%function ex0103
%%plot3函数
clear;
clc;
t=0:pi/50:6*pi;
xt=exp(-0.1*t).*cos(t);
yt=exp(-0.1*t).*sin(t);
%%拆分窗口
subplot(2,2,1),plot3(xt,yt,t),grid on
title('(xt,yt,t)的三维图a');
subplot(2,2,2),plot3(xt,yt,t),grid on,view([0 0 1]);
title('(0,0,1)观察a的图a1');
subplot(2,2,3),plot3(t,xt,yt),grid on
title('(xt,yt,t)的三维图b');
subplot(2,2,4),plot3(t,xt,yt),grid on,view([0 -4 0]);
title('(0,-4,0)观察b的图b1');