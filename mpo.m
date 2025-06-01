function [x, l] = mpo(A, tol, maxiter)
    % Instabil numeric
    n = length(A);
    x = zeros(n);
    l = zeros(n, 1);

    for i = 1:n
        % Incep cu un yp random
        yp = rand(n, 1);

        for k = 1:maxiter
            % Scot din yp toate componentele valorilor proprii calculate deja
            for j = 1:(i-1)
                yp = yp - x(:, j)' * yp * x(:, j);
            end
            yk = A * yp;

            % Normalizez vectorul
            yk = yk / norm(yk);

            l(i) = yk' * A * yk;
            x(:, i) = yk;

            if norm(yk - yp) < tol
                break
            end
            yp = yk;
        end
    end
end
