function [I,step]=CombineTraprl(f,a,b,eps)
%复合梯形公式求函数f在区间[a,b]上的定积分
%函数名:f
%积分下限:a
%积分上限:b
%积分精度:eps
%积分值:I
%积分划分的子区间的个数:step
if nargin==3
    eps=1e-4;
end

n=1;
h=(b-a)/2;
I1=0;
I2=(subs(sym(f),findsym(sym(f)),a)+subs(sym(f),findsym(sym(f)),b))/h;
while abs(I2-I1)>eps
    n=n+1;
    h=(b-a)/n;
    I1=I2;
    I2=0;
    for i=0:n-1         %第n次复合梯形公式积分
        x=a+h*i;        %i=0和n-1时,分别代表积分的左右端点
        x1=x+h;
        I2=I2+(h/2)*(subs(sym(f),findsym(sym(f)),x)+subs(sym(f),findsym(sym(f)),x1));
    end
end

I=vpa(I2,4);
step=n;