function l=Chapoly(A)
%��������ʽ����������ʽ
%��֪����:A
%��õľ�������ֵ:1

syms t;
N=size(A);
n=N(1,1);
y=det(A-t*eye(n,n));
l=solve(y);

l=vpa(l,5);   %���ȡ��λ����
