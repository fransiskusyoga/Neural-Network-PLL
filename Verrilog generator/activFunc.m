function y = activFunc(x)
    %y = 1 ./ (1 + exp(-x));  %sigmoid
    %y = tanh(x);            %tanh
    %y = max(x,x/8);       %leaky ReLU (0.01;1)
    y = max(x,0);       %ReLU
end