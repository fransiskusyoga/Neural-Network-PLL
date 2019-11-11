clear all;
bitln = 8;
maxones = 4;
allbit = 0:2^bitln-1;
bi_allbit = de2bi(allbit);
ones_allbit = sum(bi_allbit,2);
n = sum(ones_allbit<=maxones)
selectedbit = allbit(ones_allbit<=maxones);
% trainLabel = sum(multip,2);
% save('autocor_dataset.mat','trainData','trainLabel');