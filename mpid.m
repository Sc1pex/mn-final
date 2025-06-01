function [x, l, steps] = mpid(A, u, y0, tol, maxiter)
    % La fel ca mpi doar ca in loc de A am A-uI 
    yk1 = y0;
    [Q, R] = qr(A - eye(length(A)) * u);
    for steps = 1:maxiter
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
