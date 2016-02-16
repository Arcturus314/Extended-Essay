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
    
    /*
    The graph system: 
        -Runs from -3 to 3 on both the x and y planes
        -Incremented in 3/127
        -Checks to see if point is outside of +- 84/127 on both the x and y planes
    */
    
    wire [7:0] realIn_twos = (~realIn + 1'b0);
    wire [7:0] imagIn_twos = (~imagIn + 1'b0);
    
    always @(posedge clk)
    begin
        if (realIn_twos[7] == 0)
        begin
            if (realIn_twos[6:0] > 7'b1010100)
            begin
                comp_out <= 1'b1;
            end
            if (realIn_twos[6:0] < 7'b1010100)
            begin
                comp_out <= 1'b0;
            end
        end
        
        if (realIn_twos[7] == 1)
        begin
            if (realIn_twos[6:0] > 7'b0101100)
            begin
                comp_out <= 1'b0;
            end
            if (realIn_twos[6:0] < 7'b0101100)
            begin
                comp_out <= 1'b1;
            end
        end
        
        if (imagIn_twos[7] == 0)
            begin
                if (imagIn_twos[6:0] > 7'b1010100)
                begin
                    comp_out <= 1'b1;
                end
                if (imagIn_twos[6:0] < 7'b1010100)
                begin
                    comp_out <= 1'b0;
                end
            end
                
        if (imagIn_twos[7] == 1)
        begin
            if (imagIn_twos[6:0] > 7'b0101100)
            begin
                comp_out <= 1'b0;
            end
            if (imagIn_twos[6:0] < 7'b0101100)
            begin
                comp_out <= 1'b1;
            end
        end
    end
    
endmodule
