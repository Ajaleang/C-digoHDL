module switches_tb; 
  // Ports
  reg i_switch_1;
  reg i_switch_2;
  reg i_switch_3;
  reg i_switch_4;
  wire o_led_1;
  wire o_led_2;
  wire o_led_3;
  wire o_led_4;
  
  // Instantiate the Unit Under Test (UUT)
  switches_logic switches_logic_inst (
    .i_switch_1(i_switch_1),
    .i_switch_2(i_switch_2),
    .i_switch_3(i_switch_3),
    .i_switch_4(i_switch_4),
    .o_led_1(o_led_1),
    .o_led_2(o_led_2),
    .o_led_3(o_led_3),
    .o_led_4(o_led_4)
  );
  
  initial begin
    $dumpfile("switchesl.vcd");
    $dumpvars(0, switches_tb);
    
    // Test conditions
    i_switch_1 = 1'b1;
    i_switch_2 = 1'b1;
    i_switch_3 = 1'b0;
    i_switch_4 = 1'b0;

    $finish;
  end
endmodule