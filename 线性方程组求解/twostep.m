function [x,n]=twostep(A,b,x0,eps,varargin)
%�������������������Է�����Ax=b�Ľ�
%���Է������ϵ������:A
%���Է������еĳ�������:b
%������ʼ����:x0
%��ľ��ȿ���:eps
%������������:varargin
%���Է�����Ľ�:x
%������辫�ȵĽ�ʵ�ʵĵ�������:n

if nargin==3
    eps=1e-6;
    M=200;
elseif nargin<3
    error;
    return;
elseif nargin==5
    M=varargin{1};
end
D=diag(diag(A));   %��A�ĶԽǾ���
L=-tril(A,-1);     %��A�������Ǿ���
U=-triu(A,1);      %��A�������Ǿ���
B1=(D-L)\U;
B2=(D-U)\L;
f1=(D-L)\b;
f2=(D-U)\b;
x12=B1*x0+f1;
x=B2*x12+f2;
n=1;          %��������
%��������
while norm(x-x0)>=eps
    x0=x;
    x12=B1*x0+f1;
    x=B2*x12+f2;
    n=n+1;
    if(n>=M)
        disp('Warning:��������̫��,���ܲ�����!');
        return;
    end
end

%A=[4 3 0;3 4 -1;0 -1 4];
%b=[24 30 -24]';
%x0=zeros(3,1);
%[x,n]=twostep(A,b,x0);