clear;
clc;
%function ex0101()
x=0:pi/15:2*pi;
y1=0.5*x.^2;
y2=10*sin(x);
plot(x,y1,'r.-',x,y2);  %%y1�õ㻭��
grid                    %%������
xlabel('variable x');   %%x����
ylabel('variable y');   %%y����
title('x^2 and sin(x)');%%����
text(6.2,-5.5,'sin(x)');%%������(6.2,-5.5)��עy2=sinx
text(6.2,16,'x^2');     %%������(6.2,16)��עy1=x^2