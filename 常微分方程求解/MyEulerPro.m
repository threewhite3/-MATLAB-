function [Xout,Yout]=MyEulerPro(fun,x0,xt,y0,PointNum)
%�øĽ���ŷ��������΢�ַ���y'=fun
%����f(x,y):fun
%�Ա����ĳ�ֵ����ֵ:x0,xt
%y0��ʾ������x0����ֵ,�����ֵΪ��������ʽ
%�Ա�����[x0,xt]��ȡ�õ���:PointNum
%Xout:��ȡ�õ��xֵ
%Yout:��Ӧ���ϵú���ֵ
if nargin<5|PointNum<=0     %�������������4������ֵ,��PointNumĬ��Ϊ100
    PointNum=0;
end
if nargin<4       %y0Ĭ��ֵΪ0
    y0=0;
end
h=(xt-x0)/PointNum;   %���㲽��h
x=x0+[0:PointNum]'*h;    %�Ա�������
y(1,:)=y0(:)';     %����Ϊ�б���
for i=1:PointNum
    f1=h*feval(fun,x(i),y(i,:));   
    f1=f1(:)';
    f2=h*feval(fun,x(i+1),y(i,:)+f1);
    f2=f2(:)';
    y(i+1,:)=y(i,:)+0.5*(f1+f2);  
end
Yout=y;
Xout=x;