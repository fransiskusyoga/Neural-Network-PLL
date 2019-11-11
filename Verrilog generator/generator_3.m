clear all;

% setting variable
toplevelname = 'test';
bit_in = 8;
bit_frac_in = 5;
bit_out = 9;
bit_frac_out = 6;

% tab list
tab1 = "   ";
tab2 = "      ";
tab3 = "         ";
tab4 = "            ";
tab5 = "               ";
tab6 = "                  ";

n_layers = [3 8 17 2];
depth = size(n_layers,2)-1;
rng('default') % default random generator
for i=1:depth
    w{i} = i*(1-2*rand(n_layers(i), n_layers(i+1)));
    b{i} = zeros(1,n_layers(i+1));
end

% conversion function
[val_list,bin_list] = makelist(8);

%% Create activation function
% Ceate and open file
module_name = 'actifunc';
fID = fopen(strcat(module_name,'.v'),'w');
% Module header
fprintf(fID,"module actifunc(in,out);\n");
% Parameter & variable declaration    
% input variable
tempint = bit_out-1;
fprintf(fID,strcat(tab1,'input [',int2str(tempint),':0] in;\n'));
% output variable
fprintf(fID,strcat(tab1,'output [',int2str(tempint),':0] out;\n'));
% Calculation
tempstr = strcat(tab1,'assign out = in[',int2str(tempint),"] ? ", ...
    int2str(tempint+1),"'b0 : in;\n");
fprintf(fID,tempstr);
% End module
fprintf(fID,'endmodule');
fclose(fID);

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
    tempstr = strcat('output signed [',int2str(bit_out-1),':0] out1');
    for j=2:n_layers(i+1)
        tempstr = strcat(tempstr,',out',int2str(j));
    end
    tempstr = strcat(tempstr,';\n');
    fprintf(fID,tempstr);
    % module variable : negation of input
    fprintf(fID,tab1);
    tempstr = strcat('wire signed [',int2str(bit_in-1),':0] n1');
    for j=2:n_layers(i)
        tempstr = strcat(tempstr,',n',int2str(j));
    end
    tempstr = strcat(tempstr,';\n');
    fprintf(fID,tempstr);

    % Negation of input
    for j=1:n_layers(i)
        tempstr = strcat(tab1,'negate #(',int2str(bit_in),') N');
        tempstr = strcat(tempstr,int2str(j),'(in',int2str(j));
        tempstr = strcat(tempstr,',n',int2str(j),');\n');
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
            % create variable
            tempstr = strcat(tab1,'wire signed [',...
                int2str(bit_in+m_len(j,k)-1),':0] m',int2str(j),'_',...
                int2str(k),';\n');
            fprintf(fID,tempstr);
            if m_len(j,k)==0
                m_rshift(j,k) = divider-abs(bin_list(idx,1)); 
                % value assignment
                fprintf(fID,tab1);
                tempstr = strcat("assign m",int2str(j),'_',int2str(k));
                if bin_list(idx,1)<0
                    tempstr = strcat(tempstr,' = neg;\n');
                else
                    tempstr = strcat(tempstr,' = in;\n');
                end
                fprintf(fID,tempstr);
            else
                m_rshift(j,k) = divider-abs(bin_list(idx,2));
                % make lower bit assignment
                fprintf(fID,tab1);
                tempstr = strcat("assign m",int2str(j),'_',int2str(k));
                tempstr = strcat(tempstr,'[',int2str(m_len(j,k)-1),":0] = ");
                if bin_list(idx,2)<0
                    tempstr = strcat(tempstr,'neg');
                else
                    tempstr = strcat(tempstr,'in');
                end
                tempstr = strcat(tempstr,'[',int2str(m_len(j,k)-1),':0];\n');
                fprintf(fID,tempstr);
                % make higher bit assignment
                fprintf(fID,tab1);
                tempstr = strcat("assign m",int2str(j),'_',int2str(k),' = ');
                if bin_list(idx,1)<0
                    tempstr = strcat(tempstr," neg + (");
                else
                    tempstr = strcat(tempstr," in + (");
                end
                %example{ {3{in[23]}} , in[23:3]}
                if bin_list(idx,2)<0
                    tempstr = strcat(tempstr,'neg>>>');
                else
                    tempstr = strcat(tempstr,'in>>>');
                end
                tempstr = strcat(tempstr,int2str(m_len(j,k)),');\n');
                fprintf(fID,tempstr);
            end
        end
    end

%     % Tree adder outputs
%     for j=1:n_layers(i+1)
%         fprintf(fID,tab1);
%         tempstr = strcat("assign out",int2str(j),' = m1_',int2str(j));
%         for k=2:n_layers(i)
%             tempstr = strcat(tempstr,"+m",int2str(k),'_',int2str(j));
%         end
%         tempstr = strcat(tempstr,';\n');
%         fprintf(fID,tempstr);
%     end
%     
    % End module
    fprintf(fID,'endmodule');
    fclose(fID);
end
% 
% %% Create top level
% % Include all files
% module_name = toplevelname;
% fID = fopen(strcat(module_name,'.v'),'w');
% fprintf(fID,'`include "actifunc.v"\n');
% for i=1:depth
%     fname = strcat('layer_',int2str(i),int2str(i+1),'.v');
%     fprintf(fID,strcat('`include "',fname,'"\n'));
% end
% 
% % Module header
% tempstr = strcat("module ",module_name,'(in1');
% % all input
% for j=2:n_layers(1)
%     tempstr = strcat(tempstr,',in',int2str(j));
% end
% % all output
% for j=1:n_layers(end)
%     tempstr = strcat(tempstr,',out',int2str(j));
% end
% tempstr = strcat(tempstr,');\n');
% fprintf(fID,tempstr);
% 
% % Parameter & variable declaration    
% % input parameter
% fprintf(fID,tab1);
% tempstr = strcat('input [',int2str(bit_in-1),':0] in1');
% for j=2:n_layers(1)
%     tempstr = strcat(tempstr,',in',int2str(j));
% end
% tempstr = strcat(tempstr,';\n');
% fprintf(fID,tempstr);
% % ouput parameter 
% fprintf(fID,tab1);
% tempstr = strcat('output [',int2str(bit_w+bit_in-1),':0] out1');
% for j=2:n_layers(end)
%     tempstr = strcat(tempstr,',out',int2str(j));
% end
% tempstr = strcat(tempstr,';\n');
% fprintf(fID,tempstr);
% % hidden layer output (before actifation)
% for j=2:depth
%     fprintf(fID,tab1);
%     tempstr = strcat('wire signed [',int2str(bit_w+bit_in-1),...
%         ':0] s',int2str(j),'_1');
%     for k=2:n_layers(j)
%         tempstr = strcat(tempstr,',s',int2str(j),'_',int2str(k));
%     end
%     tempstr = strcat(tempstr,';\n');
%     fprintf(fID,tempstr);
% end
% % hidden layer output
% for j=2:depth
%     fprintf(fID,tab1);
%     tempstr = strcat('wire signed [',int2str(bit_w+bit_in-1),...
%         ':0] h',int2str(j),'_1');
%     for k=2:n_layers(j)
%         tempstr = strcat(tempstr,',h',int2str(j),'_',int2str(k));
%     end
%     tempstr = strcat(tempstr,';\n');
%     fprintf(fID,tempstr);
% end
% 
% % Calculation
% % input
% tempstr = strcat(tab1,'layer_12 L12(in1');
% for i=2:n_layers(1)
%     tempstr = strcat(tempstr,',in',int2str(i));
% end
% fprintf(fID,tempstr);
% % hidden layers
% for i=2:depth
%     % tail
%     tempstr = "";
%     for j=1:n_layers(i)
%         tempstr = strcat(tempstr,',s',int2str(i),'_',int2str(j));
%     end
%     tempstr = strcat(tempstr,');\n');
%     fprintf(fID,tempstr);
%     % activation function
%     for j=1:n_layers(i)
%         tempstr = strcat(tab1,'actifunc AF',int2str(i),'_',int2str(j));
%         tempstr = strcat(tempstr,'(s',int2str(i),'_',int2str(j));
%         tempstr = strcat(tempstr,',h',int2str(i),'_',int2str(j),');\n');
%         fprintf(fID,tempstr);
%     end
%     % head
%     starting = bit_frac_w;
%     ending = bit_in+starting-1;
%     tempstr = strcat(tab1,'layer_',int2str(i),int2str(i+1),' L',int2str(i),int2str(i+1),...
%         '(h',int2str(i),'_1[',int2str(ending),':',int2str(starting),']');
%     for j=2:n_layers(i)
%         tempstr = strcat(tempstr,',h',int2str(i),'_',int2str(j), ...
%             '[',int2str(ending),':',int2str(starting),']');
%     end
%     fprintf(fID,tempstr);
% end
% % output
% tempstr = "";
% for i=1:n_layers(end)
%     tempstr = strcat(tempstr,',out',int2str(i));
% end
% tempstr = strcat(tempstr,');\n');
% fprintf(fID,tempstr);
% 
% 
% % End module
% fprintf(fID,'endmodule');
% fclose(fID);
% 
% 
% %% Create test bench
% % Include toplevel module
% module_name = strcat(toplevelname,'_tb');
% fID = fopen(strcat(module_name,'.v'),'w');
% fprintf(fID,strcat('`include "',toplevelname,'.v"\n'));
% % Header module
% fprintf(fID,strcat("module ",module_name,'();\n'));
% 
% % All variables
% % input parameter
% fprintf(fID,tab1);
% tempstr = strcat('reg [',int2str(bit_in-1),':0] in1');
% for j=2:n_layers(1)
%     tempstr = strcat(tempstr,',in',int2str(j));
% end
% tempstr = strcat(tempstr,';\n');
% fprintf(fID,tempstr);
% % ouput parameter 
% fprintf(fID,tab1);
% tempstr = strcat('wire [',int2str(bit_w+bit_in-1),':0] out1');
% for j=2:n_layers(end)
%     tempstr = strcat(tempstr,',out',int2str(j));
% end
% tempstr = strcat(tempstr,';\n');
% fprintf(fID,tempstr);
% 
% % Module declaration
% tempstr = strcat(tab1,toplevelname," TopModule(in1");
% % all input
% for j=2:n_layers(1)
%     tempstr = strcat(tempstr,',in',int2str(j));
% end
% % all output
% for j=1:n_layers(end)
%     tempstr = strcat(tempstr,',out',int2str(j));
% end
% tempstr = strcat(tempstr,');\n');
% fprintf(fID,tempstr);
% 
% % Testbench Data
% testData = 1-2*rand(n_layers(1),20);
% testDataHex = round(testData*(2^bit_frac_in));
% testDataHex = testDataHex+(testDataHex<0).*2^bit_in;
% fprintf(fID,strcat(tab1,'initial begin\n'));
% for i=1:size(testData,2)
%     fprintf(fID,strcat(tab2,"#50 in1=",int2str(bit_in),"'h"));
%     fprintf(fID,dec2hex(testDataHex(1,i)));
%     for j = 2:size(testDataHex,1)
%         fprintf(fID,strcat('; in',int2str(j),'=',int2str(bit_in),"'h"));
%         fprintf(fID,dec2hex(testDataHex(j,i)));
%     end
%     fprintf(fID,";\n");
% end
% fprintf(fID,strcat(tab1,'end\n'));
% 
% % End module
% fprintf(fID,'endmodule');
% fclose(fID);
% 
% %%
% LayerVal = forwprop(w,b,testData');
% %LayerVal = LayerVal{end};
% 
% 
% %% Create do file