function l=qrtz(A,M)
%QR基本算法求矩阵全部特征值
%已知矩阵:A
%迭代步数:M
%求得的矩阵特征值:l
for i=1:M
    [q,r]=qr(A);
    A=r*q;
    l=diag(A);
end