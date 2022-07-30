function [I,step]=DDBuer(f,a,b,eps)
%区间逐次分半布尔公式求函数f在区间[a,b]上的定积分
%函数名:f
%积分下限:a
%积分上限:b
%积分精度:eps
%积分值:I
%积分划分的子区间次数:step

if nargin==3
    eps=1e-4;
end
n=1;
h=b-a;
I1=0;
I2=(subs(sym(f),findsym(sym(f)),a)+subs(sym(f),findsym(sym(f)),b))/2/h;
tol=1;
while tol>eps
    n=n+1;
    h=h/4;
    I1=I2;
    I2=0;
    for i=0:(4^(n-1)-1)
        x=a+h*4*i;
        x1=x+h;
        x2=x1+h;
        x3=x2+h;
        x4=x3+h;
        I2=I2+(2*h/45)*(7*subs(sym(f),findsym(sym(f)),x)+...
            32*subs(sym(f),findsym(sym(f)),x1)+...
            12*subs(sym(f),findsym(sym(f)),x2)+...
            32*subs(sym(f),findsym(sym(f)),x3)+...
            7*subs(sym(f),findsym(sym(f)),x4));
    end
    tol=abs(I2-I1);
end
I=vpa(I2,5);
step=n;