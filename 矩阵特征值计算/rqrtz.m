function l=rqrtz(A,M)
%������λ�Ƶ�QR�㷨�����ȫ������ֵ
%��֪����:A
%��������:M
%��õľ�������ֵ:l
A=hess(A);
for i=1:M
    N=size(A);
    n=N(1,1);
    u=A(n,n);
    [q,r]=qr(A-u*eye(n,n));
    A=r*q+u*eye(n,n);
    l=diag(A);
end