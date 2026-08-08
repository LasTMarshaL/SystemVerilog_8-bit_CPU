`timescale 1ns / 1ps


module Data_Memory_tb #(parameter DATA_WIDTH = 8, ADDRESS_WIDTH = 8);


    logic clk;
    
    logic write_enable;
    
    logic [ADDRESS_WIDTH-1:0] address;
    
    logic signed [DATA_WIDTH-1:0] write_data;
    logic signed [DATA_WIDTH-1:0] read_data;
    
    Data_Memory uut (
        .clk(clk),
        .write_enable(write_enable),
        .address(address),
        .write_data(write_data),
        .read_data(read_data)
    );
    
    
    always 
        begin
            #5 clk = ~clk;
        end
    
    
    initial
        begin
            clk = 0;
            write_enable = 0;
            address = 0;
            write_data = '0;
            
            #200
            @(negedge clk)
            
            write_enable = 1;
            address = 0;
            write_data = 8'sd13;
            
            @(posedge clk);
            #1 
            
            write_enable = 0; 
            if (read_data == write_data)
                begin
                    $display("SUCCESS: Expected data (%d) was written to the address cell %d", write_data, address);
                end
            else
                begin
                    $display("FAIL: Expected data (%d) was not written to the address cell %d", write_data, address);
                end
                
            #200
            @(negedge clk)
            
            write_enable = 1;
            address = 17;
            write_data = -8'sd64;
            
            @(posedge clk);
            #1 
            
            write_enable = 0; 
            if (read_data == write_data)
                begin
                    $display("SUCCESS: Expected data (%d) was written to the address cell %d", write_data, address);
                end
            else
                begin
                    $display("FAIL: Expected data (%d) was not written to the address cell %d", write_data, address);
                end
            
            #200
            @(negedge clk)
            
            write_enable = 1;
            address = 0;
            write_data = '0;
            
            @(posedge clk);
            #1 
            
            write_enable = 0; 
            if (read_data == write_data)
                begin
                    $display("SUCCESS: Adrress cell %d was reset to zero", address);
                end
            else
                begin
                    $display("FAIL: Adrress cell %d was not reset to zero", address);
                end
            
            #200
            @(negedge clk)
            
            write_enable = 1;
            address = 17;
            write_data = '0;
            
            @(posedge clk); 
            #1
            
            write_enable = 0; 
            if (read_data == write_data)
                begin
                    $display("SUCCESS: Address cell %d was reset to zero", address);
                end
            else
                begin
                    $display("FAIL: Address cell %d was not reset to zero", address);
                end
            
            #200 $finish;
        end
    

endmodule
