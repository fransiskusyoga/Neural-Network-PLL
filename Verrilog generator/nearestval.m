function [newval, idx, divider] = nearestval(target,val_list)
    %divide the value
    divider = log2(val_list(end)/abs(target));
    divider = floor(divider);
    val_list = val_list/(2.^divider);
    % getnew value
    [~,idx] = min(abs(target-val_list));
    newval = val_list(idx);
end