module upcount3rst(clk,rst,out);
   input clk,rst;
   output reg [2:0] out = 3'b0;
   always @(posedge clk or posedge rst) out = rst ? 3'b0 : out+3'b1;
endmodule
