`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.12.2016 15:21:13
// Design Name: 
// Module Name: StopLogic
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

/*
module StopLogic(
    input C, E, G, D,
    input reg[20:0] noteTime,
    output logic stop);
        
    always_comb
    begin
        if ( noteTime < 442) stop <= 0;
        
        else if ( noteTime == 442 &&
                 C == 0) stop = 1;
        
        else if ( noteTime == 485 &&
                 E == 0) stop = 1;
        
        else if ( noteTime == 528 &&
                 G == 0) stop = 1;
        
        else if ( noteTime == 571 &&
                 C == 0) stop = 1;
        
        else if ( noteTime == 614 &&
                 E == 0) stop = 1;
        
        else if ( noteTime == 657 &&
                 G == 0) stop = 1;
        
        else if ( noteTime == 700 &&
                 D == 0) stop = 1;
        
        else if ( noteTime == 743 &&
                 G == 0) stop = 1;
        
        else if ( noteTime == 786 &&
                 G == 0) stop = 1;
        
        else if ( noteTime == 829 &&
                 D == 0) stop = 1;
        
        else if ( noteTime == 872 &&
                 G == 0) stop = 1;
        
        else if ( noteTime == 914 &&
                 G == 0) stop = 1;
        
        else if ( noteTime == 957 &&
                 C == 0) stop = 1;
        
        else if ( noteTime == 1000 &&
                 E == 0) stop = 1;
        
        else if ( noteTime == 1043 &&
                 G == 0) stop = 1;
        
        else if ( noteTime == 1086 &&
                 C == 0) stop = 1;
        
        else if ( noteTime == 1129 &&
                 E == 0) stop = 1;
        
        else if ( noteTime == 1172 &&
                 G == 0) stop = 1;
        
        else if ( noteTime == 1215 &&
                 G == 0) stop = 1;

        else if ( noteTime == 1301 &&
                 E == 0) stop = 1;
        
        else if ( noteTime == 1429 &&
                 C == 0) stop = 1;
        
        else if ( noteTime == 1472 &&
                 C == 0) stop = 1;
        
        else if ( noteTime == 1515 &&
                 E == 0) stop = 1;
        
        else if ( noteTime == 1515 &&
                 G == 0) stop = 1;
        
        else if ( noteTime == 1558 &&
                 E == 0) stop = 1;
        
        else if ( noteTime == 1558 &&
                 G == 0) stop = 1;
        
        else if ( noteTime == 1601 &&
                 C == 0) stop = 1;
        
        else if ( noteTime == 1644 &&
                 E == 0) stop = 1;
        
        else if ( noteTime == 1644 &&
                 G == 0) stop = 1;
        
        else if ( noteTime == 1687 &&
                 E == 0) stop = 1;
        
        else if ( noteTime == 1687 &&
                 G == 0) stop = 1;
        
        else if ( noteTime == 1730 &&
                 D == 0) stop = 1;

        else if ( noteTime == 1773 &&
                 G == 0) stop = 1;
 
        else if ( noteTime == 1816 &&
                 G == 0) stop = 1;
        
        else if ( noteTime == 1859 &&
                 D == 0) stop = 1;
  
        else if ( noteTime == 1902 &&
                 G == 0) stop = 1;
        
        else if ( noteTime == 1944 &&
                 G == 0) stop = 1;
        
        else if ( noteTime == 1987 &&
                 C == 0) stop = 1;
        
        else if ( noteTime == 2030 &&
                 E == 0) stop = 1;
        
        else if ( noteTime == 2030 &&
                 G == 0) stop = 1;
        
        else if ( noteTime == 2073 &&
                 E == 0) stop = 1;
        
        else if ( noteTime == 2073 &&
                 G == 0) stop = 1;
        
        else if ( noteTime == 2116 &&
                 C == 0) stop = 1;
        
        else if ( noteTime == 2159 &&
                 E == 0) stop = 1;
        
        else if ( noteTime == 2159 &&
                 G == 0) stop = 1;
        
        else if ( noteTime == 2202 &&
                 E == 0) stop = 1;
        
        else if ( noteTime == 2202 &&
                 G == 0) stop = 1;
        
        else if ( noteTime == 2245 &&
                 D == 0) stop = 1;
        
        else if ( noteTime == 2245 &&
                 G == 0) stop = 1;
        
        else if ( noteTime == 2288 &&
                 D == 0) stop = 1;

        
        else if ( noteTime == 2331 &&
                 D == 0) stop = 1;
        
        else if ( noteTime == 2331 &&
                 E == 0) stop = 1;
        
        else if ( noteTime == 2459 &&
                 C == 0) stop = 1;
        
        else if ( noteTime == 2459 &&
                 E == 0) stop = 1;


        else if ( noteTime == 442 &&
                C == 1) stop = 0;
                 
        else if ( noteTime == 485 &&
                E == 1) stop = 0;
                 
        else if ( noteTime == 528 &&
                          G == 1) stop = 0;
                 
                 else if ( (noteTime == 571 || noteTime == 572) &&
                          C == 1) stop = 0;
                 
                 else if ( noteTime == 614 &&
                          E == 1) stop = 0;
                 
                 else if ( noteTime == 657 &&
                          G == 1) stop = 0;
                 
                 else if ( noteTime == 700 &&
                          D == 1) stop = 0;
                 
                 else if ( noteTime == 743 &&
                          G == 1) stop = 0;
                 
                 else if ( noteTime == 786 &&
                          G == 1) stop = 0;
                 
                 else if ( noteTime == 829 &&
                          D == 1) stop = 0;
                 
                 else if ( noteTime == 872 &&
                          G == 1) stop = 0;
                 
                 else if ( noteTime == 914 &&
                          G == 1) stop = 0;
                 
                 else if ( noteTime == 957 &&
                          C == 1) stop = 0;
                 
                 else if ( noteTime == 1000 &&
                          E == 1) stop = 0;
                 
                 else if ( noteTime == 1043 &&
                          G == 1) stop = 0;
                 
                 else if ( noteTime == 1086 &&
                          C == 1) stop = 0;
                 
                 else if ( noteTime == 1129 &&
                          E == 1) stop = 0;
                 
                 else if ( noteTime == 1172 &&
                          G == 1) stop = 0;
                 
                 else if ( noteTime == 1215 &&
                          G == 1) stop = 0;

                 else if ( noteTime == 1301 &&
                          E == 1) stop = 0;
                 
                 else if ( noteTime == 1429 &&
                          C == 1) stop = 0;
                 
                 else if ( noteTime == 1472 &&
                          C == 1) stop = 0;
                 
                 else if ( noteTime == 1515 &&
                          E == 1) stop = 0;
                 
                 else if ( noteTime == 1515 &&
                          G == 1) stop = 0;
                 
                 else if ( noteTime == 1558 &&
                          E == 1) stop = 0;
                 
                 else if ( noteTime == 1558 &&
                          G == 1) stop = 0;
                 
                 else if ( noteTime == 1601 &&
                          C == 1) stop = 0;
                 
                 else if ( noteTime == 1644 &&
                          E == 1) stop = 0;
                 
                 else if ( noteTime == 1644 &&
                          G == 1) stop = 0;
                 
                 else if ( noteTime == 1687 &&
                          E == 1) stop = 0;
                 
                 else if ( noteTime == 1687 &&
                          G == 1) stop = 0;
                 
                 else if ( noteTime == 1730 &&
                          D == 1) stop = 0;

                 else if ( noteTime == 1773 &&
                          G == 1) stop = 0;

                 else if ( noteTime == 1816 &&
                          G == 1) stop = 0;
                 
                 else if ( noteTime == 1859 &&
                          D == 1) stop = 0;

                 else if ( noteTime == 1902 &&
                          G == 1) stop = 0;

                 else if ( noteTime == 1944 &&
                          G == 1) stop = 0;
                 
                 else if ( noteTime == 1987 &&
                          C == 1) stop = 0;
                 
                 else if ( noteTime == 2030 &&
                          E == 1) stop = 0;
                 
                 else if ( noteTime == 2030 &&
                          G == 1) stop = 0;
                 
                 else if ( noteTime == 2073 &&
                          E == 1) stop = 0;
                 
                 else if ( noteTime == 2073 &&
                          G == 1) stop = 0;
                 
                 else if ( noteTime == 2116 &&
                          C == 1) stop = 0;
                 
                 else if ( noteTime == 2159 &&
                          E == 1) stop = 0;
                 
                 else if ( noteTime == 2159 &&
                          G == 1) stop = 0;
                 
                 else if ( noteTime == 2202 &&
                          E == 1) stop = 0;
                 
                 else if ( noteTime == 2202 &&
                          G == 1) stop = 0;
                 
                 else if ( noteTime == 2245 &&
                          D == 1) stop = 0;
                 
                 else if ( noteTime == 2245 &&
                          G == 1) stop = 0;
                 
                 else if ( noteTime == 2288 &&
                          D == 1) stop = 0;

                 else if ( noteTime == 2331 &&
                          D == 1) stop = 0;
                 
                 else if ( noteTime == 2331 &&
                          E == 1) stop = 0;
                 
                 else if ( noteTime == 2459 &&
                          C == 1) stop = 0;
                 
        else if ( noteTime == 2459 &&
                  E == 1) stop = 0;

        else if ( stop == 0)
            stop = 0;
    end
endmodule
*/
