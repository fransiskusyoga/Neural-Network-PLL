module unitbooth4_tb();
  reg [7:0] inp;
  reg [2:0] ctrl;
  wire [7:0] ou;
  
  unitbooth4 #(.N(8))UB4_0(inp,ctrl,ou);
  
  initial begin
    inp = 8'd 37; ctrl = 3'h0;
    #100 ctrl = 3'h1;
    #100 ctrl = 3'h2;
    #100 ctrl = 3'h3;
    #100 ctrl = 3'h4;
    #100 ctrl = 3'h5;
    #100 ctrl = 3'h6;
    #100 ctrl = 3'h7;
  end
endmodule