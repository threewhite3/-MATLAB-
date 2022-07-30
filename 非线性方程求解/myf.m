function f=myf(x)
f(1)=0.5*sin(x(1))+0.1*cos(x(2)*x(1))-x(1);
f(2)=0.5*cos(x(1))-0.1*sin(x(2))-x(2);
f=[f(1) f(2)];
end