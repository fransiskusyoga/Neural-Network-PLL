function [lmin,lmax] = layer_min_max(w,b,input)
    depth = size(w,2);
    layersVal{1} = input;
    lmin = zeros([1,depth]);
    lmax = zeros([1,depth]);
    for j = 1:depth
    	% calculate hidden layer
        if (j>=2)
            layersVal{j} = activFunc(layersVal{j-1}*w{j-1}+b{j-1});
        end
        % calculate ouput layer (without activation)
        layersVal{j+1} = layersVal{j}*w{j}+b{j};
        lmax(j) = max(max(layersVal{j+1}));
        lmin(j) = min(min(layersVal{j+1}));
    end
end