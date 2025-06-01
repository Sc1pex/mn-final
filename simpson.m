function [T] = simpson(f, a, b, n)
    h = (b - a) / (n * 2);
    i1 = 1:n;
    i2 = 1:(n-1);
    T = (feval(f, a) + feval(f, b));
    T = T + 4 * sum(feval(f, a + (2 * i1 - 1) * h));
    T = T + 2 * sum(feval(f, a + (2 * i2) * h));
    T = T * h / 3;
end
