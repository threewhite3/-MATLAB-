function x=ex0114(t,D)
global D   %声明全局变量
t(find(t==0))=eps;  %防止分母出现0项
x=sin(pi*t/D)./(pi*t/D);