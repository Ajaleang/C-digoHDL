`timescale 1ps/1ps

module FourBitAdder_tb;

  // Ports
  reg [3:0] a;
  reg [3:0] b;
  reg cin;
  wire [3:0] sum;
  wire cout;

  // Instantiate the FourBitAdder module
  FourBitAdder FourBitAdder_inst (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
  );

  // Initialize clock signal
  //reg clk = 0;

  // Toggle clock every 5 time units
  //always #5 clk = ~clk;

  // Testbench behavior
  initial begin
    $dumpfile("tb_4bitadder.vcd");
    $dumpvars(0, FourBitAdder_tb);

    // Test Case 1: a = 1, b = 2, cin = 0
    a = 4'b0001;
    b = 4'b0010;
    cin = 0;
    #10; // Wait for simulation to settle

    // Test Case 2: a = 10, b = 11, cin = 1
    a = 4'b1010;
    b = 4'b1011;
    cin = 1;
    #10; // Wait for simulation to settle

    // Add more test cases as needed...
    a = 4'b1111;
    b = 4'b0000;
    cin = 0;
    #10;

    a = 4'b0111;
    b = 4'b0001;
    cin = 0;
    #10;
    // Test Case 3: a = 5, b = 7, cin = 1
    a = 4'b0101;
    b = 4'b0111;
    cin = 1;
    #10; // Wait for simulation to settle

    // Test Case 4: a = 12, b = 3, cin = 0
    a = 4'b1100;
    b = 4'b0011;
    cin = 0;
    #10; // Wait for simulation to settle

    // Test Case 5: a = 8, b = 8, cin = 1
    a = 4'b1000;
    b = 4'b1000;
    cin = 1;
    #10; // Wait for simulation to settle
    // Finish simulation
    $finish;
  end

endmodule
