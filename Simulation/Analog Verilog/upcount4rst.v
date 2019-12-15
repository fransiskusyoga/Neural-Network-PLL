module upcount4rst(clk,rst,out);
   input clk,rst;
   output reg [3:0] out = 4'b0;
   always @(posedge clk or posedge rst) out = rst ? 4'b0 : out+4'b1;
endmodule
