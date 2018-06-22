tt = 0:0.01*pi:pi;
f=inline('-y+sin(t)', 't', 'y')
% true value
ye = 1.5 * exp(-tt) + 0.5 * sin(tt) - 0.5*cos(tt);
a = 0;
b = 3;
ya = 1;
h = 0.25;
M = (b-a)/h;
R = c9_rk4(f, a, b, ya, M)

plot(R(:,1), R(:,2), 'r-o', tt, ye, 'LineWidth', 3, 'markerSize', 12);