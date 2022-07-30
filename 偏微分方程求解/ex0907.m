A=1;
it0=inline('x-x^2','x');
ilt0=inline('0');
bx0t=inline('0');
bxft=inline('0');
xf=1;
M=10;
T=2;
N=50;
[u,x,t]=ECD_Wave(A,xf,T,it0,ilt0,bx0t,bxft,M,N);

figure(1),clf;
mesh(t,x,u);
xlabel('t');
ylabel('x');
zlabel('u');

figure(2),clf;
for n=1:8
    subplot(2,4,n)
    plot(x,u(:,4*n)),axis([0 xf -0.3 0.3]);
end