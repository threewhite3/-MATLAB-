%   һά�����߷���
function [u,x,t]=Grank_Nicholson(A,xf,T,it0,bx0,bxf,M,N)
%�ⷽ�� A*u_xx=u_t, 0<=x<=xf, 0<=t<=T
%��ֵ:u(x,0)=it0(x)
%�߽�����:u(0,t)=bx0(t), u(xf,t)=bxf(t)
% M:x��ĵȷֶ�
% N:y��ĵȷֶ�

dx=xf/M;
x=[0:M]'*dx;
dt=T/N;
t=[0:N]*dt;
%�߽�����
for i=1:M+1
    u(i,1)=it0(x(i));
end
for n=1:N+1
    u([1 M+1],n)=[bx0(t(n));bxf(t(n))];
end
r=A*dt/dx/dx;
r1=2*(r-1);
r2=2*(r+1);

for i=1:M-1
    P(i,i)=r1;     %�������ԽǾ���
    Q(i,i)=r2;
    if i>1
        P(i-1,i)=-r;
        P(i,i-1)=-r;
        Q(i-1,i)=r;
        Q(i,i-1)=r;
    end
end
for k=2:N+1
    b=Q*u(2:M,k-1)+[r*(u(1,k)+u(1,k-1));zeros(M-2,1)];
    u(2:M,k)=linsolve(P,b);  %������ʽ
end

bx0=inline('y^2','y');    %�߽�����
bxf=inline('4^2*cos(y)','y');
by0=inline('x^2','x');
byf=inline('4^2*cos(x)','x');
D=[x0 xf y0 yf];
MaxIter=400;
MinErr=1e-4;
[U x y]=Helmholtz(f,g,bx0,bxf,by0,byf,D,M,N,MinErr,MaxIter);
clf,mesh(x,y,U);