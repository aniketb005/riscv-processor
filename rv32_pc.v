module rv32_pc #(
    parameter BOOT_ADDRESS = 0,
    parameter PC_SRC_WIDTH = 2,
    parameter PC_WIDTH = 32,
    parameter IADDR_WIDTH = 31
)(
    input                         rst_in,
    input [(PC_SRC_WIDTH - 1):0]  pc_src_in,
    input [(PC_WIDTH - 1):0]      pc_in,
    input [(PC_WIDTH - 1):0]      epc_in,
    input [(TRAP_ADDR_WIDTH-1):0] trap_address_in,
    input                         branch_taken_in,
    input [(IADDR_WIDTH-1):0]     iaddr_in,

    output                     misaligned_instr_out,
    output [(PC_WIDTH-1):0]    pc_mux_out,
    output [(PC_WIDTH-1):0]    pc_plus_4_out,
    output [(IADDR_WIDTH-1):0] i_addr_out
);

  assign pc_plus_4_out = pc_in + 32'h00000004;
  assign next_pc = branch_taken_in ? {iaddr_in,1'b0} : pc_plus_4_out;

  assign misaligned_instr_out = branch_taken_in & next_pc[1];

  always @(*)
  begin
    case(pc_src_in)
      2'b00 : pc_mux_out = BOOT_ADDRESS;

      2'b01 : pc_mux_out = epc_in;

      2'b10 : pc_mux_out = trap_address_in;

      2'b11 : pc_mux_out = pc_next;

      default: pc_mux_out = pc_next;
    endcase
  end

  assign  i_addr_out = rst_in ? BOOT_ADDRESS : pc_mux_out;

endmodule