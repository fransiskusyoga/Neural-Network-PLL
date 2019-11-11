project compileoutofdate
#project compileall

vsim work.unitbooth4_tb;
add wave -r /*
run 1000

#vsim work.multiply_tb
#add wave -radix decimal sim:/multiply_tb/*;
#add wave -radix decimal \
#{sim:/multiply_tb/M1/adders[0]/addval};
#add wave -radix decimal \
#{sim:/multiply_tb/M1/adders[1]/addval};
#add wave -radix decimal \
#{sim:/multiply_tb/M1/adders[2]/addval};
#add wave -radix decimal \
#{sim:/multiply_tb/M1/unitbooth[0]/pmul};
#add wave -radix decimal \
#{sim:/multiply_tb/M1/unitbooth[1]/pmul};
#add wave -radix decimal \
#{sim:/multiply_tb/M1/unitbooth[2]/pmul};
#add wave -radix decimal \
#{sim:/multiply_tb/M1/unitbooth[3]/pmul};
#run 1000