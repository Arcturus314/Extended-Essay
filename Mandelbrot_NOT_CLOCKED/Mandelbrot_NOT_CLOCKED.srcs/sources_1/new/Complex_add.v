`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/19/2015 04:50:56 AM
// Design Name: 
// Module Name: Complex_add
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


module Complex_add(
    input [7:0] realIn,
    input [7:0] imagIn,
    input clk,
    input enable,
    output [7:0] realOut,
    output [7:0] imagOut
    );
    
    //Implementation
    //Module Instantiation
    
    wire [7:0] multiplier_realOut;
    wire [7:0] multiplier_imagOut;

    
    Complex_Multiply multiplier
    (
        .realIn (realIn),
        .imagIn (imagIn),
        .enable (enable),
        .clk (clk),
        .realOut (multiplier_realOut),
        .imagOut (multiplier_imagOut)
    );
    
    Adder real_add
    (
        .in1 (realIn),
        .in2 (multiplier_realOut),
        .out (realOut)
    );
    
    Adder imag_add
    (
        .in1 (imagIn),
        .in2 (multiplier_imagOut),
        .out (imagOut)
    );
    
        
endmodule
