function [r,n]=mulStablePoint(x0,eps)
%�����������������Է������һ����
%��ʼ��������:x0
%�����ľ���:eps
%������:r
%��������:n

if nargin==1
    eps=1e-4;
end

r=myf(x0);
n=1;
tol=1;
while tol>eps
    x0=r;
    r=myf(x0);   %������ʽ
    tol=norm(r-x0);   %��������,normΪ�����ŷ����÷���
    n=n+1;
    if n>100000   %������������
        disp('��������̫��,���ܲ�����!');
        return;
    end
end
end


function f=myf(x)
f(1)=0.5*sin(x(1))+0.1*cos(x(2)*x(1))-x(1);
f(2)=0.5*cos(x(1))-0.1*sin(x(2))-x(2);
end