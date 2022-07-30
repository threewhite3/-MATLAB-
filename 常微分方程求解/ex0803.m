%龙格-库塔法相对简单欧拉法和改进欧拉法更接近真值，但是计算时间也变长
clear;
clc;
x0=0;
xt=2;
Num=100;
h=(xt-x0)/(Num-1);
x=x0+[0:Num]*h;
a=1;
yt=1-exp(-a*x);    %真解
fun=inline('-y+1','x','y');   %用inline构造函数f(x,y)
y0=0;
PointNum=4;
[x1,ye]=MyEuler(fun,x0,xt,y0,PointNum);
[x2,yh]=MyEulerPro(fun,x0,xt,y0,PointNum);
[x3,yr]=MyRunge_Kutta(fun,x0,xt,y0,PointNum);
plot(x,yt,'k',x1,ye,'b:',x2,yh,'b+',x3,yr,'r*');
legend('真值','简单得欧拉法解','改进得欧拉解','龙格-库塔解');
hold on;
plot(x1,ye,'bo',x2,yh,'b+',x3,yr,'r*');
PointNum=1000;
tic;   %计时开始
[x1,ye]=MyEuler(fun,x0,xt,y0,PointNum);
time_Euler=toc;    %计时结束，运行简单欧拉法的时间
tic;
[x2,yh]=MyEulerPro(fun,x0,xt,y0,PointNum);
time_EulerPro=toc;   %运行改进欧拉法的时间
tic;
[x3,yr]=MyRunge_Kutta(fun,x0,xt,y0,PointNum);
time_RK=toc;      %运行龙格-库塔法的时间