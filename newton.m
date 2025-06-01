function yp = newton(x, y, xp)
    n = size(M)(1);
    dif_div = zeros(n,n);
    for i = [1 : n]
        dif_div(i, i) = y(i);
    end
    for dj = [1 : n-1]
        for i = [1 : n-dj]
            j = i + dj;
            dif_div(i,j) = (dif_div(i+1,j) - dif_div(i,j-1));
            dif_div(i,j) /= (x(j) - x(i));
        end
    end
    yp = dif_div(1, 1);
    p = 1;
    for k = [2 : n]
        p = p * (xp - x(k-1));
        yp = yp + p * dif_div(1, k);
    end
end
