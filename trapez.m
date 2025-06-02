function [T] = trapez(f, a, b, n)
    h = (b - a) / n;
    x = a + h : h : b - h;
    T = h * (feval(f, a) / 2 + feval(f, b) / 2 + sum(feval(f, x)));
end
