clear;
clc;
A=[1,-0.7,-0.6,1];  %Aϵ������
B=[1,0.5];   %Bϵ������
n=[-9:9];  %��ͼ��������Ӧ����
x=[zeros(1,5),ones(1,8),zeros(1,6)];
y=filter(B,A,x);   %���������Ӧ
subplot(211);
stem(n,x);   %��ͼ
grid on;
title('������Ӧ');
subplot(212);
stem(n,y);   %��ͼ
grid on;
title('�����Ӧ');
