`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2015 12:22:13 PM
// Design Name: 
// Module Name: Clock_Divide
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


module Clock_Divide(
    //clock in
    input clock,
    //clock out (no shit)
    output reg clockOut
    

    );
    //implementation
    reg [15:0] clockDivide;
    
    always @(posedge clock)
    begin
        clockDivide <= (clockDivide+1);
        clockOut <= clockDivide[15];
    end
    

    
    
endmodule
