%function ex0103
%%plot3����
clear;
clc;
t=0:pi/50:6*pi;
xt=exp(-0.1*t).*cos(t);
yt=exp(-0.1*t).*sin(t);
%%��ִ���
subplot(2,2,1),plot3(xt,yt,t),grid on
title('(xt,yt,t)����άͼa');
subplot(2,2,2),plot3(xt,yt,t),grid on,view([0 0 1]);
title('(0,0,1)�۲�a��ͼa1');
subplot(2,2,3),plot3(t,xt,yt),grid on
title('(xt,yt,t)����άͼb');
subplot(2,2,4),plot3(t,xt,yt),grid on,view([0 -4 0]);
title('(0,-4,0)�۲�b��ͼb1');