function [r,n]=mulSimNewton(x0,eps)
%ţ����ɽ������������Է������һ����
%��ʼ��������:x0
%�����ľ���:eps
%������:r
%��������:n

if nargin==1
    eps=1e-4;
end

r=x0-myf(x0)/dmyf(x0);
n=1;
tol=1;
while tol>eps
    x0=r;
    ttol=1;
    w=1;
    F1=norm(myf(x0));
    while ttol>=0
        r=x0-w*myf(x0)/dmyf(x0);   %������ʽ
        ttol=norm(myf(r))-F1;   
        w=w/2;
    end
    tol=norm(r-x0);
    n=n+1;
    if n>100000   %������������
        disp('��������̫��,���ܲ�����!');
        return;
    end
end
end