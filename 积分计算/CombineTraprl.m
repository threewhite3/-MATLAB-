function [I,step]=CombineTraprl(f,a,b,eps)
%�������ι�ʽ����f������[a,b]�ϵĶ�����
%������:f
%��������:a
%��������:b
%���־���:eps
%����ֵ:I
%���ֻ��ֵ�������ĸ���:step
if nargin==3
    eps=1e-4;
end

n=1;
h=(b-a)/2;
I1=0;
I2=(subs(sym(f),findsym(sym(f)),a)+subs(sym(f),findsym(sym(f)),b))/h;
while abs(I2-I1)>eps
    n=n+1;
    h=(b-a)/n;
    I1=I2;
    I2=0;
    for i=0:n-1         %��n�θ������ι�ʽ����
        x=a+h*i;        %i=0��n-1ʱ,�ֱ������ֵ����Ҷ˵�
        x1=x+h;
        I2=I2+(h/2)*(subs(sym(f),findsym(sym(f)),x)+subs(sym(f),findsym(sym(f)),x1));
    end
end

I=vpa(I2,4);
step=n;