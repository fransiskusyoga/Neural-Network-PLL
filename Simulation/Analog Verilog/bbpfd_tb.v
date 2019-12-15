`include "bbpfd.v"
module bbpfd_tb();
   reg ref,gen;
   wire out;
   bbpfd pfd(ref,gen,out);
   initial
   begin
   ref = 1'b0; gen = 1'b0;
   #100 ref = 1'b0; gen = 1'b1;
   #1 ref = 1'b1; gen = 1'b1;
   #100 ref = 1'b0; gen = 1'b0;
   #100 ref = 1'b1; gen = 1'b0;
   #1 ref = 1'b1; gen = 1'b1;
   #100 ref = 1'b0; gen = 1'b0;
   #100 ref = 1'b0; gen = 1'b1;
   #1 ref = 1'b1; gen = 1'b1;
   #100 ref = 1'b0; gen = 1'b0;
   #100 ref = 1'b1; gen = 1'b0;
   #1 ref = 1'b1; gen = 1'b1;
   #100 ref = 1'b0; gen = 1'b0;
   #100 ref = 1'b1; gen = 1'b0;
   #1 ref = 1'b1; gen = 1'b1;
   #100 ref = 1'b0; gen = 1'b0;
   end
endmodule
