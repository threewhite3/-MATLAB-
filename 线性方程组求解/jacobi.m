function [x,n]=jacobi(A,b,x0,eps,varargin)
%����Jacobi������������Է�����Ax=b�Ľ�
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
    error
    return
elseif nargin==5
    M=varargin{1};
end
D=diag(diag(A));  %��A�ĶԽǾ���
L=-tril(A,-1);    %��A�������Ǿ���
U=-triu(A,1);     %��A�������Ǿ���
B=D\(L+U);
f=D\b;
x=B*x0+f;
n=1;
%��������
while norm(x-x0)>=eps
    x0=x;
    x=B*x0+f;
    n=n+1;
    if(n>=M)
        disp('Warning:��������̫��,���ܲ�����!');
        return;
    end
end

% A=[0.9889 -0.0005 -0.0002;-0.0046 0.9946 0.1177;-0.0002 0.0092 0.9941];
% b=[1 0 1]';
% x0=ones(3,1);
% [x,n]=jacobi(A,b,x0);