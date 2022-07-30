function root=MultiRoot(f,a,b,eps)
%求函数f在区间[a,b]的一个多重零点
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
    fun=diff(sym(f));    %求导数
    ddf=diff(sym(fun));
    fa=subs(sym(f),findsym(sym(f)),a);
    fb=subs(sym(f),findsym(sym(f)),b);
    dfa=subs(sym(fun),findsym(sym(fun)),a);
    dfb=subs(sym(fun),findsym(sym(fun)),b);
    if dfa>dfb          
        root=a;
    else
        root=b;
    end
    while tol>eps
        r1=root;
        fx=subs(sym(f),findsym(sym(f)),r1);
        dfx=subs(sym(fun),findsym(sym(fun)),r1);     %一阶导数值
        ddfx=subs(sym(fun),findsym(sym(ddf)),r1);    %二阶导数值
        root=r1-fx*dfx/(dfx*dfx-fx*ddfx);            %迭代公式
        tol=abs(root-r1);
    end
end
root=vpa(root,6);