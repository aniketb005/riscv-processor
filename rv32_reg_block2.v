module rv32_reg_block2 (
    input clk_in,
    input reset_in,
    input [4:0] rd_addr_in,
    input [11:0] csr_addr_in,
    input [31:0] rs1_in,
    input [31:0] rs2_in,
    input [31:0] pc_in,
    input [31:0] pc_plus_4_in,
    input branch_taken_in,
    input [31:0] iaddr_in,
    input [3:0] alu_opcode_in,
    input [1:0] load_size_in,
    input load_unsigned_in,
    input alu_src_in,
    input csr_wr_en_in,
    input rf_wr_en_in,
    input [2:0] wb_mux_sel_in,
    input [2:0] csr_op_in,
    input [31:0] imm_in
);


endmodule