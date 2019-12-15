module bbpfd(ref,gen,out);
   input ref,gen;
   output reg out = 1'b0;
   wire rst;
   reg dref=1'b0,dgen=1'b0;
   // reference DFF
   always @(posedge ref or negedge rst) dref<=rst;
   // generated signal DFF
   always @(posedge gen or negedge rst) dgen<=rst;
   // assign reset value
   assign rst = ~(dref&dgen);
   // output value
   always @(posedge dref) out<=!dgen;
endmodule
