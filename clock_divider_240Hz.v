`timescale 1ns / 1ps


module clock_divider_240Hz(
    input wire clk,
    input wire rst,
    output reg clk_240Hz
    );
    
    
    reg [28:0] counter;
    
    
    always @(posedge clk) begin
        if(rst) begin
        counter <= 0;
        clk_240Hz <=0;
        end
        else begin
            
            
            if(counter >= 520_833) begin //520_833
                counter <= 0;
                clk_240Hz <= ~clk_240Hz;
            end
            else
            counter <= counter + 1;
        end
    end
endmodule
