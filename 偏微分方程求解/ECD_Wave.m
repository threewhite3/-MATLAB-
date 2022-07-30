%     双曲线偏微分方程    
%     一维波动方程
%     显示中心差分
function [u,x,t]=ECD_Wave(A,xf,T,it0,ilt0,bx0,bxf,M,N)
%解方程 A * u_xx=u_tt    边界 0<= x <=xf, 0<= t <=T
%初始条件: u(x,0)=it0(x), u_t(x,0)=ilt0(x)
%边界条件: u(0,t)=bx0(t), u(xf,t)=bxf(t)
%M:沿x轴的等分段数
%N:沿y轴的等分段数
dx=xf/M;
x=[0:M]'*dx;
dt=T/N;
t=[0:N]*dt;
for i=1:M+1
    u(i,1)=it0(x(i));
end
for k=1:N+1
    u([1 M+1],k)=[bx0(t(k));bxf(t(k))];
end
r=A*(dt*dt)/dx/dx;
r1=r/2;
r2=2*(1-r);
u(2:M,2)=r1*u(1:M-1,1)+(1-r)*u(2:M,1)+r1*u(3:M+1,1)+dt*ilt0(x(2:M));
for k=3:N+1
    u(2:M,k)=r*(u(1:M-1,k-1)+u(3:M+1,k-1))+r2*u(2:M,k-1)-u(2:M,k-2);  %迭代公式
end