`timescale 1ns / 1ps


module Instruction_Memory_tb #(parameter ADDRESS_WIDTH = 8, INSTRUCTION_WIDTH = 16);


    logic [ADDRESS_WIDTH-1:0] address;
    logic [INSTRUCTION_WIDTH-1:0] instruction;
    
    Instruction_Memory uut (
        .address(address),
        .instruction(instruction)
    );
    
    
    initial
        begin
            address = 0;
            #1
            
            if (instruction == 16'h1234)
                begin
                    $display("SUCCESS: Expected data (%d) is located in the address cell %d", instruction, address);
                end
            else
                begin
                    $display("FAIL: Expected data (%d) is not located in the address cell %d", instruction, address);
                end
            #200
                
            address = 1;
            #1
            
            if (instruction == 16'h3324)
                begin
                    $display("SUCCESS: Expected data (%d) is located in the address cell %d", instruction, address);
                end
            else
                begin
                    $display("FAIL: Expected data (%d) is not located in the address cell %d", instruction, address);
                end
            #200
                

           address = 2;
           #1

           if (instruction == 16'h2131)
                begin
                    $display("SUCCESS: Expected data (%d) is located in the address cell %d", instruction, address);
                end
           else
                begin
                    $display("FAIL: Expected data (%d) is not located in the address cell %d", instruction, address);
                end
                
           #200 $finish;
        end

endmodule
