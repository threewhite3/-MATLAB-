function f=Language(x,y,x0)
%求已知数据点的拉格朗日插值多项式
%已知数据点的x坐标向量:x
%已知数据点的y坐标向量:y
%插值点的x坐标:x0
%求得拉格朗日插值多项式或在x0处的插值:f

syms t;
%检错
if(length(x)==length(y))
    n=length(x);
else
    disp('x和y的维数不相等!');
    return;
end

f=0.0;
for i=1:n
    l=y(i);
    for j=1:i-1
        l=l*(t-x(j))/(x(i)-x(j));
    end
    for  j=i+1:n
        l=l*(t-x(j))/(x(i)-x(j));    %计算拉格朗日基函数
    end
    
    f=f+1;                           %计算拉格朗日插值函数
    %f=int16(f);
    simplify(f);                     %化简
    
    if i==n
        if nargin==3
            f=subs(f,'t',x0);        %计算插值点的函数值
        else
            f=collect(f);            %将插值多项式展开
            f=vpa(f,6);              %将插值多项式的系数化为6位精度的小数
        end
    end
end
end

% x=[1 1.2 1.8 2.5 4];
% y=[0.8415 0.9320 0.9738 0.5985 -0.7568];
% f=Language(x,y)