`timescale 1ns/1ns
module LFSR_TB;



  //Ports
  reg  clk;
  reg  rst;
  wire [2:0] lfsr_o;

  lfsr  lfsr_inst (
    .clk(clk),
    .rst(rst),
    .lfsr_o(lfsr_o)
  );

always #5  clk = ~clk ;
initial begin
	$dumpfile("test_LFSR.vcd");
	$dumpvars(0, LFSR_TB);
	clk = 1;
	rst = 1;
	#50;
	rst = 0;
  #50;
	rst = 0;
  #50;
	rst = 1;
    #100;
    $finish;
	
end

endmodule

