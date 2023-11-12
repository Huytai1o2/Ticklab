`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2023 05:34:02 PM
// Design Name: 
// Module Name: Test
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


module Test(
    input but,
    output [7:0] data_out,
    
    input clk, sent, reciever, nrst, Rx,
    output Tx,
    output reg [3:0]count,
    output reg sent_cpu, reciever_cpu
//    output clk_1s, bd1,
//    output reg sent_cpu, reciever_cpu
    );
    
    reg  [1:0]config_uart = 2'b10;
    
    wire clk_1s;
    reg [7:0] data_in;
    
    
    UART uut1(.data_in(data_in), .sent(sent_cpu), .reciever(reciever_cpu), .nrst(nrst), .Rx(Rx), .Tx(Tx),
              .clk(clk), .data_out(data_out), .full_tx(), .empty_rx(), .config_uart(config_uart));
              
    real_time uut2(.clk(clk), .clk_1s(clk_1s), .nrst(nrst));
    
/////////////////////////////////////////TESTING CASE FOR TX////////////////////////////////////////////////////////    
    parameter  no_bytes = 64;
    parameter byte_width = $clog2(64);
    parameter no_count = (1250)/ (no_bytes); // 64 bytes in 5s 125000000
    
    parameter count_width = $clog2(no_count);
    reg [count_width:0] counter_sent;
    
    parameter IDLE_STATE = 2'b00;
    parameter WORK_STATE = 2'b01;
    parameter STOP_STATE = 2'b10;
    reg [1:0]state;
    reg [6:0]i;
    
    always @(posedge clk or negedge nrst) begin
        if (!nrst) begin
            sent_cpu <=0;
            counter_sent <=0;
            data_in <=0;
            i<=0;
            state <= IDLE_STATE;
        end
        
        else begin
        
        case (state)
        IDLE_STATE : begin
            i <=0;
            counter_sent <=0;
            sent_cpu <= 0;
            if (sent) begin
                state <= WORK_STATE;
            end
        end
        
        WORK_STATE : begin
            counter_sent <= counter_sent +1;
            if (counter_sent == no_count) begin
                counter_sent <=0;
                data_in = data_in +1;
                sent_cpu <=1;
                i <= i+1;
                if (i == no_bytes-1) state <= STOP_STATE;
            end
            else sent_cpu <= 0;
        end
        
        STOP_STATE : begin
            i<=0;
            sent_cpu <=0;
            counter_sent <=0;
            data_in <=0;
            if (!sent) state <= IDLE_STATE;
        end
        
        default : state <= IDLE_STATE;
        
        endcase
//            if (sent) begin
//                if (enable_sent) begin
////                    enable_sent <=0;
//                    counter_sent<= counter_sent+1;
//                    if(counter_sent == no_count) begin
//                        counter_sent <=0;
//                        sent_cpu<=0;
//                        data_in<=0;
//                        enable_sent <=0;
//                    end
//                    else if(counter_sent >= no_count-no_bytes) begin
//                        data_in = data_in+1;
//                        sent_cpu <=1;
//                    end
////                    for (i = 0; i < 64; i = i + 1) begin
////                        if (counter_sent<no_count) counter_sent <= counter_sent+1;
////                        else if (counter_sent == no_count) begin
////                            data_in <= data_in + i;
////                            sent_cpu <= 1;
////                            counter_sent <=0;
////                        end
////                    end
//                  end
//              end
//            else begin
//                enable_sent <=1;
//                sent_cpu <=0;
//                counter_sent <=0;
//            end
        end
    end

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
    always @(posedge clk_1s or negedge nrst) begin
        if (!nrst) begin
//            sent_cpu <=0;
            reciever_cpu <=0;
            count<=0;
//            data_in<=0;
//            enable <=0;
        end
        else begin
            if (count<9) begin
            count <= count+1;
//            enable <=0;
//            sent_cpu <=0;
            reciever_cpu <=0;
        end 
        
        else begin
            if (count ==9) begin
                count<=0;
//                enable <=1;
            end
//            if (sent) sent_cpu <=1;
//            else begin
//                sent_cpu <=0;
////                enable <=0;
//            end
            
            if (reciever) reciever_cpu <=1;
            else reciever_cpu<=0;
            
//            if (but==1) data_in <= data_in+7; 
        end    
        end
    end
    
//    always @(posedge clk_1s) begin
//        if (count<9) begin
//            count <= count+1;
////            enable <=0;
//            sent_cpu <=0;
//            reciever_cpu <=0;
//        end 
        
//        else begin
////            if (count ==9) begin
//                count<=0;
//                enable <=1;
////            end
//            if (sent) sent_cpu <=1;
//            else begin
//                sent_cpu <=0;
////                enable <=0;
//            end
            
//            if (reciever==1) reciever_cpu <=1;
//            else reciever_cpu<=0;
            
//            if (but==1) data_in <= data_in+7; 
//        end    
//    end

    
endmodule
