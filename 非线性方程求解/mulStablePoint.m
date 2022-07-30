function [r,n]=mulStablePoint(x0,eps)
%不动点迭代法求非线性方程组的一个解
%初始迭代向量:x0
%迭代的精度:eps
%解向量:r
%迭代步数:n

if nargin==1
    eps=1e-4;
end

r=myf(x0);
n=1;
tol=1;
while tol>eps
    x0=r;
    r=myf(x0);   %迭代公式
    tol=norm(r-x0);   %矩阵的误差,norm为矩阵的欧几里得范数
    n=n+1;
    if n>100000   %迭代步数控制
        disp('迭代步数太多,可能不收敛!');
        return;
    end
end
end


function f=myf(x)
f(1)=0.5*sin(x(1))+0.1*cos(x(2)*x(1))-x(1);
f(2)=0.5*cos(x(1))-0.1*sin(x(2))-x(2);
end