function X = c9_trisys( A,D,C,B )
%C9_TRISYS Summary of this function goes here
%   Detailed explanation goes here
A,B,C,D
N = length(B);
for k = 2:N
    mult = A(k-1)/D(k-1);
    D(k) = D(k) - mult*C(k-1);
    B(k) = B(k) - mult*B(k-1);
end
X(N) = B(N)/D(N);
for k = N-1:-1:1
    X(k) = (B(k)-C(k)*X(k+1))/D(k);
end

end

