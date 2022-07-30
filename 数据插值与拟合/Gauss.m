function f=Gauss(x,y,x0)
%求已知数据点的高斯插值多项式
%已知数据点的x坐标向量:x
%已知数据点的y坐标向量:y
%插值点的x坐标:x0
%求得的高斯插值多项式或在x0处的插值:f
if(length(x)==length(y))
    n=length(x);
else 
    disp('x和y的维数不相等!');
    return;
end
xx=linspace(x(1),x(n),length(x));  %创建x(1)到x(n),步长为x(2)-x(1)的数组
if(xx ~= x)
    disp('节点之间不是等距的!');
    return;
end
if(mod(n,2)==1)            %n为奇数时,采用斯特林插值
    if(nargin==2)
        f=GStirling(x,y,n);    %只须求出插值多项式
    elseif(nargin==3)
        f=GStirling(x,y,n,x0);   %求出在x0处的值
    end
else                            %n为偶数采用贝塞尔插值
    if(nargin==2)
        f=GBessel(x,y,n);
    elseif(nargin==3)
        f=GBessel(x,y,n,x0);
    end
end

function f=GStirling(x,y,n,x0)    %斯特林插值
syms t;
nn=(n+1)/2;
f=y(nn);
for(i=1:n-1)
    for(j=i+1:n)
        y1(j)=y(j)-y(j-1);
    end
    if(mod(i,2)==1)
        c(i)=(y1((i+n)/2)+y1((i+n+2)/2))/2;
    else
        c(i)=y1((i+n+1)/2)/2;
    end
    if(mod(i,2)==1)
        l=t+(i-1)/2;
        for(k=1:i-1)
            l=l*(t+(i-1)/2-k);
        end
    else
        l_1=t+i/2-1;
        l_2=t+i/2;
        for(k=1:i-1)
            l_1=l_1*(t+i/2-l-k);
            l_2=l_2*(t+i/2-k);
        end
        l=l_1+l_2;
    end
    l=l/factorial(i);
    f=f+c(i)*l;
    simplify(f);
    f=vpa(f,6);
    y=y1;
    
    if(i==n-1)
        if(nargin==3)
            f=subs(f,'t',(x0-x(nn))/(x(2)-x(1)));
        end
    end
end

function f=GBessel(x,y,n,x0)      %贝塞尔插值
syms t;
nn=n/2;
f=(y(nn)+y(nn+1))/2;
for(i=1:n-1)
    for(j=i+1:n)
        y1(j)=y(j)-y(j-1);
    end
    
    if(mod(i,2)==1)
        c(i)=y1((i+n+1)/2)/2;
    else
        c(i)=(y1((i+n)/2)+y1((i+n+2)/2))/2;
    end
    
    if(mod(i,2)==0)
        l=t+i/2-1;
        for(k=1:i-1)
            l=l*(t+i/2-1-k);
        end
    else
        l_1=t+(i-1)/2;
        l_2=t+(i-1)/2-1;
        for(k=1:i-1)
            l_1=l_1*(t+(i-1)/2-k);
            l_2=l_2*(t+(i-1)/2-1-k);
        end
        l=l_1+l_2;
    end
    
    l=l/factorial(i);
    f=f+c(i)*l;
    simplify(f);
    f=vpa(f,6);
    y=y1;
    
    if(i==n-1)
        if(nargin==4)
            f=subs(f,'t',(x0-x(nn))/(x(2)-x(1)));
        end
    end
end