function root=StevenSecant(f,a,b,eps)
%���ҽط�����f������[a,b]��һ�����
%������:f
%������˵�:a
%������˵�:b
%���ľ���:eps
%����������:root
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
    disp('���˵㺯��ֵ�˻�����0!');
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