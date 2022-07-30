function dy=Myfun03(x,y)
dy=zeros(3,1);    %初始化dy
dy(1)=y(2);     %dy(1)表示一阶导数
dy(2)=y(3);     %dy(2)表示二阶导数
dy(3)=2*y(3)/x^3+3*y(2)/x^3+3*exp(2*x)/x^3;    %dy(3)表示三阶导数