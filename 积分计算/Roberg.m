function [I,step]=Roberg(f,a,b,eps)
%龙贝格积分法求函数f在区间[a,b]上的定积分
%函数名:f
%积分下限:a
%积分上限:b
%积分精度:eps
%积分值:I
%积分划分的子区间次数:step

if nargin==3
    eps=1e-4;
end
M=1;
tol=10;
k=0;
T=zeros(1,1);
h=b-a;
T(1,1)=(h/2)*(subs(sym(f),findsym(sym(f)),a)+subs(sym(f),findsym(sym(f)),b)); %初始值
while tol>eps
    k=k+1;
    h=h/2;
    Q=0;
    for i=1:M
        x=a+h*(2*i-1);
        Q=Q+subs(sym(f),findsym(sym(f)),x);
    end
    T(k+1,1)=T(k,1)/2+h*Q;
    M=M*2;
    for j=1:k
        T(k+1,j+1)=T(k+1,j)+(T(k+1,j)-T(k,j))/(4^j-1);
    end
    tol=abs(T(k+1,j+1)-T(k,j));
end
I=T(k+1,k+1);
I=vpa(I,5);
step=k;