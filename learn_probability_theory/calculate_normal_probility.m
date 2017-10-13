function [ pro ] = calculate_normal_probility(range, miu, sigma)
% input: the argument of normal distribution and the range 
% mu sigma left right
% �������ض������µ���̬�ֲ������������ĳһ��Χ�ĸ���
% normspec���� �Լ���һ������
range(1,1)  ~ range(1,2)
f = (sqrt(2*pi)*sigma).^(-1) * exp(-(x-miu).^2/(2*sigma*sigma));

int(f, 
end
