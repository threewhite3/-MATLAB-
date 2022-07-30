function root=HalfInterval(f,a,b,eps)
%���ַ�����f������[a,b]�ϵ�һ�����
%������:f
%������˵�:a
%�����Ҷ˵�:b
%���ľ���:eps
%����ĺ������:root

if nargin==3
    eps=1e-4;
end
f1=subs(sym(f),findsym(sym(f)),a);   %���˵�ĺ���ֵ
f2=subs(sym(f),findsym(sym(f)),b);

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
    root=FindRoots(f,a,b,eps);   %��������ӳ���
end

function r=FindRoots(f,a,b,eps)
f_1=subs(sym(f),findsym(sym(f)),a);
f_2=subs(sym(f),findsym(sym(f)),b);
mf=subs(sym(f),findsym(sym(f)),(a+b)/2);   %�е㺯��ֵ
if f_1*mf>0
    t=(a+b)/2;
    r=FindRoots(f,t,b,eps);     %�ҵݹ�
else
    if f_1*mf==0
        r=(a+b)/2;
    else
        if abs(b-a)<=eps
            r=(b+3*a)/4;       %�����
        else
            s=(a+b)/2;
            r=FindRoots(f,a,s,eps);       %��ݹ�
        end
    end
end