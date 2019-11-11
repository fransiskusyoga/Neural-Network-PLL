function [val_list, bin_list] = makelist(max_gap)
    val_list =[0];
    bin_list =[0,0];
    for i=0:max_gap-1
        % one shifter
        val_list = [val_list;2.^i];
        bin_list = [bin_list;zeros(1,2)];
        bin_list(end,1) = i+1;
        % two shifter
        for j=0:i-1
            % (+/+) and (+/-)
            val_list = [val_list;2.^i+2.^j;2.^i-2.^j];
            bin_list = [bin_list;zeros(2,2)];
            bin_list(end-1,1) = i+1;
            bin_list(end-1,2) = j+1;
            bin_list(end,1) = i+1;
            bin_list(end,2) = -j-1;
        end
    end
    val_list = [val_list;-val_list];
    bin_list = [bin_list;-bin_list];

    [val_list,i,~] = unique(val_list);
    bin_list = bin_list(i,:);
end