function [root,n]=StevenStablePoint(f,x0,eps)
%用史蒂芬加速迭代法求函数f的一个零点
%初始迭代向量:x0
%根的精度:eps
%求出函数零点:root
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
    y=subs(sym(f),findsym(sym(f)),r1)+r1;
    z=subs(sym(f),findsym(sym(f)),y)+y;
    root=r1-(y-r1)^2/(z-2*y+r1);
    tol=abs(root-r1);
end
root=vpa(root,6);