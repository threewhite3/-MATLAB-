function [x,y]=MyRunge_Kutta(fun,x0,xt,y0,PointNum,varargin)
%用龙格-库塔方法解微分方程y'(x)=f(x,y(x))
%此程序可解高阶的微分方程。只要将其形式写为上述微分方程的向量形式
%函数f(x,y):fun
%自变量的初值和终值：x0,xt
%y0表示函数在x0处的值，输入初值为列向量形式
%自变量在[x0,xt]上的点数：PointNum
%varargin为可选输入项可传适当参数给函数f(x,y)
%x:所取点的x值
%y:所取点的y值
if nargin<4|PointNum<=0
    PointNum=100;
end
if nargin<3
    y0=0;
end
y(1,:)=y0(:)';    %初值存为行向量形式
h=(xt-x0)/(PointNum-1);   %计算步长
x=x0+[0:PointNum]'*h;   %得x向量值
for k=1:PointNum    %迭代计算
    f1=h*feval(fun,x(k),y(k,:),varargin{:});
    f1=f1(:)';      %得公式k1
    f2=h*feval(fun,x(k)+h/2,y(k,:)+f1/2,varargin{:});
    f2=f2(:)';      %得公式k2
    f3=h*feval(fun,x(k)+h/2,y(k,:)+f2/2,varargin{:});
    f3=f3(:)';      %得公式k3
    f4=h*feval(fun,x(k)+h,y(k,:)+f3,varargin{:});
    f4=f4(:)';      %得公式k4
    y(k+1,:)=y(k,:)+(f1+2*(f2+f3)+f4)/6;      %得y(n+1)
end