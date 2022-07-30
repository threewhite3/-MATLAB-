function [I,step]=IntSimpson(f,a,b,type,eps)
%����ɭϵ�й�ʽ����f������[a,b]�ϵĶ�����
%������:f
%��������:a
%��������:b
%����ɭ��ʽ������:type(��ȡ1,2,3)
%���־���:eps
%����ֵ:I
%���ֻ��ֵ����������:step

if type==3&&nargin==4
    disp('ȱ�ٲ���!');
end
I=0;

switch type
    case 1,
        I=(b-a)/6*(subs(sym(f),findsym(sym(f)),a)+4*subs(sym(f),findsym(sym(f)),(a+b)/2)+subs(sym(f),findsym(sym(f)),b));
        step=1;
    case 2,
        I=(b-a)/8*(subs(sym(f),findsym(sym(f)),a)+3*subs(sym(f),findsym(sym(f)),(2*a+b)/3)+3*subs(sym(f),findsym(sym(f)),(a+2*b)/3)+subs(sym(f),findsym(sym(f)),b));
        step=1;
    case 3,
        n=2;
        h=(b-a)/2;
        I1=0;
        I2=(subs(sym(f),findsym(sym(f)),a)+subs(sym(f),findsym(sym(f)),b))/h;
        while abs(I2-I1)>eps
            n=n+1;
            n=(b-a)/n;
            I1=I2;
            I2=0;
            for i=0:n-1
                x=a+h*i;
                x1=x+h;
                I2=I2+h/6*(subs(sym(f),findsym(sym(f)),x)+4*subs(sum(f),findsym(sum(f)),(x+x1)/2)+subs(sym(f),findsym(sym(f)),x1));
            end
        end
        I2=vpa(I2,4);
        I=double(I2);
        step=n;
end