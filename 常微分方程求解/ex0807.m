clear;
clc;
x0=1;
xt=10;
y0=[1 10 30];
N=100;
[x,yE]=MyEulerPro('Myfun03',x0,xt,y0,N);    %%�Ľ�ŷ������
[x,yR]=MyRunge_Kutta('Myfun03',x0,xt,y0,N);  %����-��������
plot(x,yE(:,1),'r-',x,yR(:,1),'-g');
legend('�Ľ�ŷ������','����-��������');