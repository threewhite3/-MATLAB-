function x=followup(A,b)
%����׷�Ϸ�������Է�����Ax=b�Ľ�
%���Է�����ϵ������:A
%���Է����鳣������:b
%���Է�����Ľ�:x

n=rank(A);
for i=1:n
    if(A(i,i)==0)
        disp('Error:�Խ�Ԫ����0!!!');
        return;
    end
end;
d=ones(n,1);
a=ones(n-1,1);
c=ones(n-1);
for i=1:n-1
    a(i,1)=A(i+1,i);
    c(i,1)=A(i,i+1);
    d(i,1)=A(i,i);
end
d(n,1)=A(n,n);
%���Ly=b�Ľ�y,�Ᵽ����b��
for i=2:n
    d(i,1)=d(i,1)-(a(i-1,1)/d(i-1,1))*c(i-1,1);
    b(i,1)=b(i,1)-(a(i-1,1)/d(i-1,1))*b(i-1,1);
end
%���Ux=y�Ľ�x
x(n,1)=b(n,1)/d(n,1);
for i=n-1:-1:1
    x(i,1)=(b(i,1)-c(i,1)*x(i+1,1))/d(i,1);
end

%A=[2.5 1 0 0 0 0;1 1.5 1 0 0 0;0 1 0.5 1 0 0;0 0 1 0.5 1 0;0 0 0 1 0.5 1;0
%0 0 0 1 2.5];
%b=[1 1 1 1 1 1]';
%x=followup(A,b);