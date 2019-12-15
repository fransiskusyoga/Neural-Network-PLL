module dlf(clk,in,Kp,out);
   input in,clk;
   input [7:0] Kp;
   output [15:0] out;
   reg [15:0] mem = 16'b0;
   wire [15:0] inc;
   wire [15:0] mul1;
   //convert (0)-(1) into (-1)-(1)
   assign inc = in ? 16'h0001: 16'hFFFF;
   //increase memory value
   always @(posedge clk) mem = mem + inc;
   //mul1 = Kp * outpfd (1 or -1)
   assign mul1 = in ? {8'h0,Kp} : {8'hFF,~Kp+8'b1} ;
   //output
   assign out = mem+mul1;
endmodule
