function [ pro ] = calculate_normal_probility(range, miu, sigma)
% input: the argument of normal distribution and the range 
% mu sigma left right
% 计算在特定参数下的正态分布，随机变量在某一范围的概率
% normspec函数 自己造一个轮子
range(1,1)  ~ range(1,2)
f = (sqrt(2*pi)*sigma).^(-1) * exp(-(x-miu).^2/(2*sigma*sigma));

int(f, 
end
