clear all;
tic;
% Load All data
load('selected_data.mat');

trainData = [];
trainLabel = [Datas(:,4),Datas(:,5)];
Ref_Seed = 0;
DCO_Seed = 1;
for i = 1:size(Datas,1)
    % take some simulation data
    Kdco = Datas(i,1);
    Ref_Noise = Datas(i,2);
    DCO_Noise = Datas(i,3);
    K3 = Datas(i,4);
    K4 = Datas(i,5);
    % Run the simulation
    sim('ADPLL_c8.slx',linspace(0,0.0004,440000));
    avg_rise =  mean(LPFn_sig(end-199999:end));
    avg_kp = mean(LPFkp_sig(end-199999:end));
    trainData = [trainData; [avg_rise avg_kp]];
    
    fprintf('%d,',i);
end
fprintf('\n');
save('dataset.mat','trainData','trainLabel');

toc