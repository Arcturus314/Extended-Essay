`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2016 06:34:14 PM
// Design Name: 
// Module Name: test_block
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


module Test_Block(
    input clock,
    input reg [7:0] realPos_in,
    input reset,
    input enable,
    //output reg [7:0] real_coords,
    //output reg [7:0] imag_coords,
    
    reg [7:0] imagPos = 8'b01111111,
    reg [7:0] realPos
    );
 
 
    generate
        genvar x;
        for (x = 0; x < 257; x = x + 1)
        begin
            reg [7:0] iter[x];
            wire [32:0] temp_loc_op1  = (x*8'b11111111);
            wire [32:0] temp_loc_op2 = imagePos + temp_loc_op1[7:0];
            Single_Location location[x]
            (
                .real_coords (realPos),
                .imag_coords (temp_loc_op2[7:0]),
                .clock (clock),
                .reset (reset),
                .enable (enable),
                .iterations (iter[i])
            );
        end
    endgenerate
    
 always @(posedge clock)
 begin
    realPos <= realPos_in;
end
        
        
        /*generate 
            genvar x;
            for (x = 0; x < 257; x = x + 1)
            begin
                always @(posedge clock)
                begin
                   if (enable == 1'b1)
                   begin 
                    reg [7:0] iter[x];
                    imagPos <= imagePos + 8'b11111111;
                    Single_Location location[x]
                    (
                        .real_coords (realPos),
                        .imag_coords (imagPos),
                        .clock (clock),
                        .reset (reset),
                        .enable (enable),
                        .iterations (iter[i])
                    );
                   end
                end
            end
        endgenerate; */
endmodule
