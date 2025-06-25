`timescale 1ns / 1ps

module tb_pulse_every_10_cycles ;

   reg clk;
   reg start = 0;
   reg rst = 0;
    
   wire op_sig;

   initial clk = 0;

    pulse_every_10_cycles uut (.clk(clk), .start(start), .rst(rst), .op_sig(op_sig) );

    always #5 clk = ~clk; 

    initial 
       begin  
        #10 
          rst = 1;
        #10 
          rst = 0; start = 1;
        #100 
          start = 0; 
        #20 
          $finish;
       end
   
endmodule
