`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2023 11:43:16 AM
// Design Name: 
// Module Name: Baurate_clk
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


module Baudrate_clk(
    input [1:0]option_baudrate,
    input clk, nrst,
    output reg b_clk
    );
    
    
    reg [11:0]no_count, half_no_count;
    reg [11:0]count; // 125MHz/115200
    
    always @(clk) begin
        case (option_baudrate)
            2'b00 : no_count <= 1085;
            2'b01 : no_count <= 976;
            2'b11 : no_count <= 488;
            default : no_count <= 1085; //teestbech
        endcase
        
        half_no_count <= no_count /2;
    end
    
    always @(posedge clk) begin
        if (!nrst) begin
            count =0;
            b_clk =1;
        end
        else begin
            if (count <= (half_no_count)) begin //542
                count <= count +1;
                b_clk <=1;
            end
            else if (count <no_count) begin //1085
                count <= count +1;
                b_clk <=0;
            end
            else if (count == no_count) begin
                count <= 0;
                b_clk <=1;
            end
        end
    end
endmodule
