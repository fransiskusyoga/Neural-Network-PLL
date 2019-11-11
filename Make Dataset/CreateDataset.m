clear all;
tic;
% Load All data
load('search_16-Aug-2018 17_42_12.mat','BestKpval','t_all','BestRMSs',...
    'BBPFD_delay','DCO_Noise','Ffree','Fref','Kdco','Ki','Kp','N', ...
    'NPT','Ref_Noise','Bmin','Bmax','denom','DCO_rand','Ref_rand',...
    'ShiftKpval');

% Run the simulation
Kpval = [t_all,BestKpval/denom];
sim('ADPLL_zz.slx',t_all);
% Detect rising and falling edge
Ref_edge = [Ref_sig(1:end-1)-Ref_sig(2:end);0];
Ref_riseedge = (Ref_edge==-1);
Ref_falledge = (Ref_edge==1);
% Take the output sample only on rising or falling edge
PFD_sample = BBPFD_sig(Ref_riseedge);
DLF_sample = DLF_sig(Ref_riseedge);

% Make interpolation of data
BestRMSsMap = interp1(1:size(BestRMSs,2), BestRMSs', ...
    linspace(0, size(BestRMSs,2), size(PFD_sample,1)),'next','extrap')';
BestKpvalMap = interp1(1:size(BestKpval,1), BestKpval, ...
    linspace(0, size(BestKpval,1), size(PFD_sample,1)),'next','extrap')';
ShiftKpvalMap = interp1(1:size(ShiftKpval,2), ShiftKpval', ...
    linspace(0, size(ShiftKpval,2), size(PFD_sample,1)),'next','extrap')';

% Find the relation
trainData = [];
trainLabel = ShiftKpval';
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
% save('dataset.mat','trainData','trainLabel');

% Plot the result
figure;
scrollplot([PFD_sample ShiftKpvalMap/10 BestKpvalMap/10 BestRMSsMap*1e11], 100);
legend('PFD','KpNoise/10','Kp/10','RMS*1e11');
% figure;
% scatter(trainData(:,2),trainData(:,1),25,abs(ShiftKpval),'filled');
% colorbar('eastoutside');
% plot([DLF_sample(1:200)*denom BestKpvalMap(1:200) BestRMSsMap(1:200)*1e12]);
% scrollplot([PFD_sample/2+0.5 BestRMSsMap(1:200)*1e11]], 200);
% plot([PFD_sample(1:200)/2+0.5 BestRMSsMap(1:200)*1e11]);
% figure;
% plot([DLF_sample(1:200) BestKpvalMap(1:200) ShiftKpvalMap(1:200)]);

xmax=64; %change di val into dependent val
ymax=12; %change di val into dependent val
color = ones(xmax*ymax,1);
for i = 1:ymax
    for j = 1:xmax
        color((i-1)*xmax+j)= sum(and(trainData(:,2)==j,trainData(:,1)==i));
    end
end
x = (1:xmax)'*ones(1,ymax);
y = ones(xmax,1)*(1:ymax);
x = x(:);
y = y(:);
Map = (color==0);
color(Map) =[];
x(Map) = [];
y(Map) = [];
figure;
scatter(x,y,25,color,'filled');
colorbar('eastoutside');


toc