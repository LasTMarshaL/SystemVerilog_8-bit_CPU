`timescale 1ns / 1ps


module Instruction_Memory #(parameter ADDRESS_WIDTH = 8, INSTRUCTION_WIDTH = 16)
(
    input logic [ADDRESS_WIDTH-1:0] address,
    output logic [INSTRUCTION_WIDTH-1:0] instruction
);


    logic [INSTRUCTION_WIDTH-1:0] memory [0:(1<<ADDRESS_WIDTH)-1];
    

    initial
        begin
            $readmemh("CPU_Commands.mem", memory);
        end
        
        assign instruction = memory[address];


endmodule