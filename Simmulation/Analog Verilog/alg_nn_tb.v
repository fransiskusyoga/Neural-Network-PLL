module alg_nn_tb();
   reg [2:0] n;
   reg [7:0] kp;
   reg clk;
   wire [7:0] inc;
   alg_nn ALGN(n,kp,clk,inc);
   initial begin
      clk = 1'b0; n=3'd2; kp=8'd31;
   end
   always #50 clk = !clk;
   always #100 n[0] = !n[0];
endmodule
