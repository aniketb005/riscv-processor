module rv32_instruction_mux #(
    parameter INSTRUCTION_WIDTH = 32
)(
    input flush_in,
    input [INSTRUCTION_WIDTH-1 : 0] instr_in

    output wire [6:0] opcode_out,
    output wire [3:0] funct3,
    output wire [6:0] funct7_out,
    output wire [4:0] rs1_addr_out,
    output wire [4:0] rs2_addr_out,
    output wire [4:0] rd_addr_out,
    output wire [11:0] csr_addr_out,
    output wire [23:0] instr_31_7_out
);

wire [31:0]instr_mux;

assign instr_mux = flush_in ? 32'h00000013 : instr_in;

assign opcode_out = instr_mux[6:0];
assign funct3_out = instr_mux[14:12];
assign funct7_out = instr_mux[31:35];
assign csr_addr_out = instr_mux[31:20];
assign rs1_addr_out = instr_mux[19:15];
assign rs2_addr_out = instr_mux[24:20];
assign rd_addr_out  = instr_mux[11:7];
assign instr_31_7_out = instr_mux[31:7];



endmodule