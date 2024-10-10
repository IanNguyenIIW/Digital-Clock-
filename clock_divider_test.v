`timescale 1ns / 1ps


module clock_divider_test();

    reg clk;
    reg rst;
    wire clk_out;
    
    clock_divider uut(
        .clk(clk),
        .rst(rst),
        .clk_1Hz(clk_out)
    );
    
    initial begin
        clk = 0;
        forever #25 clk = ~clk;
    end
    
    initial begin
        rst = 1;
        
        #100;
        rst = 0;
    end
    
    initial begin
        $monitor("Time: %t, clk_out: %b", $time, clk_out);
        #2_050_000_000 ;  // Run the simulation for enough time
        $finish;
    end
    
    
    
endmodule
