`timescale 1ns / 1ps

module op_sig_counter(
    input clk,start,rst,
    output reg op_sig
    );
    
    reg [3:0] count;
    
    always @(posedge clk or posedge rst)
    begin
    
    if(rst)
        begin
            count <=0;
            op_sig<=0;
        end
    
    else 
        begin
        
    if (start)
        begin
            if(count!=9)
                begin
                    count<=count+1;
                    op_sig<=0;
                end 
            else
                begin
                    count<=0;
                    op_sig<=1;
                end
         end
         
     else
        begin
            op_sig<=0;
        end
    end
    end
    
endmodule




















