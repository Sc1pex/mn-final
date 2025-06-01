function yps = langrange_inef(x, y, xps)
    n = length(xps);
    yps = zeros(n);
    for i = 1:n
        yps(i) = langrange_inef_single(x, y, xps(i));
    end
end

function yp = langrange_inef_single(x, y, xp)
    n = length(x);
    yp = 0;
    for i = 1:n
        l = 1;
        for j = 1:n
            if j == i
                continue;
            end

            l = l * ((xp - x(j)) / (x(i) - x(j)));
        end
        yp = yp + l * y(i);
    end
end
