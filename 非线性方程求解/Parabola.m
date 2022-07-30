function root=Parabola(f,a,b,x,eps)
%用抛物线法求函数f在区间[a,b]的一个零点
%函数名:f
%区间左端点:a
%区间左端点:b
%初始迭代点:x
%根的精度:eps
%求出函数零点:root

if nargin==4
    eps=1e-4;
end

f1=subs(sym(f),findsym(sym(f)),a);
f2=subs(sym(f),findsym(sym(f)),b);
if f1==0
    root=a;
end
if f2==0
    root=b
end
if f1*f2>0
    disp('两端点函数值乘积大于0!');
    return;
else
    tol=1;
    fa=subs(sym(f),findsym(sym(f)),a);
    fb=subs(sym(f),findsym(sym(f)),b);
    fx=subs(sym(f),findsym(sym(f)),x);
    d1=(fb-fa)/(b-a);
    d2=(fx-fb)/(x-b);
    d3=(d2-d1)/(x-a);
    B=d2+d3*(x-b);
    root=x-2*fx/(B+sign(B)*sqrt(B^2-4*fx*d3));
    t=zeros(3);
    t(1)=a;
    t(2)=b;
    t(3)=x;
    while tol>eps
        t(1)=t(2);
        t(2)=t(3);
        t(3)=root;
        f1=subs(sym(f),findsym(sym(f)),t(1));
        f2=subs(sym(f),findsym(sym(f)),t(2));
        f3=subs(sym(f),findsym(sym(f)),t(3));
        d1=(f2-f1)/(t(2)-t(1));
        d2=(f3-f2)/(t(3)-t(2));
        d3=(d2-d1)/(t(3)-t(1));
        B=d2+d3*(t(3)-t(2));
        root=t(3)-2*f3/(B+sign(B)*sqrt(B^2-4*f3*d3));
        tol=abs(root-t(3));
    end
end
root=vpa(root,6);