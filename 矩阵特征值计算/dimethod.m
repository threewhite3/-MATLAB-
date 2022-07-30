function [l,v]=dimethod(A,x0,u,eps)
%位移逆幂法求矩阵离某个常数最近的特征值及其对应的特征向量
%已知矩阵:A
%迭代初始向量:x0
%常数:u
%迭代的精度:eps
%求得的矩阵离u最近的特征值:l
%求得的矩阵的特征值l对应的特征向量:v
if nargin==3
    eps=1e-6;
end
N=size(A);
n=N(1,1);   %n为A的阶
v=x0;
M=5000;
m=0;
l=0;
for(k=1:M)
    y=(A-u*eye(n,n))\v;
    m=max(y);
    v=y/m;
    if(abs(m-1)<eps)
        l=l/m+u;
        return;
    else
        if(k==M)
            disp('迭代步数太多,收敛速度太慢!');
            l=l/m+u;
        else
            l=m;
        end
    end
end