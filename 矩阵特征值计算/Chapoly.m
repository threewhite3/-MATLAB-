function l=Chapoly(A)
%特征多项式法求矩阵多项式
%已知矩阵:A
%求得的矩阵特征值:1

syms t;
N=size(A);
n=N(1,1);
y=det(A-t*eye(n,n));
l=solve(y);

l=vpa(l,5);   %结果取五位精度
