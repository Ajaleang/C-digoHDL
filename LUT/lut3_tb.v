`timescale 1ns/1ns
module LUT3_tb;

  // Parameters

  //Ports
  reg  a;
  reg  b;
  reg  c;
  wire  y;

  LUT3  LUT3_inst (
    .a(a),
    .b(b),
    .c(c),
    .y(y)
  );

//always #5  clk = ! clk ;
initial begin
    $dumpfile("lut_tb.vcd");        
    $dumpvars(0, lut3_tb);    
        {a,b,c} = 3'b011;
        #5;
        {a,b,c} = 3'b101;
        #5;
        {a,b,c} = 3'b110;
        #5;
        {a,b,c} = 3'b111;
        #5;
        
        $finish;

end
endmodule