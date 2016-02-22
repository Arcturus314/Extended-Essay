`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2015 07:38:37 PM
// Design Name: 
// Module Name: Multiplier
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


module Multiplier(
    input [7:0] in1,
    input [7:0] in2,
    output [7:0] out
    );
    //implementation
    wire [14:0] temp_out = in1*in2;
    assign out = temp_out[7:0];
      
endmodule
