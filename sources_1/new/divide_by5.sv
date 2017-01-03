module divide_by5(numer, quotient, remain);
    input [5:0] numer;
    output [2:0] quotient;
    output [3:0] remain;
    
    reg [2:0] quotient;
    reg [3:0] remain_bit3_bit2;
    
    assign remain = {remain_bit3_bit2, numer[1:0]}; // the first 2 bits are copied through
    
    always @(numer[5:2]) // and just do a divide by "3" on the remaining bits
    case(numer[5:2])
       0: begin quotient=0; remain_bit3_bit2=0; end
       1: begin quotient=0; remain_bit3_bit2=1; end
       2: begin quotient=0; remain_bit3_bit2=2; end
       3: begin quotient=1; remain_bit3_bit2=0; end
       4: begin quotient=1; remain_bit3_bit2=1; end
    endcase
endmodule
