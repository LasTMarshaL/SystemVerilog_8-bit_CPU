`timescale 1ns / 1ps


module Flag_Register_tb();


    logic clk;
    logic reset;
    
    logic write_enable;
    
    flags_t flags_in;
    flags_t flags_out;
    
    Flag_Register uut (
        .clk(clk),
        .reset(reset),
        .write_enable(write_enable),
        .flags_in(flags_in),
        .flags_out(flags_out)
    );
    
    
    always
        begin
            #5 clk = ~clk;
        end
    
    
    initial
        begin
            clk = 0;
            reset = 1;
            write_enable = 0;
            
            flags_in.zero = 0;
            flags_in.carry_out = 0;
            flags_in.sign = 0;
            flags_in.overflow = 0;
            
            #20
            
            reset = 0;
            
            #200
            @(negedge clk)
            write_enable = 1;
            
            flags_in.zero = 1;
            flags_in.carry_out = 1;
            flags_in.sign = 0;
            flags_in.overflow = 0;
            
            @(posedge clk)
            #1
            
            write_enable = 0;
            if (flags_in.zero == flags_out.zero)
                begin
                    $display("SUCCESS: zero flag was set correctly (%d)", flags_in.zero);
                end
            else
                begin
                    $display("FAIL: zero flag was not set correctly (%d)", flags_in.zero);
                end
            if (flags_in.carry_out == flags_out.carry_out)
                begin
                    $display("SUCCESS: carry_out flag was set correctly (%d)", flags_in.carry_out);
                end
            else
                begin
                    $display("FAIL: carry_out flag was not set correctly (%d)", flags_in.carry_out);
                end
            if (flags_in.sign == flags_out.sign)
                begin
                    $display("SUCCESS: sign flag was set correctly (%d)", flags_in.sign);
                end
            else
                begin
                    $display("FAIL: sign flag was not set correctly (%d)", flags_in.sign);
                end
            if (flags_in.overflow == flags_out.overflow)
                begin
                    $display("SUCCESS: overflow flag was set correctly (%d)", flags_in.overflow);
                end
            else
                begin
                    $display("FAIL: overflow flag was not set correctly (%d)", flags_in.overflow);
                end
                
           #200
            @(negedge clk)
            write_enable = 1;
            
            flags_in.zero = 0;
            flags_in.carry_out = 0;
            flags_in.sign = 1;
            flags_in.overflow = 1;
            
            @(posedge clk)
            #1
            
            write_enable = 0;
            if (flags_in.zero == flags_out.zero)
                begin
                    $display("SUCCESS: zero flag was set correctly (%d)", flags_in.zero);
                end
            else
                begin
                    $display("FAIL: zero flag was not set correctly (%d)", flags_in.zero);
                end
            if (flags_in.carry_out == flags_out.carry_out)
                begin
                    $display("SUCCESS: carry_out flag was set correctly (%d)", flags_in.carry_out);
                end
            else
                begin
                    $display("FAIL: carry_out flag was not set correctly (%d)", flags_in.carry_out);
                end
            if (flags_in.sign == flags_out.sign)
                begin
                    $display("SUCCESS: sign flag was set correctly (%d)", flags_in.sign);
                end
            else
                begin
                    $display("FAIL: sign flag was not set correctly (%d)", flags_in.sign);
                end
            if (flags_in.overflow == flags_out.overflow)
                begin
                    $display("SUCCESS: overflow flag was set correctly (%d)", flags_in.overflow);
                end
            else
                begin
                    $display("FAIL: overflow flag was not set correctly (%d)", flags_in.overflow);
                end
                
            #200 $finish;
        end


endmodule
