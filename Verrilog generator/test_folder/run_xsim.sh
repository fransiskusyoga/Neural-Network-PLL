# --------------------------------------------------------------------------------
# This file contains the Vivado compilation and simulation script.
# --------------------------------------------------------------------------------

## Compilation + simulation.
## Arg $1 is NB_OF_CORES : 1 to N;

xvlog lenet5_layer_1.v
xvlog lenet5_layer_2.v
xvlog lenet5_layer_3.v
xvlog lenet5_tb.v
xvlog lenet5_top.v
xvlog negate.v
xvlog actifunc.v
xvlog lenet_io.v
xvlog lenet_io_tb.v
xvlog uart_rx.v
xvlog uart_tx.v

# Elaborations
# -L SIMPRIM_VER -L unisims_ver -L xilinxcorelib_ver
xelab -L xpm -s lenet_io_sim --relax -debug typical work.lenet_io_tb

# Simulation
echo "log_wave -recursive *" > xsim.tcl
echo "run $1" >> xsim.tcl
echo "quit" >> xsim.tcl
xsim lenet_io_sim -R -wdb lenet_io_sim.wdb -t xsim.tcl

./clean_folder.sh
xsim lenet_io_sim.wdb -g
