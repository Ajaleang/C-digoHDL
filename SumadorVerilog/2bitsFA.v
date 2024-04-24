module TwoBitsFA(input [1:0] a, input [1:0] b, input cin, output [1:0] sum, output cout);
    wire  c;

    FA FA0(a[0], b[0], cin, sum[0], c);
    FA FA1(a[1], b[1], c, sum[1], cout);

endmodule