p =@(t) 2;
q =@(t) -1;
r =@(t)t.*t-1;
a = 0;
b = 1;
alpha = 5;
beta = 10;
N = 5;
F = c9_findiff(p,q,r,a,b,alpha,beta,N);
F
