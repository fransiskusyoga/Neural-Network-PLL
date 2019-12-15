`include "neuralnet.v"
`include "lpfn.v"
`include "lpfkp.v"
module alg_nn(n,kp,clk,inc);
   input [2:0] n;
   input [7:0] kp;
   input clk;
   output [7:0] inc;
   wire [7:0] avgn,avgkp;
   wire [7:0] k3,k4;
   wire eq3,eq4,n_less_4;
   wire kp_less_k3,kp_less_k4,selinc;
   lpfn lpn(n,clk,avgn);
   lpfkp lpkp(kp,clk,avgkp);
   neuralnet NN(avgn,avgkp,k3,k4);
   assign eq3 = (n==3);
   assign eq4 = (n==4);
   assign n_less_4 = (n<4);
   assign kp_less_k3 = (kp<k3);
   assign kp_less_k4 = (kp<k4);
   assign selinc = |{eq3&&kp_less_k4 , eq4&&kp_less_k3 , (!eq3&&!eq4)&&n_less_4};
   assign inc = selinc ? 8'h01: 8'hFF;
endmodule
