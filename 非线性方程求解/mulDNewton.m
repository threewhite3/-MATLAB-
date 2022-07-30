function [r,n]=mulSimNewton(x0,eps)
%牛顿下山迭代法求非线性方程组的一个解
%初始迭代向量:x0
%迭代的精度:eps
%解向量:r
%迭代步数:n

if nargin==1
    eps=1e-4;
end

r=x0-myf(x0)/dmyf(x0);
n=1;
tol=1;
while tol>eps
    x0=r;
    ttol=1;
    w=1;
    F1=norm(myf(x0));
    while ttol>=0
        r=x0-w*myf(x0)/dmyf(x0);   %迭代公式
        ttol=norm(myf(r))-F1;   
        w=w/2;
    end
    tol=norm(r-x0);
    n=n+1;
    if n>100000   %迭代步数控制
        disp('迭代步数太多,可能不收敛!');
        return;
    end
end
end