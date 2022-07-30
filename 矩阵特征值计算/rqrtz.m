function l=rqrtz(A,M)
%瑞丽商位移的QR算法求矩阵全部特征值
%已知矩阵:A
%迭代步数:M
%求得的矩阵特征值:l
A=hess(A);
for i=1:M
    N=size(A);
    n=N(1,1);
    u=A(n,n);
    [q,r]=qr(A-u*eye(n,n));
    A=r*q+u*eye(n,n);
    l=diag(A);
end