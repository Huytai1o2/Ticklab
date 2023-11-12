`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2023 10:06:11 PM
// Design Name: 
// Module Name: CPU
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


module CPU(
    input clk, nrst, Rx,
    output Tx,
    output reg sent_cpu, reciever_cpu
    );
    
    parameter DATA_WIDTH = 8;
    parameter [1:0]config_uart = 2'b11;
    
    
    reg  [DATA_WIDTH -1 :0]data_in;
    wire [DATA_WIDTH -1 :0]data_out;
    wire Rx_empty, Tx_full;
    
    wire clk_1s;
    reg [9:0] count;
    
//    parameter IDLE_STATE = 2'b00;
//    parameter WORK_STATE = 2'b01;
//    parameter STOP_STATE = 2'b10;
//    reg [1:0]state;
//    reg [6:0]i;
    
    UART uut1(.data_in(data_in), .sent(sent_cpu), .reciever(reciever_cpu), .nrst(nrst), .Rx(Rx), .Tx(Tx),
              .clk(clk), .data_out(data_out), .full_tx(Tx_full), .empty_rx(Rx_empty), .config_uart(config_uart));
    
    real_time uut2(.clk(clk), .clk_1s(clk_1s), .nrst(nrst));
    
    always @(posedge clk or negedge nrst) begin
        if (!nrst) begin
            sent_cpu <= 0;
            reciever_cpu <=0;
            count <=0;
        end
        
        else begin
//            if (count<=10) begin
                if (!Rx_empty) begin 
                    data_in <= data_out;
                    count <= count+1;
                    sent_cpu <=1;
                    reciever_cpu<=1;
                end
                else begin
                    count <= count+1;
                    sent_cpu <=0;
                    reciever_cpu<=0;
                end
//            end
            
//            else if(count<30) begin
//                count <= count+1;
//                sent_cpu <=0;
//                reciever_cpu<=0;
                
//            end
//            else if (count ==30) count<=0;
        end
    end
endmodule
