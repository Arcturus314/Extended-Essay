`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/18/2015 07:13:53 AM
// Design Name: 
// Module Name: Complex_Multiply
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


module Complex_Multiply(
    input [7:0] realIn,
    input [7:0] imagIn,
    output [7:0] realOut,
    output [7:0] imagOut
    );
    
    //implementation
    wire [7:0] real_sq_out;   
    wire [7:0] imag_sq_out;
    wire [7:0] imag_sq_invert;
    
    //finding a^2-b^2
    assign realOut = real_sq_out + imag_sq_invert;
    //finding 2bi
    assign imagOut = imagIn + imagIn;
    //Inverting imag_sq_out
    assign imag_sq_invert = ~imag_sq_out + 1'b1;
    
    //module instantiations
    Multiplier real_sq
    (
        .in1 (realIn),
        .in2 (realIn),
        .out (real_sq_out)
    );
    
    Multiplier imag_sq
    (
        .in1 (imagIn),
        .in2 (imagIn),
        .out (imag_sq_out)
    );

    
endmodule
