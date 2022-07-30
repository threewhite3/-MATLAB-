function [outx,outy]=MyEuler(fun,x0,xt,y0,PointNum)
%��ǰ���ֵ�ŷ��������΢�ַ���y'=fun
%����f(x,y):fun
%�Ա����ĳ�ֵ����ֵ:x0,xt
%y0��ʾ������x0����ֵ,�����ֵΪ��������ʽ
%�Ա�����[x0,xt]��ȡ�õ���:PointNum
%outx:��ȡ�õ��xֵ
%outy:��Ӧ���ϵú���ֵ
if nargin<5|PointNum<=0     %�������������4������ֵ,��PointNumĬ��Ϊ100
    PointNum=0;
end
if nargin==4       %y0Ĭ��ֵΪ0
    y0=0;
end
h=(xt-x0)/PointNum;   %���㲽��h
x=x0+[0:PointNum]'*h;    %�Ա�������
y(1,:)=y0(:)';     %����Ϊ�б���
for k=1:PointNum
    f=feval(fun,x(k),y(k,:));   %����f(x,y)��ÿ���������ֵ
    f=f(:)';
    y(k+1,:)=y(k,:)+h*f;   %������ȡ�õ�x��������yֵ
end
outy=y;
outx=x;
plot(x,y);