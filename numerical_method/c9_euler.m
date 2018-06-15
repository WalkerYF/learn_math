function [t, y] = c9_euler(dydt, tspan, y0, h)
%Eulode - ??????-????
%
% Syntax: [t, y] = Eulode(dydt, tspan, y0, h)
% dydt: the string of the function
% tspan: [ti, tf]
%   the initial and the final value of the independent variable
% y0: f(t0) = y0
% h: (b-a)/h
% 
    ti = tspan(1);
    tf = tspan(2);
    t = (ti:h:tf);
    n = length(t);
    if t(n) < tf
        t(n+1) = tf;
        n = n+1;
    end
    y = y0 * ones(n, 1)
    for i = 1 : n-1
        y(i+1) = y(i) + feval(dydt, t(i), y(i)) * (t(i+1) - t(i));
    end
    disp('     step              t           y')
    k = 1:length(t);
    out = [k; t; y'];
    fprintf('%5d  %15.10f %15.10f\n', out)
end