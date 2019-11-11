clear all; 
tic
% Load Dataset
% Ki = 0.01
%dataset1: 0.01ps-100ps
%dataset2: 0.1ps-10ps
%dataset3: 0.01ps-10ps
%dataset4: 0.1ps-100ps
%dataset5: all
%dataset6: all but the controll only
% Ki = 0
%dataset5_0: all
% the optimal point
%dataset7_raw: without filtering process
%dataset7: with smoothing function
load('dataset7_raw.mat');
% Preproces data

% op_kp = op_kp/1000;
% testData = op_kp;
% testLabel = op_rise;
% trainLabel = testLabel(1:335,:);
% trainData = testData(1:335,:);

testLabel = [];
testData = [];
op_kp = op_kp/1000;
op_kp = [op_kp(181:260,:);op_kp(181:260,:);op_kp(181:260,:);op_kp];
op_rise = [op_rise(181:260,:);op_rise(181:260,:);op_rise(181:260,:);op_rise];
for i = 1:size(op_kp)
    x = [op_kp(i)*ones(1,21); linspace(op_rise(i)+0.1,op_rise(i)-0.1,21)];
    testData = [testData; x'];
    testLabel = [testLabel; [ones(1,10),-ones(1,11)]'];
end
trainLabel = testLabel(1:575*21,:);
trainData = testData(1:575*21,:);

% testLabel = trainLabel;%-log(trainData(:,2)*16e-12*10);
% testData = trainData;%
% A1 = (testData(:,1)>0.2) & (testData(:,1)<0.4);
% trainLabel = testLabel(A1,:);
% trainData = trainData(A1,:);

%take some data from dataset
n_trainData = size(trainData,1);
n_input = size(trainData,2);
n_output = size(trainLabel,2);

% Neural Net Hyper parameter
n_layers = [n_input 10 n_output];
depth = size(n_layers,2)-1; % N of layer expt inp layer
MaxCycle = 10000;               % Maximum number of cycle
lambda = 0.0;               % regularization
learnRate = 0.001;           % learning rate value
batchSize = 30;              % Number of dataset for each calc 
bias1 = 0.9;                % for first momentum
bias2 = 0.999;                % for second momentum

% fractional variable
bit_ln = 16;
bit_frac = 10;
% shift 2 variable
max_dist = 8;

% batchSize must be <= n_trainData
if batchSize>n_trainData
    batchSize=n_trainData;
end

%comment1
opcost = 1;
for r = 1:1
    
% Initialize the weight and bias value
for i=1:depth
    w{i} = initWeights(n_layers(i), n_layers(i+1));
    b{i} = rand(1,n_layers(i+1));
    %if i == depth
    %    b{i} = rand(1,n_layers(i+1));
    %end
    %momentum parameter
    %first momentum
    fmw{i} = zeros(n_layers(i), n_layers(i+1));
    fmb{i} = zeros(1,n_layers(i+1));
    %second memomentum
    smw{i} = zeros(n_layers(i), n_layers(i+1));
    smb{i} = zeros(1,n_layers(i+1));
end

f = waitbar(0,'Please wait...');
EpochPerCycle = ceil(n_trainData/batchSize);
costs = zeros(1,MaxCycle);
randIdx = randperm(n_trainData,batchSize);
for i = 1:MaxCycle

    layersVal = forwprop(w,b,trainData(randIdx,:));
    % Bacward Propagation
    %[w,b,cost,fmw,fmb] = backprop(layersVal, ...
    %    trainLabel(randIdx(strIdx:endIdx),:),w,b,lambda,learnRate);
    [w,b,cost,fmw,fmb] = backprop_sgd(layersVal, ...
        trainLabel(randIdx,:),...
        w,b,fmw,fmb,bias1,lambda,learnRate);
    %[w,b,cost,fmw,fmb,smw,smb] = backprop_adam(layersVal, ...
    %    trainLabel(randIdx(strIdx:endIdx),:),w,b,...
    %    fmw,fmb,smw,smb,bias1,bias2,i,lambda,learnRate);
    % Save cost value
    costs(i) = cost;
    
    layersVal = forwprop(w,b,trainData);
    prob = abs(layersVal{end}-trainLabel);
    prob = cumsum(prob)/sum(prob);
    randIdx = sum(prob<((1:n_trainData)/n_trainData))+1;
    randIdx = randIdx(randperm(n_trainData,batchSize));
    waitbar(i/MaxCycle,f,sprintf('Loading | r:%d | i:%d',r,i))
end
delete(f)

%comment 2
% change bit representation
% for k=1:depth
%     w{k} = map_2shft(w{k},max_dist);
%     b{k} = map_2shft(b{k},max_dist);
% end
layersVal = forwprop(w,b,trainData);
cost = rms(rms(layersVal{end}-trainLabel));
% cost = -sum(sum(sign(layersVal{end})==trainLabel))/n_trainData;
if cost<opcost
    opcost = cost;
    tw = w;
    tb = b;
    fprintf('catch!!! | ');
end
fprintf('i=%d , cost = %f\n',r,cost);
end
w = tw;
b = tb;


layersVal = forwprop(w,b,testData);
A1 = layersVal{end};
A2 = A1-testLabel;
A2 = [A2,A2./testLabel,A1,testLabel];
%all plot
plot(costs);
mean(costs(end-99:end))
% sfigure;
% points = 400*(0:999)+250;
% plot(trainData(points,1),[trainLabel(points), A1(points)])
%plot(op_kp,[op_rise, A1])

figure;
scatter(testData(:,1),testData(:,2),25,sign(A1),'filled');
colorbar('eastoutside');
figure;
scatter(testData(:,1),testData(:,2),25,A2(:,4),'filled');
colorbar('eastoutside');
% figure;
% scatter(testData(:,1),testData(:,2),25,A2(:,1),'filled');
% colorbar('eastoutside');

toc