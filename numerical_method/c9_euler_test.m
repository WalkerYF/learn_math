tt = 0:0.01*pi:pi;
f=inline('-y+sin(t)', 't', 'y')
ye = 1.5 * exp(-tt) + 0.5 * sin(tt) - 0.5*cos(tt);
%[t, y] = c9_euler(f, [0 pi], 1, 0.1*pi);
[t, y] = c9_euler_2(f, 0, pi, 1, 10);
plot(t, y, 'r-o', tt, ye, 'LineWidth', 3, 'markerSize', 12);
