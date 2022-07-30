function [I,step]=DDTraprl(f,a,b,eps)
%区间逐次分半梯形公式求函数f在区间[a,b]上的定积分
%函数名:f
%积分下限;a
%积分上限:b
%精分精度:eps
%积分值:I
%积分划分的子区间次数:step
if nargin==3
    eps=1e-4;
end
n=1;
h=b-a;
I2=(subs(sym(f),findsym(sym(f)),a)+subs(sym(f),findsym(sym(f)),b))/h/2;
tol=1;
while tol>eps
    n=n+1;
    h=h/2;
    I1=I2;
    I2=0;
    for i=0:(2^n-1)
        x=a+h*i;
        x1=x+h;
        I2=I2+(h/2)*(subs(sym(f),findsym(sym(f)),x)+...
            subs(sym(f),findsym(sym(f)),x1));   %梯形公式
    end
    tol=abs(I2-I1);
end
I=vpa(I2,5);
step=n;