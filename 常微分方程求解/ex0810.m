clear;
clc;
A=[1,-0.7,-0.6,1];  %A系数向量
B=[1,0.5];   %B系数向量
n=[-9:9];  %作图的脉冲响应长度
x=[zeros(1,5),ones(1,8),zeros(1,6)];
y=filter(B,A,x);   %求得脉冲响应
subplot(211);
stem(n,x);   %作图
grid on;
title('输入响应');
subplot(212);
stem(n,y);   %作图
grid on;
title('输出响应');
