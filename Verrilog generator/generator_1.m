clear all;
rng('default')
% setting variable
toplevelname = 'test';
bit_mul = 8;
bit_in = 8;
bit_frac_in = 5;
bit_w = 9;
bit_frac_w = 6;

% tab list
tab1 = "   ";
tab2 = "      ";
tab3 = "         ";
tab4 = "            ";
tab5 = "               ";
tab6 = "                  ";

n_layers = [3 8 17 2];
depth = size(n_layers,2)-1;
for i=1:depth
    w{i} = i*(1-2*rand(n_layers(i), n_layers(i+1)));
    b{i} = zeros(1,n_layers(i+1));
end


%% Create all layer
for i=1:depth
    % Ceate and open file
    module_name = strcat('layer_',int2str(i),int2str(i+1));
    fID = fopen(strcat(module_name,'.v'),'w');
    
    % Include activation function
    fprintf(fID,'`include "actifunc.v";\n');
    
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
    tempstr = strcat('input signed [',int2str(bit_in-1),':0] in1');
    for j=2:n_layers(i)
        tempstr = strcat(tempstr,',in',int2str(j));
    end
    tempstr = strcat(tempstr,';\n');
    fprintf(fID,tempstr);
    % ouput parameter 
    fprintf(fID,tab1);
    tempstr = strcat('output signed [',int2str(bit_w+bit_in-1),':0] out1');
    for j=2:n_layers(i+1)
        tempstr = strcat(tempstr,',out',int2str(j));
    end
    tempstr = strcat(tempstr,';\n');
    fprintf(fID,tempstr);
    % module variable
    for j=1:n_layers(i)
        fprintf(fID,tab1);
        tempstr = strcat('wire signed [',int2str(bit_w+bit_in-1),...
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
            tempstr = strcat('wire signed [',int2str(bit_w-1),...
                ':0] w',int2str(j),'_',int2str(k)," = ");
            % convert weight into fractional point
            weight = round(w{i}(j,k)*(2^bit_frac_w));
            weight = weight+(weight<0)*2^bit_w;
            tempstr = strcat(tempstr,int2str(bit_w),"'h",...
                dec2hex(weight),';\n');
            fprintf(fID,tempstr);
        end
    end
    
    % Multiplucation Wab*INa
    for j=1:n_layers(i)
        for k=1:n_layers(i+1)
            fprintf(fID,tab1);
            tempstr = strcat("assign m",int2str(j),'_',int2str(k));
            tempstr = strcat(tempstr,' = in',int2str(j),'*');
            tempstr = strcat(tempstr,'w',int2str(j),'_',int2str(k),';\n');
            fprintf(fID,tempstr);
        end
    end
    
    % Tree adder outputs
    for j=1:n_layers(i+1)
        fprintf(fID,tab1);
        tempstr = strcat("assign out",int2str(j),' = m1_',int2str(j));
        for k=2:n_layers(i)
            tempstr = strcat(tempstr,"+m",int2str(k),'_',int2str(j));
        end
        tempstr = strcat(tempstr,';\n');
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
tempstr = strcat('input [',int2str(bit_in-1),':0] in1');
for j=2:n_layers(1)
    tempstr = strcat(tempstr,',in',int2str(j));
end
tempstr = strcat(tempstr,';\n');
fprintf(fID,tempstr);
% ouput parameter 
fprintf(fID,tab1);
tempstr = strcat('output [',int2str(bit_w+bit_in-1),':0] out1');
for j=2:n_layers(end)
    tempstr = strcat(tempstr,',out',int2str(j));
end
tempstr = strcat(tempstr,';\n');
fprintf(fID,tempstr);
% hidden layer output (before actifation)
for j=2:depth
    fprintf(fID,tab1);
    tempstr = strcat('wire signed [',int2str(bit_w+bit_in-1),...
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
    tempstr = strcat('wire signed [',int2str(bit_w+bit_in-1),...
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
        tempstr = strcat(tab1,'actifunc #(',int2str(bit_w+bit_in),...
            ') AF',int2str(i),'_',int2str(j));
        tempstr = strcat(tempstr,'(s',int2str(i),'_',int2str(j));
        tempstr = strcat(tempstr,',h',int2str(i),'_',int2str(j),');\n');
        fprintf(fID,tempstr);
    end
    % head
    starting = bit_frac_w;
    ending = bit_in+starting-1;
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
tempstr = strcat('reg [',int2str(bit_in-1),':0] in1');
for j=2:n_layers(1)
    tempstr = strcat(tempstr,',in',int2str(j));
end
tempstr = strcat(tempstr,';\n');
fprintf(fID,tempstr);
% ouput parameter 
fprintf(fID,tab1);
tempstr = strcat('wire [',int2str(bit_w+bit_in-1),':0] out1');
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
testData = 1-2*rand(n_layers(1),20);
testDataHex = round(testData*(2^bit_frac_in));
testDataHex = testDataHex+(testDataHex<0).*2^bit_in;
fprintf(fID,strcat(tab1,'initial begin\n'));
for i=1:size(testData,2)
    fprintf(fID,strcat(tab2,"#50 in1=",int2str(bit_in),"'h"));
    fprintf(fID,dec2hex(testDataHex(1,i)));
    for j = 2:size(testDataHex,1)
        fprintf(fID,strcat('; in',int2str(j),'=',int2str(bit_in),"'h"));
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