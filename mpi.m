function [x, l] = mpi(A, y0, tol, maxiter)
    yk1 = y0;
    [Q, R] = qr(A);
    for k = 1:maxiter
        % In loc de A vreau sa folosesc A^(-1)
        % yk = A^(-1) * yk1
        % A * yk = yk1
        % Folosesc factorizare QR
        % yk = R \ (Q' * yk1)
        yk = R \ (Q' * yk1);
        % Normalizez vectorul
        yk = yk / norm(yk);
        % Nu mai impart la norm(yk) pt ca e 1
        l = yk' * A * yk;
        x = yk;

        if norm(A*x - l*x) < tol
            break
        end

        yk1 = yk;
    end
end
