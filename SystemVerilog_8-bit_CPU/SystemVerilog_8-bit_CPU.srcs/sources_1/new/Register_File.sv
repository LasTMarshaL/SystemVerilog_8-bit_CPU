`timescale 1ns / 1ps
`include "CPU_Package.sv"


module Register_File #(parameter DATA_WIDTH = 8, REGISTER_SELECTION_WIDTH = 1)
(
    input logic clk,
    input logic reset,
    
    input logic write_register_enable,
    input logic [REGISTER_SELECTION_WIDTH-1:0] write_register_select,
    
    input logic [DATA_WIDTH-1:0] write_register_data,
    
    output logic signed [DATA_WIDTH-1:0] read_register_0,
    output logic signed [DATA_WIDTH-1:0] read_register_1
);
    
    
    logic signed [DATA_WIDTH-1:0] register_0;
    logic signed [DATA_WIDTH-1:0] register_1;
    
    assign read_register_0 = register_0;
    assign read_register_1 = register_1;

    always_ff @(posedge clk or posedge reset)
        begin
            if (reset)
                begin
                    register_0 <= '0;
                    register_1 <= '0;
                end
            else if (write_register_enable)
                begin
                    if (write_register_select)
                        begin
                            register_1 <= write_register_data;
                        end
                    else
                        begin
                            register_0 <= write_register_data;
                        end
                    end
                end
    

endmodule