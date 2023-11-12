`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2023 04:50:51 PM
// Design Name: 
// Module Name: Tx_tb
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


module Tx_tb();

    reg clk;
    
    wire tx;
    wire [3:0] bit_counter;
    
    reg [7:0] in;
    reg nrst,
        sent;
    //wire [1:0] rear, front;
    wire [7:0] out;
    wire empty,
         full,
         reciever;
    
    FIFO uut1(.in(in), .nrst(nrst), .sent(sent), .reciever(reciever), 
            .out(out), .empty(empty), .full(full), .clk(clk));
            
   Tx uut2(.data(out), .mode(empty), .clk(clk), .tx(tx), .bit_counter(bit_counter), .nrst(nrst), .reciever(reciever));
    
    initial begin
        clk = 0;
        forever begin
            #1 clk =~ clk;
        end
    end
    
    initial begin
        in = 0;
        nrst = 1;
        sent = 0;
//        reciever =0;
        
        #20 begin
        in = 8'h7;
        nrst = 0;
        sent = 0;
//        reciever =0;
        end
        
        #20 begin
        in = 8'h7;
        nrst = 1;
        sent = 1;
//        reciever =0;
        end
        
        #10 begin
        sent =1;
//        reciever =0;
        end
        
        #20 begin
        in = 8'h8;
        nrst = 1;
        sent = 1;
//        reciever =0;
        end
        
        #1 begin
        sent =0;
//        reciever =0;
        end
        
        #20 begin
        in = 8'h9;
        nrst = 1;
        sent = 1;
//        reciever =0;
        end
        
        #1 begin
        sent =0;
//        reciever =0;
        end
        
        #20 begin
        in = 8'h20;
        nrst = 1;
        sent = 1;
//        reciever =0;
        end
        
        #1 begin
        sent =0;
//        reciever =0;
        end
        
        #20 begin
        in = 8'h20;
        nrst = 1;
        sent = 0;
//        reciever =1;
        end
        
        #1 begin
        sent =0;
//        reciever =0;
        end
        
        #20 begin
        in = 8'h20;
        nrst = 1;
        sent = 0;
//        reciever =1;
        end
        
        #1 begin
        sent =0;
//        reciever =0;
        end
        
        #20 begin
        in = 8'h10;
        nrst = 1;
        sent = 0;
//        reciever =1;
        end
        
        #1 begin
        sent =0;
//        reciever =0;
        end
        
        #20 begin
        in = 8'h16;
        nrst = 1;
        sent = 1;
//        reciever =1;
        end
        
        #1 begin
        sent =0;
//        reciever =0;
        end
        
        #20 begin
        in = 8'h16;
        nrst = 1;
        sent = 0;
//        reciever =1;
        end
        
        #20 $stop;
    end    
endmodule
