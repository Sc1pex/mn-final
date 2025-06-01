function I = cuad_adapt(f, a, b, tol)
    m = (a + b) / 2;
    i1 = simpson_simplu(f, a, b);
    i2 = simpson_simplu(f, a, m) + simpson_simplu(f, m, b);
    if abs(i1 - i2) < 15 * tol
        I = i2 + (i2 - i1)/15;
    else
        I = cuad_adapt(f, a, m, tol / 2) + cuad_adapt(f, m, b, tol / 2);
    end
end

function I = simpson_simplu(f, a, b)
    I = (b - a) * (f(a) + 4 * f((a+b)/2) + f(b)) / 6;
end
