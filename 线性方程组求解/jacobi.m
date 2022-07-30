function [x,n]=jacobi(A,b,x0,eps,varargin)
%采用Jacobi迭代法求解线性方程组Ax=b的解
%线性方程组的系数矩阵:A
%线性方程组中的常数常量:b
%迭代初始向量:x0
%解的精度控制:eps
%迭代步数控制:varargin
%线性方程组的解:x
%求出所需精度的解实际的迭代步数:n
if nargin==3
    eps=1e-6;
    M=200;
elseif nargin<3
    error
    return
elseif nargin==5
    M=varargin{1};
end
D=diag(diag(A));  %求A的对角矩阵
L=-tril(A,-1);    %求A的下三角矩阵
U=-triu(A,1);     %求A的上三角矩阵
B=D\(L+U);
f=D\b;
x=B*x0+f;
n=1;
%迭代过程
while norm(x-x0)>=eps
    x0=x;
    x=B*x0+f;
    n=n+1;
    if(n>=M)
        disp('Warning:迭代次数太多,可能不收敛!');
        return;
    end
end

% A=[0.9889 -0.0005 -0.0002;-0.0046 0.9946 0.1177;-0.0002 0.0092 0.9941];
% b=[1 0 1]';
% x0=ones(3,1);
% [x,n]=jacobi(A,b,x0);