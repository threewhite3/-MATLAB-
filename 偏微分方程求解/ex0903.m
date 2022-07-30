clear;
clc;
A=0.5;          %方程系数
it0=inline('sin(pi*x)','x');   %初始条件
bx0=inline('0');     %边界条件
bxf=inline('0');
xf=2;
T=0.1;
N=100;

M=80;
[u1 x t]=EF_Euler(A,xf,T,it0,bx0,bxf,M,N);
figure(1);
clf,mesh(t,x,u1);
xlabel('t');
xlabel('x');
xlabel('u1');
title('r>0.5');

M=50;
[u2 x t]=EF_Euler(A,xf,T,it0,bx0,bxf,M,N);
figure(2);
clf,mesh(t,x,u2);
xlabel('t');
xlabel('x');
xlabel('u2');
title('r<0.5');