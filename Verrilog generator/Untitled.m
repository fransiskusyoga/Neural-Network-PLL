%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bit_in = [9 9];
bit_w = [10 10];%[12 10] % must be even number
bit_out = [17 8];%[17 8]
bit_frac_in = [8 8];
bit_frac_w = [2 9];%[4 5]
bit_frac_out = [8 8];%[8 3]
data_point = 1:40;
ndata_point = size(data_point,2);
load('validation_dataset.mat')
Kps = ones(ndata_point,1)*(0:999)/1000;
Kps = Kps';
test_data = a_rise_p10(:,data_point);
test_data = [Kps(:),test_data(:)];
[LL , Idx] = min(a_jitter_p10(:,data_point));
Idx_size = size(Idx,2);
test_label = [];
for j=1:Idx_size
    test_label = [test_label,[ones(Idx(j)-1,1);-1*ones(1001-Idx(j),1)]];
end
test_label = test_label(:);

opsi=1;
%load('result8_withzero.mat')
load('result1_v5_red.mat')
%load('result1_v9_red3.mat')
for i=1:size(n_layers,2)-1
    nw{i} = zeros(n_layers(i), n_layers(i+1));
    nb{i} = zeros(1,n_layers(i+1));
end
% weight variable
for i=1:(size(n_layers,2)-1)
    for j=1:n_layers(i)
        for k=1:n_layers(i+1)
            % convert weight into fractional point
            weight = round(w{i}(j,k)*(2^bit_frac_w(i)));
            nw{i}(j,k) =  weight./(2^(bit_frac_w(i)));
        end
    end
    for k=1:n_layers(i+1)
        % convert bias into fractional point
        bias = round(b{i}(k)*(2^bit_frac_out(i)));
        nb{i}(k) =  bias./(2^(bit_frac_out(i)));
    end
end

if(opsi==0)
    LayerVal = forwprop(w,b,test_data);
    LayerValN = forwprop_frac(nw,nb,test_data,bit_frac_in,bit_frac_out);
    predict = sign(LayerVal{3});
    AA0 = sum(predict==test_label)/size(test_data,1);
    predict = sign(LayerValN{3});
    AA1 = sum(predict==test_label)/size(test_data,1);
else
    LayerVal = forwprop(w,b,test_data(:,1));
    LayerValN = forwprop_frac(nw,nb,test_data,bit_frac_in,bit_frac_out);
    predict = sign(LayerVal{3}-test_data(:,2));
    AA0 = sum(predict==test_label)/size(test_data,1);
    predict = sign(LayerValN{3}-test_data(:,2));
    AA1 = sum(predict==test_label)/size(test_data,1);
end
AA2 = sum(sum((LayerVal{3} - LayerValN{3}).^2))/size(test_data,1);
[AA0*100,AA1*100,AA2]

test_label = reshape(test_label,[1000 ndata_point]);
predict = reshape(predict,[1000 ndata_point]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load('validation_dataset.mat')
% subplot(1,2,1); 
% hold on
% [LL , I] = min(a_jitter_p300);
% plot(I/1000,a_rise_p300(I+(0:39)*1000),'-o')
% [LL , I] = min(a_jitter_p100);
% plot(I/1000,a_rise_p100(I+(0:39)*1000),'-*')
% [LL , I] = min(a_jitter);
% plot(I/1000,a_rise(I+(0:39)*1000),'LineWidth',2)
% [LL , I] = min(a_jitter_m50);
% plot(I/1000,a_rise_m50(I+(0:39)*1000),'--*')
% [LL , I] = min(a_jitter_m75);
% plot(I/1000,a_rise_m75(I+(0:39)*1000),'--o')
% hold off
% grid on
% ylim([0.245 0.295])
% xlim([0.01 0.91])
% ylabel('rising edge occurance')
% xlabel('proportional gain')
% title('(a)')
% legend({'x4','x2','x1','/2','/4'},'Location','northeast')
% 
% subplot(1,2,2); 
% hold on
% [LL , I] = min(a_jitter_ki_p300);
% plot(I/1000,a_rise_ki_p300(I+(0:39)*1000),'-o')
% [LL , I] = min(a_jitter_ki_p100);
% plot(I/1000,a_rise_ki_p100(I+(0:39)*1000),'-*')
% [LL , I] = min(a_jitter);
% plot(I/1000,a_rise(I+(0:39)*1000),'LineWidth',2)
% [LL , I] = min(a_jitter_ki_m50);
% plot(I/1000,a_rise_ki_m50(I+(0:39)*1000),'--*')
% [LL , I] = min(a_jitter_ki_m75);
% plot(I/1000,a_rise_ki_m75(I+(0:39)*1000),'--o')
% hold off
% grid on
% ylim([0.245 0.295])
% xlim([0.01 0.91])
% ylabel('rising edge occurance')
% xlabel('proportional gain')
% title('(b)')
% legend({'x4','x2','x1','/2','/4'},'Location','northeast')