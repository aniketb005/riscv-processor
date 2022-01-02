module rv32_integer_file #(

)(
  input riscv32_mp_clk_in,
  input riscv32_mp_rst_in,
  input [4:0] rs_2_addr_in,
  input [4:0] rd_addr_in,
  input wr_en_in,
  input [31:0] rd_in,
  input [4:0] rs_1_addr_in,

  input [31:0] rs_1_out,
  input [31:0] rs_2_out
  );

  reg [31:0] reg_file [31:0];

  always@(posedge riscv32_mp_clk_in)
  begin
      if(riscv32_mp_rst_in)
      begin
        for(i = 0, i < 32, i = i + 1)
            reg_file[i] <= 0;
      end
      else
      begin
        if(rs_1_addr_in == rd_addr_in & wr_en_in)
            rs_1_out <= rd_in;
        else if(rs_2_addr_in == rd_addr_in & wr_en_in)
            rs_1_out <= rd_in;
        else if(wr_en_in)
            reg_file[rd_addr_in] <= rd_in;
        else
        begin
            rs_1_out <= reg_file[rs_1_addr_in];
            rs_2_out <= reg_file[rs_2_addr_in];
        end
      end
  end

endmodule