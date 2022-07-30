function f=Newtonforward(x,y,x0)
%求已知数据点的前向牛顿差分插值多项式
%已知数据点的x坐标向量:x
%已知数据点的y坐标向量:y
%插值点的x坐标:x0
%求得的前向牛顿微分插值多项式或在x0处的插值:f
syms t;
if(length(x)==length(y))
    n=length(x);
    c(1:n)=0.0;
else
    disp('x和y的维数不相等!');
    return;
end

f=y(1);
y1=0;
xx=linspace(x(1),x(n),length(x));
if(xx ~= x)
    disp('节点之间不是等距的!');
    return;
end
for(i=1:n-1)
    for(j=1:n-i)
        y1(j)=y(j+1)-y(j);
    end
    c(i)=y1(1);
    l=t;
    for(k=1:i-1)
        l=l*(t-k);
    end
    f=f+c(i)*l/factorial(i);
    simplify(f);
    y=y1;
    if(i==n-1)
        if(nargin==3)
            f=subs(f,'t',(x0-x(1))/(x(2)-x(1)));
        else
            f=collect(f);
            f=vpa(f,6);
        end
    end
end