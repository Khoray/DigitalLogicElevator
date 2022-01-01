`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/01 21:53:06
// Design Name: 
// Module Name: checkupordown
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


module checkupordown(
    input [4:0]nfloor,
    input [15:0]floor,
    output reg has_up, reg has_down
    );
    //1 
    always@(nfloor,floor) begin
        if(nfloor[1] && floor < 1)
            has_up = 1;
        else if(nfloor[2] && floor < 2)
            has_up = 1;
        else if(nfloor[3] && floor < 3)
            has_up = 1;
        else if(nfloor[4] && floor < 4)
            has_up = 1;
        else 
            has_up = 0;
    end
    
    always@(nfloor,floor) begin
        if(nfloor[0] && floor > 0)
            has_down = 1;
        else if(nfloor[1] && floor > 1)
            has_down = 1;
        else if(nfloor[2] && floor > 2)
            has_down = 1;
        else if(nfloor[3] && floor > 3)
            has_down = 1;
        else 
            has_down = 0;
    end
    
endmodule
