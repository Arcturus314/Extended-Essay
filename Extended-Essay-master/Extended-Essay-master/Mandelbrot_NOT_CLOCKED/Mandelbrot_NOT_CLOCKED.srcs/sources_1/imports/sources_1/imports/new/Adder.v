`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2015 10:44:47 AM
// Design Name: 
// Module Name: Adder
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


module Adder(
    input [7:0] in1,
    input [7:0] in2,
    output [7:0] out
    );
    
    //implementation
    assign out = in1 + in2;
    
endmodule
