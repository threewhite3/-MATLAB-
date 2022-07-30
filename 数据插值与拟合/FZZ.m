function [A0,A,B]=FZZ(func,T,n)
%用傅里叶级数逼近已知的连续周期函数
%已知函数的周期:T
%展开项数:n
%展开后的常数项:A0
%展开后的余弦项系数:A
%展开后的正弦项系数:B
syms t;
func=subs(sym(func),findsym(sym(func)),sym('t'));
A0=int(sym(func),t,-T/2,T/2)/T;
for(k=1:n)
    A(k)=int(func*cos(2*pi*k*t/T),t,-T/2,T/2)*2/T;
    A(k)=vpa(A(k),4);
    B(k)=int(func*sin(2*pi*k*t/T),t,-T/2,T/2)*2/T;
    B(k)=vpa(B(k),4);
end