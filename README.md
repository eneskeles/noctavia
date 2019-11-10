# Noctavia
Noctavia is a piano practice program implemented on Basys-3 FPGA Board using System Verilog. 
In Noctavia, five lines of notes flow, beginning from the top of screen as long as the user hits
the correct key combination. Once user stops hitting the correct keys, program waits for user to 
find correct combination. Pressed notes glow and the audio output of the notes are given synchronously.  

## Requirements
- Basys 3 FPGA Board
- Vivado Xilinx HLx

## Usage 
- Import project on Vivado and compile.
- Transfer the project into Basys 3 board.
- Connect Basys 3 to a screen with VGA cable.  
- Use buttons on Basys 3 as piano keys.
