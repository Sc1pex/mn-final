function [x, l] = mpio(A, tol, maxiter)
    x = rand(length(A));
    for k = 1:maxiter
        [q, ~] = qr(x);
        x = A*q;
    end

    [q, r] = qr(x);
    x = q;
    l = diag(r);
end
