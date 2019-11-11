function layersVal = forwprop(w,b,input)
    depth = size(w,2);
    layersVal{1} = input;
    % calculate hidden layer
    for j = 1:depth-1
        layersVal{j+1} = activFunc(layersVal{j}*w{j}+b{j});
    end
    % calculate ouput layer (with/without activation)
    %with
    %layersVal{depth+1} = activFunc(layersVal{depth}*w{depth}+b{depth});
    %layersVal{depth+1} = tanh(layersVal{depth}*w{depth}+b{depth}); %tanh last layer
    %without
    layersVal{depth+1} = layersVal{depth}*w{depth}+b{depth};
end