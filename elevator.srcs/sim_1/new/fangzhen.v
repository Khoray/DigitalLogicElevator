`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/01 20:55:49
// Design Name: 
// Module Name: fangzhen
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


module fangzhen(

    );
    reg [4:0]btn=5'b00000;
    reg [4:0]btn_off=5'b11111;
    reg rst,clk=0;
    wire [4:0] led;
    always #10 clk=~clk;
    initial begin
        #5 rst = 1;
        #20 rst = 0;
        #100 btn = 5'b00001;
        #105 btn = 5'b00010;
    end
    button b1(
        .btn(btn),
        .btn_pre_re(led),
        .rst(rst),
        .clk(clk),
        .btn_off(btn_off)
    );
endmodule
