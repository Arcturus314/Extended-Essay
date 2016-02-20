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
    input clockIn,
    input [7:0] realPos_in,
    input reset,
    input enable,
    
    output reg [7:0] iterations,
    output reg [7:0] current_iter
    );
 
    parameter imagPos = 8'b00000000;
    //input reg to store real position values
    reg [7:0] realPos;
    //tracks the current location calculator sent to the LEDs
    reg [7:0] loc_pos;
    //controls when LED is lit up. Lights up every 256 clocks (allowing 1 extra cause idk what my code does)
    reg [7:0] iter_count;
    //Clocked down clock output
    wire clock;
    
        
/*generate
    genvar i;
        for (i = 0; i < 256; i = i + 1)
            reg [7:0] iter[i];
    endgenerate;*/
    Clock_Divide newClock
    (
        .clock (clockIn),
        .clockOut (clock)
    );

    
    always @(posedge clock)
    begin
        if (enable == 1)
        begin
            realPos <= realPos_in;
            iter_count <= iter_count + 1;
            if (iter_count == 255)
            begin
                iterations <= iter[loc_pos];
                loc_pos <= loc_pos + 1;
            end
        end
        if (reset == 1)
        begin
            loc_pos <= 0;
            iter_count <= 0;
        end
        
        current_iter <= iter[0];
    end
    
    //I don't think my next 257 lines of code should be allowed. Seriously this is pretty embarrassing. 
    
    reg [255:0] [7:0] iter;

    Single_Location location_0 ( .real_coords (realPos), .imag_coords (8'b10000001), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[0]));
    Single_Location location_1 ( .real_coords (realPos), .imag_coords (8'b10000010), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[1]));
    Single_Location location_2 ( .real_coords (realPos), .imag_coords (8'b10000011), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[2]));
    Single_Location location_3 ( .real_coords (realPos), .imag_coords (8'b10000100), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[3]));
    Single_Location location_4 ( .real_coords (realPos), .imag_coords (8'b10000101), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[4]));
    Single_Location location_5 ( .real_coords (realPos), .imag_coords (8'b10000110), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[5]));
    Single_Location location_6 ( .real_coords (realPos), .imag_coords (8'b10000111), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[6]));
    Single_Location location_7 ( .real_coords (realPos), .imag_coords (8'b10001000), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[7]));
    Single_Location location_8 ( .real_coords (realPos), .imag_coords (8'b10001001), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[8]));
    Single_Location location_9 ( .real_coords (realPos), .imag_coords (8'b10001010), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[9]));
    Single_Location location_10 ( .real_coords (realPos), .imag_coords (8'b10001011), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[10]));
    Single_Location location_11 ( .real_coords (realPos), .imag_coords (8'b10001100), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[11]));
    Single_Location location_12 ( .real_coords (realPos), .imag_coords (8'b10001101), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[12]));
    Single_Location location_13 ( .real_coords (realPos), .imag_coords (8'b10001110), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[13]));
    Single_Location location_14 ( .real_coords (realPos), .imag_coords (8'b10001111), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[14]));
    Single_Location location_15 ( .real_coords (realPos), .imag_coords (8'b10010000), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[15]));
    Single_Location location_16 ( .real_coords (realPos), .imag_coords (8'b10010001), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[16]));
    Single_Location location_17 ( .real_coords (realPos), .imag_coords (8'b10010010), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[17]));
    Single_Location location_18 ( .real_coords (realPos), .imag_coords (8'b10010011), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[18]));
    Single_Location location_19 ( .real_coords (realPos), .imag_coords (8'b10010100), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[19]));
    Single_Location location_20 ( .real_coords (realPos), .imag_coords (8'b10010101), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[20]));
    Single_Location location_21 ( .real_coords (realPos), .imag_coords (8'b10010110), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[21]));
    Single_Location location_22 ( .real_coords (realPos), .imag_coords (8'b10010111), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[22]));
    Single_Location location_23 ( .real_coords (realPos), .imag_coords (8'b10011000), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[23]));
    Single_Location location_24 ( .real_coords (realPos), .imag_coords (8'b10011001), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[24]));
    Single_Location location_25 ( .real_coords (realPos), .imag_coords (8'b10011010), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[25]));
    Single_Location location_26 ( .real_coords (realPos), .imag_coords (8'b10011011), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[26]));
    Single_Location location_27 ( .real_coords (realPos), .imag_coords (8'b10011100), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[27]));
    Single_Location location_28 ( .real_coords (realPos), .imag_coords (8'b10011101), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[28]));
    Single_Location location_29 ( .real_coords (realPos), .imag_coords (8'b10011110), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[29]));
    Single_Location location_30 ( .real_coords (realPos), .imag_coords (8'b10011111), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[30]));
    Single_Location location_31 ( .real_coords (realPos), .imag_coords (8'b10100000), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[31]));
    Single_Location location_32 ( .real_coords (realPos), .imag_coords (8'b10100001), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[32]));
    Single_Location location_33 ( .real_coords (realPos), .imag_coords (8'b10100010), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[33]));
    Single_Location location_34 ( .real_coords (realPos), .imag_coords (8'b10100011), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[34]));
    Single_Location location_35 ( .real_coords (realPos), .imag_coords (8'b10100100), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[35]));
    Single_Location location_36 ( .real_coords (realPos), .imag_coords (8'b10100101), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[36]));
    Single_Location location_37 ( .real_coords (realPos), .imag_coords (8'b10100110), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[37]));
    Single_Location location_38 ( .real_coords (realPos), .imag_coords (8'b10100111), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[38]));
    Single_Location location_39 ( .real_coords (realPos), .imag_coords (8'b10101000), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[39]));
    Single_Location location_40 ( .real_coords (realPos), .imag_coords (8'b10101001), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[40]));
    Single_Location location_41 ( .real_coords (realPos), .imag_coords (8'b10101010), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[41]));
    Single_Location location_42 ( .real_coords (realPos), .imag_coords (8'b10101011), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[42]));
    Single_Location location_43 ( .real_coords (realPos), .imag_coords (8'b10101100), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[43]));
    Single_Location location_44 ( .real_coords (realPos), .imag_coords (8'b10101101), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[44]));
    Single_Location location_45 ( .real_coords (realPos), .imag_coords (8'b10101110), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[45]));
    Single_Location location_46 ( .real_coords (realPos), .imag_coords (8'b10101111), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[46]));
    Single_Location location_47 ( .real_coords (realPos), .imag_coords (8'b10110000), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[47]));
    Single_Location location_48 ( .real_coords (realPos), .imag_coords (8'b10110001), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[48]));
    Single_Location location_49 ( .real_coords (realPos), .imag_coords (8'b10110010), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[49]));
    Single_Location location_50 ( .real_coords (realPos), .imag_coords (8'b10110011), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[50]));
    Single_Location location_51 ( .real_coords (realPos), .imag_coords (8'b10110100), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[51]));
    Single_Location location_52 ( .real_coords (realPos), .imag_coords (8'b10110101), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[52]));
    Single_Location location_53 ( .real_coords (realPos), .imag_coords (8'b10110110), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[53]));
    Single_Location location_54 ( .real_coords (realPos), .imag_coords (8'b10110111), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[54]));
    Single_Location location_55 ( .real_coords (realPos), .imag_coords (8'b10111000), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[55]));
    Single_Location location_56 ( .real_coords (realPos), .imag_coords (8'b10111001), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[56]));
    Single_Location location_57 ( .real_coords (realPos), .imag_coords (8'b10111010), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[57]));
    Single_Location location_58 ( .real_coords (realPos), .imag_coords (8'b10111011), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[58]));
    Single_Location location_59 ( .real_coords (realPos), .imag_coords (8'b10111100), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[59]));
    Single_Location location_60 ( .real_coords (realPos), .imag_coords (8'b10111101), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[60]));
    Single_Location location_61 ( .real_coords (realPos), .imag_coords (8'b10111110), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[61]));
    Single_Location location_62 ( .real_coords (realPos), .imag_coords (8'b10111111), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[62]));
    Single_Location location_63 ( .real_coords (realPos), .imag_coords (8'b11000000), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[63]));
    Single_Location location_64 ( .real_coords (realPos), .imag_coords (8'b11000001), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[64]));
    Single_Location location_65 ( .real_coords (realPos), .imag_coords (8'b11000010), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[65]));
    Single_Location location_66 ( .real_coords (realPos), .imag_coords (8'b11000011), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[66]));
    Single_Location location_67 ( .real_coords (realPos), .imag_coords (8'b11000100), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[67]));
    Single_Location location_68 ( .real_coords (realPos), .imag_coords (8'b11000101), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[68]));
    Single_Location location_69 ( .real_coords (realPos), .imag_coords (8'b11000110), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[69]));
    Single_Location location_70 ( .real_coords (realPos), .imag_coords (8'b11000111), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[70]));
    Single_Location location_71 ( .real_coords (realPos), .imag_coords (8'b11001000), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[71]));
    Single_Location location_72 ( .real_coords (realPos), .imag_coords (8'b11001001), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[72]));
    Single_Location location_73 ( .real_coords (realPos), .imag_coords (8'b11001010), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[73]));
    Single_Location location_74 ( .real_coords (realPos), .imag_coords (8'b11001011), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[74]));
    Single_Location location_75 ( .real_coords (realPos), .imag_coords (8'b11001100), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[75]));
    Single_Location location_76 ( .real_coords (realPos), .imag_coords (8'b11001101), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[76]));
    Single_Location location_77 ( .real_coords (realPos), .imag_coords (8'b11001110), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[77]));
    Single_Location location_78 ( .real_coords (realPos), .imag_coords (8'b11001111), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[78]));
    Single_Location location_79 ( .real_coords (realPos), .imag_coords (8'b11010000), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[79]));
    Single_Location location_80 ( .real_coords (realPos), .imag_coords (8'b11010001), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[80]));
    Single_Location location_81 ( .real_coords (realPos), .imag_coords (8'b11010010), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[81]));
    Single_Location location_82 ( .real_coords (realPos), .imag_coords (8'b11010011), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[82]));
    Single_Location location_83 ( .real_coords (realPos), .imag_coords (8'b11010100), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[83]));
    Single_Location location_84 ( .real_coords (realPos), .imag_coords (8'b11010101), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[84]));
    Single_Location location_85 ( .real_coords (realPos), .imag_coords (8'b11010110), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[85]));
    Single_Location location_86 ( .real_coords (realPos), .imag_coords (8'b11010111), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[86]));
    Single_Location location_87 ( .real_coords (realPos), .imag_coords (8'b11011000), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[87]));
    Single_Location location_88 ( .real_coords (realPos), .imag_coords (8'b11011001), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[88]));
    Single_Location location_89 ( .real_coords (realPos), .imag_coords (8'b11011010), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[89]));
    Single_Location location_90 ( .real_coords (realPos), .imag_coords (8'b11011011), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[90]));
    Single_Location location_91 ( .real_coords (realPos), .imag_coords (8'b11011100), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[91]));
    Single_Location location_92 ( .real_coords (realPos), .imag_coords (8'b11011101), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[92]));
    Single_Location location_93 ( .real_coords (realPos), .imag_coords (8'b11011110), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[93]));
    Single_Location location_94 ( .real_coords (realPos), .imag_coords (8'b11011111), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[94]));
    Single_Location location_95 ( .real_coords (realPos), .imag_coords (8'b11100000), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[95]));
    Single_Location location_96 ( .real_coords (realPos), .imag_coords (8'b11100001), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[96]));
    Single_Location location_97 ( .real_coords (realPos), .imag_coords (8'b11100010), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[97]));
    Single_Location location_98 ( .real_coords (realPos), .imag_coords (8'b11100011), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[98]));
    Single_Location location_99 ( .real_coords (realPos), .imag_coords (8'b11100100), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[99]));
    Single_Location location_100 ( .real_coords (realPos), .imag_coords (8'b11100101), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[100]));
    Single_Location location_101 ( .real_coords (realPos), .imag_coords (8'b11100110), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[101]));
    Single_Location location_102 ( .real_coords (realPos), .imag_coords (8'b11100111), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[102]));
    Single_Location location_103 ( .real_coords (realPos), .imag_coords (8'b11101000), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[103]));
    Single_Location location_104 ( .real_coords (realPos), .imag_coords (8'b11101001), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[104]));
    Single_Location location_105 ( .real_coords (realPos), .imag_coords (8'b11101010), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[105]));
    Single_Location location_106 ( .real_coords (realPos), .imag_coords (8'b11101011), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[106]));
    Single_Location location_107 ( .real_coords (realPos), .imag_coords (8'b11101100), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[107]));
    Single_Location location_108 ( .real_coords (realPos), .imag_coords (8'b11101101), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[108]));
    Single_Location location_109 ( .real_coords (realPos), .imag_coords (8'b11101110), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[109]));
    Single_Location location_110 ( .real_coords (realPos), .imag_coords (8'b11101111), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[110]));
    Single_Location location_111 ( .real_coords (realPos), .imag_coords (8'b11110000), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[111]));
    Single_Location location_112 ( .real_coords (realPos), .imag_coords (8'b11110001), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[112]));
    Single_Location location_113 ( .real_coords (realPos), .imag_coords (8'b11110010), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[113]));
    Single_Location location_114 ( .real_coords (realPos), .imag_coords (8'b11110011), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[114]));
    Single_Location location_115 ( .real_coords (realPos), .imag_coords (8'b11110100), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[115]));
    Single_Location location_116 ( .real_coords (realPos), .imag_coords (8'b11110101), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[116]));
    Single_Location location_117 ( .real_coords (realPos), .imag_coords (8'b11110110), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[117]));
    Single_Location location_118 ( .real_coords (realPos), .imag_coords (8'b11110111), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[118]));
    Single_Location location_119 ( .real_coords (realPos), .imag_coords (8'b11111000), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[119]));
    Single_Location location_120 ( .real_coords (realPos), .imag_coords (8'b11111001), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[120]));
    Single_Location location_121 ( .real_coords (realPos), .imag_coords (8'b11111010), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[121]));
    Single_Location location_122 ( .real_coords (realPos), .imag_coords (8'b11111011), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[122]));
    Single_Location location_123 ( .real_coords (realPos), .imag_coords (8'b11111100), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[123]));
    Single_Location location_124 ( .real_coords (realPos), .imag_coords (8'b11111101), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[124]));
    Single_Location location_125 ( .real_coords (realPos), .imag_coords (8'b11111110), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[125]));
    Single_Location location_126 ( .real_coords (realPos), .imag_coords (8'b11111111), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[126]));
    Single_Location location_127 ( .real_coords (realPos), .imag_coords (1'b0), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[127]));
    Single_Location location_128 ( .real_coords (realPos), .imag_coords (1'b1), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[128]));
    Single_Location location_129 ( .real_coords (realPos), .imag_coords (2'b10), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[129]));
    Single_Location location_130 ( .real_coords (realPos), .imag_coords (2'b11), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[130]));
    Single_Location location_131 ( .real_coords (realPos), .imag_coords (3'b100), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[131]));
    Single_Location location_132 ( .real_coords (realPos), .imag_coords (3'b101), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[132]));
    Single_Location location_133 ( .real_coords (realPos), .imag_coords (3'b110), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[133]));
    Single_Location location_134 ( .real_coords (realPos), .imag_coords (3'b111), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[134]));
    Single_Location location_135 ( .real_coords (realPos), .imag_coords (8'b1000), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[135]));
    Single_Location location_136 ( .real_coords (realPos), .imag_coords (8'b1001), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[136]));
    Single_Location location_137 ( .real_coords (realPos), .imag_coords (8'b1010), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[137]));
    Single_Location location_138 ( .real_coords (realPos), .imag_coords (4'b1011), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[138]));
    Single_Location location_139 ( .real_coords (realPos), .imag_coords (4'b1100), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[139]));
    Single_Location location_140 ( .real_coords (realPos), .imag_coords (4'b1101), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[140]));
    Single_Location location_141 ( .real_coords (realPos), .imag_coords (4'b1110), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[141]));
    Single_Location location_142 ( .real_coords (realPos), .imag_coords (4'b1111), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[142]));
    Single_Location location_143 ( .real_coords (realPos), .imag_coords (5'b10000), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[143]));
    Single_Location location_144 ( .real_coords (realPos), .imag_coords (5'b10001), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[144]));
    Single_Location location_145 ( .real_coords (realPos), .imag_coords (5'b10010), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[145]));
    Single_Location location_146 ( .real_coords (realPos), .imag_coords (5'b10011), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[146]));
    Single_Location location_147 ( .real_coords (realPos), .imag_coords (5'b10100), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[147]));
    Single_Location location_148 ( .real_coords (realPos), .imag_coords (5'b10101), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[148]));
    Single_Location location_149 ( .real_coords (realPos), .imag_coords (5'b10110), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[149]));
    Single_Location location_150 ( .real_coords (realPos), .imag_coords (5'b10111), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[150]));
    Single_Location location_151 ( .real_coords (realPos), .imag_coords (5'b11000), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[151]));
    Single_Location location_152 ( .real_coords (realPos), .imag_coords (5'b11001), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[152]));
    Single_Location location_153 ( .real_coords (realPos), .imag_coords (5'b11010), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[153]));
    Single_Location location_154 ( .real_coords (realPos), .imag_coords (5'b11011), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[154]));
    Single_Location location_155 ( .real_coords (realPos), .imag_coords (5'b11100), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[155]));
    Single_Location location_156 ( .real_coords (realPos), .imag_coords (5'b11101), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[156]));
    Single_Location location_157 ( .real_coords (realPos), .imag_coords (5'b11110), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[157]));
    Single_Location location_158 ( .real_coords (realPos), .imag_coords (5'b11111), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[158]));
    Single_Location location_159 ( .real_coords (realPos), .imag_coords (6'b100000), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[159]));
    Single_Location location_160 ( .real_coords (realPos), .imag_coords (6'b100001), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[160]));
    Single_Location location_161 ( .real_coords (realPos), .imag_coords (6'b100010), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[161]));
    Single_Location location_162 ( .real_coords (realPos), .imag_coords (6'b100011), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[162]));
    Single_Location location_163 ( .real_coords (realPos), .imag_coords (6'b100100), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[163]));
    Single_Location location_164 ( .real_coords (realPos), .imag_coords (6'b100101), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[164]));
    Single_Location location_165 ( .real_coords (realPos), .imag_coords (6'b100110), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[165]));
    Single_Location location_166 ( .real_coords (realPos), .imag_coords (6'b100111), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[166]));
    Single_Location location_167 ( .real_coords (realPos), .imag_coords (6'b101000), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[167]));
    Single_Location location_168 ( .real_coords (realPos), .imag_coords (6'b101001), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[168]));
    Single_Location location_169 ( .real_coords (realPos), .imag_coords (6'b101010), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[169]));
    Single_Location location_170 ( .real_coords (realPos), .imag_coords (6'b101011), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[170]));
    Single_Location location_171 ( .real_coords (realPos), .imag_coords (6'b101100), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[171]));
    Single_Location location_172 ( .real_coords (realPos), .imag_coords (6'b101101), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[172]));
    Single_Location location_173 ( .real_coords (realPos), .imag_coords (6'b101110), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[173]));
    Single_Location location_174 ( .real_coords (realPos), .imag_coords (6'b101111), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[174]));
    Single_Location location_175 ( .real_coords (realPos), .imag_coords (6'b110000), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[175]));
    Single_Location location_176 ( .real_coords (realPos), .imag_coords (6'b110001), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[176]));
    Single_Location location_177 ( .real_coords (realPos), .imag_coords (6'b110010), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[177]));
    Single_Location location_178 ( .real_coords (realPos), .imag_coords (6'b110011), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[178]));
    Single_Location location_179 ( .real_coords (realPos), .imag_coords (6'b110100), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[179]));
    Single_Location location_180 ( .real_coords (realPos), .imag_coords (6'b110101), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[180]));
    Single_Location location_181 ( .real_coords (realPos), .imag_coords (6'b110110), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[181]));
    Single_Location location_182 ( .real_coords (realPos), .imag_coords (6'b110111), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[182]));
    Single_Location location_183 ( .real_coords (realPos), .imag_coords (6'b111000), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[183]));
    Single_Location location_184 ( .real_coords (realPos), .imag_coords (6'b111001), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[184]));
    Single_Location location_185 ( .real_coords (realPos), .imag_coords (6'b111010), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[185]));
    Single_Location location_186 ( .real_coords (realPos), .imag_coords (6'b111011), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[186]));
    Single_Location location_187 ( .real_coords (realPos), .imag_coords (6'b111100), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[187]));
    Single_Location location_188 ( .real_coords (realPos), .imag_coords (6'b111101), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[188]));
    Single_Location location_189 ( .real_coords (realPos), .imag_coords (6'b111110), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[189]));
    Single_Location location_190 ( .real_coords (realPos), .imag_coords (6'b111111), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[190]));
    Single_Location location_191 ( .real_coords (realPos), .imag_coords (7'b1000000), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[191]));
    Single_Location location_192 ( .real_coords (realPos), .imag_coords (7'b1000001), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[192]));
    Single_Location location_193 ( .real_coords (realPos), .imag_coords (7'b1000010), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[193]));
    Single_Location location_194 ( .real_coords (realPos), .imag_coords (7'b1000011), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[194]));
    Single_Location location_195 ( .real_coords (realPos), .imag_coords (7'b1000100), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[195]));
    Single_Location location_196 ( .real_coords (realPos), .imag_coords (7'b1000101), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[196]));
    Single_Location location_197 ( .real_coords (realPos), .imag_coords (7'b1000110), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[197]));
    Single_Location location_198 ( .real_coords (realPos), .imag_coords (7'b1000111), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[198]));
    Single_Location location_199 ( .real_coords (realPos), .imag_coords (7'b1001000), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[199]));
    Single_Location location_200 ( .real_coords (realPos), .imag_coords (7'b1001001), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[200]));
    Single_Location location_201 ( .real_coords (realPos), .imag_coords (7'b1001010), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[201]));
    Single_Location location_202 ( .real_coords (realPos), .imag_coords (7'b1001011), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[202]));
    Single_Location location_203 ( .real_coords (realPos), .imag_coords (7'b1001100), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[203]));
    Single_Location location_204 ( .real_coords (realPos), .imag_coords (7'b1001101), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[204]));
    Single_Location location_205 ( .real_coords (realPos), .imag_coords (7'b1001110), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[205]));
    Single_Location location_206 ( .real_coords (realPos), .imag_coords (7'b1001111), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[206]));
    Single_Location location_207 ( .real_coords (realPos), .imag_coords (7'b1010000), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[207]));
    Single_Location location_208 ( .real_coords (realPos), .imag_coords (7'b1010001), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[208]));
    Single_Location location_209 ( .real_coords (realPos), .imag_coords (7'b1010010), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[209]));
    Single_Location location_210 ( .real_coords (realPos), .imag_coords (7'b1010011), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[210]));
    Single_Location location_211 ( .real_coords (realPos), .imag_coords (7'b1010100), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[211]));
    Single_Location location_212 ( .real_coords (realPos), .imag_coords (7'b1010101), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[212]));
    Single_Location location_213 ( .real_coords (realPos), .imag_coords (7'b1010110), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[213]));
    Single_Location location_214 ( .real_coords (realPos), .imag_coords (7'b1010111), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[214]));
    Single_Location location_215 ( .real_coords (realPos), .imag_coords (7'b1011000), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[215]));
    Single_Location location_216 ( .real_coords (realPos), .imag_coords (7'b1011001), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[216]));
    Single_Location location_217 ( .real_coords (realPos), .imag_coords (7'b1011010), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[217]));
    Single_Location location_218 ( .real_coords (realPos), .imag_coords (7'b1011011), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[218]));
    Single_Location location_219 ( .real_coords (realPos), .imag_coords (7'b1011100), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[219]));
    Single_Location location_220 ( .real_coords (realPos), .imag_coords (7'b1011101), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[220]));
    Single_Location location_221 ( .real_coords (realPos), .imag_coords (7'b1011110), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[221]));
    Single_Location location_222 ( .real_coords (realPos), .imag_coords (7'b1011111), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[222]));
    Single_Location location_223 ( .real_coords (realPos), .imag_coords (7'b1100000), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[223]));
    Single_Location location_224 ( .real_coords (realPos), .imag_coords (7'b1100001), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[224]));
    Single_Location location_225 ( .real_coords (realPos), .imag_coords (7'b1100010), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[225]));
    Single_Location location_226 ( .real_coords (realPos), .imag_coords (7'b1100011), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[226]));
    Single_Location location_227 ( .real_coords (realPos), .imag_coords (7'b1100100), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[227]));
    Single_Location location_228 ( .real_coords (realPos), .imag_coords (7'b1100101), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[228]));
    Single_Location location_229 ( .real_coords (realPos), .imag_coords (7'b1100110), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[229]));
    Single_Location location_230 ( .real_coords (realPos), .imag_coords (7'b1100111), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[230]));
    Single_Location location_231 ( .real_coords (realPos), .imag_coords (7'b1101000), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[231]));
    Single_Location location_232 ( .real_coords (realPos), .imag_coords (7'b1101001), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[232]));
    Single_Location location_233 ( .real_coords (realPos), .imag_coords (7'b1101010), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[233]));
    Single_Location location_234 ( .real_coords (realPos), .imag_coords (7'b1101011), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[234]));
    Single_Location location_235 ( .real_coords (realPos), .imag_coords (7'b1101100), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[235]));
    Single_Location location_236 ( .real_coords (realPos), .imag_coords (7'b1101101), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[236]));
    Single_Location location_237 ( .real_coords (realPos), .imag_coords (7'b1101110), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[237]));
    Single_Location location_238 ( .real_coords (realPos), .imag_coords (7'b1101111), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[238]));
    Single_Location location_239 ( .real_coords (realPos), .imag_coords (7'b1110000), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[239]));
    Single_Location location_240 ( .real_coords (realPos), .imag_coords (7'b1110001), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[240]));
    Single_Location location_241 ( .real_coords (realPos), .imag_coords (7'b1110010), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[241]));
    Single_Location location_242 ( .real_coords (realPos), .imag_coords (7'b1110011), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[242]));
    Single_Location location_243 ( .real_coords (realPos), .imag_coords (7'b1110100), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[243]));
    Single_Location location_244 ( .real_coords (realPos), .imag_coords (7'b1110101), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[244]));
    Single_Location location_245 ( .real_coords (realPos), .imag_coords (7'b1110110), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[245]));
    Single_Location location_246 ( .real_coords (realPos), .imag_coords (7'b1110111), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[246]));
    Single_Location location_247 ( .real_coords (realPos), .imag_coords (7'b1111000), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[247]));
    Single_Location location_248 ( .real_coords (realPos), .imag_coords (7'b1111001), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[248]));
    Single_Location location_249 ( .real_coords (realPos), .imag_coords (7'b1111010), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[249]));
    Single_Location location_250 ( .real_coords (realPos), .imag_coords (7'b1111011), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[250]));
    Single_Location location_251 ( .real_coords (realPos), .imag_coords (7'b1111100), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[251]));
    Single_Location location_252 ( .real_coords (realPos), .imag_coords (7'b1111101), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[252]));
    Single_Location location_253 ( .real_coords (realPos), .imag_coords (7'b1111110), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[253]));
    Single_Location location_254 ( .real_coords (realPos), .imag_coords (7'b1111111), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[254]));
    Single_Location location_255 ( .real_coords (realPos), .imag_coords (8'b10000000), .clock (clock), .reset (reset), .enable (enable), .iterations (iter[255]));
    
    
    
    //This should be my actual code but I can't find any documentation on the generate and genvar commands so it will no longer be my code. Instead I will have an inefficient mess of shit that will probably still not work. 
    /*generate
        genvar x;
        for (x = 0; x < 257; x = x + 1)
        begin
            reg [7:0] iter_x;
            wire [32:0] temp_loc_op1  = (x*8'b11111111);
            wire [32:0] temp_loc_op2 = imagPos + temp_loc_op1[7:0];
            Single_Location location_x
            (
                .real_coords (realPos),
                .imag_coords (temp_loc_op2[7:0]),
                .clock (clock),
                .reset (reset),
                .enable (enable),
                .iterations (iter_x)
            );
        end
    endgenerate*/
         
endmodule
