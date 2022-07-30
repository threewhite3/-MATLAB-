clear;
clc;
%���ú���Helmholtz_Newton������һ����ֵ�����ķ���:u_xx+u_yy+g(x,y)u=f(x,y)
f=inline('x^2+y^2','x','y');    %���캯��f(x,y)=x^2+y^2
g=inline('sqrt(x)','x','y');    %���캯��g(x,y)=sqrt(x)
%�Ա���ȡֵ��Χ
x0=0;
xf=4;
y0=0;
yf=4;
%�ȷֶ���
Mx=30;
My=30;
%ţ�ٱ�ֵ
dbx=inline('x^2+y^2','x','y');
%�߽�����
bx0=inline('y^2','y');
bxf=inline('4^2*cos(y)','y');
by0=inline('x^2','x');
byf=inline('4^2*cos(x)','x');
D=[x0 xf y0 yf];
MaxIter=100;
MinErr=1e-4;
[u x y]=Helmholtz_Newton(f,g,dbx,bx0,bxf,by0,byf,D,Mx,My,MinErr,MaxIter);
%��ͼ
clf;
mesh(x,y,u);
xlabel('x');
ylabel('y');
zlabel('u');