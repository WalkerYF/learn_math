function [t, y] = c9_euler_2(f, a, b, ya, M)
    %c9_euler_2 - Description
    %
    % Syntax: E = c9_euler_2(f, a, b, ya, M)
    %
    % Long description
    h = (b - a)/M;
    T = zeros(1, M+1);
    Y = zeros(1, M+1);
    T = a:h:b;
    Y(1)=ya;
    for j = 1:M
        Y(j+1) = Y(j) + h*feval(f, T(j), Y(j));
    end
    t = T';
    y = Y';
end