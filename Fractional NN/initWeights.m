function W = initWeights(n_in, n_out)
    % Output: 
    epsilon = sqrt(6) / sqrt(n_in + n_out);
    W = rand(n_in, n_out) * 2* epsilon - epsilon;
    % W = rand(n_out, n_in)/n_in;
end