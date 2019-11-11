clear all;

% setting variable
toplevelname = 'test';

% tab list
tab1 = "   ";
tab2 = "      ";
tab3 = "         ";
tab4 = "            ";
tab5 = "               ";
tab6 = "                  ";

rng('default') % default random generator
% n_layers = [3 8 17 2];
% depth = size(n_layers,2)-1;
% for i=1:depth
%     w{i} = i*(1-2*rand(n_layers(i), n_layers(i+1)));
%     b{i} = rand(1,n_layers(i+1));
% end
load('result4.mat')
depth = size(n_layers,2)-1;
w{1} = w{1}*1000;

for i=1:depth
    nw{i} = zeros(n_layers(i), n_layers(i+1));
    nb{i} = zeros(1,n_layers(i+1));
end

% bit precission of each layer
% bit_in = 9*ones(1,depth);
% bit_out = 18*ones(1,depth);
% bit_frac_in = 5*ones(1,depth);
% bit_frac_out = 10*ones(1,depth);
% bit_in = [32 30 20];
% bit_out = [43 39 28];
% bit_frac_in = [12 11 10];
% bit_frac_out = [22 20 15];
bit_in = [9 9];
bit_out = [16 8];
bit_frac_in = [8 8];
bit_frac_out = [8 8];
% conversion function
[val_list,bin_list] = makelist(11);


%% Create all layer
for i=1:depth
    % Ceate and open file
    module_name = strcat('layer_',int2str(i),int2str(i+1));
    fID = fopen(strcat(module_name,'.v'),'w');
   
    % Include activation function
    fprintf(fID,'`include "negate.v"\n');
   
    % Module header
    tempstr = strcat("module ",module_name,'(in1');
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
    tempstr = strcat('output signed [',int2str(bit_out(i)-1),':0] out1');
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
        bias = bias+(bias<0)*2^(bit_out(i));
        tempstr = strcat(tempstr,int2str(bit_out(i)),"'h",...
            dec2hex(bias),');\n');
        nb{i}(k) = bias./(2^(bit_frac_out(i)));
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
            m_len(j,k) = (bin_list(idx,2)~=0).*...
                ( abs(bin_list(idx,1)) - abs(bin_list(idx,2)) );
            nw{i}(j,k) = newval;
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
            % there is only one value
            if m_len(j,k)==0
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
        tempstr = strcat("assign out",int2str(j),' = m1_',int2str(j));
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
module_name = toplevelname;
fID = fopen(strcat(module_name,'.v'),'w');
fprintf(fID,'`include "actifunc.v"\n');
fprintf(fID,'`include "negate.v"\n');
for i=1:depth
    fname = strcat('layer_',int2str(i),int2str(i+1),'.v');
    fprintf(fID,strcat('`include "',fname,'"\n'));
end

% Module header
tempstr = strcat("module ",module_name,'(in1');
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
tempstr = strcat(tab1,'layer_12 L12(in1');
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
    tempstr = strcat(tab1,'layer_',int2str(i),int2str(i+1),' L',...
        int2str(i),int2str(i+1),'(h',int2str(i),'_1[',...
        int2str(ending),':',int2str(starting),']');
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
fprintf(fID,strcat('`include "',toplevelname,'.v"\n'));
% Header module
fprintf(fID,strcat("module ",module_name,'();\n'));

% All variables
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
tempstr = strcat(tab1,toplevelname," TopModule(in1");
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
testData = rand(n_layers(1),30);
testDataHex = round(testData*(2^bit_frac_in(1)));
testDataHex = testDataHex+(testDataHex<0).*2^bit_in(1);
fprintf(fID,strcat(tab1,'initial begin\n'));
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

% End module
fprintf(fID,'endmodule');
fclose(fID);

%%
LayerVal = forwprop(w,b,testData');
LayerValN = forwprop(nw,nb,testData');
%LayerVal = LayerVal{end};


%% Create do file