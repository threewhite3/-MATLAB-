function [root,n]=StevenStablePoint(f,x0,eps)
%��ʷ�ٷҼ��ٵ���������f��һ�����
%��ʼ��������:x0
%���ľ���:eps
%����������:root
%��������:n

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