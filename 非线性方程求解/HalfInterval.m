function root=HalfInterval(f,a,b,eps)
%二分法求函数f在区间[a,b]上的一个零点
%函数名:f
%区间左端点:a
%区间右端点:b
%根的精度:eps
%求出的函数零点:root

if nargin==3
    eps=1e-4;
end
f1=subs(sym(f),findsym(sym(f)),a);   %两端点的函数值
f2=subs(sym(f),findsym(sym(f)),b);

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
    root=FindRoots(f,a,b,eps);   %调用求解子程序
end

function r=FindRoots(f,a,b,eps)
f_1=subs(sym(f),findsym(sym(f)),a);
f_2=subs(sym(f),findsym(sym(f)),b);
mf=subs(sym(f),findsym(sym(f)),(a+b)/2);   %中点函数值
if f_1*mf>0
    t=(a+b)/2;
    r=FindRoots(f,t,b,eps);     %右递归
else
    if f_1*mf==0
        r=(a+b)/2;
    else
        if abs(b-a)<=eps
            r=(b+3*a)/4;       %输出根
        else
            s=(a+b)/2;
            r=FindRoots(f,a,s,eps);       %左递归
        end
    end
end