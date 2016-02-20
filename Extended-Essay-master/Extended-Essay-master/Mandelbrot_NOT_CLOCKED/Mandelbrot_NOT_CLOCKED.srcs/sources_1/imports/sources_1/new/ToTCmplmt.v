`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2015 11:46:25 AM
// Design Name: 
// Module Name: ToTCmplmt
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


module ToTCmplmt(
    input [7:0] in,
    output [7:0] out
    );
    //implementation
    assign out = (~in+1'b1);
    
endmodule
