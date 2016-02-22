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
    output [7:0] realOut,
    output [7:0] imagOut
    );
    
    //Implementation            
    wire [7:0] multiplier_realOut;
    wire [7:0] multiplier_imagOut;
    
    //a^2-b^2+Ainit
    assign realOut = realIn + multiplier_realOut;
    //2bi+Binit
    assign imagOut = imagIn + multiplier_imagOut;
    
    //Module Instantiation   
    Complex_Multiply multiplier
    (
        .realIn (realIn),
        .imagIn (imagIn),
        .realOut (multiplier_realOut),
        .imagOut (multiplier_imagOut)
    );
           
endmodule
