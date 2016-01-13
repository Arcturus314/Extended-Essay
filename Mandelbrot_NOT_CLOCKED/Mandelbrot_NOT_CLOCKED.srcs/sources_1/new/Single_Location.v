`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/18/2015 02:56:57 PM
// Design Name: 
// Module Name: Single_Location
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


module Single_Location(
    input [7:0] real_coords,
    input [7:0] imag_coords,
    input clock,
    input reset,
    input enable,
    output reg [7:0] iterations,
    output [7:0] current_iter
    );
    //implementation
    wire [7:0] realVal;
    wire [7:0] imagVal;
    wire comp_out;
    reg counter_reset;
    wire [7:0] iter_count;
    
    assign current_iter = iter_count;
    //module declarations

    Complex_add adder
    (
        .realIn (real_coords),
        .imagIn (imag_coords),
        .clk (clock),
        .enable (enable),
        .realOut (realVal),
        .imagOut (imagVal)
    );
    
    Comparator compare
    (
        .realIn (realVal),
        .imagIn (imagVal),
        .dim (01'b1), //cannot exceed box of max size 2)
        .enable (enable),
        .clk (clock),
        .comp_out (comp_out)
    );
    
    Iter_Counter count
    (
        .clock (clock),
        .enable (enable),
        .reset (counter_reset),
        .count (iter_count)
    );
    
    always @(posedge clock)
    begin
        if (reset == 1)
            counter_reset <= 1;
        else if (reset == 0)
            counter_reset <= 0;
        if (comp_out == 1)
            iterations <= iter_count;
    end
       
endmodule
