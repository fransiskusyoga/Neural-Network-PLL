clear all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Load Model, Dataset and Bit Lenght Detail
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%rng('default') % default random generator

load('LeNet5.mat')
load('datasets_norm.mat')
depth = size(w,2);
% remove connection with zero weight
% zero from previous layer
for i=depth-1:-1:1
    pow2 = w{i+1}.^2;
    non0 = (sum(pow2,2)~=0);
    w{i+1} = w{i+1}(non0,:);
    w{i} = w{i}(:,non0);
    b{i} = b{i}(non0);
end
% remove redundant inputs
pow2 = w{1}.^2;
non0 = (sum(pow2,2)~=0);
w{1} = w{1}(non0,:);
test_data_red = test_data_red(:,non0);
% zero to the next layer
for i=1:depth-1
    pow2 = w{i}.^2;
    non0 = (sum(pow2,1)~=0);
    w{i} = w{i}(:,non0);
    b{i+1} = b{i+1} + b{i}(~non0)*w{i+1}(~non0,:);
    b{i} = b{i}(non0);
    w{i+1} = w{i+1}(non0,:);
end

%Select bit lenght
%  calculate the decimal lenght
[lmin,lmax] = layer_min_max(w,b,test_data_red);
bit_dec_out = ceil(log2(max(abs([lmin;lmax]))))+1;
bit_dec_in  = zeros(size(bit_dec_out));
bit_dec_in(2:end) = bit_dec_out(1:end-1);
bit_dec_in(1) = ceil(log2(max(max(abs(train_data_red)))))+1;
%  the other parameter
bit_frac_in = [6 6 6]-bit_dec_in;
bit_frac_out = [10 10 10]-bit_dec_out;
bit_in = bit_dec_in+bit_frac_in;
bit_out = bit_dec_out+bit_frac_out;


%Serial communication setup
sCOM = serial('COM12');
set(sCOM,'BaudRate',115200);
fopen(sCOM);
byte_in = [hex2dec('23'),0,0,0,0,0,0,0,0,0];

%open logfile
fileID = fopen('acc_check_fpga.txt','w');

%initiate loop
correct_result = 0;
for k=1:size(test_data_red,1)
    fprintf("%d,",k);
    fprintf(fileID,"%d,",k);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Send The Input data
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %buffer setup
    byte_in(2) = hex2dec('09');
    
    %Chose 1 input data
    testLabel = test_labels(:,k);
    testData  = test_data_red(k,:)';
    testDataHex = round(testData*(2^bit_frac_in(1)));
    testDataHex = testDataHex+(testDataHex<0).*2^bit_in(1);
    %Send the data
    for i = 0:size(test_data_red,2)-1
        if (k>1)
            if (testDataHex(i+1)==testDataHex_prev(i+1)) 
                continue;
            end
        end
        byte_in(3) = uint8(floor(i/256));
        byte_in(4) = uint8(mod(i,256));
        byte_in(5) = uint8(testDataHex(i+1));
        for j = 1:5
            fwrite(sCOM,byte_in(j))
        end
        %fprintf("%d,%d,%d\n",byte_in(3),byte_in(4),byte_in(5));
    end
    %save to improve test speed
    testDataHex_prev = testDataHex;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Start Calculation
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %send command
    byte_in(2) = hex2dec('14');
    for j = 1:2
        fwrite(sCOM,byte_in(j))
    end
    %Check response
    [byte_out,count] = fread(sCOM,2);
    result = byte_out(1)*256+byte_out(2);
    if (result==(2.^16-1))
        fprintf("P1,");
        fprintf(fileID,"P1,");
    else
        fprintf("E1,");
        fprintf(fileID,"E1,");
    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Get the data back
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %buffer setup
    byte_in(2) = hex2dec('04');

    %initialize the output array
    result_fpga = zeros(10,1);
    for i = 0:9
        byte_in(3) = uint8(i/256);
        byte_in(4) = uint8(mod(i,256));
        for j = 1:4
            fwrite(sCOM,byte_in(j))
        end
        [byte_out,count] = fread(sCOM,2);
        result_fpga(i+1) = (byte_out(1)*256+byte_out(2));
    end
    %convert result from hex to floating point
    limit = 2.^(bit_out(end));
    result_fpga = result_fpga-limit*(result_fpga>=(limit/2));
    result_fpga = result_fpga./(2.^bit_frac_out(end));
    [~,I] = max(result_fpga);
    if ((I-1)==testLabel)
        correct_result = correct_result+1;
        fprintf("P2,%d\n",correct_result);
        fprintf(fileID,"P2,%d\n",correct_result);
    else
        fprintf("E2,%d\n",correct_result);
        fprintf(fileID,"E2,%d\n",correct_result);
    end
end

fclose(fileID)
fclose(sCOM)
delete(sCOM)
clear sCOM