%function ex0104
x=-2:1:2;
y=-2:1:2;
[X,Y] = meshgrid(x,y)  %���ж�����x��X�ľ���͸��ж�����y��Y����
Z=X.^2+Y.^2;          %���Z����
subplot(2,2,1),mesh(X,Y,Z)
title('����ͼa');
subplot(2,2,2),mesh(X,Y,Z),view([0,30])
title('�ڷ�λ��0����ӽ�30�㴦�۲�ͼa');
subplot(2,2,3),contour(X,Y,Z)
title('��ά�ȸ���');
subplot(2,2,4),contour3(X,Y,Z,10) %10�ǵȸ��ߵ�����
title('��ά�ȸ���');