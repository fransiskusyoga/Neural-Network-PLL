function [w,b,cost,fmw,fmb,smw,smb] = ...
    backprop_adam(layersVal, label,w,b,fmw,fmb,smw,smb,beta1,beta2,t,lambda,learnRate)
    depth = size(w,2);
    batchSize = size(label,1);
    % calculate error
    error =label-layersVal{end};
    % calculate cost function
    cost = sum(sum(abs(error)))./batchSize;
    % calculate gradient of last layer (with/without activation)
    % with
    %db{depth} = error.*dactivFunc(layersVal{depth+1});
    %db{depth} = error.*(1 - layersVal{depth+1}.^2); %tanh last layer
    %without
    db{depth} = error;
    % calculate gradient
    for j = depth:-1:2
        dw{j} = layersVal{j}'*db{j};
        db{j-1} = dactivFunc(layersVal{j}).*(db{j}*w{j}');
    end
    dw{1} = layersVal{1}'*db{1};
    %Apply Regularization
    for j=1:depth
        dw{j} = ((dw{j}./batchSize) + lambda*w{j});
        db{j} = ((sum(db{j})./batchSize) + lambda*b{j});
    end
    %Momentum calculation
    for j=1:depth
        fmw{j} = beta1*fmw{j}+(1-beta1)*dw{j};
        fmb{j} = beta1*fmb{j}+(1-beta1)*db{j};
        smw{j} = beta2*smw{j}+(1-beta2)*(dw{j}.*dw{j});
        smb{j} = beta2*smb{j}+(1-beta2)*(db{j}.*db{j});
    end
    % Update wieght and bias value
    for j=1:depth
        funbiasw = fmw{j};%/(1-beta1.^t);
        funbiasb = fmb{j};%/(1-beta1.^t);
        sunbiasw = smw{j};%/(1-beta2.^t);
        sunbiasb = smb{j};%/(1-beta2.^t);
        w{j} = w{j}+funbiasw./sqrt(sunbiasw+1e-7)*learnRate;
        % bias in all layer
        b{j} = b{j}+funbiasb./sqrt(sunbiasb+1e-7)*learnRate;
        % bias only in the end
        %if j == depth
        %    b{j} = b{j}+db{j};
        %send
    end
end