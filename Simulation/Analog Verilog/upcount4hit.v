module upcount4hit(clk,out,hit);
   input clk;
   output reg [3:0] out = 4'b0;
   output hit;
   always @(posedge clk) out = out+4'b1;
   assign hit = &(out);
endmodule
