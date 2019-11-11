%clear all;
tic;
% Load All data
load('search_0_Kdco-1.0e6_Nref-1e-19_Ndco-1e12.mat','BestKpval','BestRMSs',...
    'BBPFD_delay','DCO_Noise','Ffree','Fref','Kdco','Ki','Kp','N', ...
    'NPT','Ref_Noise','Bmin','Bmax','denom','ShiftKpval','n_itr', ...
    't_max','dt','t_chunk','Ref_Seed','DCO_Seed');
t_all = (0:dt:t_max)';
t_all(end) = [];

%BestRMSsMaps =[];
%BestKpvalMaps = [];
%ShiftKpvalMaps = [];
%PFD_samples = [];
trainData = [];
trainLabel = ShiftKpval';
trainLabel = trainLabel(:);
Ref_Seed = Ref_Seed-n_itr;
DCO_Seed = DCO_Seed-n_itr;
for h = 1:n_itr
    % Run the simulation
    Kpval = [t_all,BestKpval(h,:)'/denom];
    Ref_Seed = Ref_Seed+1;
    DCO_Seed = DCO_Seed+1;
    sim('ADPLL_c4.slx',t_all);
    % Detect rising and falling edge
    Ref_edge = [0;Ref_sig(1:end-1)-Ref_sig(2:end)];
    Ref_riseedge = (Ref_edge==-1);
    Ref_falledge = (Ref_edge==1);
    % Take the output sample only on rising or falling edge
    PFD_sample = BBPFD_sig(Ref_riseedge);
    DLF_sample = DLF_sig(Ref_riseedge);
    % Make interpolation of data
    BestRMSsMap = interp1(1:size(BestRMSs,2), BestRMSs(h,:)', ...
        linspace(0, size(BestRMSs,2), size(PFD_sample,1)),'next','extrap')';
    BestKpvalMap = interp1(1:size(BestKpval,2), BestKpval(h,:), ...
        linspace(0, size(BestKpval,2), size(PFD_sample,1)),'next','extrap')';
    ShiftKpvalMap = interp1(1:size(ShiftKpval,2), ShiftKpval(h,:)', ...
        linspace(0, size(ShiftKpval,2), size(PFD_sample,1)),'next','extrap')';
    %BestRMSsMaps =[BestRMSsMaps; BestRMSsMap];
    %BestKpvalMaps = [BestKpvalMaps; BestKpvalMap];
    %ShiftKpvalMaps = [ShiftKpvalMaps; ShiftKpvalMap];
    %PFD_samples = [PFD_samples; PFD_sample];
    % Find the relation
    n = size(BestRMSs,2);
    n_spl =  size(PFD_sample,1);
    for i=1:n
        pos1 = round((i-1)/n*n_spl) + 1;
        pos2 = round(i/n*n_spl);
        if i==n
            pos2 = n_spl-1;
        end
        Kp = mode(BestKpvalMap(pos1:pos2));
        count = 0;
        for j = pos1:pos2
            % detect rising edge
            if PFD_sample(j)-PFD_sample(j+1)==-2
                count = count +1;
            end
        end
        trainData = [trainData; [count Kp]];
    end
    
    fprintf('%d,',h);
end
fprintf('\n');
%save('dataset.mat','trainData','trainLabel');

% Plot the result
% Count the
xmax=64; %change di val into dependent val
ymax=12; %change di val into dependent val
occur = zeros(xmax*ymax,1);
ShiftHeat = zeros(xmax*ymax,1);
RMSHeat = zeros(xmax*ymax,1);
temp1 = ShiftKpval(:);
temp2 = BestRMSs(:);
for i = 1:ymax
    for j = 1:xmax
        Map = and(trainData(:,2)==j,trainData(:,1)==i);
        occur((i-1)*xmax+j)= sum(Map);
        ShiftHeat((i-1)*xmax+j)= mean(temp1(Map));
        RMSHeat((i-1)*xmax+j)= mean(temp2(Map));
    end
end
% Plot mean RMS_TIMEs
x = (1:xmax)'*ones(1,ymax);
y = ones(xmax,1)*(1:ymax);
x = x(:);
y = y(:);
Map = isnan(RMSHeat);
RMSHeat(Map) =[];
x(Map) = [];
y(Map) = [];
figure;
scatter(x,y,25,RMSHeat,'filled');
colorbar('eastoutside');
% Plot mean shift
x = (1:xmax)'*ones(1,ymax);
y = ones(xmax,1)*(1:ymax);
x = x(:);
y = y(:);
Map = isnan(ShiftHeat);
ShiftHeat(Map) =[];
x(Map) = [];
y(Map) = [];
figure;
scatter(x,y,25,ShiftHeat,'filled');
colorbar('eastoutside');
% Plot occurance
x = (1:xmax)'*ones(1,ymax);
y = ones(xmax,1)*(1:ymax);
x = x(:);
y = y(:);
Map = (occur==0);
occur(Map) =[];
x(Map) = [];
y(Map) = [];
figure;
scatter(x,y,25,occur,'filled');
colorbar('eastoutside');
% figure;
% scrollplot([PFD_samples ShiftKpvalMaps/10 BestKpvalMaps/10 BestRMSsMaps*1e11], 100);
% legend('PFD','KpNoise/10','Kp/10','RMS*1e11');

% figure;
% scatter(trainData(:,2),trainData(:,1),25,abs(trainLabel),'filled');
% colorbar('eastoutside');
% scrollplot([PFD_sample/2+0.5 BestRMSsMap(1:200)*1e11]], 200);
% plot([PFD_sample(1:200)/2+0.5 BestRMSsMap(1:200)*1e11]);
% plot([DLF_sample(1:200) BestKpvalMap(1:200) BestRMSsMap(1:200)*1e12]);
% figure;
% plot([DLF_sample(1:200) BestKpvalMap(1:200) ShiftKpvalMap(1:200)]);
toc