x=[1 2 3 4 5 6 7];
Y=[3.5 2.1 1.3 0.8 2.9 4.2 5.7];
xx=1:0.5:7;
y1=interp1(x,y,xx,'nearest');
y2=interp1(x,y,xx,'spline');
y3=interp1(x,y,xx,'cubic');
plot(x,y,'o',xx,y1,'-',xx,y2,'-.',xx,y3,':');