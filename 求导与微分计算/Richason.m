function df=Richason(func,x0,n,h)
%里查森外推算法求已知函数func在x0点处的导数值
%函数名:func
%求导点:x0
%将已知函数离散的数据点数:n
%离散步长:h
%导数值:df

if nargin==3
    h=1;
else if(nargin==3&&h==0.0)
        disp('h不能为0!');
        return;
    end
end

for i=1:n
    y1=subs(sym(func),findsym(sym(func)),x0+h/(2^i));
    y2=subs(sym(func),findsym(sym(func)),x0-h/(2^i));
    G(i)=2^(i-1)*(y1-y2)/h;    %求金字塔的底层值
end

G1=G;
for i=1:n-1
    for j=i+1:n
        G1(j)=(G(j)-0.5^(2*i)*G(j-1))/(1-0.5^(2*i));
    end
    G=G1;
end
df=G(n);   %顶层值就是所需的导数值
df=vpa(df,6);  %vpa设置df的精度