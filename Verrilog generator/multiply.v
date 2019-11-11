`include "unitbooth4.v"
module multiply #(
  parameter N1,
  parameter N2)(
  input [N1-1:0] in1,
  input [N2-1:0] in2,
  output [N1+N2-2:0] ou);
  
  
  
  genvar i,j;
  
  generate
    for(i=0; i<N2/2; i=i+1)
    begin : unitbooth
      wire signed [N1-1:0] pmul;
      if (i==0) begin
        unitbooth4 #(N1) UB4(
              .in(in1),.ctr({in2[1:0],1'b0}),.ou(pmul));
      end
      else begin
        unitbooth4 #(N1) UB4(
              .in(in1),.ctr(in2[i*2+1:i*2-1]),.ou(pmul));
      end
    end
  endgenerate
  
  generate
    for (i=0; i<N2/2-1; i=i+1)
    begin : adders
      wire signed [N1:0] addval;
      if (i==0) begin
        assign addval = { unitbooth[1].pmul[N1-1] , unitbooth[1].pmul } + 
                { {3{unitbooth[0].pmul[N1-1]}}, unitbooth[0].pmul[N1-1:2] };
        assign ou[1:0] = unitbooth[0].pmul[1:0];
      end
      else begin
        assign addval = {unitbooth[i+1].pmul[N1-1] , unitbooth[i+1].pmul } +
                { {3{adders[i-1].addval[N1-1]}} , adders[i-1].addval[N1-1:2] };
        assign ou[2*i+1:2*i] = adders[i-1].addval[1:0];
      end
    end
  endgenerate
  
  assign ou[N1+N2-2 -: N1+1] = adders[N2/2-2].addval;
endmodule
  
