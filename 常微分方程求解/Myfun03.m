function dy=Myfun03(x,y)
dy=zeros(3,1);    %��ʼ��dy
dy(1)=y(2);     %dy(1)��ʾһ�׵���
dy(2)=y(3);     %dy(2)��ʾ���׵���
dy(3)=2*y(3)/x^3+3*y(2)/x^3+3*exp(2*x)/x^3;    %dy(3)��ʾ���׵���