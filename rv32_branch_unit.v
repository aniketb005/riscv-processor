module rv32_branch_unit(
    input [31:0] rs1_in,
    input [31:0] rs2_in,
    input [4:0]  opcode_6_to_2_in,
    input [2:0]  funct3_in,
    output wire branch_taken_out
);

parameter BRANCH = 5'b110001;
//parameter JUMP_AND_LINK = 5'b110111;
//parameter JUMP_AND_LINK_REG = 5'b110011;

always @(*)
begin
    if(opcode_6_to_2_in == BRANCH)
    begin
        case(funct3_in)
          3'b000 : branch_taken_out = (rs1 == rs2)  ? 1'b1 : 1'b0;
          3'b001 : branch_taken_out = (rs1 != rs2)  ? 1'b1 : 1'b0;
          3'b100 : branch_taken_out = (rs1[31] ^ rs2[31])  ? 1'b1 : rs1 < rs2;
          3'b101 : branch_taken_out = (rs1[31] ^ rs2[31])  ? 1'b1 : rs1 >= rs2;
          3'b110 : branch_taken_out = rs1 < rs2  ? 1'b1 : 1'b0;
          3'b111 : branch_taken_out = rs1 >= rs2 ? 1'b1 : 1'b0;

          default : branch_taken_out = 1'b0;
        endcase
    end
    //else if(opcode_6_to_2_in == JUMP_AND_LINK | opcode_6_to_2_in == JUMP_AND_LINK_REG)
    //    branch_taken_out = 1'b1;
    else
        branch_taken_out = 1'b0;
end


endmodule