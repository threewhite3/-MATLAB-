function l=qrtz(A,M)
%QR�����㷨�����ȫ������ֵ
%��֪����:A
%��������:M
%��õľ�������ֵ:l
for i=1:M
    [q,r]=qr(A);
    A=r*q;
    l=diag(A);
end