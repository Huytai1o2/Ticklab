`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2023 04:49:04 PM
// Design Name: 
// Module Name: Universal_tb
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


module Universal_tb();
    reg but1, but2;
    wire [7:0] data_out1, data_out2;
    
    reg clk1, clk2, sent1, sent2, reciever1, reciever2, nrst1, nrst2;
    wire Tx1, Tx2 , Rx1, Rx2;
    wire [3:0]count1, count2;
    
    wire RX_1;
    wire RX_2;
    wire TX_1;
    wire TX_2;
    
    assign RX_1 = TX_2;
    assign RX_2 = TX_1;
    
    Test uut1 (.but(but1), .data_out(data_out1), .clk(clk1), .sent(sent1)
               , .reciever(reciever1), .nrst(nrst1), .Rx(RX_1), .Tx(TX_1), .count(count1));
               
    CPU uut2 (.clk(clk2), .nrst(nrst2), .Rx(RX_2), .Tx(TX_2));
    
    initial begin
        #0 clk1=0;
        #1 clk2=0;
        forever begin
            #1 begin
                clk1 = ~clk1;
                clk2 = ~clk2;
            end
        end
     end
     
     initial begin
        nrst2 =1;
        nrst1 = 1;
        sent1 =1;
        reciever1 =1;
        reciever2 =1;
        
        #2000 begin
        nrst2 =0;
        nrst1 =0;
        sent1 =1;
        but1 =1;
        reciever2 =1;
        end
        
        #2000 begin
        nrst2 =1;
        nrst1 =1;
        sent1 =1;
        but1 =1;
        reciever2 =1;
        end
        
        #975000 reciever2 =1;
        #100000$stop; 
     end   
endmodule
