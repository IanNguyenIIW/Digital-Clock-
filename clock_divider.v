`timescale 1ns / 1ps


module clock_divider(
    input wire clk,
    input wire rst,
    output reg clk_1Hz
    );
    
    
    reg [28:0] counter;
    
    
    always @(posedge clk) begin
        if(rst) begin
        counter <= 0;
        clk_1Hz <=0;
        end
        else begin
            
            
            if(counter >= 62_500_000) begin //62_500_000
                counter <= 0;
                clk_1Hz <= ~clk_1Hz;
            end
            else begin
            counter <= counter + 1;
            end
        end
    end
endmodule
