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
    output reg [7:0] iterations
    //output [7:0] current_iter
    );
    //implementation
    wire [7:0] realVal;
    wire [7:0] imagVal;
    wire comp_out;
    //reg counter_reset;
    wire [7:0] iter_count;
    
    //This is where values are stored as they are incremented
    reg [7:0] temp_real;
    reg [7:0] temp_imag;
    
    //assign current_iter = iter_count;
    //module declarations
    
    
    //Shouldn't need this, I just have to hit reset
    //This doesn't work anyway: real_coords and imag_coords are not constants
    //As such it is commented out
    /*initial
    begin
        temp_real <= real_coords;
        temp_imag <= imag_coords;
    end*/
    

    Complex_add adder
    (
        .realIn (temp_real),
        .imagIn (temp_imag),
        .realOut (realVal),
        .imagOut (imagVal)
    );
    
    Comparator compare
    (
        .realIn (temp_real),
        .imagIn (temp_imag),
        //.dim (01'b1), //cannot exceed box of max size 2) (not used)
        .enable (enable),
        //.clk (clock),
        .comp_out (comp_out)
    );
    
    Iter_Counter count
    (
        .clock (clock),
        .enable (enable),
        .reset (reset),
        .count (iter_count)
    );
    
    always @(posedge clock)
    begin
        if (enable == 1'b1)
        begin
            temp_real <= realVal;
            temp_imag <= imagVal;
        end
        if (reset == 1'b1)
        begin
            temp_real <= real_coords;
            temp_imag <= imag_coords;
            iterations <= 0;
        end
        if (comp_out == 1'b1)
            iterations <= iter_count;
    end
       
endmodule
