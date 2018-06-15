function H = c9_heum( f, a, b, ya, M )
%C9_HEUM Summary of this function goes here
%   Detailed explanation goes here

    h = (b-a)/M;
    T = zeros(1, M+1);
    Y = zeros(1, M+1);
    T = a:h:b;
    Y(1) = ya;
    for j = 1:M
           k1 = feval(f, T(j), Y(j));
           k2 = feval(f, T(j+1), Y(j)+h*k1);
           Y(j+1) = Y(j) + h * (k1+k2) /2;
    end
    H = [ T' Y'];
end


