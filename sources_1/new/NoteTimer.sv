`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2016 01:48:43 PM
// Design Name: 
// Module Name: NoteTimer
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


module NoteTimer( input C, D, E, F, G, 
                  input wire Noteclk, reset, 
                  output reg[20:0] noteTime
                  );
    
    logic stop;
    
    always@( posedge Noteclk or posedge reset)
    begin
        if ( reset)
            noteTime <= 0;
                    
        else if ( stop == 0)
            noteTime <= noteTime + 1;
    end
    
    always@(*)
    begin
            if ( noteTime < 417)
                stop = 0;
        
            else if ( noteTime == 417 &&
                     C == 0) stop = 1;
            
            else if ( noteTime == 460 &&
                     E == 0) stop = 1;
            
            else if ( noteTime == 503 &&
                     G == 0) stop = 1;
            
            else if ( noteTime == 546 &&
                     C == 0) stop = 1;
            
            else if ( noteTime == 589 &&
                     E == 0) stop = 1;
            
            else if ( noteTime == 632 &&
                     G == 0) stop = 1;
            
            else if ( noteTime == 675 &&
                     D == 0) stop = 1;
            
            else if ( noteTime == 718 &&
                     (F == 0 || G == 0)) stop = 1;
            
            else if ( noteTime == 761 &&
                     (F == 0 || G == 0)) stop = 1;
            
            else if ( noteTime == 804 &&
                     D == 0) stop = 1;
            
            else if ( noteTime == 847 &&
                     (F == 0 || G == 0)) stop = 1;
            
            else if ( noteTime == 889 &&
                     (F == 0 || G == 0)) stop = 1;
            
            else if ( noteTime == 932 &&
                     C == 0) stop = 1;
            
            else if ( noteTime == 975 &&
                     E == 0) stop = 1;
            
            else if ( noteTime == 1018 &&
                     G == 0) stop = 1;
            
            else if ( noteTime == 1061 &&
                     C == 0) stop = 1;
            
            else if ( noteTime == 1104 &&
                     E == 0) stop = 1;
            
            else if ( noteTime == 1147 &&
                     G == 0) stop = 1;
            
            else if ( noteTime == 1190 &&
                     G == 0) stop = 1;
            
            else if ( noteTime == 1233 &&
                     F == 0) stop = 1;
            
            else if ( noteTime == 1276 &&
                     E == 0) stop = 1;
            
            else if ( noteTime == 1404 &&
                     C == 0) stop = 1;
            
            else if ( noteTime == 1447 &&
                     C == 0) stop = 1;
            
            else if ( noteTime == 1490 &&
                     (E == 0 || G == 0)) stop = 1;
            
            else if ( noteTime == 1533 &&
                     (E == 0 || G == 0)) stop = 1;
            
            else if ( noteTime == 1576 &&
                     C == 0) stop = 1;
            
            else if ( noteTime == 1619 &&
                     (E == 0 || G == 0)) stop = 1;
            
            else if ( noteTime == 1662 &&
                     (E == 0 || G == 0)) stop = 1;
            
            else if ( noteTime == 1705 &&
                     D == 0) stop = 1;
            
            else if ( noteTime == 1748 &&
                     (F == 0 || G == 0)) stop = 1;
            
            else if ( noteTime == 1791 &&
                     (F == 0 || G == 0)) stop = 1;
            
            else if ( noteTime == 1834 &&
                     D == 0) stop = 1;
            
            else if ( noteTime == 1877 &&
                     (F == 0 || G == 0)) stop = 1;
            
            else if ( noteTime == 1919 &&
                     (F == 0 || G == 0)) stop = 1;
            
            else if ( noteTime == 1962 &&
                     C == 0) stop = 1;
            
            else if ( noteTime == 2005 &&
                     (E == 0 || G == 0)) stop = 1;
            
            else if ( noteTime == 2048 &&
                     (E == 0 || G == 0)) stop = 1;
            
            else if ( noteTime == 2091 &&
                     C == 0) stop = 1;
            
            else if ( noteTime == 2134 &&
                     (E == 0 || G == 0)) stop = 1;
            
            else if ( noteTime == 2177 &&
                     (E == 0 || G == 0)) stop = 1;
            
            else if ( noteTime == 2220 &&
                     (D == 0 || G == 0)) stop = 1;
            
            else if ( noteTime == 2263 &&
                     (D == 0 || F == 0)) stop = 1;
            
            else if ( noteTime == 2306 &&
                     (D == 0 || E == 0)) stop = 1;
            
            else if ( noteTime == 2434 &&
                     (C == 0 || E == 0)) stop = 1;

            else stop = 0;
    end
    
    //StopLogic SL( C, E, G, D, noteTime, stop);
     
endmodule
