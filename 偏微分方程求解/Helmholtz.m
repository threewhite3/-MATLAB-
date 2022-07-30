%   椭圆形偏微分方程解法
%   Helmholtz方程
function [u,x,y]=Helmholtz(f,g,bx0,bxf,by0,byf,D,Mx,My,MinErr,MaxIter)
%解方程:u_xx+u_yy+g(x,y)u=f(x,y)
%f,g:函数名
%bx0:在边界x=x0上的函数值
%bxf:在边界x=xf上的函数值
%by0:在边界y=y0上的函数值
%byf:在边界y=yf上的函数值
%D:边界点值,长度为4的列向量,其元素分别为x0,xf,y0,yf
%Mx:沿x轴的区间数
%My:沿y轴的区间数
%MinErr:误差控制因子
%MaxIter:最大迭代步数
%[u,x,y]=方程u(x,y)在(x,y)点的函数值
x0=D(1);
xf=D(2);
y0=D(3);
yf=D(4);
dx=(xf-x0)/Mx;
x=x0+[0:Mx]*dx;
dy=(yf-y0)/My;
y=y0+[0:My]*dy;
Mx1=Mx+1;
My1=My+1;
%边界条件
for m=1:My1
    u(m,[1 Mx1])=[bx0(y(m)) bxf(y(m))];  %左右边界
end
for n=1:Mx1
    u([1 My1],n)=[by0(x(n));byf(x(n))];  %上下边界
end
%边界平均值作迭代初值
sumOfBv=sum(sum([u(2:My,[1 Mx1]) u([1 My1],2:Mx)']));
u(2:My,2:Mx)=sumOfBv/(2*(Mx+My-2));
for i=1:My
    for j=1:Mx
        F(i,j)=f(x(j),y(i));
        G(i,j)=g(x(j),y(i));
    end
end
dx2=dx*dx;
dy2=dy*dy;
dxy2=2*(dx2+dy2);
rx=dx2/dxy2;
ry=dy2/dxy2;
rxy=rx*dy2;
for iter=1:MaxIter
    for j=2:Mx
        for i=2:My
            u(i,j)=ry*(u(i,j+1)+u(i,j-1))+rx*(u(i+1,j)+u(i-1,j))+rxy*(G(i,j)*u(i,j)-F(i,j));  %迭代公式
        end
    end
    if iter>1&&max(max(abs(u-u0)))<MinErr   %循环结束条件
        break;
    end
    u0=u;
end