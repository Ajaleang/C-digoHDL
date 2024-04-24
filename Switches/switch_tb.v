`timescale 1ns/1ns

module switches_to_leds_tb;

  // Parameters
  localparam  N = 4; // Set a default value for N
  integer i;
  
  // Ports
  reg [N-1:0] i_switch;
  wire [N-1:0] o_led;

  switches_to_leds # (
    .N(N)
  ) switches_to_leds_inst (
    .i_switch(i_switch),
    .o_led(o_led)
  );

  initial begin
    $dumpfile("switches.vcd");
    $dumpvars(0, switches_to_leds_tb);
    
    // Test conditions
    i_switch = 4'b0001; #10;
    // Add more test conditions as needed
    
    // End simulation after test conditions
    $finish;
  end

  // Optionally, if you want a clock signal
  // always #5 clk = ~clk;

endmodule
