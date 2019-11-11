clear all;
bitln = 16;
n_trainData = 65536;
trainData = randperm(2^bitln,n_trainData)'-1;
bi_trnDat = de2bi(trainData)*2-1;
multip = bi_trnDat(:,1:bitln-1).*bi_trnDat(:,2:bitln);
trainLabel = sum(multip,2);
% save('autocor_dataset.mat','trainData','trainLabel');