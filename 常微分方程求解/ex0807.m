clear;
clc;
x0=1;
xt=10;
y0=[1 10 30];
N=100;
[x,yE]=MyEulerPro('Myfun03',x0,xt,y0,N);    %%改进欧拉方法
[x,yR]=MyRunge_Kutta('Myfun03',x0,xt,y0,N);  %龙格-库塔方法
plot(x,yE(:,1),'r-',x,yR(:,1),'-g');
legend('改进欧拉方法','龙格-库塔方法');