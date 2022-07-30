D=1;
b1=-2;
b2=2;
t=b1+[0:100]/100*(b2-b1);
bounds=[b1 b2];
subplot(1,3,1),ex0117('ex0114')
axis([b1 b2 -0.4 1.2])
subplot(1,3,2),ex0117('ex0114',bounds)
axis([b1 b2 -0.4 1.2])
subplot(1,3,3),ex0117('ex0114',bounds,D)
axis([b1 b2 -0.4 1.2])