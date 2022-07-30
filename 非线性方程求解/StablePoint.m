function [root,n]=StablePoint(f,x0,eps)
%�ò����������������һ�����
%��ʼ��������:x0
%���ľ���:eps
%����ĺ������:root
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
    root=subs(sym(f),findsym(sym(f)),r1)+r1;   %�������Ĺ�ʽ
    tol=abs(root-r1);
end
root=vpa(root,6);