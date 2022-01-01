`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/01 21:37:52
// Design Name: 
// Module Name: dfa
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


module dfa(
    output reg [15:0]floor,
    output reg [4:0]btn_off,
    input clk,rst,
    input [4:0]nfloor
    );
    wire has_up;
    wire has_down;
    checkupordown ckud(
        .has_up(has_up),
        .has_down(has_down),
        .floor(floor),
        .nfloor(nfloor)
    );
    
    
    reg [3:0]next_state;
    reg [3:0]curr_state;
    reg [15:0] next_floor;
    parameter N=99_999999;
    reg clk_1s; 
    reg [31:0]count;
    always@(posedge clk, posedge rst)begin
        if(rst) begin
            count <= 0;
        end
        else begin
            clk_1s<=0;
            if(count<N)
                count<=count+1;
            else begin
                count<=0;
                clk_1s<=1;
            end
        end
    end
    
    always@(curr_state,has_up,has_down,nfloor,floor) begin
        if(curr_state == 0) begin
            if(has_up) begin 
                next_state = 1; 
            end
            else if(has_down) begin 
                next_state = 3;
            end
            else begin
                next_state = 0;
            end
        end
        else if(curr_state == 1) begin
            if(nfloor[floor]) begin
                next_state = 2;
            end 
            else begin
                if(has_up) begin
                    next_state = 1;
                end
                else begin
                    next_state = 0; 
                end
            end
        end if(curr_state == 3) begin
            if(nfloor[floor]) begin
                next_state = 4;
            end 
            else begin
                if(has_down) begin
                    next_state = 3;
                end
                else begin
                    next_state = 0;
                end
            end
        end if(curr_state == 2) begin
            if(has_up) begin 
                next_state = 1; 
            end
            else begin
                next_state = 0;
            end 
        end if(curr_state == 4) begin
            if(has_down) begin
                next_state = 3;
            end
            else begin
                next_state = 0;
            end
        end
    end
    
    always@(curr_state,nfloor,floor) begin
        if(curr_state == 1) begin
            if(!nfloor[floor]) begin
                next_floor = floor + 1;
            end
            else begin
                next_floor = floor;
            end
        end
        else if(curr_state == 3) begin
            if(!nfloor[floor]) begin
                next_floor = floor - 1;
            end
            else begin
                next_floor = floor;
            end
        end
        else begin
            next_floor = floor;
        end
    end
    
    always @(posedge clk_1s, posedge rst) begin
        if(rst)
            curr_state <= 0;
        else
            curr_state <= next_state;
    end
    
    always @(posedge clk_1s, posedge rst) begin
        if(rst)
            floor <= 0;
        else
            floor <= next_floor;
    end
    
    always @(curr_state) begin
        if(curr_state == 2 || curr_state == 4 || curr_state == 0) begin
            btn_off = ~(1<<floor);
        end
        else begin
            btn_off = 5'b11111;
        end
    end
    
endmodule
