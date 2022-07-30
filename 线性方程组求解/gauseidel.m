function [x,n]=gauseidel(A,b,x0,eps,M)
%����Gause-Seidel������������Է�����Ax=b�Ľ�
%���Է������ϡ�����:A
%���Է������еĳ�������:b
%������ʼ����:x0
%��ľ��ȿ���:eps
%������������:M
%���Է�����Ľ�:x
%������辫�ȵĽ�ʵ�ʵĵ�������:n

if nargin==3
    eps=1e-6;
    M=200;
elseif nargin==4
    M=200;
elseif nargin<3
    error;
    return
end
D=diag(diag(A));   %��A�ĶԽǾ���
L=-tril(A,-1);     %��A����������
U=-triu(A,1);      %��A����������
G=(D-L)\U;
f=(D-L)\b;
x=G*x0+f;          %��������
n=1;
%%��������
while norm(x-x0)>=eps
    x0=x;
    x=G*x0+f;
    n=n+1;
    if(n>=M)
        disp('Warning:��������̫��,���ܲ�����!');
        return;
    end
end

% A=[1.4449 0.7948 0.8801;0.6946 1.9568 0.173;0.6213 0.5226 1.9797];
% b=[1 0 1]';
% x0=zeros(3,1);
% [x,n]=gauseidel(A,b,x0);