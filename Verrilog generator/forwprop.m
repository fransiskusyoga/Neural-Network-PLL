function layersVal = forwprop(w,b,input)
    depth = size(w,2);
    layersVal{1} = input;
    % calculate hidden layer
    for j = 1:depth-1
        layersVal{j+1} = activFunc(layersVal{j}*w{j}+b{j});
    end
    % calculate ouput layer (without activation)
    layersVal{depth+1} = layersVal{depth}*w{depth}+b{depth};
end