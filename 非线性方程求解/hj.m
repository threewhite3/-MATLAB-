function root=hj(f,a,b,eps)
%黄金分割法求函数f在区间[a,b]上的一个零点
%函数名:f
%区间左端点;a
%区间右端点:b
%根的精度:eps
%求出的函数零点:root

if nargin==3
    eps=1e-4;
end

f1=subs(sym(f),findsym(sym(f)),a);   %a的函数值
f2=subs(sym(f),findsym(sym(f)),b);   %b的函数值

if f1==0
    root=a;
end
if f2==0
    root=b;
end

if f1*f2>0
    disp('两端点函数值乘积大于0!');
    return;
else
    t1=a+(b-a)*0.382;
    t2=a+(b-a)*0.618;
    f_1=subs(sym(f),findsym(sym(f)),t1);   %t1的函数值
    f_2=subs(sym(f),findsym(sym(f)),t2);   %t2的函数值
    while abs(t1-t2)>eps
        if f_1*f_2<0    %t1,t2异号
            a=t1;
            b=t2;
        else
            fa=subs(sym(f),findsym(sym(f)),a);
            if f_1*fa>0   %t1,a同号
                a=t2;
            else          %t1,a异号
                b=t1;
            end
        end
        t1==a+(b-a)*0.382;
        t2=a+(b-a)*0.618;
        f_1=subs(sym(f),findsym(sym(f)),t1);
        f_2=subs(sym(f),findsym(sym(f)),t2);
    end
    root=(t1+t2)/2;    %输出根
end