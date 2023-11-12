`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2023 04:01:45 PM
// Design Name: 
// Module Name: realtime_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module realtime_tb(
    );
    
    reg clk, nrst;
    wire clk_1s;
    
    real_time uut1(.clk(clk), .nrst(nrst), .clk_1s(clk_1s));
    
    initial begin
        clk = 0;
        forever begin
            #1 clk =~clk;
        end
    end
    
    initial begin
        nrst = 1;
        
        #10 begin
            nrst =0;
        end
        
        #10 begin
            nrst =1;
        end
        
        #2500 $stop;
        
    end
endmodule
