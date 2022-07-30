clear;
clc;
[x,y]=meshgrid(-4:4);    %������֪����դ���
z=peaks(x,y);           %������֪���ϵĺ���ֵ
[x1,y1]=meshgrid(-4:0.25:4);  %��������ϸ�Ĳ�ֵդ���
z1=interp2(x,y,z,x1,y1,'nearest');  
subplot(1,3,1);
surf(x1,y1,z1);             %���������ڽ�����ֵ����ά����ͼ
z2=interp2(x,y,z,x1,y1,'linear');
subplot(1,3,2);
surf(x1,y1,z2);             %�����ڶ�ά�ֶ����Բ�ֵ����ά����ͼ
z3=interp2(x,y,z,x1,y1,'cubic');
subplot(1,3,3);
surf(x1,y1,z3);            %�����ڶ�ά���ζ���ʽ��ֵ����ά����ͼ