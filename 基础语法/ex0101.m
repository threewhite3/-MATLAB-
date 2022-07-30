clear;
clc;
%function ex0101()
x=0:pi/15:2*pi;
y1=0.5*x.^2;
y2=10*sin(x);
plot(x,y1,'r.-',x,y2);  %%y1用点画线
grid                    %%网格线
xlabel('variable x');   %%x坐标
ylabel('variable y');   %%y坐标
title('x^2 and sin(x)');%%标题
text(6.2,-5.5,'sin(x)');%%在坐标(6.2,-5.5)标注y2=sinx
text(6.2,16,'x^2');     %%在坐标(6.2,16)标注y1=x^2