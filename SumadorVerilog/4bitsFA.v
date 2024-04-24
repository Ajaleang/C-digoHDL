module FourBitAdder(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
);
wire [2:0] c;
TwoBitsFA FA0(a[1:0], b[1:0], cin, sum[1:0], c[0]);
TwoBitsFA FA1(a[3:2], b[3:2], c[0], sum[3:2], cout);


endmodule

