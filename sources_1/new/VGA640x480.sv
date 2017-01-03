`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2016 01:54:50 PM
// Design Name: 
// Module Name: VGA640x480
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


module VGA640x480( input C, D, E, F, G,
                   input wire masterclk, VGAclk, reset,
                   input reg[20:0] noteTime,
                   output reg[3:0] red,
                   output reg[3:0] green,
                   output reg[3:0] blue,
                   output wire hsync, vsync 
                  );
   
    // video structure constants
    parameter hpixels = 800;   // horizontal pixels per line
    parameter vlines = 521;    // vertical lines per frame
    parameter hpulse = 96;     // hsync pulse length
    parameter vpulse = 2;      // vsync pulse length
    parameter hbp = 144;       // end of horizontal back porch
    parameter hfp = 784;       // beginning of horizontal front porch
    parameter vbp = 31;        // end of vertical back porch
    parameter vfp = 511;       // beginning of vertical front porch
    // active horizontal video is therefore: 784 - 144 = 640
    // active vertical video is therefore: 511 - 31 = 480
   
   
    reg [9:0] hc;
    reg [9:0] vc;

    /////////////////////////////////////////////////////
    /////////////////////////////////////////////////////
    
    // hc and vc are increasing 
       
    always@( posedge VGAclk, posedge reset)
    begin
        if ( reset == 1)
        begin
            hc <= 0;
            vc <= 0;
        end   
        
        else 
        begin
            if ( hc < hpixels - 1)
                hc <= hc + 1;
            else
            begin
                hc <= 0;
                
                if ( vc < vlines - 1)
                    vc <= vc + 1;
                else
                    vc = 0;
            end
        end       
    end
    
    // sync signals
    assign hsync = (hc < hpulse) ? 0:1;
    assign vsync = (vc < vpulse) ? 0:1;
    /////////////////////////////////////////////////////
    /////////////////////////////////////////////////////
    
    
    
    always@(*)
    begin
        if ( vc > vfp - 80 && vc < vfp)
            begin 
            
                if (hc <= (hbp+128) )
                begin
                    if ( C == 1)
                        red = 4'b0111;
                    else 
                        red = 4'b1111;
                       
                    green = 4'b0000;
                    blue = 4'b0000;
                end
            
                else if (hc <= (hbp+256) )
                begin
                    if  ( D == 1)
                    begin
                        red = 4'b0111;
                        green = 4'b0111;
                    end
                    
                    else 
                    begin
                        red = 4'b1111;
                        green = 4'b1111;
                    end
                    blue = 4'b0000;
                end
            
                else if (hc <= (hbp+384) )
                begin
                    red = 4'b0000;
                    green = 4'b0000;
                    
                    if ( E == 1)
                        blue = 4'b0111;
                    else
                        blue = 4'b1111;
                end
            
                else if (hc <= (hbp+512) )
                begin
                   
                    red = 4'b0000;
                    if ( F == 1)
                        green = 4'b0111;
                    else 
                        green = 4'b1111;
                        
                    blue = 4'b0000;
                end
                
                else if(hc <= (hbp+640) )
                begin
                    if ( G == 1)
                    begin
                        red = 4'b0111;
                        blue = 4'b0111;
                    end
                    
                    else 
                    begin
                        red = 4'b1111;
                        blue = 4'b1111; 
                    end
                    
                    green = 4'b0000;
                end
            // we're outside active horizontal range so display black
            else if (hc < hbp || hc > hfp)
            begin
                red = 4'b0000;
                green = 4'b0000;
                blue = 4'b0000;
            end
        end 
        
       /******************************************************************************************************************************************************/         
       /******************************************************************************************************************************************************/         
       /******************************************************************************************************************************************************/         
        else if ( ( noteTime >= 42) &&
        ( vc === ( noteTime - 42 + vbp) || vc === ( noteTime - 42 + vbp + 25)) &&
          hc >= 0 + hbp && hc <= 128 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 85) &&
        ( vc === ( noteTime - 85 + vbp) || vc === ( noteTime - 85 + vbp + 25)) &&
          hc >= 256 + hbp && hc <= 384 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 128) &&
        ( vc === ( noteTime - 128 + vbp) || vc === ( noteTime - 128 + vbp + 25)) &&
          hc >= 512 + hbp && hc <= 640 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 171) &&
        ( vc === ( noteTime - 171 + vbp) || vc === ( noteTime - 171 + vbp + 25)) &&
          hc >= 0 + hbp && hc <= 128 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 214) &&
        ( vc === ( noteTime - 214 + vbp) || vc === ( noteTime - 214 + vbp + 25)) &&
          hc >= 256 + hbp && hc <= 384 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 257) &&
        ( vc === ( noteTime - 257 + vbp) || vc === ( noteTime - 257 + vbp + 25)) &&
          hc >= 512 + hbp && hc <= 640 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 300) &&
        ( vc === ( noteTime - 300 + vbp) || vc === ( noteTime - 300 + vbp + 25)) &&
          hc >= 128 + hbp && hc <= 256 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 343) &&
        ( vc === ( noteTime - 343 + vbp) || vc === ( noteTime - 343 + vbp + 25)) &&
          hc >= 384 + hbp && hc <= 512 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 343) &&
        ( vc === ( noteTime - 343 + vbp) || vc === ( noteTime - 343 + vbp + 25)) &&
          hc >= 512 + hbp && hc <= 640 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 386) &&
        ( vc === ( noteTime - 386 + vbp) || vc === ( noteTime - 386 + vbp + 25)) &&
          hc >= 384 + hbp && hc <= 512 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 386) &&
        ( vc === ( noteTime - 386 + vbp) || vc === ( noteTime - 386 + vbp + 25)) &&
          hc >= 512 + hbp && hc <= 640 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 429) &&
        ( vc === ( noteTime - 429 + vbp) || vc === ( noteTime - 429 + vbp + 25)) &&
          hc >= 128 + hbp && hc <= 256 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 472) &&
        ( vc === ( noteTime - 472 + vbp) || vc === ( noteTime - 472 + vbp + 25)) &&
          hc >= 384 + hbp && hc <= 512 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 472) &&
        ( vc === ( noteTime - 472 + vbp) || vc === ( noteTime - 472 + vbp + 25)) &&
          hc >= 512 + hbp && hc <= 640 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 514) &&
        ( vc === ( noteTime - 514 + vbp) || vc === ( noteTime - 514 + vbp + 25)) &&
          hc >= 384 + hbp && hc <= 512 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 514) &&
        ( vc === ( noteTime - 514 + vbp) || vc === ( noteTime - 514 + vbp + 25)) &&
          hc >= 512 + hbp && hc <= 640 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 557) &&
        ( vc === ( noteTime - 557 + vbp) || vc === ( noteTime - 557 + vbp + 25)) &&
          hc >= 0 + hbp && hc <= 128 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 600) &&
        ( vc === ( noteTime - 600 + vbp) || vc === ( noteTime - 600 + vbp + 25)) &&
          hc >= 256 + hbp && hc <= 384 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 643) &&
        ( vc === ( noteTime - 643 + vbp) || vc === ( noteTime - 643 + vbp + 25)) &&
          hc >= 512 + hbp && hc <= 640 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 686) &&
        ( vc === ( noteTime - 686 + vbp) || vc === ( noteTime - 686 + vbp + 25)) &&
          hc >= 0 + hbp && hc <= 128 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 729) &&
        ( vc === ( noteTime - 729 + vbp) || vc === ( noteTime - 729 + vbp + 25)) &&
          hc >= 256 + hbp && hc <= 384 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 772) &&
        ( vc === ( noteTime - 772 + vbp) || vc === ( noteTime - 772 + vbp + 25)) &&
          hc >= 512 + hbp && hc <= 640 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 815) &&
        ( vc === ( noteTime - 815 + vbp) || vc === ( noteTime - 815 + vbp + 25)) &&
          hc >= 512 + hbp && hc <= 640 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 858) &&
        ( vc === ( noteTime - 858 + vbp) || vc === ( noteTime - 858 + vbp + 25)) &&
          hc >= 384 + hbp && hc <= 512 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 901) &&
        ( vc === ( noteTime - 901 + vbp) || vc === ( noteTime - 901 + vbp + 25)) &&
          hc >= 256 + hbp && hc <= 384 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1029) &&
        ( vc === ( noteTime - 1029 + vbp) || vc === ( noteTime - 1029 + vbp + 25)) &&
          hc >= 0 + hbp && hc <= 128 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1072) &&
        ( vc === ( noteTime - 1072 + vbp) || vc === ( noteTime - 1072 + vbp + 25)) &&
          hc >= 0 + hbp && hc <= 128 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1115) &&
        ( vc === ( noteTime - 1115 + vbp) || vc === ( noteTime - 1115 + vbp + 25)) &&
          hc >= 256 + hbp && hc <= 384 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1115) &&
        ( vc === ( noteTime - 1115 + vbp) || vc === ( noteTime - 1115 + vbp + 25)) &&
          hc >= 512 + hbp && hc <= 640 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1158) &&
        ( vc === ( noteTime - 1158 + vbp) || vc === ( noteTime - 1158 + vbp + 25)) &&
          hc >= 256 + hbp && hc <= 384 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1158) &&
        ( vc === ( noteTime - 1158 + vbp) || vc === ( noteTime - 1158 + vbp + 25)) &&
          hc >= 512 + hbp && hc <= 640 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1201) &&
        ( vc === ( noteTime - 1201 + vbp) || vc === ( noteTime - 1201 + vbp + 25)) &&
          hc >= 0 + hbp && hc <= 128 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1244) &&
        ( vc === ( noteTime - 1244 + vbp) || vc === ( noteTime - 1244 + vbp + 25)) &&
          hc >= 256 + hbp && hc <= 384 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1244) &&
        ( vc === ( noteTime - 1244 + vbp) || vc === ( noteTime - 1244 + vbp + 25)) &&
          hc >= 512 + hbp && hc <= 640 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1287) &&
        ( vc === ( noteTime - 1287 + vbp) || vc === ( noteTime - 1287 + vbp + 25)) &&
          hc >= 256 + hbp && hc <= 384 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1287) &&
        ( vc === ( noteTime - 1287 + vbp) || vc === ( noteTime - 1287 + vbp + 25)) &&
          hc >= 512 + hbp && hc <= 640 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1330) &&
        ( vc === ( noteTime - 1330 + vbp) || vc === ( noteTime - 1330 + vbp + 25)) &&
          hc >= 128 + hbp && hc <= 256 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1373) &&
        ( vc === ( noteTime - 1373 + vbp) || vc === ( noteTime - 1373 + vbp + 25)) &&
          hc >= 384 + hbp && hc <= 512 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1373) &&
        ( vc === ( noteTime - 1373 + vbp) || vc === ( noteTime - 1373 + vbp + 25)) &&
          hc >= 512 + hbp && hc <= 640 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1416) &&
        ( vc === ( noteTime - 1416 + vbp) || vc === ( noteTime - 1416 + vbp + 25)) &&
          hc >= 384 + hbp && hc <= 512 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1416) &&
        ( vc === ( noteTime - 1416 + vbp) || vc === ( noteTime - 1416 + vbp + 25)) &&
          hc >= 512 + hbp && hc <= 640 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1459) &&
        ( vc === ( noteTime - 1459 + vbp) || vc === ( noteTime - 1459 + vbp + 25)) &&
          hc >= 128 + hbp && hc <= 256 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1502) &&
        ( vc === ( noteTime - 1502 + vbp) || vc === ( noteTime - 1502 + vbp + 25)) &&
          hc >= 384 + hbp && hc <= 512 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1502) &&
        ( vc === ( noteTime - 1502 + vbp) || vc === ( noteTime - 1502 + vbp + 25)) &&
          hc >= 512 + hbp && hc <= 640 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1544) &&
        ( vc === ( noteTime - 1544 + vbp) || vc === ( noteTime - 1544 + vbp + 25)) &&
          hc >= 384 + hbp && hc <= 512 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1544) &&
        ( vc === ( noteTime - 1544 + vbp) || vc === ( noteTime - 1544 + vbp + 25)) &&
          hc >= 512 + hbp && hc <= 640 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1587) &&
        ( vc === ( noteTime - 1587 + vbp) || vc === ( noteTime - 1587 + vbp + 25)) &&
          hc >= 0 + hbp && hc <= 128 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1630) &&
        ( vc === ( noteTime - 1630 + vbp) || vc === ( noteTime - 1630 + vbp + 25)) &&
          hc >= 256 + hbp && hc <= 384 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1630) &&
        ( vc === ( noteTime - 1630 + vbp) || vc === ( noteTime - 1630 + vbp + 25)) &&
          hc >= 512 + hbp && hc <= 640 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1673) &&
        ( vc === ( noteTime - 1673 + vbp) || vc === ( noteTime - 1673 + vbp + 25)) &&
          hc >= 256 + hbp && hc <= 384 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1673) &&
        ( vc === ( noteTime - 1673 + vbp) || vc === ( noteTime - 1673 + vbp + 25)) &&
          hc >= 512 + hbp && hc <= 640 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1716) &&
        ( vc === ( noteTime - 1716 + vbp) || vc === ( noteTime - 1716 + vbp + 25)) &&
          hc >= 0 + hbp && hc <= 128 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1759) &&
        ( vc === ( noteTime - 1759 + vbp) || vc === ( noteTime - 1759 + vbp + 25)) &&
          hc >= 256 + hbp && hc <= 384 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1759) &&
        ( vc === ( noteTime - 1759 + vbp) || vc === ( noteTime - 1759 + vbp + 25)) &&
          hc >= 512 + hbp && hc <= 640 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1802) &&
        ( vc === ( noteTime - 1802 + vbp) || vc === ( noteTime - 1802 + vbp + 25)) &&
          hc >= 256 + hbp && hc <= 384 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1802) &&
        ( vc === ( noteTime - 1802 + vbp) || vc === ( noteTime - 1802 + vbp + 25)) &&
          hc >= 512 + hbp && hc <= 640 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1845) &&
        ( vc === ( noteTime - 1845 + vbp) || vc === ( noteTime - 1845 + vbp + 25)) &&
          hc >= 128 + hbp && hc <= 256 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1845) &&
        ( vc === ( noteTime - 1845 + vbp) || vc === ( noteTime - 1845 + vbp + 25)) &&
          hc >= 512 + hbp && hc <= 640 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1888) &&
        ( vc === ( noteTime - 1888 + vbp) || vc === ( noteTime - 1888 + vbp + 25)) &&
          hc >= 128 + hbp && hc <= 256 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1888) &&
        ( vc === ( noteTime - 1888 + vbp) || vc === ( noteTime - 1888 + vbp + 25)) &&
          hc >= 384 + hbp && hc <= 512 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1931) &&
        ( vc === ( noteTime - 1931 + vbp) || vc === ( noteTime - 1931 + vbp + 25)) &&
          hc >= 128 + hbp && hc <= 256 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 1931) &&
        ( vc === ( noteTime - 1931 + vbp) || vc === ( noteTime - 1931 + vbp + 25)) &&
          hc >= 256 + hbp && hc <= 384 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 2059) &&
        ( vc === ( noteTime - 2059 + vbp) || vc === ( noteTime - 2059 + vbp + 25)) &&
          hc >= 0 + hbp && hc <= 128 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end
       
       else if ( ( noteTime >= 2059) &&
        ( vc === ( noteTime - 2059 + vbp) || vc === ( noteTime - 2059 + vbp + 25)) &&
          hc >= 256 + hbp && hc <= 384 + hbp)
        begin red = 4'b0000; green = 4'b0000; blue = 4'b0000; end

                                        
       /******************************************************************************************************************************************************/         
       /******************************************************************************************************************************************************/         
       /******************************************************************************************************************************************************/         

        // 4 black lines
        else if ( vc >= vbp && vc < vfp)
        begin
            
            if (hc === (hbp+128) )
            begin
                red = 4'b0000;
                green = 4'b0000;
                blue = 4'b0000;
            end
            
            else if (hc === (hbp+256) )
            begin
                red = 4'b0000;
                green = 4'b0000;
                blue = 4'b0000;
            end
            
            else if (hc === (hbp+384) )
            begin
                red = 4'b0000;
                green = 4'b0000;
                blue = 4'b0000;
            end
            
            else if (hc === (hbp+512) )
            begin
                red = 4'b0000;
                green = 4'b0000;
                blue = 4'b0000;
            end
            
            // we're outside active horizontal range so display black
            else if (hc < hbp || hc > hfp)
            begin
                red = 4'b0000;
                green = 4'b0000;
                blue = 4'b0000;
            end
            
            // white spaces
            else 
            begin
                red = 4'b1111;
                green = 4'b1111;
                blue = 4'b1111;
            end    
        end
        
        // we're outside active vertical range so display black
        else
        begin
            red = 4'b0000;
            green = 4'b0000;
            blue = 4'b0000;
        end
    end
                 
endmodule
