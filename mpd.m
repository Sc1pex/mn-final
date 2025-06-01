function [x, l] = mpd(A, y0, tol, maxiter)
    yk1 = y0;
    for k = 1:maxiter
        yk = A * yk1;
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
