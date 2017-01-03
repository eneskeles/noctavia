`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2016 02:19:48 PM
// Design Name: 
// Module Name: NotesArray
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

module NotesArray(  output reg [20:0] timeOfNotes[4:0],
                    output reg [10:0] laneOfNotes[4:0],
                    output reg [2:0] lengthOfNotes[4:0]);
                  
    always_comb
    begin
        timeOfNotes[0] = 4'b1000;
        laneOfNotes[0] = 8'b10000000; // 128 TODO PARAMETER THEM
        lengthOfNotes[0] = 5'b11001;
        
        timeOfNotes[1] = 8'b10000000;
        laneOfNotes[1] = 9'b100000000; // 256
        lengthOfNotes[1] = 6'b100100;
    /*
        timeOfNotes[2] = 3'd400;
        laneOfNotes[2] = 1'd1;
        lengthOfNotes[2] = 1'd1;    
        
        timeOfNotes[3] = 3'd800;
        laneOfNotes[3] = 1'd5;
        lengthOfNotes[3] = 1'd2;
        
        timeOfNotes[4] = 3'd900;
        laneOfNotes[4] = 1'd2;
        lengthOfNotes[4] = 1'd1;
    */
    end
    
endmodule
