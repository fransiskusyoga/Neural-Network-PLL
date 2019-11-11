function newval = map_2shft(target,maxdist)
    threshold = log2(1.5);
    abs_v = abs(target);
    log_v = log2(abs_v);
    % first value;
    fidx1 = floor(log_v);
    pfidx1 = 2.^fidx1;
    err1 = abs_v-pfidx1;
    sidx1 = log2(err1);
    sidx1 = floor(sidx1) + ((sidx1-floor(sidx1)) >threshold);
    sidx1 = sidx1.*(fidx1-sidx1<maxdist); %not satisfactory yet
    val1 = pfidx1+2.^sidx1;
    err1 = abs(abs_v-val1);
    % second value
    fidx2 = ceil(log_v);
    pfidx2 = 2.^fidx2;
    err2 = pfidx2-abs_v;
    sidx2 = log2(err2);
    sidx2 = floor(sidx2) + ((sidx2-floor(sidx2))>threshold);
    sidx2 = sidx2.*(fidx2-sidx2<maxdist); %not satisfactory yet
    val2 = pfidx2-2.^sidx2;
    err2 = abs(abs_v-val2);
    % decide
    newval = val1.*(err1<=err2) + val2.*(err1>err2);
    newval = sign(target).*newval;
end