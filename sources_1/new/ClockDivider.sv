`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2016 01:54:38 PM
// Design Name: 
// Module Name: ClockDivider
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


module VGAClockDivider( input wire clkin,          // 100 Mhz master clock 
                        input wire reset,          // asynchronous reset
                        output wire clkout);       // 25 Mhz VGA clock
    
    reg [1:0] counter ;
    
    always@(posedge clkin, posedge reset)
    begin
        if ( reset == 1)
            counter <= 0;
        else
            counter <= counter + 1;    
    end
    
    assign clkout = counter[1];
                            
endmodule
