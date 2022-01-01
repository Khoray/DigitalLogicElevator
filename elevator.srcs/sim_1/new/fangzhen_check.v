`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/01 22:05:42
// Design Name: 
// Module Name: fangzhen_check
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


module fangzhen_check(

    );
    reg [15:0]floor=16'd4;
    reg [4:0]nfloor=5'b11100;
    wire up;
    wire down;
    checkupordown ckud(
        .floor(floor),
        .nfloor(nfloor),
        .has_up(up),
        .has_down(down)
    );
endmodule
