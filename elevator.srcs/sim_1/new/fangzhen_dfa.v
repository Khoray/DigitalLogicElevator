`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/01 22:39:26
// Design Name: 
// Module Name: fangzhen_dfa
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


module fangzhen_dfa(

    );
//    wire [15:0]floor;
//    wire [4:0]btn_off;
    reg clk=0,rst;
    wire [4:0]nfloor;
    
    reg [4:0] btn=0;
//    input clk, rst,
//    output [4:0] nfloor, 
    wire [3:0] shuma_enable;
    wire [6:0] seg;
    
    always #10 clk = ~clk;
    initial begin
        #10 rst = 1;
        #20 rst = 0;
        #45 btn = 5'b00100;
        #52 btn = 5'b00000;
        #55 btn = 5'b01000;
        #62 btn = 5'b00000;
    end
    main main1(
        .btn(btn),
        .seg(seg),
        .shuma_enable(shuma_enable),
        .clk(clk),
        .rst(rst),
        .nfloor(nfloor)
    );
endmodule
