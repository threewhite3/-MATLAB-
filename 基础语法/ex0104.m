%function ex0104
x=-2:1:2;
y=-2:1:2;
[X,Y] = meshgrid(x,y)  %各行都等于x的X的矩阵和各列都等于y的Y矩阵
Z=X.^2+Y.^2;          %求解Z矩阵
subplot(2,2,1),mesh(X,Y,Z)
title('网格图a');
subplot(2,2,2),mesh(X,Y,Z),view([0,30])
title('在方位角0°和视角30°处观察图a');
subplot(2,2,3),contour(X,Y,Z)
title('二维等高线');
subplot(2,2,4),contour3(X,Y,Z,10) %10是等高线的条数
title('三维等高线');