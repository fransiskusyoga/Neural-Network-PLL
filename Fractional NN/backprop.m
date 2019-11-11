function [w,b,cost] = backprop(layersVal, label,w,b,lambda,learnRate)
    depth = size(w,2);
    batchSize = size(label,1);
    % calculate error
    error =label-layersVal{end};
    % calculate cost function
    cost = sum(sum(abs(error)))./batchSize;
    % calculate gradient of last layer (with/without activation)
    % with
    %db{depth} = error.*dactivFunc(layersVal{depth+1});
    db{depth} = error.*(1 - layersVal{depth+1}.^2); %tanh last layer
    %without
    %db{depth} = error;
    % calculate gradient
    for j = depth:-1:2
        dw{j} = layersVal{j}'*db{j};
        db{j-1} = dactivFunc(layersVal{j}).*(db{j}*w{j}');
    end
    dw{1} = layersVal{1}'*db{1};
    %Apply Regularization
    for j=1:depth
        dw{j} = ((dw{j}./batchSize) + lambda*w{j})*learnRate;
        db{j} = ((sum(db{j})./batchSize) + lambda*b{j})*learnRate;
    end
    % Update wieght and bias value
    for j=1:depth
        w{j} = w{j}+dw{j};
        % bias in all layer
        b{j} = b{j}+db{j};
        % bias only in the end
        %if j == depth
        %    b{j} = b{j}+db{j};
        %send
    end
end