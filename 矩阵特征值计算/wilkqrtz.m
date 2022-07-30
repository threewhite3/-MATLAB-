function l=wilkqrtz(A,M)
%ά����ɭλ�Ƶ�QR�㷨�����ȫ������ֵ
%��֪����:A
%��������:M
%��õľ�������ֵ:l
A=hess(A);
for i=1:M
    N=size(A);
    n=N(1,1);
    A1=A((n-1):n,(n-1):n);
    t=Chapoly(A1);
    if(imag(t(1,1))==0&&imag(t(2,1))==0)
        if(abs(t(1,1)-A(n,n))<abs(t(1,1)-A(n,n)))
            u=t(1,1);
        else
            u=t(2,1);
        end
    else
        u=A(n,n);
    end
    [q,r]=qr(A-u*eye(n,n));
    A=r*q+u*eye(n,n);
    l=diag(A);
end