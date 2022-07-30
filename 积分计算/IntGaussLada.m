function I=IntGaussLada(f,a,b,n,AK,NK)
%高斯-拉道公式求函数f在区间[a,b]上的定积分
%函数名:f
%积分下限:a
%积分上限:b
%积分所用项数:n
%自定义高斯-拉道公式中的系数:AK
%自定义高斯-拉道公式中的节点坐标:AK
%积分值:I

if n<6&&nargin==4
    AK=0;
    XK=0;
else
    XK1=(b-a)/2*XK+(a+b)/2;
    I=(b-a)/2*((2/n/n)*subs(sym(f),findsym(sym(f)),a)+...
        sum(AK.*subs(sym(f),findsym(sym(f)),XK1)));
end

ta=(b-a)/2;
tb=(b+a)/2;

switch n
    case 2,
        I=ta*0.5*subs(sym(f),findsym(sym(f)),ta*(-1)+tb)+...
            1.5*ta*subs(sym(f),findsym(sym(f)),ta*(1/3)+tb);
    case 3,
        I=ta*(2/9*subs(sym(f),findsym(sym(f)),ta*(-1)+tb)+...
            0.752806*subs(sym(f),findsym(sym(f)),ta*(-0.289898)+tb)+...
            1.024972*subs(sym(f),findsym(sym(f)),ta*0.689898+tb));
    case 4,
        I=ta*(0.125*subs(sym(f),findsym(sym(f)),ta*(-1)+tb)+...
            0.657689*subs(sym(f),findsym(sym(f)),ta*(-0.575319)+tb)+...
            0.776387*subs(sym(f),findsym(sym(f)),ta*0.181066+tb)+...
            0.440925*subs(sym(f),findsym(sym(f)),ta*0.822824+tb));
    case 5,
        I=ta*(0.08*subs(sym(f),findsym(sym(f)),ta*(-1)+tb)+...
            0.446207*subs(sym(f),findsym(sym(f)),ta*(-0.720480)+tb)+...
            0.623653*subs(sym(f),findsym(sym(f)),ta*(-0.167181)+tb)+...
            0.562712*subs(sym(f),findsym(sym(f)),ta*0.446314+tb)+...
            0.287427*subs(sym(f),findsym(sym(f)),ta*0.885792+tb));
end
I=vpa(I,5);