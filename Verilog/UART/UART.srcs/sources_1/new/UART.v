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

module UART(
        input [1:0]config_uart,
        input [7:0] data_in,
        input clk, sent, nrst, reciever,
        input Rx,
        output Tx, full_tx, empty_rx,
        output [7:0] data_out
    );

    wire [7:0] ff3_out, ff6_in;
    wire mode;
    wire Tx_req, Rx_sent;
    wire Tx_clk, Rx_clk;
    wire [1:0]option_baudrate;
    
    assign option_baudrate = config_uart[1:0];
    assign option_bytes = config_uart[0];
    
    Baudrate_clk uut1(.clk(clk), .nrst(nrst), .b_clk(Tx_clk), .option_baudrate(option_baudrate));
    Baudrate_clk_Rx uut2(.clk(clk), .nrst(nrst), .b_clk_Rx(Rx_clk), .option_baudrate(option_baudrate));
    
    FIFO uut3(.in(data_in), .out(ff3_out), .nrst(nrst), .reciever(Tx_req), .full(full_tx), .empty(mode), .sent(sent),
              .clk(clk));
    Tx uut4(.data(ff3_out), .tx(Tx), .reciever(Tx_req), .clk(Tx_clk), .mode(mode), .enable(Tx_req), .nrst(nrst), .bit_counter());
    
    Rx uut5(.rx(Rx), .clk(Rx_clk), .nrst(nrst), .data(ff6_in), .sent(Rx_sent), .bit_counter());
    FIFO uut6(.in(ff6_in), .out(data_out), .nrst(nrst), .reciever(reciever), .full(), .empty(empty_rx), .sent(Rx_sent),
              .clk(clk));
    
    
    
endmodule