function l=hessqrtz(A,M)
%��ɭ����QR�㷨�����ȫ������ֵ
%��֪����:A 
%��������:M
%��õľ�������ֵ:l
A=hess(A);  %��A��Ϊ��ɭ�������
for i=1:M
    [q,r]=qr(A);
    A=r*q;
    l=diag(A);
end
