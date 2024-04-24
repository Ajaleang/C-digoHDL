`timescale 1ps/1ps
module LED_FF_tb;

  // Parameters

  //Ports
  reg  clk = 1;
  reg  switch = 0;
  wire  led;

  LED_FF  LED_FF_inst (
    .clk(clk),
    .switch(switch),
    .led(led)
  );
  always begin
    #0.5  clk = !clk;
end
initial begin
    $dumpfile("ledFF_tb.vcd");        
    $dumpvars(0, LED_FF_tb);    
        switch = 1;
        #5;
        switch = 0;
        #5;
        switch = 1;
        #5;
        switch = 0;
        #5;
        switch = 1;
        #5; 
        switch = 0;
        #5;
        switch = 1;
        #5;
        switch = 0;
        #5;
        switch = 1;
        #5;       
        $finish;
end
endmodule