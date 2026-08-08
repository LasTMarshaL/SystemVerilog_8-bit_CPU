`timescale 1ns / 1ps


module Data_Memory #(parameter DATA_WIDTH = 8, ADDRESS_WIDTH = 8)
(
    input logic clk,
    
    input logic write_enable,
    
    input logic [ADDRESS_WIDTH-1:0] address,
    
    input logic signed [DATA_WIDTH-1:0] write_data, 
    output logic signed [DATA_WIDTH-1:0] read_data
);


    logic [DATA_WIDTH-1:0] memory [0:(1<<ADDRESS_WIDTH)-1];
    
    initial
        begin
            for (int i = 0; i < (1<<ADDRESS_WIDTH); i++)
                begin
                    memory[i] = '0;
                end
        end
    
    always_ff @(posedge clk)
        begin
            if (write_enable)
                begin
                    memory[address] <= write_data;
                    read_data <= write_data;
                end
            else
                begin
                    read_data <= memory[address];
                end
        end


endmodule