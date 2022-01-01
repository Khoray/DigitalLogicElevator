`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/01 17:58:46
// Design Name: 
// Module Name: button
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


module button(
    input clk,rst,
    input [4:0]btn,[4:0]btn_off,
    output reg [4:0]btn_pre_re
    );
    parameter N=99_999999;
    reg clk_200ms; 
    reg [31:0]count;
    always@(posedge clk, posedge rst)begin
        if(rst) begin
            count <= 0;
        end
        else begin
            clk_200ms<=0;
            if(count<N/5)
                count<=count+1;
            else begin
                count<=0;
                clk_200ms<=1;
            end
        end
    end
    always@(posedge clk_200ms,posedge rst)begin
        if(rst) begin
            btn_pre_re <= 5'b00000;
        end
        else begin
            btn_pre_re<=(btn_pre_re^btn)&btn_off;
//            btn_pre_re=btn_pre_re;
        end
    end
endmodule
