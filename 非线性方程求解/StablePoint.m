function [root,n]=StablePoint(f,x0,eps)
%用不动点迭代法求函数的一个零点
%初始迭代向量:x0
%根的精度:eps
%求出的函数零点:root
%迭代步数:n

if nargin==2
    eps=1e-4;
end
tol=1;
root=x0;
n=0;
while tol>eps
    n=n+1;
    r1=root;
    root=subs(sym(f),findsym(sym(f)),r1)+r1;   %迭代核心公式
    tol=abs(root-r1);
end
root=vpa(root,6);