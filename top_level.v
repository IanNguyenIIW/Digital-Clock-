`timescale 1ns / 1ps


module top_level(
    input wire clk,
    input wire reset,
    output wire [6:0] display,
    output wire [3:0] digit,
    output wire clk1hz
    );
    //wire clk1hz;
    wire [5:0] seconds, minutes,hours;
    reg [3:0] current_digit;
    reg [1:0] digit_select;
    wire clk_240Hz;
    
     clock_divider_240Hz clk_divider240(
        .clk(clk),
        .rst(reset),
        .clk_240Hz(clk_240Hz)
    );
    
    clock_divider clk_divider(
        .clk(clk),
        .rst(reset),
        .clk_1Hz(clk1hz)
    );
    
    digital_clock dig_clk(
        .clk(clk1hz),
        .rst(reset),
        .sec(seconds),
        .minute(minutes),
        .hour(hours)
    );
    
    always @(posedge clk_240Hz or posedge reset) begin
        if (reset) begin
            digit_select <= 0;
        end else begin
            digit_select <= digit_select + 1;//digit_select + 1;
        end
    end
    
    always @(*) begin
        case (digit_select)
            2'b00: current_digit <= seconds % 10;      // Seconds, ones place
            2'b01: current_digit <= seconds / 10;      // Seconds, tens place
            2'b10: current_digit <= minutes % 10;      // Minutes, ones place
            2'b11: current_digit <= minutes / 10;      // Minutes, tens place
            default: current_digit <= 4'b0000;
        endcase
    end
    seven_seg sev_seg(
        .digit(current_digit),
        .digit_seg(display)
    );
    
    assign digit = ~(1 << digit_select);
endmodule
