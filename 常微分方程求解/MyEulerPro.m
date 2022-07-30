function [Xout,Yout]=MyEulerPro(fun,x0,xt,y0,PointNum)
%用改进的欧拉方法解微分方程y'=fun
%函数f(x,y):fun
%自变量的初值和终值:x0,xt
%y0表示函数在x0处的值,输入初值为列向量形式
%自变量在[x0,xt]上取得点数:PointNum
%Xout:所取得点得x值
%Yout:对应点上得函数值
if nargin<5|PointNum<=0     %如果函数仅输入4个参数值,则PointNum默认为100
    PointNum=0;
end
if nargin<4       %y0默认值为0
    y0=0;
end
h=(xt-x0)/PointNum;   %计算步长h
x=x0+[0:PointNum]'*h;    %自变量数组
y(1,:)=y0(:)';     %输入为列变量
for i=1:PointNum
    f1=h*feval(fun,x(i),y(i,:));   
    f1=f1(:)';
    f2=h*feval(fun,x(i+1),y(i,:)+f1);
    f2=f2(:)';
    y(i+1,:)=y(i,:)+0.5*(f1+f2);  
end
Yout=y;
Xout=x;