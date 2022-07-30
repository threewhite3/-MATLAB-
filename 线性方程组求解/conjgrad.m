function [x,n]=conjgrad(A,b,x0)
%采用共轭梯度法求解线性方程组Ax=b的解
%线性方程组的系数矩阵:A
%线性方程组中的常数向量:b
%初始向量:x0
%线性方程组的解:x
%求解所需精度的解实际的搜索步数:n

if(nargin==3)
    eps=1e-6;
end
r1=b-A*x0;
p1=r1;
d=dot(r1,r1)/dot(p1,A*p1);
x=x0+d*p1;
r2=r1-d*A*p1;
f=dot(r2,r2)/dot(r1,r1);
p2=r2+f*p1;
n=1;
for i=1:(rank(A)-1)
    x0=x;
    p1=p2;
    r1=r2;
    d=dot(r1,r1)/dot(p1,A*p1);
    x=x0+d*p1;
    r2=r1-d*A*p1;
    f=dot(r2,r2)/dot(r1,r1);
    p2=r2+f*p1;
    n=n+1;
end
d=dot(r2,r2)/dot(p2,A*p2);
x=x+d*p2;
n=n+1;
end


%A=[25 -300 1050 -1400 630;-300 4800 -18900 26880 -12600;1050 -18900 79380
%-117600 56700;-1400 26880 -117600 179200 -88200;630 -12600 56700 -88200
%44100];
%b=[5 3 -1 0 -2]';
%x0=zeros(5,1);
%[x,n]=conjgrad(A,b,x0);