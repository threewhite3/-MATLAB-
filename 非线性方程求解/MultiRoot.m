function root=MultiRoot(f,a,b,eps)
%����f������[a,b]��һ���������
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
    fun=diff(sym(f));    %����
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
        dfx=subs(sym(fun),findsym(sym(fun)),r1);     %һ�׵���ֵ
        ddfx=subs(sym(fun),findsym(sym(ddf)),r1);    %���׵���ֵ
        root=r1-fx*dfx/(dfx*dfx-fx*ddfx);            %������ʽ
        tol=abs(root-r1);
    end
end
root=vpa(root,6);