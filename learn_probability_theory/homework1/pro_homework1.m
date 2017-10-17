% 概率论第一次matlab作业
% 10月13号
% 请用matlab 编程语言实现求解下列问题，设随机变量X~N(2, 0.25),
% (1) 求概率P{0.5<X<2.5};
% (2) 绘制分布函数图和分布密度图;
% (3) 画出区间[1.5, 1.9] 上的分布密度曲线下方区域。

% 第一题
normspec([0.5,2.5],2,0.5)

% 第二题

% 概率密度函数图
figure
x = 0:0.01:4;
y1 = normpdf(x, 2, 0.5);
plot(x, y1, 'r');
title('数学期望为2，方差为0.25的正态分布的概率密度函数图');
xlabel('随机变量X的取值');
ylabel('概率密度');

% 分布函数图
figure
y2 = normcdf(x, 2, 0.5);
plot(x, y2)
title('数学期望为2，方差为0.25的正态分布的分布函数图');
xlabel('随机变量X的取值');
ylabel('P{X <= x}');

% 第三题
% 画出区间[1.5, 1.9] 上的分布密度曲线下方区域。

figure
x = 1:0.01:3;
x3 = 1.5:0.01:1.9;
y = normpdf(x, 2, 0.5);
y3 = normpdf(x3, 2, 0.5);
plot(x, y) % 先画出原有的图像
hold on % 切换状态
area(x3, y3) % 在原有的图像上叠加
title('区间[1.5, 1.9] 上的概率密度曲线下方区域');
xlabel('随机变量X');