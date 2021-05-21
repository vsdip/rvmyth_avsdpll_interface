`timescale 1ns / 1ps
module tb_mythcore_test;
	// Inputs
	reg clk, reset;
	// Outputs
	wire [9:0] out;

        // Instantiate the Unit Under Test (UUT)
	core uut (
		.clk(clk),
		.reset(reset),
		.out(out)
	);

	initial begin
        $dumpfile("tb_mythcore_test.vcd");
        $dumpvars(0,tb_mythcore_test);
        clk = 1;
        reset = 0;
        #2 reset = 1;
	#10 reset = 0;
        #2000 $finish;
        end
        always #1 clk = ~clk;

endmodule
