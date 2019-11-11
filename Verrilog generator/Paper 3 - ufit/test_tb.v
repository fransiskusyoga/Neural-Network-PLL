module test_tb();
   reg [9:0] in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12;
   wire [11:0] out1,out2,out3,out4,out5,out6,out7,out8,out9,out10;
   test_top TopModule(in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10);
   initial begin
      #50 in1=10'h0; in2=10'h0; in3=10'h0; in4=10'hC4; in5=10'h19; in6=10'h0; in7=10'h0; in8=10'h0; in9=10'h0; in10=10'h0; in11=10'h88; in12=10'h8B;
      #50 in1=10'h2A; in2=10'h19; in3=10'h0; in4=10'h0; in5=10'h2C; in6=10'h0; in7=10'h8B; in8=10'h0; in9=10'h0; in10=10'h0; in11=10'h82; in12=10'h0;
      #50 in1=10'h0; in2=10'h2C; in3=10'h70; in4=10'h0; in5=10'h0; in6=10'h0; in7=10'h0; in8=10'h0; in9=10'hE; in10=10'h0; in11=10'h0; in12=10'h22;
      #50 in1=10'h0; in2=10'h0; in3=10'h0; in4=10'hA5; in5=10'h0; in6=10'h0; in7=10'h0; in8=10'h0; in9=10'h0; in10=10'h0; in11=10'h30; in12=10'h63;
      #50 in1=10'h0; in2=10'hC; in3=10'h2F; in4=10'h0; in5=10'h0; in6=10'h0; in7=10'hA; in8=10'h0; in9=10'h0; in10=10'h0; in11=10'h0; in12=10'h0;
      #50 in1=10'h0; in2=10'h0; in3=10'h0; in4=10'h0; in5=10'h0; in6=10'h62; in7=10'h0; in8=10'h38; in9=10'h0; in10=10'h0; in11=10'h0; in12=10'h0;
      #50 in1=10'h0; in2=10'h56; in3=10'h4A; in4=10'h0; in5=10'h0; in6=10'h0; in7=10'h0; in8=10'h0; in9=10'h0; in10=10'h0; in11=10'h0; in12=10'h2E;
      #50 in1=10'h3C; in2=10'h3E; in3=10'h0; in4=10'h0; in5=10'h0; in6=10'h1A; in7=10'h0; in8=10'h17; in9=10'h0; in10=10'h0; in11=10'h0; in12=10'h0;
      #50 in1=10'h0; in2=10'h74; in3=10'h0; in4=10'h0; in5=10'h86; in6=10'h0; in7=10'h0; in8=10'h0; in9=10'h0; in10=10'h8; in11=10'h0; in12=10'h0;
      #50 in1=10'h0; in2=10'h0; in3=10'h0; in4=10'h0; in5=10'h0; in6=10'h7E; in7=10'h0; in8=10'h60; in9=10'h0; in10=10'h0; in11=10'h0; in12=10'h0;
      #50 in1=10'h0; in2=10'h0; in3=10'h0; in4=10'h8; in5=10'h0; in6=10'h0; in7=10'h0; in8=10'h0; in9=10'h0; in10=10'h7A; in11=10'h0; in12=10'h42;
      #50 in1=10'h0; in2=10'h88; in3=10'h42; in4=10'h0; in5=10'h0; in6=10'h0; in7=10'h0; in8=10'h0; in9=10'h0; in10=10'h0; in11=10'h0; in12=10'hAD;
      #50 in1=10'h2B; in2=10'hA; in3=10'h0; in4=10'h0; in5=10'hC; in6=10'h0; in7=10'h0; in8=10'h0; in9=10'h7F; in10=10'h0; in11=10'hD; in12=10'h0;
      #50 in1=10'h8; in2=10'h0; in3=10'h0; in4=10'h0; in5=10'h11; in6=10'h0; in7=10'h2B; in8=10'h0; in9=10'h0; in10=10'h0; in11=10'h43; in12=10'h0;
      #50 in1=10'h0; in2=10'h0; in3=10'h0; in4=10'h0; in5=10'h0; in6=10'h1; in7=10'h1; in8=10'hA1; in9=10'h0; in10=10'h0; in11=10'h0; in12=10'h0;
      #50 in1=10'h6C; in2=10'h19; in3=10'h3F; in4=10'h0; in5=10'h0; in6=10'h0; in7=10'h0; in8=10'h0; in9=10'h41; in10=10'h0; in11=10'hC; in12=10'h0;
      #50 in1=10'h0; in2=10'h4; in3=10'h0; in4=10'h0; in5=10'h60; in6=10'h0; in7=10'h0; in8=10'h0; in9=10'h0; in10=10'h35; in11=10'h0; in12=10'h3A;
      #50 in1=10'h0; in2=10'h0; in3=10'h0; in4=10'h0; in5=10'h0; in6=10'h0; in7=10'h59; in8=10'h2; in9=10'h0; in10=10'h22; in11=10'h0; in12=10'h0;
      #50 in1=10'h29; in2=10'h0; in3=10'h0; in4=10'h0; in5=10'h0; in6=10'h0; in7=10'h3F; in8=10'h0; in9=10'h0; in10=10'h0; in11=10'h4B; in12=10'h0;
      #50 in1=10'h4E; in2=10'h0; in3=10'h0; in4=10'h0; in5=10'h0; in6=10'h0; in7=10'hA8; in8=10'h0; in9=10'h0; in10=10'h0; in11=10'hA4; in12=10'h0;
      #50 in1=10'h0; in2=10'h7E; in3=10'h0; in4=10'h0; in5=10'h84; in6=10'h0; in7=10'h0; in8=10'h0; in9=10'h0; in10=10'h0; in11=10'h0; in12=10'h0;
      #50 in1=10'h49; in2=10'h34; in3=10'h14; in4=10'h0; in5=10'h0; in6=10'h35; in7=10'h0; in8=10'h22; in9=10'h0; in10=10'h8; in11=10'h0; in12=10'h0;
      #50 in1=10'h0; in2=10'h0; in3=10'h0; in4=10'h0; in5=10'h0; in6=10'h0; in7=10'h42; in8=10'h30; in9=10'h0; in10=10'h25; in11=10'h0; in12=10'h0;
      #50 in1=10'h0; in2=10'h7E; in3=10'h0; in4=10'h0; in5=10'hA0; in6=10'h0; in7=10'h27; in8=10'h0; in9=10'h0; in10=10'h0; in11=10'h0; in12=10'h0;
      #50 in1=10'h13; in2=10'hF; in3=10'h0; in4=10'h0; in5=10'h0; in6=10'h0; in7=10'h0; in8=10'h0; in9=10'h48; in10=10'h0; in11=10'h0; in12=10'h0;
      #50 in1=10'h0; in2=10'h21; in3=10'h7A; in4=10'h0; in5=10'h0; in6=10'h4; in7=10'h0; in8=10'h0; in9=10'h0; in10=10'h0; in11=10'h0; in12=10'h7C;
      #50 in1=10'h5C; in2=10'h0; in3=10'h0; in4=10'h0; in5=10'h0; in6=10'h0; in7=10'hA0; in8=10'h0; in9=10'h0; in10=10'h0; in11=10'hB2; in12=10'h0;
      #50 in1=10'h0; in2=10'h0; in3=10'h0; in4=10'hE5; in5=10'h11; in6=10'h0; in7=10'h4; in8=10'h0; in9=10'h0; in10=10'h0; in11=10'hA3; in12=10'h71;
      #50 in1=10'h26; in2=10'h0; in3=10'h0; in4=10'h0; in5=10'h0; in6=10'h0; in7=10'h0; in8=10'h0; in9=10'h76; in10=10'h0; in11=10'h19; in12=10'h0;
      #50 in1=10'h0; in2=10'h0; in3=10'h0; in4=10'hE4; in5=10'h13; in6=10'h0; in7=10'h0; in8=10'h0; in9=10'h0; in10=10'h0; in11=10'h6D; in12=10'h73;
   end
endmodule