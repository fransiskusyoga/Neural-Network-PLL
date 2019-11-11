function layersVal = forwprop_frac(w,b,input, ...
                        	bit_frac_in,bit_frac_out)
    
    two_f_in = 2.^bit_frac_in;
    two_f_out = 2.^bit_frac_out;
    depth = size(w,2);
    layersVal{1} = round(input*two_f_in(1))/two_f_in(1);
    % calculate hidden layer
    for j = 1:depth-1
        layersVal{j+1} = floor(b{j}*two_f_out(j))/two_f_out(j);
        for k = 1:size(w{j},1)
            A = layersVal{j}(:,k)*w{j}(k,:);
            layersVal{j+1} = layersVal{j+1} + ...
                floor(A*two_f_out(j))/two_f_out(j);
        end
        layersVal{j+1} = activFunc(layersVal{j+1});
        layersVal{j+1} = floor(layersVal{j+1}*two_f_in(j+1))/two_f_in(j+1);
    end
    % calculate ouput layer (without activation)
    layersVal{depth+1} = floor(b{depth}*two_f_out(depth))/two_f_out(depth);
    for k = 1:size(w{depth},1)
        A = layersVal{depth}(:,k)*w{depth}(k,:);
        layersVal{depth+1} = layersVal{depth+1} + ...
            floor(A*two_f_out(depth))/two_f_out(depth);
    end
end