clear all;

% setting variable
toplevelname = 'lenet5';

% tab list
tab1 = "   ";
tab2 = "      ";
tab3 = "         ";
tab4 = "            ";
tab5 = "               ";
tab6 = "                  ";

rng('default') % default random generator

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

%get size data after zero removal
n_layers = [size(w{1},1)];
for i=1:depth
    n_layers = [n_layers,size(w{i},2)];
end

for i=1:depth
    nw{i} = zeros(n_layers(i), n_layers(i+1));
    nb{i} = zeros(1,n_layers(i+1));
end

%calculate the decimal lenght
[lmin,lmax] = layer_min_max(w,b,test_data_red);
bit_dec_out = ceil(log2(max(abs([lmin;lmax]))))+1;
bit_dec_in  = zeros(size(bit_dec_out));
bit_dec_in(2:end) = bit_dec_out(1:end-1);
bit_dec_in(1) = ceil(log2(max(max(abs(train_data_red)))))+1;
%the other parameter
bit_frac_in = [6 6 6]-bit_dec_in;
bit_frac_out = [10 10 10]-bit_dec_out;
bit_in = bit_dec_in+bit_frac_in;
bit_out = bit_dec_out+bit_frac_out;

% conversion function
[val_list,bin_list] = makelist(9);
divider_max = 20;
with_include = false;
full_combinational = false;

%% Create all layer
for i=1:depth
    % Ceate and open file
    module_name = strcat(toplevelname,'_layer_',int2str(i));
    fID = fopen(strcat(module_name,'.v'),'w');
   
    % Include activation function
    if (with_include)
        fprintf(fID,'`include "negate.v"\n');
    end
    
    % Module header
    if (full_combinational)
        tempstr = strcat("module ",module_name,'(in1');
    else
        tempstr = strcat("module ",module_name,'(clk,in1');
    end
    % all input
    for j=2:n_layers(i)
        tempstr = strcat(tempstr,',in',int2str(j));
    end
    % all output
    for j=1:n_layers(i+1)
         tempstr = strcat(tempstr,',out',int2str(j));
    end
    tempstr = strcat(tempstr,');\n');
    fprintf(fID,tempstr);
    
    % Parameter & variable declaration    
    % clock if not full combinationa
    if (~full_combinational)
        fprintf(fID,tab1);
        fprintf(fID,"input clk;\n");
    end
    % input parameter
    fprintf(fID,tab1);
    tempstr = strcat('input signed [',int2str(bit_in(i)-1),':0] in1');
    for j=2:n_layers(i)
        tempstr = strcat(tempstr,',in',int2str(j));
    end
    tempstr = strcat(tempstr,';\n');
    fprintf(fID,tempstr);
    % ouput parameter 
    fprintf(fID,tab1);
    if (full_combinational)
        tempstr = strcat('output signed [',int2str(bit_out(i)-1),':0] out1');
    else 
        tempstr = strcat('output reg signed [',int2str(bit_out(i)-1),':0] out1');
    end
    for j=2:n_layers(i+1)
        tempstr = strcat(tempstr,',out',int2str(j));
    end
    tempstr = strcat(tempstr,';\n');
    fprintf(fID,tempstr);
    % module variable : negation of input
    fprintf(fID,tab1);
    tempstr = strcat('wire signed [',int2str(bit_in(i)-1),':0] neg1');
    for j=2:n_layers(i)
        tempstr = strcat(tempstr,',neg',int2str(j));
    end
    tempstr = strcat(tempstr,';\n');
    fprintf(fID,tempstr);
    
    % bias variable
    fprintf(fID,strcat("\n",tab1,"//Bias value\n"));
    for k=1:n_layers(i+1)
        fprintf(fID,tab1);
        tempstr = strcat('wire signed [',int2str(bit_out(i)-1),...
            ':0] b',int2str(k)," = $signed(");
        % convert weight into fractional point
        bias = round(b{i}(k)*(2^(bit_frac_out(i))));
        nb{i}(k) = bias./(2^(bit_frac_out(i)));
        bias = bias+(bias<0)*2^(bit_out(i));
        tempstr = strcat(tempstr,int2str(bit_out(i)),"'h",...
            dec2hex(bias),');\n');
        fprintf(fID,tempstr);
    end

    % Negation of input
    fprintf(fID,strcat("\n",tab1,"//Negation modules\n"));
    for j=1:n_layers(i)
        tempstr = strcat(tab1,'negate #(',int2str(bit_in(i)),') N');
        tempstr = strcat(tempstr,int2str(j),'(in',int2str(j));
        tempstr = strcat(tempstr,',neg',int2str(j),');\n');
        fprintf(fID,tempstr);
    end
    
    % Multiplucation Wab*INa
    m_rshift = zeros(n_layers(i),n_layers(i+1));
    m_len = zeros(n_layers(i),n_layers(i+1));
    for j=1:n_layers(i)
        for k=1:n_layers(i+1)
            % calculate bit lenght
            [newval, idx, divider] = nearestval(w{i}(j,k),val_list);
            m_len(j,k) = ( abs(bin_list(idx,1)) - abs(bin_list(idx,2)) );
            nw{i}(j,k) = newval;
            if (divider>divider_max)
                nw{i}(j,k) = 0;
            end
            % create variable
            tempstr = strcat('\n',tab1,"// m",int2str(j),'_',...
                int2str(k),' = W*in\n');
            fprintf(fID,tempstr);
            tempstr = strcat(tab1,'wire signed [',...
                int2str(bit_out(i)-1),':0] m',int2str(j),'_',...
                int2str(k),';\n');
            fprintf(fID,tempstr);
            % create text of exponent sign value
            if bin_list(idx,1)<0
                sign1 = strcat('neg',int2str(j));
            else
                sign1 = strcat('in',int2str(j));
            end
            if bin_list(idx,2)<0
                sign2 = strcat('neg',int2str(j));
            else
                sign2 = strcat('in',int2str(j));
            end
            % multiplication value assingment
            % if zero
            if (divider>divider_max)
                fprintf(fID,tab1);
                tempstr = strcat("assign m",int2str(j),'_',int2str(k),' = ');
                tempstr = strcat(tempstr,int2str(bit_out(i)),"'b0;\n");
                fprintf(fID,tempstr);
            % if there only 1 value
            elseif (bin_list(idx,2)==0)
                %shift calculation
                m_rshift(j,k) = divider-abs(bin_list(idx,1))+1;
                % main assignment
                fprintf(fID,tab1);
                tempstr = strcat("assign m",int2str(j),'_',int2str(k),' = ');
                tempstr = strcat(tempstr,str_expandbit(sign1, bit_in(i),...
                    bit_frac_in(i)+m_rshift(j,k), bit_out(i), ...
                    bit_frac_out(i)),';\n');
                fprintf(fID,tempstr);
            %there are 2 value
            else
                m_rshift(j,k) = divider-abs(bin_list(idx,2))+1;
                %create helper variable
                tempstr = strcat(tab1,'wire signed [',...
                    int2str(bit_in(i)+m_len(j,k)),':0] tm',int2str(j),'_',...
                    int2str(k),';\n');
                fprintf(fID,tempstr);
                % make lower bit assignment
                fprintf(fID,tab1);
                tempstr = strcat("assign tm",int2str(j),'_',int2str(k));
                tempstr = strcat(tempstr,'[',int2str(m_len(j,k)-1),":0] = ");
                tempstr = strcat(tempstr,sign2);
                tempstr = strcat(tempstr,'[',int2str(m_len(j,k)-1),':0];\n');
                fprintf(fID,tempstr);
                % make higher bit assignment
                fprintf(fID,tab1);
                tempstr = strcat("assign tm",int2str(j),'_',int2str(k),'[');
                tempstr = strcat(tempstr,int2str(bit_in(i)+m_len(j,k)),...
                    ':',int2str(m_len(j,k)),"] = ");
                tempstr = strcat(tempstr,str_expandbit(sign1, bit_in(i),...
                    bit_frac_in(i), bit_in(i)+1, bit_frac_in(i))," + ");
                tempstr = strcat(tempstr,str_expandbit(sign2, bit_in(i),...
                    bit_frac_in(i), bit_in(i)+1, bit_frac_in(i)-m_len(j,k)));
                tempstr = strcat(tempstr,';\n');
                fprintf(fID,tempstr);
                % expand bit
                fprintf(fID,tab1);
                tempstr = strcat("assign m",int2str(j),'_',int2str(k),' = ');
                fprintf(fID,tempstr);
                tempstr = strcat("tm",int2str(j),'_',int2str(k));
                tempstr = strcat(str_expandbit(tempstr, bit_in(i)+m_len(j,k)+1,...
                    bit_frac_in(i)+m_rshift(j,k), bit_out(i), bit_frac_out(i)),';\n');
                fprintf(fID,tempstr);
            end
        end
    end

    % Tree adder outputs
     fprintf(fID,strcat('\n',tab1,'//Perceptron Adders\n'));
    for j=1:n_layers(i+1)
        fprintf(fID,tab1);
        if (full_combinational)
            tempstr = strcat("assign out",int2str(j),' = m1_',int2str(j));
        else 
            tempstr = strcat("always @(posedge clk) out",int2str(j),' <= m1_',int2str(j));
        end
        for k=2:n_layers(i)
            tempstr = strcat(tempstr,"+m",int2str(k),'_',int2str(j));
        end
        tempstr = strcat(tempstr,'+b',int2str(j),';\n');
        fprintf(fID,tempstr);
    end
    
    % End module
    fprintf(fID,'endmodule');
    fclose(fID);
end





%% Create top level
% Include all files
module_name = strcat(toplevelname,'_top');
fID = fopen(strcat(module_name,'.v'),'w');

if (with_include)
    fprintf(fID,'`include "actifunc.v"\n');
    fprintf(fID,'`include "negate.v"\n');
    for i=1:depth
        fname = strcat(toplevelname,'_layer_',int2str(i),'.v');
        fprintf(fID,strcat('`include "',fname,'"\n'));
    end
end
% Module header
if (full_combinational)
    tempstr = strcat("module ",module_name,'(in1');
else 
    tempstr = strcat("module ",module_name,'(clk,in1');
end
% all input
for j=2:n_layers(1)
    tempstr = strcat(tempstr,',in',int2str(j));
end
% all output
for j=1:n_layers(end)
    tempstr = strcat(tempstr,',out',int2str(j));
end
tempstr = strcat(tempstr,');\n');
fprintf(fID,tempstr);

% Parameter & variable declaration    
% clock if not full_combinational
if (~full_combinational)
    fprintf(fID,tab1);
    fprintf(fID,"input clk;\n");
end
% input parameter
fprintf(fID,tab1);
tempstr = strcat('input [',int2str(bit_in(1)-1),':0] in1');
for j=2:n_layers(1)
    tempstr = strcat(tempstr,',in',int2str(j));
end
tempstr = strcat(tempstr,';\n');
fprintf(fID,tempstr);
% ouput parameter 
fprintf(fID,tab1);
tempstr = strcat('output [',int2str(bit_out(end)-1),':0] out1');
for j=2:n_layers(end)
    tempstr = strcat(tempstr,',out',int2str(j));
end
tempstr = strcat(tempstr,';\n');
fprintf(fID,tempstr);
% hidden layer output (before actifation)
for j=2:depth
    fprintf(fID,tab1);
    tempstr = strcat('wire signed [',int2str(bit_out(j-1)-1),...
        ':0] s',int2str(j),'_1');
    for k=2:n_layers(j)
        tempstr = strcat(tempstr,',s',int2str(j),'_',int2str(k));
    end
    tempstr = strcat(tempstr,';\n');
    fprintf(fID,tempstr);
end
% hidden layer output
for j=2:depth
    fprintf(fID,tab1);
    tempstr = strcat('wire signed [',int2str(bit_out(j-1)-1),...
        ':0] h',int2str(j),'_1');
    for k=2:n_layers(j)
        tempstr = strcat(tempstr,',h',int2str(j),'_',int2str(k));
    end
    tempstr = strcat(tempstr,';\n');
    fprintf(fID,tempstr);
end

% Calculation
% input
if (full_combinational)
    tempstr = strcat(tab1,toplevelname,'_layer_1 L1(in1');
else
    tempstr = strcat(tab1,toplevelname,'_layer_1 L1(clk,in1');
end
for i=2:n_layers(1)
    tempstr = strcat(tempstr,',in',int2str(i));
end
fprintf(fID,tempstr);
% hidden layers
for i=2:depth
    % tail
    tempstr = "";
    for j=1:n_layers(i)
        tempstr = strcat(tempstr,',s',int2str(i),'_',int2str(j));
    end
    tempstr = strcat(tempstr,');\n');
    fprintf(fID,tempstr);
    % activation function
    for j=1:n_layers(i)
        tempstr = strcat(tab1,'actifunc #(',int2str(bit_out(i-1)),') AF',...
            int2str(i),'_',int2str(j));
        tempstr = strcat(tempstr,'(s',int2str(i),'_',int2str(j));
        tempstr = strcat(tempstr,',h',int2str(i),'_',int2str(j),');\n');
        fprintf(fID,tempstr);
    end
    % head
    starting = bit_frac_out(i-1) - bit_frac_in(i);
    ending = starting + bit_in(i) -1;
    if (full_combinational)
        tempstr = strcat(tab1,toplevelname,'_layer_',int2str(i),' L',...
            int2str(i),'(h',int2str(i),'_1[',...
            int2str(ending),':',int2str(starting),']');
    else
        tempstr = strcat(tab1,toplevelname,'_layer_',int2str(i),' L',...
            int2str(i),'(clk,h',int2str(i),'_1[',...
            int2str(ending),':',int2str(starting),']');
    end
    for j=2:n_layers(i)
        tempstr = strcat(tempstr,',h',int2str(i),'_',int2str(j), ...
            '[',int2str(ending),':',int2str(starting),']');
    end
    fprintf(fID,tempstr);
end
% output
tempstr = "";
for i=1:n_layers(end)
    tempstr = strcat(tempstr,',out',int2str(i));
end
tempstr = strcat(tempstr,');\n');
fprintf(fID,tempstr);


% End module
fprintf(fID,'endmodule');
fclose(fID);





%% Create test bench
% Include toplevel module
module_name = strcat(toplevelname,'_tb');
fID = fopen(strcat(module_name,'.v'),'w');
if (with_include)
    fprintf(fID,strcat('`include "',toplevelname,'_top.v"\n'));
end
% Header module
fprintf(fID,strcat("module ",module_name,'();\n'));

% All variables
% clock if not full combinational
if (~full_combinational)
    fprintf(fID,tab1);
    fprintf(fID,"reg clk;\n");
end
% input parameter
fprintf(fID,tab1);
tempstr = strcat('reg [',int2str(bit_in(1)-1),':0] in1');
for j=2:n_layers(1)
    tempstr = strcat(tempstr,',in',int2str(j));
end
tempstr = strcat(tempstr,';\n');
fprintf(fID,tempstr);
% ouput parameter 
fprintf(fID,tab1);
tempstr = strcat('wire [',int2str(bit_out(end)-1),':0] out1');
for j=2:n_layers(end)
    tempstr = strcat(tempstr,',out',int2str(j));
end
tempstr = strcat(tempstr,';\n');
fprintf(fID,tempstr);

% Module declaration
if (full_combinational)
    tempstr = strcat(tab1,toplevelname,"_top TopModule(in1");
else
    tempstr = strcat(tab1,toplevelname,"_top TopModule(clk,in1");
end
% all input
for j=2:n_layers(1)
    tempstr = strcat(tempstr,',in',int2str(j));
end
% all output
for j=1:n_layers(end)
    tempstr = strcat(tempstr,',out',int2str(j));
end
tempstr = strcat(tempstr,');\n');
fprintf(fID,tempstr);

% Testbench Data
testData_all = test_data_red;
testData  = randi(size(testData_all,1),30,1);
testLabel = test_labels(:,testData);
testData  = testData_all(testData,:)';
testDataHex = round(testData*(2^bit_frac_in(1)));
testDataHex = testDataHex+(testDataHex<0).*2^bit_in(1);
fprintf(fID,strcat(tab1,'initial begin\n'));
if (~full_combinational)
    fprintf(fID,tab2);
    fprintf(fID,"clk=1'b0;\n");
end
for i=1:size(testData,2)
    fprintf(fID,strcat(tab2,"#50 in1=",int2str(bit_in(1)),"'h"));
    fprintf(fID,dec2hex(testDataHex(1,i)));
    for j = 2:size(testDataHex,1)
        fprintf(fID,strcat('; in',int2str(j),'=',int2str(bit_in(1)),"'h"));
        fprintf(fID,dec2hex(testDataHex(j,i)));
    end
    fprintf(fID,";\n");
end
fprintf(fID,strcat(tab1,'end\n'));
if (~full_combinational)
    fprintf(fID,"\n");
    fprintf(fID,tab1);
    fprintf(fID,"always #25 clk <= ~clk;\n");
end
% End module
fprintf(fID,'endmodule');
fclose(fID);




%% Create do file




%% Output check
fclose all;

LayerVal = forwprop(w,b,test_data_red);
[~,idx] = max(LayerVal{end}');
AB1 = sum((idx-1)==test_labels)/10000;
LayerVal = forwprop_frac(nw,nb,test_data_red,bit_frac_in,bit_frac_out);
[~,idx] = max(LayerVal{end}');
AB2 = sum((idx-1)==test_labels)/10000;
[AB1,AB2]