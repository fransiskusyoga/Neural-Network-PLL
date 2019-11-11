module test_tb();
   reg [5:0] in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12;
   wire [7:0] out1,out2,out3,out4,out5,out6,out7,out8,out9,out10;
   test_top TopModule(in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10);
   initial begin
      #50 in1=6'h0; in2=6'h0; in3=6'h0; in4=6'hC; in5=6'h2; in6=6'h0; in7=6'h0; in8=6'h0; in9=6'h0; in10=6'h0; in11=6'h9; in12=6'h9;
      #50 in1=6'h3; in2=6'h2; in3=6'h0; in4=6'h0; in5=6'h3; in6=6'h0; in7=6'h9; in8=6'h0; in9=6'h0; in10=6'h0; in11=6'h8; in12=6'h0;
      #50 in1=6'h0; in2=6'h3; in3=6'h7; in4=6'h0; in5=6'h0; in6=6'h0; in7=6'h0; in8=6'h0; in9=6'h1; in10=6'h0; in11=6'h0; in12=6'h2;
      #50 in1=6'h0; in2=6'h0; in3=6'h0; in4=6'hA; in5=6'h0; in6=6'h0; in7=6'h0; in8=6'h0; in9=6'h0; in10=6'h0; in11=6'h3; in12=6'h6;
      #50 in1=6'h0; in2=6'h1; in3=6'h3; in4=6'h0; in5=6'h0; in6=6'h0; in7=6'h1; in8=6'h0; in9=6'h0; in10=6'h0; in11=6'h0; in12=6'h0;
      #50 in1=6'h0; in2=6'h0; in3=6'h0; in4=6'h0; in5=6'h0; in6=6'h6; in7=6'h0; in8=6'h4; in9=6'h0; in10=6'h0; in11=6'h0; in12=6'h0;
      #50 in1=6'h0; in2=6'h5; in3=6'h5; in4=6'h0; in5=6'h0; in6=6'h0; in7=6'h0; in8=6'h0; in9=6'h0; in10=6'h0; in11=6'h0; in12=6'h3;
      #50 in1=6'h4; in2=6'h4; in3=6'h0; in4=6'h0; in5=6'h0; in6=6'h2; in7=6'h0; in8=6'h1; in9=6'h0; in10=6'h0; in11=6'h0; in12=6'h0;
      #50 in1=6'h0; in2=6'h7; in3=6'h0; in4=6'h0; in5=6'h8; in6=6'h0; in7=6'h0; in8=6'h0; in9=6'h0; in10=6'h0; in11=6'h0; in12=6'h0;
      #50 in1=6'h0; in2=6'h0; in3=6'h0; in4=6'h0; in5=6'h0; in6=6'h8; in7=6'h0; in8=6'h6; in9=6'h0; in10=6'h0; in11=6'h0; in12=6'h0;
      #50 in1=6'h0; in2=6'h0; in3=6'h0; in4=6'h0; in5=6'h0; in6=6'h0; in7=6'h0; in8=6'h0; in9=6'h0; in10=6'h8; in11=6'h0; in12=6'h4;
      #50 in1=6'h0; in2=6'h8; in3=6'h4; in4=6'h0; in5=6'h0; in6=6'h0; in7=6'h0; in8=6'h0; in9=6'h0; in10=6'h0; in11=6'h0; in12=6'hB;
      #50 in1=6'h3; in2=6'h1; in3=6'h0; in4=6'h0; in5=6'h1; in6=6'h0; in7=6'h0; in8=6'h0; in9=6'h8; in10=6'h0; in11=6'h1; in12=6'h0;
      #50 in1=6'h0; in2=6'h0; in3=6'h0; in4=6'h0; in5=6'h1; in6=6'h0; in7=6'h3; in8=6'h0; in9=6'h0; in10=6'h0; in11=6'h4; in12=6'h0;
      #50 in1=6'h0; in2=6'h0; in3=6'h0; in4=6'h0; in5=6'h0; in6=6'h0; in7=6'h0; in8=6'hA; in9=6'h0; in10=6'h0; in11=6'h0; in12=6'h0;
      #50 in1=6'h7; in2=6'h2; in3=6'h4; in4=6'h0; in5=6'h0; in6=6'h0; in7=6'h0; in8=6'h0; in9=6'h4; in10=6'h0; in11=6'h1; in12=6'h0;
      #50 in1=6'h0; in2=6'h0; in3=6'h0; in4=6'h0; in5=6'h6; in6=6'h0; in7=6'h0; in8=6'h0; in9=6'h0; in10=6'h3; in11=6'h0; in12=6'h4;
      #50 in1=6'h0; in2=6'h0; in3=6'h0; in4=6'h0; in5=6'h0; in6=6'h0; in7=6'h6; in8=6'h0; in9=6'h0; in10=6'h2; in11=6'h0; in12=6'h0;
      #50 in1=6'h3; in2=6'h0; in3=6'h0; in4=6'h0; in5=6'h0; in6=6'h0; in7=6'h4; in8=6'h0; in9=6'h0; in10=6'h0; in11=6'h5; in12=6'h0;
      #50 in1=6'h5; in2=6'h0; in3=6'h0; in4=6'h0; in5=6'h0; in6=6'h0; in7=6'hA; in8=6'h0; in9=6'h0; in10=6'h0; in11=6'hA; in12=6'h0;
      #50 in1=6'h0; in2=6'h8; in3=6'h0; in4=6'h0; in5=6'h8; in6=6'h0; in7=6'h0; in8=6'h0; in9=6'h0; in10=6'h0; in11=6'h0; in12=6'h0;
      #50 in1=6'h5; in2=6'h3; in3=6'h1; in4=6'h0; in5=6'h0; in6=6'h3; in7=6'h0; in8=6'h2; in9=6'h0; in10=6'h0; in11=6'h0; in12=6'h0;
      #50 in1=6'h0; in2=6'h0; in3=6'h0; in4=6'h0; in5=6'h0; in6=6'h0; in7=6'h4; in8=6'h3; in9=6'h0; in10=6'h2; in11=6'h0; in12=6'h0;
      #50 in1=6'h0; in2=6'h8; in3=6'h0; in4=6'h0; in5=6'hA; in6=6'h0; in7=6'h2; in8=6'h0; in9=6'h0; in10=6'h0; in11=6'h0; in12=6'h0;
      #50 in1=6'h1; in2=6'h1; in3=6'h0; in4=6'h0; in5=6'h0; in6=6'h0; in7=6'h0; in8=6'h0; in9=6'h5; in10=6'h0; in11=6'h0; in12=6'h0;
      #50 in1=6'h0; in2=6'h2; in3=6'h8; in4=6'h0; in5=6'h0; in6=6'h0; in7=6'h0; in8=6'h0; in9=6'h0; in10=6'h0; in11=6'h0; in12=6'h8;
      #50 in1=6'h6; in2=6'h0; in3=6'h0; in4=6'h0; in5=6'h0; in6=6'h0; in7=6'hA; in8=6'h0; in9=6'h0; in10=6'h0; in11=6'hB; in12=6'h0;
      #50 in1=6'h0; in2=6'h0; in3=6'h0; in4=6'hE; in5=6'h1; in6=6'h0; in7=6'h0; in8=6'h0; in9=6'h0; in10=6'h0; in11=6'hA; in12=6'h7;
      #50 in1=6'h2; in2=6'h0; in3=6'h0; in4=6'h0; in5=6'h0; in6=6'h0; in7=6'h0; in8=6'h0; in9=6'h7; in10=6'h0; in11=6'h2; in12=6'h0;
      #50 in1=6'h0; in2=6'h0; in3=6'h0; in4=6'hE; in5=6'h1; in6=6'h0; in7=6'h0; in8=6'h0; in9=6'h0; in10=6'h0; in11=6'h7; in12=6'h7;
   end
endmodule