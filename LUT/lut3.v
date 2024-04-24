module LUT3 (input switch_1, input switch_2, input switch_3, output y);
    wire w1,w2;
    not(w1,switch_2);
    and(w2,w1,switch_3);
    or(y,switch_1,w2);    
endmodule