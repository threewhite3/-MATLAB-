%����-��������Լ�ŷ�����͸Ľ�ŷ�������ӽ���ֵ�����Ǽ���ʱ��Ҳ�䳤
clear;
clc;
x0=0;
xt=2;
Num=100;
h=(xt-x0)/(Num-1);
x=x0+[0:Num]*h;
a=1;
yt=1-exp(-a*x);    %���
fun=inline('-y+1','x','y');   %��inline���캯��f(x,y)
y0=0;
PointNum=4;
[x1,ye]=MyEuler(fun,x0,xt,y0,PointNum);
[x2,yh]=MyEulerPro(fun,x0,xt,y0,PointNum);
[x3,yr]=MyRunge_Kutta(fun,x0,xt,y0,PointNum);
plot(x,yt,'k',x1,ye,'b:',x2,yh,'b+',x3,yr,'r*');
legend('��ֵ','�򵥵�ŷ������','�Ľ���ŷ����','����-������');
hold on;
plot(x1,ye,'bo',x2,yh,'b+',x3,yr,'r*');
PointNum=1000;
tic;   %��ʱ��ʼ
[x1,ye]=MyEuler(fun,x0,xt,y0,PointNum);
time_Euler=toc;    %��ʱ���������м�ŷ������ʱ��
tic;
[x2,yh]=MyEulerPro(fun,x0,xt,y0,PointNum);
time_EulerPro=toc;   %���иĽ�ŷ������ʱ��
tic;
[x3,yr]=MyRunge_Kutta(fun,x0,xt,y0,PointNum);
time_RK=toc;      %��������-��������ʱ��