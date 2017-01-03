`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2016 01:59:47 PM
// Design Name: 
// Module Name: Display
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


module TopModule( input C, input D, input E, input F, input G, 
                  input wire masterclk, reset,
                  
                  output wire hsync, vsync,                   
                  output reg[3:0] red,
                  output reg[3:0] green,
                  output reg[3:0] blue,
                  output speakerC, speakerD, speakerE, speakerF, speakerG);
        
    wire VGAclk, Noteclk;
    reg[20:0] noteTime;  
    
    SoundModule SM(masterclk, C, D, E, F, G, speakerC, speakerD, speakerE, speakerF, speakerG);
    VGAClockDivider CD( masterclk, reset, VGAclk);
    NoteClockDivider ND( masterclk, reset, Noteclk);
    NoteTimer NT( C, D, E, F, G, Noteclk, reset, noteTime);
    VGA640x480 VG( C, D, E, F, G, masterclk, VGAclk, reset, noteTime, red, green, blue, hsync, vsync);
        
endmodule
