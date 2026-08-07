`timescale 1ns / 1ps


module Register_File_tb #(parameter DATA_WIDTH = 8);


    logic clk;
    logic reset;
    logic write_register_enable;
    logic write_register_select;
    logic signed [DATA_WIDTH-1:0] write_register_data;
    
    logic signed [DATA_WIDTH-1:0] read_register_0;
    logic signed [DATA_WIDTH-1:0] read_register_1;
    
    Register_File utt (
        .clk(clk),
        .reset(reset),
        .write_register_enable(write_register_enable),
        .write_register_select(write_register_select),
        .write_register_data(write_register_data),
        .read_register_0(read_register_0),
        .read_register_1(read_register_1)
    );
    
    
    always
        begin
            #5 clk = ~clk;
        end
        
    
    initial 
        begin
            clk = 0;
            reset = 1;
            write_register_enable = 0;
            write_register_select = 0;
            write_register_data = '0;
            
            #20 reset = 0;
            
            #500
            @(negedge clk)
            
            write_register_enable = 1;
            write_register_select = 0; 
            write_register_data = 8'sd24;
            
            @(posedge clk)
            #1
                
            if (read_register_0 == 8'sd24)
                begin
                    $display("SUCCESS: Number %d was written in register_0", read_register_0);
                end
            else
                begin
                    $display("FAIL: Number %d was not written in register_0", write_register_data);
                end
           write_register_enable = 0;
            
            #500
            @(negedge clk)
            
            write_register_enable = 1;
            write_register_select = 1;
            write_register_data = -8'sd38;
            
            @ (posedge clk)
            #1
                
            if (read_register_1 == -8'sd38)
                begin
                    $display("SUCCESS: Number %d was written in register_1", read_register_1);
                end
            else
                begin
                    $display("FAIL: Number %d was not written in register_1", write_register_data);
                end
             write_register_enable = 0;
                
            #500
            @(negedge clk)
            
            write_register_select = 0;
            write_register_data = 8'sd51;
            
            @(posedge clk)
            #1
            
            if (read_register_0 == 8'sd24)
                begin
                    $display("SUCCESS: register_0 is unchanged");
                end
            else
                begin
                    $display("FAIL: register_0 is changed");
                end
                
            #500
            @(negedge clk)
            
            write_register_select = 0;
            write_register_data = 8'sd23;
            
            
            @(posedge clk)   
            #1
            
            if (read_register_1 == -8'sd38)
                begin
                    $display("SUCCESS: register_1 is unchanged");
                end
            else
                begin
                    $display("FAIL: register_1 is changed");
                end
                
            #1000 $finish;
        end    


endmodule
