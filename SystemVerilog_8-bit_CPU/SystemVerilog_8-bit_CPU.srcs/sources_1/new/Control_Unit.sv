`timescale 1ns / 1ps


module Control_Unit #(parameter INSTRUCTION_WIDTH = 16, OPERATION_WIDTH = 4)
(
    input logic [INSTRUCTION_WIDTH-1:0] instruction,
    
    output logic [OPERATION_WIDTH-1:0] alu_operation,
    input logic zero_flag,
    output logic register_write_enable,  
    output logic jump_enable,
    output logic pc_enable ,
    
    output logic data_memory_read,   
    output logic data_memory_write,      
    output logic [1:0] register_write_source
);

    
    logic [OPERATION_WIDTH-1:0] operation_code;
    assign operation_code = instruction[INSTRUCTION_WIDTH-1:INSTRUCTION_WIDTH-OPERATION_WIDTH];
    

    always_comb 
        begin
            alu_operation = 4'b0000;
            register_write_enable = 1'b0;
            jump_enable = 1'b0;
            pc_enable   = 1'b1;
            
            data_memory_read = 1'b0;
            data_memory_write = 1'b0;
            register_write_source = 2'b00;
            
            case (operation_code)
                '0: begin
                    // Skip
                end
                
                4'b1101: begin
                    register_write_enable = 1'b1;
                    register_write_source = 2'b10;
                end

                4'b1011: begin
                    data_memory_read = 1'b1;
                    register_write_enable = 1'b1;
                    register_write_source  = 2'b01; 
                end

                4'b0100: begin
                    data_memory_write = 1'b1;
                    register_write_enable = 1'b0;
                end
                
                4'b0010: begin
                    jump_enable = 1'b1;
                end
                
                4'b1001: begin
                    if (zero_flag)
                        begin
                            jump_enable = 1;
                        end
                end
                
                4'b0001,
                4'b0011,
                4'b0111,
                4'b1111,
                4'b1000,
                4'b1100,
                4'b1110,
                4'b0101,
                4'b1010,
                4'b0110:
                begin
                    alu_operation = operation_code;
                    register_write_enable = 1'b1;
                    register_write_source = 2'b00;
                    
                end
            endcase
                           
                    
        end


endmodule
