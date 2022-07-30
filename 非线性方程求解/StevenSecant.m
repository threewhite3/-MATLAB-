function root=StevenSecant(f,a,b,eps)
%用弦截法求函数f在区间[a,b]的一个零点
%函数名:f
%区间左端点:a
%区间左端点:b
%根的精度:eps
%求出函数零点:root
if nargin==3
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
    faa=subs(sym(f),findsym(sym(f)),a+fa);
    root=a-fa*fa/(faa-fa);
    while tol>eps
        r1=root;
        fx=subs(sym(f),findsym(sym(f)),r1);
        v=fx+r1;
        fv=subs(sym(f),findsym(sym(f)),v);
        root=r1-fx*fx/(fv-fx);
        tol=abs(root-r1);
    end
end
root=vpa(root,6);