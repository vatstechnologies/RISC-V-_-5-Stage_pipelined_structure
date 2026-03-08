module riscv_pipeline(
    input clk,
    input reset
);

reg [31:0] pc;
reg [31:0] imem[0:15];

initial begin
    imem[0] = 32'h00100093; // ADDI x1,x0,1
    imem[1] = 32'h00200113; // ADDI x2,x0,2
    imem[2] = 32'h002081B3; // ADD x3,x1,x2
end

// pipeline registers
reg [31:0] IF_ID_instr;
reg [31:0] ID_EX_a, ID_EX_b;
reg [4:0] ID_EX_rd;

reg [31:0] EX_MEM_result;
reg [4:0] EX_MEM_rd;

reg [31:0] MEM_WB_result;
reg [4:0] MEM_WB_rd;

wire [31:0] alu_out;

alu alu0(
    .a(ID_EX_a),
    .b(ID_EX_b),
    .alu_ctrl(4'b0000),
    .result(alu_out)
);

regfile rf(
    .clk(clk),
    .we(1'b1),
    .rs1(IF_ID_instr[19:15]),
    .rs2(IF_ID_instr[24:20]),
    .rd(MEM_WB_rd),
    .wd(MEM_WB_result),
    .rd1(ID_EX_a),
    .rd2(ID_EX_b)
);

always @(posedge clk or posedge reset) begin

if(reset) begin
    pc <= 0;
end
else begin

// IF
IF_ID_instr <= imem[pc];
pc <= pc + 1;

// ID
ID_EX_rd <= IF_ID_instr[11:7];

// EX
EX_MEM_result <= alu_out;
EX_MEM_rd <= ID_EX_rd;

// MEM
MEM_WB_result <= EX_MEM_result;
MEM_WB_rd <= EX_MEM_rd;

end
end

endmodule
