module switches_to_leds
    //parametros
    #(parameter  N= 4)
    // ports
    (input [N-1:0] i_switch, output[N-1:0] o_led);
    assign o_led = i_switch;
endmodule