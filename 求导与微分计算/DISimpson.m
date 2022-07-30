%%%%%%%%用于离散数据点
function df=DISimpson(X,Y,n,p)
%辛普森数值法求n个数据点在第p个点处的导数
%离散数据点的x坐标向量:X
%离散数据点的y坐标向量:Y
%数据点的个数:n
%要求导数的点:p
%导数值:df
if n<5
    disp('n不能小于5!');
    return;
end

if p==0
    disp('p不能等于0!');
    return;
end

h=n;        %%%总觉得这里有问题?????
xx=linspace(X(1),X(n),h);
if xx~=X                                 %判断是否是等距节点
    disp('节点之间不是等距的!');
    return;
end

%这两行用中心微分法给出端点的导数
f(1)=(Y(3)-Y(1))/(2*h);
f(2)=(Y(n)-Y(n-2))/(2*h);

%这一块用辛普森公式的右边的列向量
b(1,1)=3*(Y(3)-Y(1))/h-f(1);
b(n-2,1)=3*(Y(n)-Y(n-2))/h-f(2);
for i=2:n-3
    b(i,1)=3*(Y(i+2)-Y(i))/h;
end

%这一块是系数矩阵
for i=1:n-2
    for j=1:n-2
        if((i==j+1)||(j==i+1))
            A(i,j)=1;
        else if i==j
            A(i,j)=4;
            end
        end
    end
end

%%用QR分解法求解
[Q,R]=qr(A);
DF=R\(Q\b);

%求出第p个节点处的导数值
if p==1
    df=f(1);
else
    df=DF(p-1);
end