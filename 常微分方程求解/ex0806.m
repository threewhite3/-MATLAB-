clear;
clc
x0=0;   %积分区域开始值
xt=10;   %积分区域终止值
y0=0;   %y初值
N=50;   %离散点数
fun66=inline('-y+1','x','y');   %需要求解的微分方程
f66=inline('1-exp(-t)','t');   %方程的精确解析解
tic
[x113,y113]=ode113(fun66,[x0,xt],y0);
t113=toc;
tic;
[x1,yH]=MyHamming(fun66,x0,xt,y0,N);
tH=toc;
yt1=f66(x1);    %在精确解上取离散点
subplot(1,2,1);   %将窗口分为一行两列,在第一个图中作出各种方法的解的曲线
plot(x1,yt1,'*r',x1,yH,'og');
legend('精确解','Hamming解');
yt113=f66(x113);
subplot(1,2,2);
plot(x113,yt113,'*r',x113,y113,'og');
legend('精确解','ABM解');
title('ode113即ABM算法所得的解')