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


module compare_test(
    input [7:0] real_coords,
    input [7:0] imag_coords,
    //input [7:0] dim,
    input enable,
    //input clock,
    output reg [7:0] iterations
    );
    //implementation
    //If comp_out = 1, real_coords > dim
    //If comp_out = 0, real_coords !> dim
    parameter dim_pos = 8'b01010100;
    parameter dim_neg = 8'b10101100;
    /*
    The graph system: 
        -Runs from -3 to 3 on both the x and y planes
        -Incremented in 3/127
        -Checks to see if point is outside of +- 84/127 on both the x and y planes
    */
    
    wire [7:0] real_coords_twos = (~real_coords + 1'b0);
    wire [7:0] imag_coords_twos = (~imag_coords + 1'b0);
    
    //What follows is the Code from Hell. Do not try to understand it, simply pray that it continues to work.
    //Unless you're good at simplifying boolean algebra... In that case fix it please.
    //Shit it doesn't work fuck me
    /*assign comp_out_real_above = enable & ( (real_coords[7]&~dim_pos[7]) | (real_coords[7]&dim_pos[7]&~real_coords[6]&dim_pos[6]) | (real_coords[7]&dim_pos[7]&~real_coords[6]&dim_pos[6]&~real_coords[5]&dim_pos[5]) | (real_coords[7]&dim_pos[7]&~real_coords[6]&dim_pos[6]&~real_coords[5]&dim_pos[5]&~real_coords[4]&dim_pos[4]) | (real_coords[7]&dim_pos[7]&~real_coords[6]&dim_pos[6]&~real_coords[5]&dim_pos[5]&~real_coords[4]&dim_pos[4]&~real_coords[3]&dim_pos[3]) | (real_coords[7]&dim_pos[7]&~real_coords[6]&dim_pos[6]&~real_coords[5]&dim_pos[5]&~real_coords[4]&dim_pos[4]&~real_coords[3]&dim_pos[3]&~real_coords[2]&dim_pos[2]) | (real_coords[7]&dim_pos[7]&~real_coords[6]&dim_pos[6]&~real_coords[5]&dim_pos[5]&~real_coords[4]&dim_pos[4]&~real_coords[3]&dim_pos[3]&~real_coords[2]&dim_pos[2]&~real_coords[1]&dim_pos[1]) | (real_coords[7]&dim_pos[7]&~real_coords[6]&dim_pos[6]&~real_coords[5]&dim_pos[5]&~real_coords[4]&dim_pos[4]&~real_coords[3]&dim_pos[3]&~real_coords[2]&dim_pos[2]&~real_coords[1]&dim_pos[1]&~real_coords[0]&dim_pos[0]) | (~real_coords[7]&~dim_pos[7]&real_coords[6]&~dim_pos[6]) | (~real_coords[7]&~dim_pos[7]&real_coords[6]&~dim_pos[6]&real_coords[5]&~dim_pos[5]) | (~real_coords[7]&~dim_pos[7]&real_coords[6]&~dim_pos[6]&real_coords[5]&~dim_pos[5]&real_coords[4]&~dim_pos[4]) | (~real_coords[7]&~dim_pos[7]&real_coords[6]&~dim_pos[6]&real_coords[5]&~dim_pos[5]&real_coords[4]&~dim_pos[4]&real_coords[3]&~dim_pos[3]) | (~real_coords[7]&~dim_pos[7]&real_coords[6]&~dim_pos[6]&real_coords[5]&~dim_pos[5]&real_coords[4]&~dim_pos[4]&real_coords[3]&~dim_pos[3]&real_coords[2]&~dim_pos[2]) | (~real_coords[7]&~dim_pos[7]&real_coords[6]&~dim_pos[6]&real_coords[5]&~dim_pos[5]&real_coords[4]&~dim_pos[4]&real_coords[3]&~dim_pos[3]&real_coords[2]&~dim_pos[2]&real_coords[1]&~dim_pos[1]) | (~real_coords[7]&~dim_pos[7]&real_coords[6]&~dim_pos[6]&real_coords[5]&~dim_pos[5]&real_coords[4]&~dim_pos[4]&real_coords[3]&~dim_pos[3]&real_coords[2]&~dim_pos[2]&real_coords[1]&~dim_pos[1]&real_coords[0]&~dim_pos[0]) );
    assign comp_out_real_below = enable & ( (real_coords_twos[7]&~dim_neg[7]) | (real_coords_twos[7]&dim_neg[7]&~real_coords_twos[6]&dim_neg[6]) | (real_coords_twos[7]&dim_neg[7]&~real_coords_twos[6]&dim_neg[6]&~real_coords_twos[5]&dim_neg[5]) | (real_coords_twos[7]&dim_neg[7]&~real_coords_twos[6]&dim_neg[6]&~real_coords_twos[5]&dim_neg[5]&~real_coords_twos[4]&dim_neg[4]) | (real_coords_twos[7]&dim_neg[7]&~real_coords_twos[6]&dim_neg[6]&~real_coords_twos[5]&dim_neg[5]&~real_coords_twos[4]&dim_neg[4]&~real_coords_twos[3]&dim_neg[3]) | (real_coords_twos[7]&dim_neg[7]&~real_coords_twos[6]&dim_neg[6]&~real_coords_twos[5]&dim_neg[5]&~real_coords_twos[4]&dim_neg[4]&~real_coords_twos[3]&dim_neg[3]&~real_coords_twos[2]&dim_neg[2]) | (real_coords_twos[7]&dim_neg[7]&~real_coords_twos[6]&dim_neg[6]&~real_coords_twos[5]&dim_neg[5]&~real_coords_twos[4]&dim_neg[4]&~real_coords_twos[3]&dim_neg[3]&~real_coords_twos[2]&dim_neg[2]&~real_coords_twos[1]&dim_neg[1]) | (real_coords_twos[7]&dim_neg[7]&~real_coords_twos[6]&dim_neg[6]&~real_coords_twos[5]&dim_neg[5]&~real_coords_twos[4]&dim_neg[4]&~real_coords_twos[3]&dim_neg[3]&~real_coords_twos[2]&dim_neg[2]&~real_coords_twos[1]&dim_neg[1]&~real_coords_twos[0]&dim_neg[0]) | (~real_coords_twos[7]&~dim_neg[7]&real_coords_twos[6]&~dim_neg[6]) | (~real_coords_twos[7]&~dim_neg[7]&real_coords_twos[6]&~dim_neg[6]&real_coords_twos[5]&~dim_neg[5]) | (~real_coords_twos[7]&~dim_neg[7]&real_coords_twos[6]&~dim_neg[6]&real_coords_twos[5]&~dim_neg[5]&real_coords_twos[4]&~dim_neg[4]) | (~real_coords_twos[7]&~dim_neg[7]&real_coords_twos[6]&~dim_neg[6]&real_coords_twos[5]&~dim_neg[5]&real_coords_twos[4]&~dim_neg[4]&real_coords_twos[3]&~dim_neg[3]) | (~real_coords_twos[7]&~dim_neg[7]&real_coords_twos[6]&~dim_neg[6]&real_coords_twos[5]&~dim_neg[5]&real_coords_twos[4]&~dim_neg[4]&real_coords_twos[3]&~dim_neg[3]&real_coords_twos[2]&~dim_neg[2]) | (~real_coords_twos[7]&~dim_neg[7]&real_coords_twos[6]&~dim_neg[6]&real_coords_twos[5]&~dim_neg[5]&real_coords_twos[4]&~dim_neg[4]&real_coords_twos[3]&~dim_neg[3]&real_coords_twos[2]&~dim_neg[2]&real_coords_twos[1]&~dim_neg[1]) | (~real_coords_twos[7]&~dim_neg[7]&real_coords_twos[6]&~dim_neg[6]&real_coords_twos[5]&~dim_neg[5]&real_coords_twos[4]&~dim_neg[4]&real_coords_twos[3]&~dim_neg[3]&real_coords_twos[2]&~dim_neg[2]&real_coords_twos[1]&~dim_neg[1]&real_coords_twos[0]&~dim_neg[0]) );
    assign comp_out_imag_above = enable & ( (imag_coords[7]&~dim_pos[7]) | (imag_coords[7]&dim_pos[7]&~imag_coords[6]&dim_pos[6]) | (imag_coords[7]&dim_pos[7]&~imag_coords[6]&dim_pos[6]&~imag_coords[5]&dim_pos[5]) | (imag_coords[7]&dim_pos[7]&~imag_coords[6]&dim_pos[6]&~imag_coords[5]&dim_pos[5]&~imag_coords[4]&dim_pos[4]) | (imag_coords[7]&dim_pos[7]&~imag_coords[6]&dim_pos[6]&~imag_coords[5]&dim_pos[5]&~imag_coords[4]&dim_pos[4]&~imag_coords[3]&dim_pos[3]) | (imag_coords[7]&dim_pos[7]&~imag_coords[6]&dim_pos[6]&~imag_coords[5]&dim_pos[5]&~imag_coords[4]&dim_pos[4]&~imag_coords[3]&dim_pos[3]&~imag_coords[2]&dim_pos[2]) | (imag_coords[7]&dim_pos[7]&~imag_coords[6]&dim_pos[6]&~imag_coords[5]&dim_pos[5]&~imag_coords[4]&dim_pos[4]&~imag_coords[3]&dim_pos[3]&~imag_coords[2]&dim_pos[2]&~imag_coords[1]&dim_pos[1]) | (imag_coords[7]&dim_pos[7]&~imag_coords[6]&dim_pos[6]&~imag_coords[5]&dim_pos[5]&~imag_coords[4]&dim_pos[4]&~imag_coords[3]&dim_pos[3]&~imag_coords[2]&dim_pos[2]&~imag_coords[1]&dim_pos[1]&~imag_coords[0]&dim_pos[0]) | (~imag_coords[7]&~dim_pos[7]&imag_coords[6]&~dim_pos[6]) | (~imag_coords[7]&~dim_pos[7]&imag_coords[6]&~dim_pos[6]&imag_coords[5]&~dim_pos[5]) | (~imag_coords[7]&~dim_pos[7]&imag_coords[6]&~dim_pos[6]&imag_coords[5]&~dim_pos[5]&imag_coords[4]&~dim_pos[4]) | (~imag_coords[7]&~dim_pos[7]&imag_coords[6]&~dim_pos[6]&imag_coords[5]&~dim_pos[5]&imag_coords[4]&~dim_pos[4]&imag_coords[3]&~dim_pos[3]) | (~imag_coords[7]&~dim_pos[7]&imag_coords[6]&~dim_pos[6]&imag_coords[5]&~dim_pos[5]&imag_coords[4]&~dim_pos[4]&imag_coords[3]&~dim_pos[3]&imag_coords[2]&~dim_pos[2]) | (~imag_coords[7]&~dim_pos[7]&imag_coords[6]&~dim_pos[6]&imag_coords[5]&~dim_pos[5]&imag_coords[4]&~dim_pos[4]&imag_coords[3]&~dim_pos[3]&imag_coords[2]&~dim_pos[2]&imag_coords[1]&~dim_pos[1]) | (~imag_coords[7]&~dim_pos[7]&imag_coords[6]&~dim_pos[6]&imag_coords[5]&~dim_pos[5]&imag_coords[4]&~dim_pos[4]&imag_coords[3]&~dim_pos[3]&imag_coords[2]&~dim_pos[2]&imag_coords[1]&~dim_pos[1]&imag_coords[0]&~dim_pos[0]) );
    assign comp_out_imag_below = enable & ( (imag_coords_twos[7]&~dim_neg[7]) | (imag_coords_twos[7]&dim_neg[7]&~imag_coords_twos[6]&dim_neg[6]) | (imag_coords_twos[7]&dim_neg[7]&~imag_coords_twos[6]&dim_neg[6]&~imag_coords_twos[5]&dim_neg[5]) | (imag_coords_twos[7]&dim_neg[7]&~imag_coords_twos[6]&dim_neg[6]&~imag_coords_twos[5]&dim_neg[5]&~imag_coords_twos[4]&dim_neg[4]) | (imag_coords_twos[7]&dim_neg[7]&~imag_coords_twos[6]&dim_neg[6]&~imag_coords_twos[5]&dim_neg[5]&~imag_coords_twos[4]&dim_neg[4]&~imag_coords_twos[3]&dim_neg[3]) | (imag_coords_twos[7]&dim_neg[7]&~imag_coords_twos[6]&dim_neg[6]&~imag_coords_twos[5]&dim_neg[5]&~imag_coords_twos[4]&dim_neg[4]&~imag_coords_twos[3]&dim_neg[3]&~imag_coords_twos[2]&dim_neg[2]) | (imag_coords_twos[7]&dim_neg[7]&~imag_coords_twos[6]&dim_neg[6]&~imag_coords_twos[5]&dim_neg[5]&~imag_coords_twos[4]&dim_neg[4]&~imag_coords_twos[3]&dim_neg[3]&~imag_coords_twos[2]&dim_neg[2]&~imag_coords_twos[1]&dim_neg[1]) | (imag_coords_twos[7]&dim_neg[7]&~imag_coords_twos[6]&dim_neg[6]&~imag_coords_twos[5]&dim_neg[5]&~imag_coords_twos[4]&dim_neg[4]&~imag_coords_twos[3]&dim_neg[3]&~imag_coords_twos[2]&dim_neg[2]&~imag_coords_twos[1]&dim_neg[1]&~imag_coords_twos[0]&dim_neg[0]) | (~imag_coords_twos[7]&~dim_neg[7]&imag_coords_twos[6]&~dim_neg[6]) | (~imag_coords_twos[7]&~dim_neg[7]&imag_coords_twos[6]&~dim_neg[6]&imag_coords_twos[5]&~dim_neg[5]) | (~imag_coords_twos[7]&~dim_neg[7]&imag_coords_twos[6]&~dim_neg[6]&imag_coords_twos[5]&~dim_neg[5]&imag_coords_twos[4]&~dim_neg[4]) | (~imag_coords_twos[7]&~dim_neg[7]&imag_coords_twos[6]&~dim_neg[6]&imag_coords_twos[5]&~dim_neg[5]&imag_coords_twos[4]&~dim_neg[4]&imag_coords_twos[3]&~dim_neg[3]) | (~imag_coords_twos[7]&~dim_neg[7]&imag_coords_twos[6]&~dim_neg[6]&imag_coords_twos[5]&~dim_neg[5]&imag_coords_twos[4]&~dim_neg[4]&imag_coords_twos[3]&~dim_neg[3]&imag_coords_twos[2]&~dim_neg[2]) | (~imag_coords_twos[7]&~dim_neg[7]&imag_coords_twos[6]&~dim_neg[6]&imag_coords_twos[5]&~dim_neg[5]&imag_coords_twos[4]&~dim_neg[4]&imag_coords_twos[3]&~dim_neg[3]&imag_coords_twos[2]&~dim_neg[2]&imag_coords_twos[1]&~dim_neg[1]) | (~imag_coords_twos[7]&~dim_neg[7]&imag_coords_twos[6]&~dim_neg[6]&imag_coords_twos[5]&~dim_neg[5]&imag_coords_twos[4]&~dim_neg[4]&imag_coords_twos[3]&~dim_neg[3]&imag_coords_twos[2]&~dim_neg[2]&imag_coords_twos[1]&~dim_neg[1]&imag_coords_twos[0]&~dim_neg[0]) );
    
    assign iterations[0] = comp_out_real_above | comp_out_imag_above | ~comp_out_real_below | ~comp_out_imag_below; */
    
    reg [3:0] comparator_out;
    
    always @(enable or real_coords or imag_coords or real_coords_twos or imag_coords_twos)
    begin
        if (real_coords[7] == 1'b0)
        begin
            if (real_coords[6:0] > 7'b1010100)
            begin
                comparator_out[0] = 1'b1;
            end
            if (real_coords[6:0] < 7'b1010100)
            begin
                comparator_out[0] = 1'b0;
            end
        end
        
        if (real_coords[7] == 1'b1)
        begin
            if (real_coords_twos[6:0] > 7'b0101100)
            begin
                comparator_out[1] = 1'b0;
            end
            if (real_coords_twos[6:0] < 7'b0101100)
            begin
                comparator_out[1] = 1'b1;
            end
        end
        
        if (imag_coords[7] == 1'b0)
            begin
                if (imag_coords[6:0] > 7'b1010100)
                begin
                    comparator_out[2] = 1'b1;
                end
                if (imag_coords[6:0] < 7'b1010100)
                begin
                    comparator_out[2] = 1'b0;
                end
            end
                
        if (imag_coords[7] == 1'b1)
        begin
            if (imag_coords_twos[6:0] > 7'b0101100)
            begin
                comparator_out[3] = 1'b0;
            end
            if (imag_coords_twos[6:0] < 7'b0101100)
            begin
                comparator_out[3] = 1'b1;
            end
        end
        
        iterations[0] = (comparator_out[0] | comparator_out[1]) | (comparator_out[2] | comparator_out[3]);
        iterations[1] = comparator_out[0];
        iterations[2] = comparator_out[1];
        iterations[3] = comparator_out[2];
        iterations[4] = comparator_out[3];
        iterations[5] = 1'b1;
    end
    
endmodule