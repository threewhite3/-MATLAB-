function [I,step]=DDTraprl(f,a,b,eps)
%������ηְ����ι�ʽ����f������[a,b]�ϵĶ�����
%������:f
%��������;a
%��������:b
%���־���:eps
%����ֵ:I
%���ֻ��ֵ����������:step
if nargin==3
    eps=1e-4;
end
n=1;
h=b-a;
I2=(subs(sym(f),findsym(sym(f)),a)+subs(sym(f),findsym(sym(f)),b))/h/2;
tol=1;
while tol>eps
    n=n+1;
    h=h/2;
    I1=I2;
    I2=0;
    for i=0:(2^n-1)
        x=a+h*i;
        x1=x+h;
        I2=I2+(h/2)*(subs(sym(f),findsym(sym(f)),x)+...
            subs(sym(f),findsym(sym(f)),x1));   %���ι�ʽ
    end
    tol=abs(I2-I1);
end
I=vpa(I2,5);
step=n;