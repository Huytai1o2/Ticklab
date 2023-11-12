`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2023 07:34:11 PM
// Design Name: 
// Module Name: test_tb
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


module test_tb();
    reg but;
    wire [7:0] data_out;
    reg clk, sent, reciever, nrst, Rx;
    wire Tx;
    wire [3:0] count;
    wire sentcpu, bd1;
    
    Test uut1(.but(but), .data_out(data_out), .clk(clk), .sent(sent), .nrst(nrst), .Rx(Rx), .Tx(Tx), .count(count));
    
    initial begin
        #0 clk = 0;
        forever begin
            #1 clk =~ clk;
        end
    end
    
    initial begin
        nrst = 1;
        sent =1;
        reciever =0;
        
        #200 begin
        nrst =0;
        sent =1;
        but =1;
        end
        
        #200 begin
        nrst =1;
        sent =1;
        but =1;
        end
        
        #97500 $stop;  
    end
    
endmodule
