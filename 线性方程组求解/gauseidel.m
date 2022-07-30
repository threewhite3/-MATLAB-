function [x,n]=gauseidel(A,b,x0,eps,M)
%采用Gause-Seidel迭代法求解线性方程组Ax=b的解
%线性方程组的稀疏矩阵:A
%线性方程组中的常数向量:b
%迭代初始向量:x0
%解的精度控制:eps
%迭代步数控制:M
%线性方程组的解:x
%求出所需精度的解实际的迭代步数:n

if nargin==3
    eps=1e-6;
    M=200;
elseif nargin==4
    M=200;
elseif nargin<3
    error;
    return
end
D=diag(diag(A));   %求A的对角矩阵
L=-tril(A,-1);     %求A的下三角阵
U=-triu(A,1);      %求A的上三角阵
G=(D-L)\U;
f=(D-L)\b;
x=G*x0+f;          %迭代次数
n=1;
%%迭代过程
while norm(x-x0)>=eps
    x0=x;
    x=G*x0+f;
    n=n+1;
    if(n>=M)
        disp('Warning:迭代次数太多,可能不收敛!');
        return;
    end
end

% A=[1.4449 0.7948 0.8801;0.6946 1.9568 0.173;0.6213 0.5226 1.9797];
% b=[1 0 1]';
% x0=zeros(3,1);
% [x,n]=gauseidel(A,b,x0);