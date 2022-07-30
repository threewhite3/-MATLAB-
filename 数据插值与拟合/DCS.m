function f=DCS(x,y,x0)
%用倒差商算法求已知数据点的有理分式形式的插值分式
%已知数据点的x坐标向量:x
%已知数据点的y坐标向量:y
%插值点的x坐标:x0
%求得的有理分式形式的插值分式或在x0处的插值:f

syms t;
if(length(x)==length(y))
    n=length(x);
    c(1:n)=0.0;
else 
    disp('x和y的维数不相等!');
    return;
end
c(1)=y(1);
for(i=1:n-1)
    for(j=i+1:n)
        y1(j)=(x(j)-x(i))/(y(j)-y(i));
    end
    c(i+1)=y1(i+1);
    y=y1;
end
f=c(n);
for(i=1:n-1)
    f=c(n-i)+(t-x(n-i))/f;
    f=vpa(f,6);
    if(i==n-1)
        if(nargin==3)
            f=subs(f,'t',x0);
        else
            f=vpa(f,6);
        end
    end
end