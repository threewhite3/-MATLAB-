function dx=Myfun02(x,y)
dx=zeros(2,1);
dx(1)=y(1)*(1-0.1*y(2));
dx(2)=y(2)*(-0.5+0.02*y(1));
end