clear;
clc;
x=0:2*pi;
y=sin(x);
z=interpft(y,15);
xx=linspace(0,2*pi,15);
plot(x,y,'-o',xx,z,':o');