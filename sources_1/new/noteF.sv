`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2016 02:15:14 PM
// Design Name: 
// Module Name: au1
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

module noteF(clk, speaker, F);
    input F;
    input clk;
    output speaker;

    reg [27:0] tone;
    always @(posedge clk) tone <= tone+1;

    wire [4:0] fullnote = tone[27:22];

    wire [2:0] octave;
    wire [3:0] note;
    divide_by5 divby5(.numer(fullnote[4:0]), .quotient(octave), .remain(note));

    reg [8:0] clkdivider;
    always @(note)
    case(note)
        0: clkdivider = 323-1; 
        1: clkdivider = 323-1; 
        2: clkdivider = 323-1; 
        3: clkdivider = 323-1;  
        4: clkdivider = 323-1; 
        5: clkdivider = 323-1;  
        6: clkdivider = 323-1;
        7: clkdivider = 323-1;  
        8: clkdivider = 323-1; 
        9: clkdivider = 323-1; 
        10: clkdivider = 323-1; 
        11: clkdivider = 323-1; 
        12: clkdivider = 0; // should never happen
        13: clkdivider = 0; // should never happen
        14: clkdivider = 0; // should never happen
        15: clkdivider = 0; // should never happen
    endcase
    
      

    reg [8:0] counter_note;
    always @(posedge clk) 
        if(counter_note==0) 
        counter_note <= clkdivider; else counter_note <= counter_note-1;

    reg [10:0] counter_octave;
    always @(posedge clk)
    if(counter_note==0)
        begin
            if(counter_octave==0)
                counter_octave <= (octave==0?255:octave==1?255:octave==2?255:octave==3?255:octave==4?255:octave==5?255:octave==6?255:octave==7?255:octave==8?255:octave==9?255:255);
            else
                counter_octave <= counter_octave-1;
        end

    reg speaker;
    always @(posedge clk && F) 
        if(counter_note==0 && counter_octave==0) 
        speaker <= ~speaker;
        
endmodule