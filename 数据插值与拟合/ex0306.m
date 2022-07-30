clear;
clc;
x=-3:3;
y=[-1 -1 -1 0 1 1 1];
t=-3:0.01:3;
p=pchip(x,y,t);
ppol=spline(x,y);
s=ppval(ppol,t);
plot(x,y,'o',t,p,'-',t,s,'-.');