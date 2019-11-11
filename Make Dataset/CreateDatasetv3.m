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
    sim('ADPLL_c7.slx',linspace(0,0.0003,330000));
    % Detect rising and falling edge
    Ref_edge = [zeros(130000,1);Ref_sig(end-200000:end-1)-Ref_sig(end-199999:end)];
    Ref_riseedge = (Ref_edge==-1);
    Ref_falledge = (Ref_edge==1);
    % Take the output sample only on rising or falling edge
    PFD_sample = BBPFD_sig(Ref_riseedge);
    Kp_sample = KP_sig(Ref_riseedge);
    % find avg rising edge and Kp mean
    PFD_edge = PFD_sample(1:end-1)-PFD_sample(2:end);
    PFD_riseedge = (PFD_edge==-2);
    avg_rise = sum(PFD_riseedge)/size(PFD_sample,1);
    avg_kp = mean(Kp_sample);
    trainData = [trainData; [avg_rise avg_kp]];
    
    fprintf('%d,',i);
end
fprintf('\n');
save('dataset.mat','trainData','trainLabel');

toc