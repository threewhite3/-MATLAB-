function [I,step]=Roberg(f,a,b,eps)
%��������ַ�����f������[a,b]�ϵĶ�����
%������:f
%��������:a
%��������:b
%���־���:eps
%����ֵ:I
%���ֻ��ֵ����������:step

if nargin==3
    eps=1e-4;
end
M=1;
tol=10;
k=0;
T=zeros(1,1);
h=b-a;
T(1,1)=(h/2)*(subs(sym(f),findsym(sym(f)),a)+subs(sym(f),findsym(sym(f)),b)); %��ʼֵ
while tol>eps
    k=k+1;
    h=h/2;
    Q=0;
    for i=1:M
        x=a+h*(2*i-1);
        Q=Q+subs(sym(f),findsym(sym(f)),x);
    end
    T(k+1,1)=T(k,1)/2+h*Q;
    M=M*2;
    for j=1:k
        T(k+1,j+1)=T(k+1,j)+(T(k+1,j)-T(k,j))/(4^j-1);
    end
    tol=abs(T(k+1,j+1)-T(k,j));
end
I=T(k+1,k+1);
I=vpa(I,5);
step=k;