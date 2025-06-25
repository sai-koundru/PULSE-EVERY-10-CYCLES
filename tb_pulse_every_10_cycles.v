`timescale 1ns / 1ps

module op_sig_counter_tb;

   reg clk;
initial clk = 0;

    reg start = 0;
    reg rst = 0;
    
    wire op_sig;

    op_sig_counter uut (.clk(clk), .start(start), .rst(rst), .op_sig(op_sig) );

    always #5 clk = ~clk; 

    initial begin  
        $display("Time\t clk\t start\t rst\t op_sig");
        $monitor("%0t\t %b\t %b\t %b\t %b", $time, clk, start, rst, op_sig);

        #10 rst = 1;
        #10 rst = 0; start = 1;
        #100 start = 0; 
        #20 $finish;
    end
   
endmodule

