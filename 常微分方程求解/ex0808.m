clear;
clc;
[x23,y23]=ode23('Myfun03',[1,10],[1 10 30]);
[x45,y45]=ode45('Myfun03',[1,10],[1 10 30]);
[x113,y113]=ode113('Myfun03',[1,10],[1 10 30]);
figure(1);   %��һ��ͼ
plot(x23,y23(:,1),'-r',x45,y45(:,1),'g-',x113,y113(:,1),'b-');
legend('ode23','ode45','ode113');
title('ODE���������');
figure(2);   %�ڶ���ͼ
plot(x45,y45);
legend('y','yһ��','y����');
title('ode45���׵���ͼ');