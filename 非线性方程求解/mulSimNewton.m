function [r,n]=mulSimNewton(x0,eps)
%简化牛顿迭代法求非线性方程组的一个解
%初始迭代向量:x0
%迭代的精度:eps
%解向量:r
%迭代步数:n

if nargin==1
    eps=1e-4;
end

r=x0-myf(x0)/dmyf(x0);
c=dmyf(x0);
n=1;
tol=1;
while tol>eps
    x0=r;
    r=x0-myf(x0)/c;   %迭代公式
    tol=norm(r-x0);   %矩阵的误差,norm为矩阵的欧几里得范数
    n=n+1;
    if n>100000   %迭代步数控制
        disp('迭代步数太多,可能不收敛!');
        return;
    end
end
end