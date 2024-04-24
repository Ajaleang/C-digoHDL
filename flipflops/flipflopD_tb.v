`timescale 1ns/1ns
module FlipFLopD_tb;

  // Parameters

  //Ports
  reg  D = 0;
  reg   CLK = 1;
  wire  Q;

  FlipFLopD  FlipFLopD_inst (
    .D(D),
    . CLK( CLK),
    .Q(Q)
  );
    
always begin
    #5  CLK = ! CLK ;
end

initial begin
    $dumpfile("FlipFLopD_tb.vcd");        
    $dumpvars(0, FlipFLopD_tb);    
        D = 1;
        #2;
        D = 1;
        #2;
        D = 0;
        #2;
        D = 0;
        #2;
        D = 1;
        #2; 
        D = 0;
        #2;
        D = 1;
        #2;
        D = 0;
        #2;
        D = 1;
        #2;       
        $finish;
end
endmodule