`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.12.2016 13:46:29
// Design Name: 
// Module Name: SoundModule
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


module SoundModule(input clk, 
            input C, D, E, F, G, //input E, input G, input D, 
            output speakerC, speakerD, speakerE, speakerF, speakerG); //output speakerE, output speakerG, output speakerD);


    noteC(clk, speakerC, C);
    noteD(clk, speakerD, D);
    noteE(clk, speakerE, E);
    noteF(clk, speakerF, F);
    noteG(clk, speakerG, G);

endmodule

