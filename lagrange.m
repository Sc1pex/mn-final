function yp = langrange(x, y, xp)
    n = length(x);
    U = diag(x) * ones(n) - ones(n) * diag(x) + eye(n);
    V = diag(xp - x) * ~eye(n) + eye(n);
    yp = prod(V) ./ prod(U) * y;
end
