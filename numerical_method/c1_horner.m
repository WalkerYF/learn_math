function [b1]=c1_horner(a,c,n)
% c : the x of the polynomial
% a : the coefficient of th polynomial 从低次数到高次数
    b(n) = a(n);
    for k = n-1 : -1 : 1
        b(k) = a(k)+c*b(k+1);
    end
    b1 = b(1)