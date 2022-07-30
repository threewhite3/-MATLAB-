clear;
clc;
f=inline('x^2+y^2','x','y');
f0=inline('0','x','y');
g=inline('sqrt(x)','x','y');
g0=inline('0','x','y');
%自变量取值范围
x0=0;
xf=4;
y0=0;
yf=4;
%等分段数
Mx=30;
My=30;
bx0=inline('y^2','y');
bxf=inline('16*cos(y)','y');
by0=inline('x^2','x');
byf=inline('16*cos(x)','x');
D=[x0 xf y0 yf];
MaxIter=400;
MinErr=1e-4;
[U,x,y]=Helmholtz(f,g,bx0,bxf,by0,byf,D,Mx,My,MinErr,MaxIter);       %Helmholtz Equation
[Up,xp,yp]=Helmholtz(f,g0,bx0,bxf,by0,byf,D,Mx,My,MinErr,MaxIter);   %Possion Equation
[UL,xL,yL]=Helmholtz(f0,g0,bx0,bxf,by0,byf,D,Mx,My,MinErr,MaxIter);  %Laplace Equation
clf;
figure(1);
mesh(x,y,U);
xlabel('x');
ylabel('y');
zlabel('U');
title('Helmholtz Equation');
figure(2);
mesh(xp,yp,Up);
xlabel('xp');
ylabel('yp');
zlabel('Up');
title('Possion Equation');
figure(3);
mesh(xL,yL,UL);
xlabel('xL');
ylabel('yL');
zlabel('UL');
title('Laplace Equation');