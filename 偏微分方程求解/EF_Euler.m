function [u,x,t]=EF_Euler(A,xf,T,it0,bx0,bxf,M,N)
%解方程 A*u_xx=u_t, 0<=x<=xf, 0<=t<=T
%初值:u(x,0)=it0(x)
%边界条件:u(0,t)=bx0(t), u(xf,t)=bxf(t)
% M:x轴的等分段
% N:y轴的等分段

dx=xf/M;
x=[0:M]'*dx;
dt=T/N;
t=[0:N]*dt;
%边界条件
for i=1:M+1
    u(i,1)=it0(x(i));
end
for n=1:N+1
    u([1 M+1],n)=[bx0(t(n));bxf(t(n))];
end

r=A*dt/dx/dx;
r1=1-2*r;
if(r>0.5)
    disp('r>0.5,unstability');
end
for k=1:N
    for i=2:M
        u(i,k+1)=r*(u(i+1,k)+u(i-1,k))+r1*u(i,k);  %迭代公式
    end
end