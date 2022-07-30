%   二维抛物线方程
%  二维热传导方程
function [u,x,y,t]=TDE(A,D,T,ixy0,bxyt,Mx,My,N)
%解方程 A*(u_xx+u_yy)=u_t, x0<=x<=xf, y0<=y<yf, 0<=t<=T
%初值:u(x,y,0)=ixy0(x)
%边界条件:u(x0,y,t)=bx0(y,t), u(xf,y,t)=bxf(y,t), u(x,y0,t)=by0(x,t),
%u(x,yf,t)=byf(x,t)
% Mx:x轴的等分段
% Ny:y轴的等分段
dx=(D(2)-D(1))/Mx;
x=D(1)+[0:Mx]*dx;
dy=(D(4)-D(3))/My;
y=D(3)+[0:My]*dy;
dt=T/N;
t=[0:N]*dt;
%初始化u
for j=1:Mx+1
    for i=1:My+1
        u(i,j)=ixy0(x(j),y(i));
    end
end
rx=A*dt/(dx*dx);
rx1=1+2*rx;
rx2=1-2*rx;
ry=A*dt/(dy*dy);
ry1=1+2*ry;
ry2=1-2*ry;
for j=1:Mx-1
    P(j,j)=ry1;
    if j>1
        P(j-1,j)=-ry;
        P(j,j-1)=-ry;
    end
end
for i=1:My-1
    Q(i,i)=rx1;
    if i>1
        Q(i-1,i)=-rx;
        Q(i,i-1)=-rx;
    end
end
for k=1:N
    u_1=u;
    t=k*dt;
    for i=1:My+1
        u(i,1)=feval(bxyt,x(1),y(i),t);
        u(i,Mx+1)=feval(bxyt,x(Mx+1),y(i),t);
    end
    for j=1:Mx+1
        u(1,j)=feval(bxyt,x(j),y(1),t);
        u(Mx+1,j)=feval(bxyt,x(j),y(1),t);
    end
    if mod(k,2)==0
        for i=2:My
            jj=2:Mx
            bx=[ry*u(i,1) zeros(1,Mx-3) ry*u(i,My+1)] + rx*(u_1(i-1,jj)+u_1(i+1,jj))+rx2*u_1(i,jj);
            u(i,jj)=linsolve(P,bx')';
        end
    else
        for j=2:Mx
            ii=2:My
            by=[rx*u(1,j) ;zeros(My-3,1) ;rx*u(Mx+1,j)] + ry*(u_1(ii,j-1)+u_1(ii,j+1))+ry2*u_1(ii,j);
            u(ii,j)=linsolve(Q,by);
        end
    end
end