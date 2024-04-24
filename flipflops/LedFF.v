module LED_FF(
	input clk,
	input switch,
	output led);
	
	reg r_LED_1 = 1'b0; //1
	reg r_Switch_1 = 1'b0;
	
	always @(negedge clk)//2
	begin
		r_Switch_1 <= switch;//3
		if (switch == 1'b0 && r_Switch_1 == 1'b1)//4
		begin
			r_LED_1 <= ~r_LED_1;//5
		end
	end
	assign led = r_LED_1;
endmodule