function yp = neville(x, y, xp)
    yp = neville_rec(x, y, xp, 1, length(x));
end

function yp = neville_rec(x, y, xp, i, j)
    if i == j
        yp = y(i);
    else
        p1 = neville_rec(x, y, xp, i, j - 1);
        p2 = neville_rec(x, y, xp, i+1, j);
        yp = ((xp - x(j)) * p1 + (xp - x(i)) * p2) / (x(i) - x(j));
    end
end
