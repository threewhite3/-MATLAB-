clear;
clc;
[x,y]=ode45('Myfun02',[0 15],[25 2]);
plot(x,y(:,1),'-',x,y(:,2),'*');
legend('y1º¯ÊýÍ¼','y2º¯ÊýÍ¼');