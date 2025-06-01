function [T] = romberg(f, a, b, n)
    n = n + 1;
    R = zeros(n, n);
    
    h = arrayfun(@(i) (b - a) / (2 ^ i), 1:n);

    R(1, 1) = h(1) * (f(a) + f(b));
    for i = [2 : n]
        S = 0;
        k = 1 : 2^(i-2);
        S = S + sum(feval(f, a + (2 * k - 1) * h(i-1)));
        R(i,1) = R(i-1,1) / 2 + h(i-1) * S;
    end

    for j = [2 : n]
        for i = [j : n]
            R(i,j) = 4^(j-1) * R(i,j-1) - R(i-1,j-1);
            R(i,j) /= 4^(j-1) - 1;
        end
    end
    
    T = R(n, n);
end
