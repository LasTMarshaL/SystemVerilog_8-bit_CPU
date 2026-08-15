`timescale 1ns / 1ps


module Instruction_Memory #(parameter ADDRESS_WIDTH = 8, INSTRUCTION_WIDTH = 16)
(
    input logic [ADDRESS_WIDTH-1:0] address,
    output logic [INSTRUCTION_WIDTH-1:0] instruction
);


    logic [INSTRUCTION_WIDTH-1:0] memory [0:255];
    

    initial
        begin
            // The solution bellow will be used at the final stage, when connections berween all modulel
            // and "machine code" file will be implemented.
            // $readmemh("program.hex", memory);
            
            // Now the following "blanking plug" is used for tests:
            memory[0] = 16'h1234;
            memory[1] = 16'h3324;
            memory[2] = 16'h2131;
            
            for (int i = 3; i < 256; i++)
                begin
                    memory[i] = '0;
                end
        end
        
        assign instruction = memory[address];


endmodule
