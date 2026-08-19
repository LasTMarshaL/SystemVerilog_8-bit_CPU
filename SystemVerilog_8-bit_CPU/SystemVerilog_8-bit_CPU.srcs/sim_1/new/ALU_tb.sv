`timescale 1ns / 1ps


module ALU_tb #(parameter DATA_WIDTH = 8);


    logic [3:0] command;
    logic signed [DATA_WIDTH-1:0] data_in_operand_a;
    logic signed [DATA_WIDTH-1:0] data_in_operand_b;
    logic carry_in;
    
    logic signed [DATA_WIDTH-1:0] data_out;
    
    logic zero;
    logic overflow;
    logic sign;
    logic carry_out;
    
    
    ALU uut (
        .command(command),
        .data_in_operand_a(data_in_operand_a),
        .data_in_operand_b(data_in_operand_b),
        .carry_in(carry_in),
        .data_out(data_out),
        .zero(zero),
        .overflow(overflow),
        .sign(sign),
        .carry_out(carry_out)
    );
    
    
    initial
        begin
            command = 4'b0001;
            data_in_operand_a = 8'sd12;
            data_in_operand_b = 8'sd3;
            carry_in = 0;
            
            #5
            if (data_out == 8'sd15)
                begin
                     $display("SUCCESS ADD: Expected result (%d) was received correctly", data_out);
                end
            else
                begin
                    $display("FAIL ADD: Expected result (%d) was not received correctly", data_out);
                end
            
            #200
            command = 4'b0011;
            data_in_operand_a = 8'sd4;
            data_in_operand_b = 8'sd11;
            carry_in = 0;
            
            #5
            if (data_out == -8'sd7)
                begin
                     $display("SUCCESS SUB: Expected result (%d) was received correctly", data_out);
                end
            else
                begin
                    $display("FAIL SUB: Expected result (%d) was not received correctly", data_out);
                end
                
            #200
            command = 4'b0111;
            data_in_operand_a = 8'sd5;
            data_in_operand_b = 8'sd34;
            carry_in = 1;
            
            #5
            if (data_out == 8'sd40)
                begin
                     $display("SUCCESS ADC: Expected result (%d) was received correctly", data_out);
                end
            else
                begin
                    $display("FAIL ADC: Expected result (%d) was not received correctly", data_out);
                end
                
            #200
            command = 4'b1111;
            data_in_operand_a = 8'sd56;
            data_in_operand_b = 8'sd17;
            carry_in = 1;
            
            #5
            if (data_out == 8'sd38)
                begin
                     $display("SUCCESS SUC: Expected result (%d) was received correctly", data_out);
                end
            else
                begin
                    $display("FAIL SUC: Expected result (%d) was not received correctly", data_out);
                end
                
            # 200
            command = 4'b1000;
            data_in_operand_a = 8'sd1;
            data_in_operand_b = 8'sd0;
            carry_in = 0;
            
            #5
            if (data_out == 8'sd0)
                begin
                     $display("SUCCESS AND: Expected result (%d) was received correctly", data_out);
                end
            else
                begin
                    $display("FAIL AND: Expected result (%d) was not received correctly", data_out);
                end
                
            #200
            command = 4'b1100;
            data_in_operand_a = 8'sd1;
            data_in_operand_b = 8'sd0;
            carry_in = 0;
            
            #5
            if (data_out == 8'sd1)
                begin
                     $display("SUCCESS OR: Expected result (%d) was received correctly", data_out);
                end
            else
                begin
                    $display("FAIL OR: Expected result (%d) was not received correctly", data_out);
                end
                
            # 200
            command = 4'b1110;
            data_in_operand_a = 8'sd48;
            data_in_operand_b = '0;
            carry_in = 0;
            
            #5
            if (data_out == -8'sd48)
                begin
                     $display("SUCCESS NEG: Expected result (%d) was received correctly", data_out);
                end
            else
                begin
                    $display("FAIL NEG: Expected result (%d) was not received correctly", data_out);
                end 
                
            #200
            command = 4'b1010;
            data_in_operand_a = 8'sd16;
            data_in_operand_b = '0;
            carry_in = 0;
            
            #5
            if (data_out === 8'sd8)
                begin
                     $display("SUCCESS >>>: Expected result (%d) was received correctly", data_out);
                end
            else
                begin
                    $display("FAIL >>>: Expected result (%d) was not received correctly", data_out);
                end
                
            #200
            command = 4'b0101;
            data_in_operand_a = 8'sd16;
            data_in_operand_b = '0;
            carry_in = 0;
            
            #5
            if (data_out === 8'sd32)
                begin
                     $display("SUCCESS <<<: Expected result (%d) was received correctly", data_out);
                end
            else
                begin
                    $display("FAIL <<<: Expected result (%d) was not received correctly", data_out);
                end
                
            #200
            command = 4'b0110;
            data_in_operand_a = '0;
            data_in_operand_b = '0;
            carry_in = 0;
            
            #5
            if (data_out == -8'sd1)
                begin
                     $display("SUCCESS NOT: Expected result (%d) was received correctly", data_out);
                end
            else
                begin
                    $display("FAIL NOT: Expected result (%d) was not received correctly", data_out);
                end
                
            #200
            command = 4'b0001;
            data_in_operand_a = 8'sd127;
            data_in_operand_b = 8'sd1;
            carry_in = 0;
            
            #5
            if (overflow == 8'sb1)
                begin
                     $display("SUCCESS: (+) Overflow was set");
                end
            else
                begin
                    $display("FAIL: (+) Overflow was not set");
                end
                
            #200
            command = 4'b0011;
            data_in_operand_a = -8'sd128;
            data_in_operand_b = 8'sd1;
            carry_in = 0;
            
            #5
            if (overflow == 8'sb1)
                begin
                     $display("SUCCESS: (-) Overflow was set");
                end
            else
                begin
                    $display("FAIL: (-) Overflow was not set");
                end
                
            #200 $finish;
        end


endmodule
