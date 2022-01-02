module rv32_reg_block_1 #(
  parameter PC_MUX_DATA_WIDTH = 32
 )(
  input riscv32_mp_clk_in,
  input riscv32_mp_rst_in,
  input [(PC_MUX_DATA_WIDTH-1):0]      pc_mux_in,
  output reg [(PC_MUX_DATA_WIDTH-1):0] pc_out
);

always @(posedge riscv32_mp_clk_in)
begin
  if(riscv32_mp_rst_in)
    pc_out <= 0;
  else
    pc_out <= pc_mux_in;
end

endmodule