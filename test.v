module test;

	// Inputs
	reg clk;
	reg rst;
	reg[3:0] REQ;

	// Outputs
	wire [3:0] GNT;

	// Instantiate the Unit Under Test (UUT)
	RRA uut (
		.clk(clk), 
		.rst(rst), 
		.REQ(REQ), 
		.GNT(GNT)
	);
always #1 clk= ~clk;
	initial
begin

clk = 0;
rst = 1;
REQ[0] = 0;
REQ[1] = 0;
REQ[2] = 0;
REQ[3] = 0;
	
rst = 0;


repeat (1) @ (posedge clk);
REQ[0] <= 1;
repeat (1) @ (posedge clk);
REQ[0] <= 0;
repeat (1) @ (posedge clk);
REQ[1] <= 1;
repeat (1) @ (posedge clk);
REQ[2] <= 1;
REQ[1] <= 0;
repeat (1) @ (posedge clk);
REQ[3] <= 1;
REQ[2] <= 0;
repeat (1) @ (posedge clk);
REQ[3] <= 0;
repeat (1) @ (posedge clk);
REQ[0] <= 0;
repeat (1) @ (posedge clk);
#10 $finish;


end

endmodule
