[x1,y1]=MyEuler('Myfun01',0,2*pi,1,16);    %欧拉法求解结果
h1=2*pi/15;                               %计算步长
[x11,y11]=MyEuler('Myfun01',0,2*pi,1,32);   %欧拉法求解结果
h2=pi/15;                               %计算步长
y=dsolve('Dy=y+sin(t)','y(0)=1');     %常微分方程得符号解
for k=1:33
    t(k)=x11(k);
    y2(k)=subs(y,t(k));     %对应点得离散解
end

plot(x1,y1,'+b',x11,y11,'og',x11,y2,'*r');
legend('h=0.4得欧拉解','h=0.2的欧拉解','符号解');