`include "alg_autocor.v"
module alg_autocor_tb();
   reg [3:0] nrise;
   wire [7:0] inc;
   alg_autocor algAC(nrise,inc);
   initial begin
      nrise = 4'b0;
      #50 nrise = 4'd1;
      #50 nrise = 4'd2;
      #50 nrise = 4'd3;
      #50 nrise = 4'd4;
      #50 nrise = 4'd5;
      #50 nrise = 4'd6;
      #50 nrise = 4'd7;
      #50 nrise = 4'd6;
      #50 nrise = 4'd5;
      #50 nrise = 4'd4;
      #50 nrise = 4'd3;
      #50 nrise = 4'd2;
      #50 nrise = 4'd1;
      #50 nrise = 4'd0;
   end
endmodule
