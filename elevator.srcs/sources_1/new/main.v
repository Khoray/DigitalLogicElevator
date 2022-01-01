`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/01 18:07:55
// Design Name: 
// Module Name: main
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


module main(
    input [4:0] btn, 
    input clk, rst,
    output [4:0] nfloor, 
    output [3:0] shuma_enable,
    output [6:0] seg
    );
    wire [4:0]btn_off;
//    assign btn_off = 5'b11111;
    wire [15:0] now_floor;
    wire [15:0]true_floor;
    assign true_floor = now_floor + 1;
    button button1(
        .clk(clk),
        .btn(btn),
        .rst(rst),
        .btn_off(btn_off),
        .btn_pre_re(nfloor)
    );
    displaysegs displaysegs1(
        .clk(clk),
        .shuma_enable(shuma_enable),
        .reset(rst),
        .segs(seg),
        .s(true_floor)
    );
    dfa dfa1(
        .nfloor(nfloor),
        .floor(now_floor),
        .clk(clk),
        .rst(rst),
        .btn_off(btn_off)
    );
endmodule
