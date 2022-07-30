function [r,n]=mulSimNewton(x0,eps)
%��ţ�ٵ�����������Է������һ����
%��ʼ��������:x0
%�����ľ���:eps
%������:r
%��������:n

if nargin==1
    eps=1e-4;
end

r=x0-myf(x0)/dmyf(x0);
c=dmyf(x0);
n=1;
tol=1;
while tol>eps
    x0=r;
    r=x0-myf(x0)/c;   %������ʽ
    tol=norm(r-x0);   %��������,normΪ�����ŷ����÷���
    n=n+1;
    if n>100000   %������������
        disp('��������̫��,���ܲ�����!');
        return;
    end
end
end