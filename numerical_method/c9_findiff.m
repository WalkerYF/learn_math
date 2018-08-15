function F = c9_findiff( p,q,r,a,b,alpha,beta,N )
%C9_FINDIFF Summary of this function goes here
%   Detailed explanation goes here
T = zeros(1,N+1);
X = zeros(1,N-1);
Va = zeros(1, N-2);
Vb = zeros(1, N-1);
Vc = zeros(1, N-2);
Vd = zeros(1, N-1);
h = (b-a)/N;

Vt = a+h:h:a+h*(N-1);
Vb = -h^2*feval(r,Vt);
Vb(1) = Vb(1) + (1+h/2*feval(p, Vt(1)))*alpha;
Vb(N-1) = Vb(N-1) + (1-h/2*feval(p, Vt(N-1)))*beta;

Vd = 2+h^2*feval(q, Vt);

Vta = Vt(1, 2:N-1);
Va = -1-h/2*feval(p, Vta);

Vtc = Vt(1, 1:N-2);
Vc = -1+h/2*feval(p, Vtc);

X = c9_trisys(Va, Vd, Vc, Vb);
T = [a, Vt, b];
X = [alpha, X, beta];
F = [T' X'];
end

