`timescale 1ns / 1ps



module digital_clock_tb();

    reg clk;
    reg rst;
    wire [5:0] sec;//2^6 == 64
    wire [5:0] minute;
    wire [4:0] hour;
    wire clk_out;
    clock_divider uut(
        .clk(clk),
        .rst(rst),
        .clk_1Hz(clk_out)
    );
    digital_clock dig_clock1(
        .clk(clk_out),
        .rst(rst),
        .sec(sec),
        .minute(minute),
        .hour(hour)
    );
    
    initial begin
        clk = 0;
        forever #4 clk = ~clk;
    end
    
    initial begin
        rst = 1;
        
        #100;
        rst = 0;
    end
    
    initial begin
        //$monitor("Time: %t, second: %b", $time);
        #150_000_000 ;  // Run the simulation for enough time
        $finish;
    end
    
endmodule
