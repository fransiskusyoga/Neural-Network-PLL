function mapped = mapvalue(map, data)
    mapped = interp1(map, map, data,'nearest','extrap');
end