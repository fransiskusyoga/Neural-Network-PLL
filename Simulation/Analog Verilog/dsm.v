module dsm(in,clk,out);
   input [8:0] in;
   input clk;
   output out;
   reg [10:0] mem = 11'b0;
   wire [10:0] dif;
   always @(posedge clk) mem<=mem+dif;
   assign dif = {2'b0,in}-(out ? 11'd511:11'd0);
   assign out = (!mem[10]) && (|mem[9:8]);
endmodule
