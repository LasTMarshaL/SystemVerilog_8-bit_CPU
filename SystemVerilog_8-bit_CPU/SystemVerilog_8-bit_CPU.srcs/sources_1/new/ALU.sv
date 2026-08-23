`timescale 1ns / 1ps


import CPU_Package::*;


module ALU #(parameter DATA_WIDTH = 8)
(
    input logic [DATA_WIDTH/2-1:0] command,
    input logic signed [DATA_WIDTH-1:0] data_in_operand_a,
    input logic signed [DATA_WIDTH-1:0] data_in_operand_b,
    input logic carry_in,
    
    output logic signed [DATA_WIDTH-1:0] data_out,
    
    output flags_t flags
);


    logic signed [DATA_WIDTH:0] temprorary_sum;

    always_comb 
        begin
            data_out = '0;
            flags.overflow = '0;
            flags.sign = '0;
            flags.carry_out = '0;
            
            case (command)
                4'b0001: 
                    begin
                        temprorary_sum = data_in_operand_a + data_in_operand_b;
                        data_out = temprorary_sum[DATA_WIDTH-1:0];
                        flags.carry_out = temprorary_sum[DATA_WIDTH];
                        flags.overflow = ((data_in_operand_a[DATA_WIDTH-1] == data_in_operand_b[DATA_WIDTH-1]) & data_out[DATA_WIDTH-1] != data_in_operand_a[DATA_WIDTH-1]);
                    end
                4'b0011:
                    begin
                        temprorary_sum = data_in_operand_a - data_in_operand_b;
                        data_out = temprorary_sum[DATA_WIDTH-1:0];
                        flags.carry_out = temprorary_sum[DATA_WIDTH];
                        flags.overflow = ((data_in_operand_a[DATA_WIDTH-1] != data_in_operand_b[DATA_WIDTH-1]) & data_out[DATA_WIDTH-1] != data_in_operand_a[DATA_WIDTH-1]);
                    end
                4'b0111: 
                    begin
                        temprorary_sum = data_in_operand_a + data_in_operand_b + carry_in;
                        data_out = temprorary_sum[DATA_WIDTH-1:0];
                        flags.carry_out = temprorary_sum[DATA_WIDTH];
                        flags.overflow = ((data_in_operand_a[DATA_WIDTH-1] == data_in_operand_b[DATA_WIDTH-1]) & data_out[DATA_WIDTH-1] != data_in_operand_a[DATA_WIDTH-1]);
                    end
                4'b1111:
                    begin
                        temprorary_sum = data_in_operand_a - data_in_operand_b - carry_in;
                        data_out = temprorary_sum[DATA_WIDTH-1:0];
                        flags.carry_out = temprorary_sum[DATA_WIDTH];
                        flags.overflow = ((data_in_operand_a[DATA_WIDTH-1] != data_in_operand_b[DATA_WIDTH-1]) & data_out[DATA_WIDTH-1] != data_in_operand_a[DATA_WIDTH-1]);
                    end
                4'b1000: data_out = data_in_operand_a & data_in_operand_b; 
                4'b1100: data_out = data_in_operand_a | data_in_operand_b; 
                4'b1110: data_out = -data_in_operand_a; 
                4'b0101: data_out = data_in_operand_a <<< 1; 
                4'b1010: data_out = data_in_operand_a >>> 1; 
                4'b0110: data_out = ~data_in_operand_a;
                default: data_out = '0;
            endcase
            
            flags.zero = (data_out == '0);
            flags.sign = data_out[DATA_WIDTH-1];
        end
    

endmodule