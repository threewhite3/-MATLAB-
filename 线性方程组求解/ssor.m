function [x,n]=ssor(A,b,x0,w,eps,M)
%���öԳ���γ��ɳڵ�����������Է�����Ax=b�Ľ�
%���Է������ϵ������:A
%���Է������еĳ�������:b
%������ʼ����:x0
%�ɳ�����:w
%��ľ��ȿ���:eps
%������������:M
%���Է�����Ľ�:x
%������辫�ȵĽ�ʵ�ʵĵ�������:n
if nargin==4
    eps=1e-6;
    M=200;
elseif nargin<4
    error;
    return;
elseif nargin==5
    M=200;
end
if(w<=0||w>=2)
    error;
    return;
end
D=diag(diag(A));   %��A�ĶԽǾ���
L=-tril(A,-1);      %��A�������Ǿ���
U=-triu(A,1);       %��A�������Ǿ���
B1=inv(D-L*w)*((1-w)*D+w*U);  %��һ����������
B2=inv(D-U*w)*((1-w)*D+w*L);  %�ڶ�����������
f1=w*inv((D-L*w))*b;
f2=w*inv((D-U*w))*b;
x12=B1*x0+f1;    %��һ�������õ����м�ֵ
x=B2*x12+f2;
n=1;   %��������
%��������
while norm(x-x0)>=eps
    x0=x;
    x12=B1*x0+f1;
    x=B2*x12+f2;
    n=n+1;
    if(n>=M)
        disp('Warning:��������̫��,���ܲ�����!');
        return ;
    end
end

%A=[4 3 0;3 4 -1;0 -1 4];
%b=[24 30 -24]';
%x0=zeros(3,1);
%[x,n]=ssor(A,b,x0,1.25);