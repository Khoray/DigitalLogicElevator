`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/01 18:07:17
// Design Name: 
// Module Name: displaysegs
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


module displaysegs(
    input clk, reset,
    input [15:0]s,
    output reg [3:0]shuma_enable,
    output reg [6:0]segs
    );
    reg [3:0]digit;
    reg [19:0]count;
    
    //简单分频器
    
    always @ (posedge clk,posedge reset) begin
        if(reset)
            count <= 0;
        else
            count <= count + 1;
    end
    
    //数码管使能
    
    always @(posedge clk) begin
        case(count[19:18])
            0: begin shuma_enable=4'b1110;digit=s[3:0]; end
            1: begin shuma_enable=4'b1101;digit=s[7:4]; end
            2: begin shuma_enable=4'b1011;digit=s[11:8]; end
            3: begin shuma_enable=4'b0111;digit=s[15:12]; end
        endcase
    end
    
    //把数据编码成七段数码管
    
    always @(posedge clk) begin
        case(digit)
            4'h0:segs=7'b000_0001;
            4'h1:segs=7'b100_1111;
            4'h2:segs=7'b001_0010;
            4'h3:segs=7'b000_0110;
            4'h4:segs=7'b100_1100;
            4'h5:segs=7'b010_0100;
            4'h6:segs=7'b010_0000;
            4'h7:segs=7'b000_1111;
            4'h8:segs=7'b000_0000;
            4'h9:segs=7'b000_1100;
            4'ha:segs=7'b000_1000;
            4'hb:segs=7'b110_0000;
            4'hc:segs=7'b111_0010;
            4'hd:segs=7'b100_0010;
            4'he:segs=7'b011_0000;
            4'hf:segs=7'b011_1000;
            default: segs=7'b1111111;
        endcase
    end
    
endmodule
