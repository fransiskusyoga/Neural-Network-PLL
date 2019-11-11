function str = str_expandbit(var_name, bit_in, bit_frac_in, bit_out, bit_frac_out)
    con1 = (bit_out-bit_frac_out) - (bit_in-bit_frac_in);
    con2 = bit_frac_out-bit_frac_in;
    % CASE 1
    if (con1<=0) && (con2>0)
        %middle
        tempstr = strcat("{ ",var_name,'[',int2str(bit_in+con1-1),":0] , ");
        %tail
        tempstr = strcat(tempstr,"{",int2str(con2),"{1'b0}} }");
    % CASE 2
    elseif (con2<=0) && (con1>0)
        %head
        tempstr = strcat("{ {",int2str(con1),...
            '{',var_name,'[',int2str(bit_in-1),"]}} , ");
        %middle
        tempstr = strcat(tempstr,var_name,'[',int2str(bit_in-1),":",...
            int2str(-con2),"] }");
    % CASE 3
    elseif (con2>0) && (con1>0)
        %head
        tempstr = strcat("{ {",int2str(con1),...
            '{',var_name,'[',int2str(bit_in-1),"]}} , ");
        %middle
        tempstr = strcat(tempstr,var_name," , ");
        %tail
        tempstr = strcat(tempstr,"{",int2str(con2),"{1'b0}} }");
    % CASE 4
    else %(con2<=0) && (con1<=0)
        tempstr = strcat(var_name,"[",int2str(bit_in+con1-1),":",...
            int2str(-con2),"]");
    end 
    str = tempstr;
end