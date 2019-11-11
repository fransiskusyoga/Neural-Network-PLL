function newval = map_fractional(target,bit_ln,bit_fr)
    temp = round(target*(2^bit_fr));
    maxval = 2^(bit_ln-1)-1;
    newval = (temp>=maxval).*(maxval-temp) + temp;
    newval = newval/(2^bit_fr);
end