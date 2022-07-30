clear;
clc;
%function ex0102()
x=0.1:pi/15:2*pi;
y1=exp(x);
y2=log(x);
y3=sin(x);
y4=cos(x);
subplot(2,2,1);   %拆分成2*2个区域,分别在各个区域作图
plot(x,y1);
title('exp(x)');
subplot(2,2,2);
plot(x,y2);
title('log(x)');
subplot(2,2,3);
plot(x,y3);
title('sin(x)');
subplot(2,2,4);
plot(x,y4);
title('cos(x)');