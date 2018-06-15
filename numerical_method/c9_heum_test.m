% ????368??
f = @(t,y)(t-y)/2;
a = 0;
b = 3;
ya = 1;
h = 0.25;
M = (b-a)/h;
result = c9_heum(f, a, b, ya, M)
