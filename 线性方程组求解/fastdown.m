function [x,n]=fastdown(A,b,x0,eps)
%采用最速下降法求线性方程组Ax=b的解
%线性方程组的系数矩阵:A
%线性方程组中的常数向量:b
%初始向量:x0
%解的精度控制:eps
%线性方程组的解:x
%求出所需精度的解实际的搜索步数:n

if(nargin==3)
    eps=1e-6;
end
r=b-A*x0;
d=dot(r,r)/dot(A*r,r);
x=x0+d*r;
n=1;
%迭代过程
while(norm(x-x0)>eps)
    x0=x;
    r=b-A*x0;
    d=dot(r,r)/dot(A*r,r);
    x=x0+d*r;
    n=n+1;
end

%A=[1 0.5 0.3333 0.25;0.5 0.3333 0.25 0.2; 0.3333 0.25 0.2 0.1667;0.25 0.2
%0.1667 0.1429];
%b=[1 0 1 0]';
%x0=[1 1 1 1]';    %迭代初始值
%[x,n]=fastdown(A,b,x0);