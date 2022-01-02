module rv32_immediate_addr #(
  parameter DATA_WIDTH = 32
  )(
  input [(DATA_WIDTH-1):0] pc_in,
  input [(DATA_WIDTH-1):0] rs1_in,
  input [(DATA_WIDTH-1):0] imm_in,
  input iadder_src_in,
  output [(DATA_WIDTH-1):0] iadder_out
  );

  assign iadder_out = iadder_src_in ? (rs1_in + imm_in) : (pc_in + imm_in);

endmodule