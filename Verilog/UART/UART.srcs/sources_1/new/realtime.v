`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2023 06:30:30 PM
// Design Name: 
// Module Name: realtime
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


module real_time(
    input clk, nrst,
    output reg clk_1s
    );
    
    reg [26:0]count;
    always @(posedge clk) begin
        if (!nrst) begin
            count<=0;
            clk_1s<=1;
        end
        
        else begin
            if(count < 62500000) begin //62500000
                count <= count +1;
                clk_1s <=1;
            end
            
            else if(count < 125000000) begin //125000000
                count<=count+1;
                clk_1s<=0;
            end
            
            else begin
                count<=0;
                clk_1s<=1;
            end
        end
    end
endmodule
