`timescale 1ns / 1ps


import CPU_Package::*;


module TOP_Unit #(parameter INSTRUCTION_WIDTH = 16, OPERATION_WIDTH = 4, DATA_WIDTH = 8, ADDRESS_WIDTH = 8, REGISTER_SELECTION_WIDTH = 1)
(
    input logic clk,
    input logic reset
);



    logic signed [DATA_WIDTH-1:0] alu_result;
    
    
    logic [INSTRUCTION_WIDTH-1:0] instruction;
    
    logic [OPERATION_WIDTH-1:0] alu_operation;
    logic register_write_enable;  
    logic flag_register_write_enable;  
    logic jump_enable;
    logic pc_enable;
    
    logic data_memory_read;   
    logic data_memory_write;      
    logic [1:0] register_write_source;
    
    
    logic write_register_select;
    
    logic [DATA_WIDTH-1:0] write_register_data_mux;
    
    logic signed [DATA_WIDTH-1:0] register_0_data;
    logic signed [DATA_WIDTH-1:0] register_1_data;
    
    
    flags_t register_flags_t;
    
    flags_t alu_register_flags;
    flags_t current_register_flags;
    
    assign write_register_data_mux = (register_write_source == 2'b00) ? alu_result:    
                        (register_write_source == 2'b01) ? data_memory_read:     
                                                            instruction[INSTRUCTION_WIDTH-OPERATION_WIDTH-REGISTER_SELECTION_WIDTH-1:INSTRUCTION_WIDTH-OPERATION_WIDTH-REGISTER_SELECTION_WIDTH-8];
    
    
    ALU alu_instance ( 
        .command(instruction[INSTRUCTION_WIDTH-1:INSTRUCTION_WIDTH-OPERATION_WIDTH]),
        .carry_in(current_register_flags.carry_out),
        .flags(alu_register_flags),
        .data_operand_a(register_0_data),
        .data_operand_b(register_1_data),
        .data_out(alu_result)
    );
    
    Register_File register_file_instance ( 
        .clk(clk),
        .reset(reset),
        .write_register_enable(write_register_enable),
        .write_register_select(instruction[INSTRUCTION_WIDTH-OPERATION_WIDTH-REGISTER_SELECTION_WIDTH]),
        .write_register_data(write_register_data_mux),
        .read_register_0(register_0_data),
        .read_register_1(register_1_data)
    );
    
    Flag_Register flag_register_instance ( 
        .clk(clk),
        .reset(reset),
        .write_enable(flag_register_write_enable),
        .flags_in(alu_register_flags),
        .flags_out(current_register_flags)
    );
    
    Control_Unit control_unit_instance( 
        .clk(clk),
        .reset(reset),
        .instruction(instruction),
        .zero_flag(register_flags.zero),
        .register_write_enable(register_write_enable),
        .flag_register_write_enable(flag_register_write_enable),
        .jump_enable(jump_enable),
        .pc_enable(pc_enable),
        .data_memory_read(data_memory_read),
        .data_memory_write(data_memory_write),
        .register_write_source(register_write_source)
    );
    
    
endmodule
