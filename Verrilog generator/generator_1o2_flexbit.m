clear all;
rng('default')
% top module name
toplevelname = 'test';

% tab list
tab1 = "   ";
tab2 = "      ";
tab3 = "         ";
tab4 = "            ";
tab5 = "               ";
tab6 = "                  ";

% n_layers = [3 8 17 2];
% depth = size(n_layers,2)-1;
% for i=1:depth
%     w{i} = i*(1-2*rand(n_layers(i), n_layers(i+1)));
%     b{i} = rand(1,n_layers(i+1));
% end

load('result1_v5_red.mat');
depth = size(n_layers,2)-1;

% requirement bit_frac_out <= bit_frac_in+bit_frac_w
% requirement bit_dec_out <= bit_dec_in+bit_dec_w
%     * bit_dec_NNN = bit_NNN-bit_frac_NNN
% requirement bit_frac_in <= bit_frac_out
% requirement bit_dec_in <= bit_dec_out
%     * bit_dec_NNN = bit_NNN-bit_frac_NNN
% bit_in = 10*ones(1,depth);
% bit_w = 10*ones(1,depth);
% bit_out = 16*ones(1,depth);
% bit_frac_in = 5*ones(1,depth);
% bit_frac_w = 5*ones(1,depth);
% bit_frac_out = 8*ones(1,depth);
% bit_in = [32 30 20];
% bit_w = [34 28 24];
% bit_out = [44 40 28];
% bit_frac_in = [12 11 10];
% bit_frac_w = [12 13 11];
% bit_frac_out = [22 20 15];
bit_in = [9 9];
bit_w = [10 10];%[12 10] % must be even number
bit_out = [16 8];%[17 8]
bit_frac_in = [8 8];
bit_frac_w = [2 9];%[4 5]
bit_frac_out = [8 8];%[8 3]

% multiplier type
mul_type = 1;
% 1 = normal multiplication
% 2 = custom multiplier





%% Create all layer
for i=1:depth
    % Ceate and open file
    module_name = strcat('layer_',int2str(i),int2str(i+1));
    fID = fopen(strcat(module_name,'.v'),'w');
    
    % Include activation function
    fprintf(fID,'`include "actifunc.v"\n');
    
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
    % module variable
    for j=1:n_layers(i)
        fprintf(fID,tab1);
        tempstr = strcat('wire signed [',int2str(bit_w(i)+bit_in(i)-2),...
            ':0] m',int2str(j),'_1');
        for k=2:n_layers(i+1)
            tempstr = strcat(tempstr,',m',int2str(j),'_',int2str(k));
        end
        tempstr = strcat(tempstr,';\n');
        fprintf(fID,tempstr);
    end
    % weight variable
    for j=1:n_layers(i)
        for k=1:n_layers(i+1)
            fprintf(fID,tab1);
            tempstr = strcat('wire signed [',int2str(bit_w(i)-1),...
                ':0] w',int2str(j),'_',int2str(k)," = $signed(");
            % convert weight into fractional point
            weight = round(w{i}(j,k)*(2^bit_frac_w(i)));
            weight = weight+(weight<0)*2^bit_w(i);
            tempstr = strcat(tempstr,int2str(bit_w(i)),"'h",...
                dec2hex(weight),');\n');
            fprintf(fID,tempstr);
        end
    end
    % bias variable
    for k=1:n_layers(i+1)
        fprintf(fID,tab1);
        tempstr = strcat('wire signed [',int2str(bit_out(i)-1),...
            ':0] b',int2str(k)," = $signed(");
        % convert bias into fractional point
        bias = round(b{i}(k)*(2^bit_frac_out(i)));
        bias = bias+(bias<0)*2^(bit_out(i));
        tempstr = strcat(tempstr,int2str(bit_out(i)),"'h",...
            dec2hex(bias),');\n');
        fprintf(fID,tempstr);
    end
    
    % Multiplucation Wab*INa
    for j=1:n_layers(i)
        for k=1:n_layers(i+1)
            if (mul_type ==1)
                fprintf(fID,tab1);
                tempstr = strcat("assign m",int2str(j),'_',int2str(k));
                tempstr = strcat(tempstr,' = in',int2str(j),'*');
                tempstr = strcat(tempstr,'w',int2str(j),'_',int2str(k),';\n');
                fprintf(fID,tempstr);
            elseif (mul_type == 2)
                fprintf(fID,tab1);
                tempstr = strcat("multiply #(.N1(",int2str(bit_in(i)),...
                    '),.N2(', int2str(bit_w(i)),")) ");
                tempstr = strcat(tempstr,"MUL",int2str(j),'_',int2str(k));
                tempstr = strcat(tempstr,"(.in1(in",int2str(j),"),.in2(");
                tempstr = strcat(tempstr,'w',int2str(j),'_',int2str(k));
                tempstr = strcat(tempstr,"),.ou(m",int2str(j),'_',int2str(k));
                tempstr = strcat(tempstr,'));\n');
                fprintf(fID,tempstr);
            end
        end
    end
    
    % Tree adder outputs
    for j=1:n_layers(i+1)
        fprintf(fID,tab1);
        tempstr = strcat("assign out",int2str(j)," = ");
        varname = strcat("m1_",int2str(j));
        varname = str_expandbit(varname,bit_w(i)+bit_in(i)-1,...
            bit_frac_in(i)+bit_frac_w(i), bit_out(i), bit_frac_out(i));
        tempstr = strcat(tempstr,varname);
        for k=2:n_layers(i)
            varname = strcat("m",int2str(k),'_',int2str(j));
            varname = str_expandbit(varname,bit_w(i)+bit_in(i)-1,...
                bit_frac_in(i)+bit_frac_w(i), bit_out(i), bit_frac_out(i));
            tempstr = strcat(tempstr,'+\n',tab6,varname);
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
        tempstr = strcat(tab1,'actifunc #(',int2str(bit_out(i-1)),...
            ') AF',int2str(i),'_',int2str(j));
        tempstr = strcat(tempstr,'(s',int2str(i),'_',int2str(j));
        tempstr = strcat(tempstr,',h',int2str(i),'_',int2str(j),');\n');
        fprintf(fID,tempstr);
    end
    % head
    starting = bit_frac_out(i-1)-bit_frac_in(i);
    ending = bit_in(i)+starting-1;
    tempstr = strcat(tab1,'layer_',int2str(i),int2str(i+1),' L',int2str(i),int2str(i+1),...
        '(h',int2str(i),'_1[',int2str(ending),':',int2str(starting),']');
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
%LayerVal = LayerVal{end};


%% Create do file