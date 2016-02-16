`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2015 11:22:51 PM
// Design Name: 
// Module Name: Timer_Top
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


module Calc(
    input clk,
    input [7:0] sw,
    //sw[3:0] is input 1
    //sw[8:4} is input 2
    output [15:0] led,
    input btnL,
    //btnL to add
    input btnR,
    //btnR to twos complement
    input btnU
    //btnU to multiply
    );
    //implementation ALU TEST
    /*
    wire [4:0] toLED_1;
    wire [4:0] toLED_2;
    wire [7:0] toLED_3;
    
    //instantiations
    Adder adder_1
        (
            .enable (btnL),
            .in1 (sw[3:0]),
            .in2 (sw[7:4]),
            .out (toLED_1)
        );
        
    ToTCmplmt ToTwos_1
        (
            .enable (btnR),
            .in (sw[3:0]),
            .out (toLED_2)
        );
        
    Multiplier multiplier_1
        (
        .enable (btnU),
        .in1 (sw[3:0]),
        .in2 (sw[7:4]),
        .out (toLED_3)
        );
        
    assign led = { (toLED_3[7:5]&{4{btnU}}), ((toLED_1&{5{btnL}}) | (toLED_2&{5{btnR}}) | (toLED_3[4:0]&{4{btnU}}))}; */
    
    // Implementation count TEST
    
    wire lowClock;
    assign led[15] = lowClock;
    assign led[14] = clk;
    
    Clock_Divide divide_1
        (
            .clockIn (clk),
            .clockOut (lowClock)
        );
        
    Iter_Counter count_1
        (
            .clock (lowClock),
            .enable (sw[0]),
            .reset (sw[1]),
            .count (led[7:0])
        );
            
        
            
            
endmodule
