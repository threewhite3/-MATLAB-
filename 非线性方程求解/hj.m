function root=hj(f,a,b,eps)
%�ƽ�ָ����f������[a,b]�ϵ�һ�����
%������:f
%������˵�;a
%�����Ҷ˵�:b
%���ľ���:eps
%����ĺ������:root

if nargin==3
    eps=1e-4;
end

f1=subs(sym(f),findsym(sym(f)),a);   %a�ĺ���ֵ
f2=subs(sym(f),findsym(sym(f)),b);   %b�ĺ���ֵ

if f1==0
    root=a;
end
if f2==0
    root=b;
end

if f1*f2>0
    disp('���˵㺯��ֵ�˻�����0!');
    return;
else
    t1=a+(b-a)*0.382;
    t2=a+(b-a)*0.618;
    f_1=subs(sym(f),findsym(sym(f)),t1);   %t1�ĺ���ֵ
    f_2=subs(sym(f),findsym(sym(f)),t2);   %t2�ĺ���ֵ
    while abs(t1-t2)>eps
        if f_1*f_2<0    %t1,t2���
            a=t1;
            b=t2;
        else
            fa=subs(sym(f),findsym(sym(f)),a);
            if f_1*fa>0   %t1,aͬ��
                a=t2;
            else          %t1,a���
                b=t1;
            end
        end
        t1==a+(b-a)*0.382;
        t2=a+(b-a)*0.618;
        f_1=subs(sym(f),findsym(sym(f)),t1);
        f_2=subs(sym(f),findsym(sym(f)),t2);
    end
    root=(t1+t2)/2;    %�����
end