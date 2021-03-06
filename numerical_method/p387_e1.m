tt = 0:0.01:2;
f = @(t, y)t*t-y;
ff = @(t)-exp(-t) + t.*t - 2*t + 2;
% true value
ye = ff(tt);
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

format long

% second
diff1 = ff(R1(:,1)) - R1(:,2)
diff2 = ff(R2(:,1)) - R2(:,2)
R1(21,2)
R2(41,2)
% third
final_diff1 = abs(ff(2) - R1(21,2))
final_diff2 = abs(ff(2) - R2(41,2))
if (final_diff2 < final_diff1/16)
    disp ( 'true' )
else
    disp ( 'false' )
end
% fourth
plot(R1(:,1), R1(:,2), 'bo', R2(:,1), R2(:,2), 'kx', tt, ye, 'r-');

