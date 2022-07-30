[x3,y3]=MyEulerPro('Myfun01',0,2*pi,1,128);    %改进欧拉法求解结果
[x,y1]=MyEuler('Myfun01',0,2*pi,1,128);    %欧拉法求解结果

y=dsolve('Dy=y+sin(t)','y(0)=1');     %常微分方程得符号解
for k=1:129
    t(k)=x(k);
    y2(k)=subs(y,t(k));     %对应点得离散解
end

plot(x,y1,'-b',x3,y3,'og',x,y2,'*r');
legend('简单欧拉解','改进欧拉解','符号解');


%%改进欧拉解和精确解几乎一样,单数简单欧拉解和其他两种数值有误差