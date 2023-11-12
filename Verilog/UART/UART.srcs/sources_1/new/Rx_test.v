`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2023 11:17:22 AM
// Design Name: 
// Module Name: Rx_test
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


module Rx_test(
    input rx,
    input nrst,
    input clk,
    output reg [7:0]data,
    output reg [3:0]bit_counter,
    output reg sent
    );
    
    reg [3:0]clk_counter;
    reg ready;
    
    always @(posedge clk) begin
        if (!nrst) begin
            //tx =1;
            clk_counter <=0;
            bit_counter <= 0;
            data <=0;
            sent<=0;
            ready <=1;
        end
        
        else begin
            if (bit_counter==0 && ready) begin
                if (rx == 0) bit_counter <= bit_counter+1;
                
                else begin
                    if (bit_counter>0 && bit_counter<=8) begin
                        clk_counter <= clk_counter+1;
                        if (clk_counter+1 == 7) begin
                            data[bit_counter-1] <= rx;
                            bit_counter<= bit_counter+1;
                        end
                    end
                    else if(bit_counter>=9 && bit_counter<10) begin
                        clk_counter <= clk_counter+1;
                        if (clk_counter+1 == 7) begin
                            bit_counter<= bit_counter+1;
                            sent <=1;
                        end
                    end
                    else if(bit_counter ==10) begin
                        clk_counter <= clk_counter+1;
                        if (clk_counter+1 == 7) begin
                            bit_counter <=0;
                            data <=0;
                            sent<=0;
                        end
                    end
                end
            end
        end
    end
endmodule
