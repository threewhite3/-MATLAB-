function I=IntGaussLager(f,n,AK,XK)
%高斯-拉盖尔公式求函数f在0到正无穷的近似积分
%函数名:f
%积分所用项数:n
%自定义高斯-拉盖尔公式中的系数:AK
%自定义高斯-拉盖尔公式中的节点坐标:XK
%积分值:I
if n<6&&nargin==2
    AK=0;
    XK=0;
else
    I=sum(AK.*subs(sym(f),findsym(sym(f)),XK));
end

switch n
    case 2,
        I=0.853553*subs(sym(f),findsym(sym(f)),-0.585786)+...
            0.146447*subs(sym(f),findsym(sym(f)),3.414214);
    case 3,
        I=0.711093*subs(sym(f),findsym(sym(f)),0.415575)+...
            0.248518*subs(sym(f),findsym(sym(f)),2.294280)+...
            0.0103893*subs(sym(f),findsym(sym(f)),6.289945);
    case 4,
        I=0.603154*subs(sym(f),findsym(sym(f)),0.322548)+...
            0.357419*subs(sym(f),findsym(sym(f)),1.745761)+...
            0.0388879*subs(sym(f),findsym(sym(f)),4.536620)+...
            0.000539295*subs(sym(f),findsym(sym(f)),9.395071);
    case 5,
        I=0.521756*subs(sym(f),findsym(sym(f)),0.263560)+...
            0.398667*subs(sym(f),findsym(sym(f)),1.413403)+...
            0.0759424*subs(sym(f),findsym(sym(f)),3.596426)+...
            0.00361176*subs(sym(f),findsym(sym(f)),7.085710)+...
            0.0000233700*subs(sym(f),findsym(sym(f)),12.640801);
end
I=vpa(I,4);