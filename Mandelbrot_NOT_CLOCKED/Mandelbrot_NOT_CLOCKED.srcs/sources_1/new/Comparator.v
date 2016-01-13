`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/19/2015 05:33:29 AM
// Design Name: 
// Module Name: Comparator
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


module Comparator(
    input [7:0] realIn,
    input [7:0] imagIn,
    input [7:0] dim,
    input enable,
    input clk,
    output reg comp_out
    );
    //implementation
    //If comp_out = 1, realIn > dim
    //If comp_out = 0, realIn !> dim
    
    wire [7:0] dim_twos = (~dim + 1'b0);
    wire [7:0] realIn_twos = (~realIn + 1'b0);
    wire [7:0] imagIn_twos = (~imagIn + 1'b0);
    
    always @(posedge clk)
    begin
        if (realIn > 1)
            comp_out <= 1;
        else
            comp_out <= 0;
    end
    
endmodule
