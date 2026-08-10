`timescale 1ns / 1ps


typedef struct packed
{
    logic zero;
    logic carry_out;
    logic sign;
    logic overflow;
} flags_t;


module Flag_Register
(    
    input logic clk,
    input logic reset,
    
    input logic write_enable,
    
    input flags_t flags_in,
    output flags_t flags_out
);
    

    always_ff @(posedge clk or posedge reset)
        begin
            if (reset)
                begin
                    flags_out <= '0;
                end
            else if (write_enable)
                        begin
                            flags_out <= flags_in;
                        end
        end
    
    
endmodule
