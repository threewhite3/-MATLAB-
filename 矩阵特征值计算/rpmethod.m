function [l,v,s]=rpmethod(A,x0,eps)
%瑞利商加速幂法求对称矩阵的主特征值及主特征向量
%已知矩阵:A
%迭代初始向量:x0
%迭代的精度:eps
%求得的矩阵特征值:l
%求得的矩阵主特征向量:v
%迭代步数:s
if nargin==2
    eps=1e-6;
end
v=x0;  %v为主特征向量
M=5000;  %迭代步数控制
m=0;
l=0;
for(k=1:M)
    y=A*v;
    m=(y'*v)/(v'*v);  %m为瑞利商
    if(rank(m)>1)
        m=(y*v')/(v*v');
    end
    v=y/m;
    if(abs(m-1)<eps)
        l=m;   %到达精度,退出,l为主特征值
        s=k;
        return;
    else
        if(k==M)
            disp('迭代步数太多,收敛速度太慢!');
            l=m;
            s=M;
        else
            l=m;
        end
    end
end