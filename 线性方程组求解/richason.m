function [x,n]=richason(A,b,x0,eps,M)
%采用里查森迭代法求解线性方程组Ax=b的解
%线性方程组的系数矩阵:A
%线性方程组的常数向量:b
%迭代初始向量:x0
%解的精度控制:eps
%迭代步数控制:M
%线性方程组的解:x
%求出所需精度的解实际的迭代步数:n
if(nargin==3)
    eps=1e-6;
    M=200;
elseif(nargin==4)
    M=200;
end
I=eye(size(A));  %返回和A一样大的单位矩阵
x1=x0;
x=(I-A).*x0+b;
n=1;
%迭代过程
while(norm(x-x1)>eps)  %norm(x-x1)返回x-x1的2范数
    x1=x;
    x=(I-A).*x1+b;
    n=n+1;
    if(n>=M)
        disp('Warning:迭代次数太多,可能不收敛!');   %disp()函数将内容直接输出
        return;
    end
end

% A=[1.017 -0.0092 -0.0095;-0.0092 0.9903 0.0136;-0.0095 0.0136 0.9898];
% b=[1 0 1]';
% x0=[0 0 0];
% [x,n]=richason(A,b,x0)