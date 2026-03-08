module tb_riscv_pipeline;

reg clk;
reg reset;

riscv_pipeline cpu(
    .clk(clk),
    .reset(reset)
);

initial begin

$dumpfile("riscv_pipe.vcd");
$dumpvars(0,tb_riscv_pipeline);

clk = 0;
reset = 1;

#10 reset = 0;

#200 $finish;

end

always #5 clk = ~clk;

endmodule
