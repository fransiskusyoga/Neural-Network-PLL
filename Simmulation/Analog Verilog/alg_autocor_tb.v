`include "alg_autocor.v"
module alg_autocor_tb();
   reg [2:0] nrise;
   wire [7:0] inc;
   alg_autocor algAC(nrise,inc);
   initial begin
      nrise = 3'b0;
      #50 nrise = 3'd1;
      #50 nrise = 3'd2;
      #50 nrise = 3'd3;
      #50 nrise = 3'd4;
      #50 nrise = 3'd5;
      #50 nrise = 3'd6;
      #50 nrise = 3'd7;
      #50 nrise = 3'd6;
      #50 nrise = 3'd5;
      #50 nrise = 3'd4;
      #50 nrise = 3'd3;
      #50 nrise = 3'd2;
      #50 nrise = 3'd1;
      #50 nrise = 3'd0;
   end
endmodule
