% tt = 0:0.01*pi:pi;
% f=inline('-y+sin(t)', 't', 'y')
% % true value
% ye = 1.5 * exp(-tt) + 0.5 * sin(tt) - 0.5*cos(tt);
% a = 0;
% b = 3;
% ya = 1;
% h = 0.25;
% M = (b-a)/h;
% R = c9_rk4(f, a, b, ya, M)

% plot(R(:,1), R(:,2), 'r-o', tt, ye, 'LineWidth', 3, 'markerSize', 12);

tt = 0:0.01:2;
f = @(t, y)t*t-y;
% true value
ye = -exp(-tt)+tt.*tt-2*tt+2;
a = 0;
h = 0.1;
M = 20;
b = a + M * h;
ya = 1;
R1 = c9_rk4(f, a, b, ya, M)

a = 0;
h = 0.05;
M = 40;
b = a + M * h;
ya = 1;
R2 = c9_rk4(f, a, b, ya, M)


plot(R1(:,1), R1(:,2), 'bo', R2(:,1), R2(:,2), 'kx', tt, ye, 'r-');

