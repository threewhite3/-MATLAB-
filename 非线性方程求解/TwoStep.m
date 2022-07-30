function root=TwoStep(f,a,b,type,eps)
%用两步迭代法求函数f在区间[a,b]的一个零点
%函数名:f
%区间左端点:a
%区间左端点:b
%两步迭代法的形式:type(可取1,2)
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
    fun=diff(sym(f));    %求导数
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
        if type==1
            r1=root;
            fx1=subs(sym(f),findsym(sym(f)),r1);
            dfx=subs(sym(fun),findsym(sym(fun)),r1);
            r2=r1-fx1/dfx;            %第一步迭代
            fx2=subs(sym(f),findsym(sym(f)),r2);
            root=r2-fx2/dfx;          %第二部迭代
            tol=abs(root-r1);
        else
            r1=root;
            fx1=subs(sym(f),findsym(sym(f)),r1);
            dfx=subs(sym(fun),findsym(sym(fun)),r1);
            r2=r1-fx1/dfx;            %第一步迭代
            fx2=subs(sym(f),findsym(sym(f)),r2);
            root=r2-fx2*(r2-r1)/(2*fx2-fx1);          %第二部迭代
            tol=abs(root-r1);
        end
    end
end
root=vpa(root,6);