function p = vandermonde(x, y) 
    n = length(x);
    A = zeros(n);
    for i = 0:(n-1)
        A(:, i+1) = x .^ i;
    end
    p = A \ y;
end
