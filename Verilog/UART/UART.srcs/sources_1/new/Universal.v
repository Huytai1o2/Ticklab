`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2023 03:58:34 PM
// Design Name: 
// Module Name: Universal
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


module Universal(
    input but1, but2,
    output [7:0] data_out1, data_out2,
    
    input clk1, clk2, sent1, sent2, reciever1, reciever2, nrst1, nrst2, Rx1, Rx2,
    output Tx1, Tx2,
    output [3:0]count1, count2
    );
    
//    Test uut1 (.but(but1), .data_out(data_out1), .clk(clk1), .sent(sent1)
//               , .reciever(reciever1), .nrst(nrst1), .Rx(Tx2), .Tx(Rx1), .count(count1));
               
//    Test uut2 (.but(but2), .data_out(data_out2), .clk(clk2), .sent(sent2)
//               , .reciever(reciever2), .nrst(nrst2), .Rx(Tx1), .Tx(Rx2), .count(count2));
endmodule
