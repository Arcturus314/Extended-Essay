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


module test_block_1(
    input reg [7:0] realPos,
    input clock,
    input reset,
    input enable,
    output reg [7:0] real_coords,
    output reg [7:0] imag_coords,
    
    reg [7:0] imagPos = 8'b01111111,
    reg [32:0] totalIter = 32'b0
    );
 
    
    always @(posedge clock)
    begin
        if (enable == 1'b1)
        begin
         //genvar i;
         //generate for (i = 0; i < 129; i = i + 1)
            genvar i;
            generate for (i = 0; i < 257; i = i + 1)
            begin
                imagPos <= imagePos + 8'b11111111;
                Single_Location Location_[i]
                (
                 .real_coords (realPos),
                 .imag_coords (imagPos),
                 .clock (clock),
                 .reset (reset),
                 .enable (enable)
                );
            end
            endgenerate;
          //endgenerate;
      end
    
    end
endmodule
