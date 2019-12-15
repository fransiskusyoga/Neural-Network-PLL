module dsm(in,clk,out);
   input [9:0] in;
   input clk;
   output out;
   reg [11:0] mem = 12'b0;
   wire [11:0] dif;
   always @(posedge clk) mem<=mem+dif;
   assign dif = {2'b0,in}-(out ? 12'd1023:12'd0);
   assign out = (!mem[11]) && (|mem[10:9]);
endmodule
