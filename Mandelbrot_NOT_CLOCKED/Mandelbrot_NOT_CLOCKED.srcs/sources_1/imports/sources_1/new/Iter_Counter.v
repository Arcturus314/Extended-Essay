`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2015 12:07:02 PM
// Design Name: 
// Module Name: Iter_Counter
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


module Iter_Counter(
    input clock,
    input enable,
    input reset,
    output reg [7:0] count
    );
    //implementation
    always @(posedge clock)
    begin
    if (enable == 1) count <= (count + 1);
    if (reset == 1) count <= 0'd1;
    end
    
endmodule
