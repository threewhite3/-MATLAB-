function [root,n]=AtKenStablePoint(f,x0,eps)
%�ð��ؿϼ��ٵ���������f��һ�����
%��ʼ��������:x0
%���ľ���:eps
%����������:root
%��������:n

if nargin==2
    eps=1e-4;
end

tol=1;
root=x0;
x(1:2)=0;
n=0;
m=0;
a2=x0;
while tol>eps
    n=n+1;
    a1=a2;
    r1=root;
    root=subs(sym(f),findsym(sym(f)),r1)+r1;
    x(n)=root;
    if n>2
        m=m+1;
        a2=x(m)-(x(m+1)-x(m))^2/(x(m+2)-2*x(m+1)+x(m)); %�Ա���ĸ����а��ؿ�����
        tol=abs(a2-a1);
    end
end
root=vpa(a2,5);