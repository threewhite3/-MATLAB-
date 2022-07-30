function [x,n]=twostep(A,b,x0,eps,varargin)
%采用两步迭代法求线性方程组Ax=b的解
%线性方程组的系数矩阵:A
%线性方程组中的常数向量:b
%迭代初始向量:x0
%解的精度控制:eps
%迭代步数控制:varargin
%线性方程组的解:x
%求出所需精度的解实际的迭代步数:n

if nargin==3
    eps=1e-6;
    M=200;
elseif nargin<3
    error;
    return;
elseif nargin==5
    M=varargin{1};
end
D=diag(diag(A));   %求A的对角矩阵
L=-tril(A,-1);     %求A的下三角矩阵
U=-triu(A,1);      %求A的上三角矩阵
B1=(D-L)\U;
B2=(D-U)\L;
f1=(D-L)\b;
f2=(D-U)\b;
x12=B1*x0+f1;
x=B2*x12+f2;
n=1;          %迭代次数
%迭代过程
while norm(x-x0)>=eps
    x0=x;
    x12=B1*x0+f1;
    x=B2*x12+f2;
    n=n+1;
    if(n>=M)
        disp('Warning:迭代次数太多,可能不收敛!');
        return;
    end
end

%A=[4 3 0;3 4 -1;0 -1 4];
%b=[24 30 -24]';
%x0=zeros(3,1);
%[x,n]=twostep(A,b,x0);