function y = dactivFunc(x)
    %y = ((1-x) .* x);   %sigmoid
    %y = 1 - x.*x;       %tanh
    y = 1 - (x<0)*7/8;   %leaky ReLU (0.01;1)
    %y = x>=0;       %ReLU
end