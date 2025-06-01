function [T] = trapez(f, a, b, n)
    h = (b - a) / n;
    x = a + h : h : b - h;
    T = h * feval(f, a) + feval(f, b) + sum(feval(f, x));
end
