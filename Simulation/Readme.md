## Simulation Folder
This folder contains all fiel to do simmulation

### Folders and Files
- Matlab
  Matlab with simulink
  - ADPLL_base.slx: Model of full analog digital phase-locked loop. Use ADPLL_simulink.m to run this
  - ADPLL_autocor.slx: Model of full analog digital pahse locked loop with autocorrelation
  - ADPLL_pseudonn.slx: Model of full analog digital pahse locked loop with pseudo neural network
  - ADPLL_simulink.m: The companion scrip of ADPLL_model.slx. Please run this conde if you wish to simulalte the ADPLL_model.slx
  matlab with full script
  - ADPLL_script_base.m
  - ADPLL_script_autocor.m
  - ADPLL_script_nn.m
  neural network file
  - nnmodel_v3.mat, nnmodel_v5_red.mat, nnmodel_v9_red3.mat: trained model
  - actiFunc.m, forwprob.m: nn functions   