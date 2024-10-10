`timescale 1ns / 1ps



module seven_seg(
    input wire [3:0] digit,
    output reg [6:0] digit_seg
    );
    
    always @(*) begin
    
        case(digit) 
            4'd0: digit_seg = 7'b1111110;
            4'd1: digit_seg = 7'b0110000;
            4'd2: digit_seg = 7'b1101101;
            4'd3: digit_seg = 7'b1111001;
            4'd4: digit_seg = 7'b0110011;
            4'd5: digit_seg = 7'b1011011;
            4'd6: digit_seg = 7'b1011111;
            4'd7: digit_seg = 7'b1110000;
            4'd8: digit_seg = 7'b1111111;
            4'd9: digit_seg = 7'b1111011;
            default: digit_seg = 7'b0000000; // Blank for invalid digit
        endcase
    end
endmodule
