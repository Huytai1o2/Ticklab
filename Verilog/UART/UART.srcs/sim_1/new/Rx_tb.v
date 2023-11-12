`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2023 11:31:30 AM
// Design Name: 
// Module Name: Rx_tb
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


module Rx_tb();
    reg clk1, clk2, clk;
    
    wire tx;
    wire [3:0] bit_counter;
    
    reg [7:0] in;
    reg nrst,
        sent;
    //wire [1:0] rear, front;
    wire [7:0] out;
    wire empty,
         full,
         almost_empty,
         almost_full;
    
    wire Rx_sent;
    wire reciever;
    wire [7:0]res;
    wire [3:0] bit_counter2;
    
    FIFO uut1(.in(in), .nrst(nrst), .sent(sent), .reciever(reciever), 
            .out(out), .empty(empty), .full(full),.clk(clk));
            
    Tx uut2(.data(out), .mode(empty), .clk(clk1), .tx(tx), .bit_counter(bit_counter), .nrst(nrst), .enable(reciever),
            .reciever(reciever));
    
    Rx uut3(.rx(tx), .data(res), .clk(clk2), .bit_counter(bit_counter2), .nrst(nrst), .sent(Rx_sent), .clk(clk));
    
    FIFO uut4(.in(out), .sent(Rx_sent), .nrst(nrst),. clk(clk));
    
    initial begin
//        clk <=0;
        clk1 <= 0;
        clk2 <= 0;
        forever begin
//            #10 clk =~ clk;
            #10 clk1 =~ clk1;
            #11 clk2 =~ clk2;
        end
    end
    
    initial begin
        in = 0;
        nrst = 1;
        sent = 0;
//        reciever =0;
        
        #200 begin
        in = 8'h7;
        nrst = 0;
        sent = 0;
//        reciever =0;
        end
        
        #200 begin
        in = 8'h7;
        nrst = 1;
        sent = 1;
//        reciever =0;
        end
        
        #100 begin
        sent =0;
//        reciever =0;
        end
        
        #200 begin
        in = 8'h8;
        nrst = 1;
        sent = 1;
//        reciever =0;
        end
        
        #100 begin
        sent =0;
//        reciever =0;
        end
        
        #200 begin
        in = 8'h9;
        nrst = 1;
        sent = 1;
//        reciever =0;
        end
        
        #100 begin
        sent =0;
//        reciever =0;
        end
        
        #90 begin
        in = 8'h20;
        nrst = 1;
        sent = 1;
//        reciever =0;
        end
        
        #50 begin
        sent =0;
//        reciever =0;
        end
        
        #90 begin
        in = 8'h20;
        nrst = 1;
        sent = 1;
//        reciever =1;
        end
        
        #100 begin
        sent =0;
//        reciever =0;
        end
        
        #200 begin
        in = 8'h20;
        nrst = 1;
        sent = 0;
//        reciever =1;
        end
        
        #100 begin
        sent =0;
//        reciever =0;
        end
        
        #200 begin
        in = 8'h10;
        nrst = 1;
        sent = 0;
//        reciever =1;
        end
        
        #100 begin
        sent =0;
//        reciever =0;
        end
        
        #90 begin
        in = 8'h16;
        nrst = 1;
        sent = 1;
//        reciever =1;
        end
        
        #100 begin
        sent =0;
//        reciever =0;
        end
        
        #200 begin
        in = 8'h16;
        nrst = 1;
        sent = 0;
//        reciever =1;
        end
        
        #10;
        in = 8'd27;
        sent = 1;
        #2 sent = 0;
        
        
        #10;
        in = 8'd02;
        sent = 1;
        #2 sent = 0;
        
        
        #10;
        in = 8'd10;
        sent = 1;
        #2 sent = 0;
        
        
        #10;
        in = 8'd30;
        sent = 1;
        #2 sent = 0;
        #800 $stop;
    end    
endmodule
