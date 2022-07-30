%%%%%%%%%%已知函数表达式
function df=CISimpson(func,x0,n,h)
%辛普森数值法求已知函数func在x0点的导数值
%函数名:func
%求导点:x0
%将已知函数离散的数据点数:n
%离散步长:h
%导数值:df
if nargin==2
    h=0.1;
    n=5;
else
    if nargin==3
        if(n<5)
            disp('n不能小于5!');
            return;
        else
            h=0.1;
        end
    elseif(nargin==4&&h==0.0)
        disp('h不能为0!');
        return;
    end
end
for i=1:n      %这个循环计算节点的函数值
    if(mod(n,2)==0)
        y(i)=subs(sym(func),findsym(sym(func)),x0+(i-n/2)*h);
    else
        y(i)=subs(sym(func),findsym(sym(func)),x0+(i-(n+1)/2)*h);
    end
end
%这两行用中心微分法给出的端点的导数
f(1)=(y(3)-y(1))/(2*h);
f(2)=(y(n)-y(n-2))/(2*h);
%这一块是辛普森公式的列向量
b(1:n-2,1)=zeros(n-2,1);
b(1,1)=3*(y(3)-y(1))/(h-f(1));
b(n-2,1)=3*(y(n)-y(n-2))/h-f(2);
for i=2:(n-3)
    b(i,1)=3*(y(i+2)-y(i))/h;
end
%这一块是系数矩阵
for i=1:n-2
    for j=1:n-2
        if((i==j+1)||(j==i+1))
            A(i,j)=1;
        elseif i==j
            A(i,j)=4;
        end
    end
end
%用QR分解法求解
[Q,R]=qr(A);
DF=R\(Q\b);
%求出x0的导数
if mod(n,2)==0
    df=DF(n/2);
else
    df=DF((n+1)/2);
end