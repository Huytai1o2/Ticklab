`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2023 12:24:17 AM
// Design Name: 
// Module Name: FIFO_test_tb
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


module FIFO_test_tb();
    reg [7:0] in;
    reg nrst,
        sent,
        reciever,
        clk;
    wire [7:0] out;
    wire empty,
         full;
    
    FIFO_test uut(.in(in), .nrst(nrst), .sent(sent), .reciever(reciever), 
            .out(out), .empty(empty), .full(full), .clk(clk));
            
    initial begin
        clk = 0;
        forever begin
            #1 clk = ~clk;
        end
    end 
    
    initial begin
        in = 0;
        nrst = 1;
        sent = 0;
        reciever =0;
        
        #50 begin
        in = 8'h7;
        nrst = 0;
        sent = 0;
        reciever =0;
        end
        
        #50 begin
        in = 8'h7;
        nrst = 1;
        #20 sent = 1;
        reciever =0;
        end
        
        #10 begin
        sent =0;
        reciever =0;
        end
        
        #50 begin
        in = 8'h8;
        nrst = 1;
        sent = 1;
        reciever =0;
        end
        
        #10 begin
        sent =0;
        reciever =0;
        end
        
        #50 begin
        in = 8'h9;
        nrst = 1;
        sent = 1;
        reciever =0;
        end
        
        #10 begin
        sent =0;
        reciever =0;
        end
        
        #50 begin
        in = 8'h10;
        nrst = 1;
        sent = 1;
        reciever =0;
        end
        
        #10 begin
        sent =0;
        reciever =0;
        end
        
        #10 sent =1;
        
        #50 begin
        in = 8'h10;
        nrst = 1;
        sent = 0;
        reciever =1;
        end
        
        #10 begin
        sent =0;
        reciever =0;
        end
        
        #50 begin
        in = 8'h10;
        nrst = 1;
        sent = 0;
        reciever =1;
        end
        
        #10 begin
        sent =0;
        reciever =0;
        end
        
        #50 begin
        in = 8'h10;
        nrst = 1;
        sent = 1;
        #10 reciever =1;
        end
        
        #10 begin
        sent =0;
        reciever =0;
        end
        
        #50 begin
        in = 8'h16;
        nrst = 1;
        sent = 0;
        reciever =1;
        end
        
        #10 begin
        sent =0;
        reciever =0;
        end
        
        #50 begin
        in = 8'h16;
        nrst = 1;
        sent = 0;
        reciever =1;
        end
        
        #50 $stop;
    end    
endmodule
