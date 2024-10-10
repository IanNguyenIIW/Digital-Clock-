`timescale 1ns / 1ps


module digital_clock(
    input wire clk,
    input wire rst,
    output reg [5:0] sec,//2^6 == 64
    output reg [5:0] minute,
    output reg [4:0] hour //2^5 = 32
    );
    
    always @(posedge clk or posedge rst) begin
    
        if(rst) begin
        sec <= 0;
        minute <= 0;
        hour <=0;
        end
        else begin
        
        if(sec == 59) begin
            sec <= 0;
            if(minute == 59) begin
                minute <= 0;
                if(hour == 23) 
                    hour <= 0;
                else
                    hour <= hour + 1;
            end
            else
                minute <= minute + 1;
        end else
                sec <= sec + 1;
        end 
        
    end
endmodule


