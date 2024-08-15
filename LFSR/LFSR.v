module lfsr (
input clk, rst,
output reg [2:0] lfsr_o);

always @ (posedge clk, posedge rst)
if (rst)
lfsr_o <= 3'b000;
else begin
    /*lfsr_o[2:1] <= lfsr_o[1:0];
    lfsr_o[0] <= lfsr_o[2] ~^ lfsr_o[1];*/
    lfsr_o <= {lfsr_o[2],lfsr_o[1],lfsr_o[0],~(lfsr_o[2] ^ lfsr_o[1])};
end
endmodule



