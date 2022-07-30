function [l,v]=ipmethod(A,x0,eps)
%逆幂法求矩阵按模的最小特征值及其特征向量
%已知矩阵:A
%迭代初始向量:x0
%迭代的精度:eps
%求得的矩阵特征值:l
%求得的矩阵特征值l对应的特征向量:v
if nargin==2
    eps=1e-6;
end
v=x0;     %v按模的最小特征值对应的特征向量
M=5000;    %迭代步数控制
m=0;
l=0;
for(k=1:M)
    y=A\v;
    m=max(y);   %m为按模最大的分量
    v=y/m;
    if(abs(m-l)<eps)
        l=l/m;    %到达精度,退出,l为按模的最小特征值
        return;
    else
        if(k==M)
            disp('迭代步数太多,收敛速度太慢!');
            l=l/m;
        else
            l=m;
        end
    end
end
        