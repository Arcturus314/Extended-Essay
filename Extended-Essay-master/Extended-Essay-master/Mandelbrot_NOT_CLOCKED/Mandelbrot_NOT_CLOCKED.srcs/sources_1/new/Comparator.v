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
    //input [7:0] dim,
    input enable,
    //input clk,
    output reg comp_out
    );
    //implementation
    //If comp_out = 1, realIn > dim
    //If comp_out = 0, realIn !> dim
    parameter dim_pos = 8'b01010100;
    parameter dim_neg = 8'b10101100;
    /*
    The graph system: 
        -Runs from -3 to 3 on both the x and y planes
        -Incremented in 3/127
        -Checks to see if point is outside of +- 84/127 on both the x and y planes
    */
    
    wire [7:0] realIn_twos = (~realIn + 1'b0);
    wire [7:0] imagIn_twos = (~imagIn + 1'b0);
    
    //What follows is the Code from Hell. Do not try to understand it, simply pray that it continues to work.
    //Unless you're good at simplifying boolean algebra... In that case fix it please.
    //Shit it doesn't work fuck me
    //Well time to comment this out
    /*assign comp_out_real_above = enable & ( (realIn[7]&~dim_pos[7]) | (realIn[7]&dim_pos[7]&~realIn[6]&dim_pos[6]) | (realIn[7]&dim_pos[7]&~realIn[6]&dim_pos[6]&~realIn[5]&dim_pos[5]) | (realIn[7]&dim_pos[7]&~realIn[6]&dim_pos[6]&~realIn[5]&dim_pos[5]&~realIn[4]&dim_pos[4]) | (realIn[7]&dim_pos[7]&~realIn[6]&dim_pos[6]&~realIn[5]&dim_pos[5]&~realIn[4]&dim_pos[4]&~realIn[3]&dim_pos[3]) | (realIn[7]&dim_pos[7]&~realIn[6]&dim_pos[6]&~realIn[5]&dim_pos[5]&~realIn[4]&dim_pos[4]&~realIn[3]&dim_pos[3]&~realIn[2]&dim_pos[2]) | (realIn[7]&dim_pos[7]&~realIn[6]&dim_pos[6]&~realIn[5]&dim_pos[5]&~realIn[4]&dim_pos[4]&~realIn[3]&dim_pos[3]&~realIn[2]&dim_pos[2]&~realIn[1]&dim_pos[1]) | (realIn[7]&dim_pos[7]&~realIn[6]&dim_pos[6]&~realIn[5]&dim_pos[5]&~realIn[4]&dim_pos[4]&~realIn[3]&dim_pos[3]&~realIn[2]&dim_pos[2]&~realIn[1]&dim_pos[1]&~realIn[0]&dim_pos[0]) | (~realIn[7]&~dim_pos[7]&realIn[6]&~dim_pos[6]) | (~realIn[7]&~dim_pos[7]&realIn[6]&~dim_pos[6]&realIn[5]&~dim_pos[5]) | (~realIn[7]&~dim_pos[7]&realIn[6]&~dim_pos[6]&realIn[5]&~dim_pos[5]&realIn[4]&~dim_pos[4]) | (~realIn[7]&~dim_pos[7]&realIn[6]&~dim_pos[6]&realIn[5]&~dim_pos[5]&realIn[4]&~dim_pos[4]&realIn[3]&~dim_pos[3]) | (~realIn[7]&~dim_pos[7]&realIn[6]&~dim_pos[6]&realIn[5]&~dim_pos[5]&realIn[4]&~dim_pos[4]&realIn[3]&~dim_pos[3]&realIn[2]&~dim_pos[2]) | (~realIn[7]&~dim_pos[7]&realIn[6]&~dim_pos[6]&realIn[5]&~dim_pos[5]&realIn[4]&~dim_pos[4]&realIn[3]&~dim_pos[3]&realIn[2]&~dim_pos[2]&realIn[1]&~dim_pos[1]) | (~realIn[7]&~dim_pos[7]&realIn[6]&~dim_pos[6]&realIn[5]&~dim_pos[5]&realIn[4]&~dim_pos[4]&realIn[3]&~dim_pos[3]&realIn[2]&~dim_pos[2]&realIn[1]&~dim_pos[1]&realIn[0]&~dim_pos[0]) );
    assign comp_out_real_below = enable & ( (realIn_twos[7]&~dim_neg[7]) | (realIn_twos[7]&dim_neg[7]&~realIn_twos[6]&dim_neg[6]) | (realIn_twos[7]&dim_neg[7]&~realIn_twos[6]&dim_neg[6]&~realIn_twos[5]&dim_neg[5]) | (realIn_twos[7]&dim_neg[7]&~realIn_twos[6]&dim_neg[6]&~realIn_twos[5]&dim_neg[5]&~realIn_twos[4]&dim_neg[4]) | (realIn_twos[7]&dim_neg[7]&~realIn_twos[6]&dim_neg[6]&~realIn_twos[5]&dim_neg[5]&~realIn_twos[4]&dim_neg[4]&~realIn_twos[3]&dim_neg[3]) | (realIn_twos[7]&dim_neg[7]&~realIn_twos[6]&dim_neg[6]&~realIn_twos[5]&dim_neg[5]&~realIn_twos[4]&dim_neg[4]&~realIn_twos[3]&dim_neg[3]&~realIn_twos[2]&dim_neg[2]) | (realIn_twos[7]&dim_neg[7]&~realIn_twos[6]&dim_neg[6]&~realIn_twos[5]&dim_neg[5]&~realIn_twos[4]&dim_neg[4]&~realIn_twos[3]&dim_neg[3]&~realIn_twos[2]&dim_neg[2]&~realIn_twos[1]&dim_neg[1]) | (realIn_twos[7]&dim_neg[7]&~realIn_twos[6]&dim_neg[6]&~realIn_twos[5]&dim_neg[5]&~realIn_twos[4]&dim_neg[4]&~realIn_twos[3]&dim_neg[3]&~realIn_twos[2]&dim_neg[2]&~realIn_twos[1]&dim_neg[1]&~realIn_twos[0]&dim_neg[0]) | (~realIn_twos[7]&~dim_neg[7]&realIn_twos[6]&~dim_neg[6]) | (~realIn_twos[7]&~dim_neg[7]&realIn_twos[6]&~dim_neg[6]&realIn_twos[5]&~dim_neg[5]) | (~realIn_twos[7]&~dim_neg[7]&realIn_twos[6]&~dim_neg[6]&realIn_twos[5]&~dim_neg[5]&realIn_twos[4]&~dim_neg[4]) | (~realIn_twos[7]&~dim_neg[7]&realIn_twos[6]&~dim_neg[6]&realIn_twos[5]&~dim_neg[5]&realIn_twos[4]&~dim_neg[4]&realIn_twos[3]&~dim_neg[3]) | (~realIn_twos[7]&~dim_neg[7]&realIn_twos[6]&~dim_neg[6]&realIn_twos[5]&~dim_neg[5]&realIn_twos[4]&~dim_neg[4]&realIn_twos[3]&~dim_neg[3]&realIn_twos[2]&~dim_neg[2]) | (~realIn_twos[7]&~dim_neg[7]&realIn_twos[6]&~dim_neg[6]&realIn_twos[5]&~dim_neg[5]&realIn_twos[4]&~dim_neg[4]&realIn_twos[3]&~dim_neg[3]&realIn_twos[2]&~dim_neg[2]&realIn_twos[1]&~dim_neg[1]) | (~realIn_twos[7]&~dim_neg[7]&realIn_twos[6]&~dim_neg[6]&realIn_twos[5]&~dim_neg[5]&realIn_twos[4]&~dim_neg[4]&realIn_twos[3]&~dim_neg[3]&realIn_twos[2]&~dim_neg[2]&realIn_twos[1]&~dim_neg[1]&realIn_twos[0]&~dim_neg[0]) );
    assign comp_out_imag_above = enable & ( (imagIn[7]&~dim_pos[7]) | (imagIn[7]&dim_pos[7]&~imagIn[6]&dim_pos[6]) | (imagIn[7]&dim_pos[7]&~imagIn[6]&dim_pos[6]&~imagIn[5]&dim_pos[5]) | (imagIn[7]&dim_pos[7]&~imagIn[6]&dim_pos[6]&~imagIn[5]&dim_pos[5]&~imagIn[4]&dim_pos[4]) | (imagIn[7]&dim_pos[7]&~imagIn[6]&dim_pos[6]&~imagIn[5]&dim_pos[5]&~imagIn[4]&dim_pos[4]&~imagIn[3]&dim_pos[3]) | (imagIn[7]&dim_pos[7]&~imagIn[6]&dim_pos[6]&~imagIn[5]&dim_pos[5]&~imagIn[4]&dim_pos[4]&~imagIn[3]&dim_pos[3]&~imagIn[2]&dim_pos[2]) | (imagIn[7]&dim_pos[7]&~imagIn[6]&dim_pos[6]&~imagIn[5]&dim_pos[5]&~imagIn[4]&dim_pos[4]&~imagIn[3]&dim_pos[3]&~imagIn[2]&dim_pos[2]&~imagIn[1]&dim_pos[1]) | (imagIn[7]&dim_pos[7]&~imagIn[6]&dim_pos[6]&~imagIn[5]&dim_pos[5]&~imagIn[4]&dim_pos[4]&~imagIn[3]&dim_pos[3]&~imagIn[2]&dim_pos[2]&~imagIn[1]&dim_pos[1]&~imagIn[0]&dim_pos[0]) | (~imagIn[7]&~dim_pos[7]&imagIn[6]&~dim_pos[6]) | (~imagIn[7]&~dim_pos[7]&imagIn[6]&~dim_pos[6]&imagIn[5]&~dim_pos[5]) | (~imagIn[7]&~dim_pos[7]&imagIn[6]&~dim_pos[6]&imagIn[5]&~dim_pos[5]&imagIn[4]&~dim_pos[4]) | (~imagIn[7]&~dim_pos[7]&imagIn[6]&~dim_pos[6]&imagIn[5]&~dim_pos[5]&imagIn[4]&~dim_pos[4]&imagIn[3]&~dim_pos[3]) | (~imagIn[7]&~dim_pos[7]&imagIn[6]&~dim_pos[6]&imagIn[5]&~dim_pos[5]&imagIn[4]&~dim_pos[4]&imagIn[3]&~dim_pos[3]&imagIn[2]&~dim_pos[2]) | (~imagIn[7]&~dim_pos[7]&imagIn[6]&~dim_pos[6]&imagIn[5]&~dim_pos[5]&imagIn[4]&~dim_pos[4]&imagIn[3]&~dim_pos[3]&imagIn[2]&~dim_pos[2]&imagIn[1]&~dim_pos[1]) | (~imagIn[7]&~dim_pos[7]&imagIn[6]&~dim_pos[6]&imagIn[5]&~dim_pos[5]&imagIn[4]&~dim_pos[4]&imagIn[3]&~dim_pos[3]&imagIn[2]&~dim_pos[2]&imagIn[1]&~dim_pos[1]&imagIn[0]&~dim_pos[0]) );
    assign comp_out_imag_below = enable & ( (imagIn_twos[7]&~dim_neg[7]) | (imagIn_twos[7]&dim_neg[7]&~imagIn_twos[6]&dim_neg[6]) | (imagIn_twos[7]&dim_neg[7]&~imagIn_twos[6]&dim_neg[6]&~imagIn_twos[5]&dim_neg[5]) | (imagIn_twos[7]&dim_neg[7]&~imagIn_twos[6]&dim_neg[6]&~imagIn_twos[5]&dim_neg[5]&~imagIn_twos[4]&dim_neg[4]) | (imagIn_twos[7]&dim_neg[7]&~imagIn_twos[6]&dim_neg[6]&~imagIn_twos[5]&dim_neg[5]&~imagIn_twos[4]&dim_neg[4]&~imagIn_twos[3]&dim_neg[3]) | (imagIn_twos[7]&dim_neg[7]&~imagIn_twos[6]&dim_neg[6]&~imagIn_twos[5]&dim_neg[5]&~imagIn_twos[4]&dim_neg[4]&~imagIn_twos[3]&dim_neg[3]&~imagIn_twos[2]&dim_neg[2]) | (imagIn_twos[7]&dim_neg[7]&~imagIn_twos[6]&dim_neg[6]&~imagIn_twos[5]&dim_neg[5]&~imagIn_twos[4]&dim_neg[4]&~imagIn_twos[3]&dim_neg[3]&~imagIn_twos[2]&dim_neg[2]&~imagIn_twos[1]&dim_neg[1]) | (imagIn_twos[7]&dim_neg[7]&~imagIn_twos[6]&dim_neg[6]&~imagIn_twos[5]&dim_neg[5]&~imagIn_twos[4]&dim_neg[4]&~imagIn_twos[3]&dim_neg[3]&~imagIn_twos[2]&dim_neg[2]&~imagIn_twos[1]&dim_neg[1]&~imagIn_twos[0]&dim_neg[0]) | (~imagIn_twos[7]&~dim_neg[7]&imagIn_twos[6]&~dim_neg[6]) | (~imagIn_twos[7]&~dim_neg[7]&imagIn_twos[6]&~dim_neg[6]&imagIn_twos[5]&~dim_neg[5]) | (~imagIn_twos[7]&~dim_neg[7]&imagIn_twos[6]&~dim_neg[6]&imagIn_twos[5]&~dim_neg[5]&imagIn_twos[4]&~dim_neg[4]) | (~imagIn_twos[7]&~dim_neg[7]&imagIn_twos[6]&~dim_neg[6]&imagIn_twos[5]&~dim_neg[5]&imagIn_twos[4]&~dim_neg[4]&imagIn_twos[3]&~dim_neg[3]) | (~imagIn_twos[7]&~dim_neg[7]&imagIn_twos[6]&~dim_neg[6]&imagIn_twos[5]&~dim_neg[5]&imagIn_twos[4]&~dim_neg[4]&imagIn_twos[3]&~dim_neg[3]&imagIn_twos[2]&~dim_neg[2]) | (~imagIn_twos[7]&~dim_neg[7]&imagIn_twos[6]&~dim_neg[6]&imagIn_twos[5]&~dim_neg[5]&imagIn_twos[4]&~dim_neg[4]&imagIn_twos[3]&~dim_neg[3]&imagIn_twos[2]&~dim_neg[2]&imagIn_twos[1]&~dim_neg[1]) | (~imagIn_twos[7]&~dim_neg[7]&imagIn_twos[6]&~dim_neg[6]&imagIn_twos[5]&~dim_neg[5]&imagIn_twos[4]&~dim_neg[4]&imagIn_twos[3]&~dim_neg[3]&imagIn_twos[2]&~dim_neg[2]&imagIn_twos[1]&~dim_neg[1]&imagIn_twos[0]&~dim_neg[0]) );
    
    assign comp_out = comp_out_real_above | comp_out_imag_above | ~comp_out_real_below | ~comp_out_imag_below;*/
    
    //stores temp values from each test to OR together
    reg [3:0] comparator_out;
    
    always @(enable or realIn or realIn_twos or imagIn or imagIn_twos)
    begin
        if(enable == 1'b1)
        begin
    
        if (realIn[7] == 1'b0)
        begin
            if (realIn[6:0] > 7'b1010100)
            begin
                comparator_out[0] <= 1'b1;
            end
            if (realIn[6:0] < 7'b1010100)
            begin
                comparator_out[0] <= 1'b0;
            end
        end
        
        if (realIn_twos[7] == 1'b1)
        begin
            if (realIn_twos[6:0] > 7'b0101100)
            begin
                comparator_out[1] <= 1'b0;
            end
            if (realIn_twos[6:0] < 7'b0101100)
            begin
                comparator_out[1] <= 1'b1;
            end
        end
        
        if (imagIn[7] == 1'b0)
            begin
                if (imagIn[6:0] > 7'b1010100)
                begin
                    comparator_out[2] <= 1'b1;
                end
                if (imagIn[6:0] < 7'b1010100)
                begin
                    comparator_out[2] <= 1'b0;
                end
            end
                
        if (imagIn_twos[7] == 1'b1)
        begin
            if (imagIn_twos[6:0] > 7'b0101100)
            begin
                comparator_out[3] <= 1'b0;
            end
            if (imagIn_twos[6:0] < 7'b0101100)
            begin
                comparator_out[3] <= 1'b1;
            end
        end
        end
        
        comp_out <= (comparator_out[0] | comparator_out[1]) | (comparator_out[2] | comparator_out[3]);
    end
    
endmodule
