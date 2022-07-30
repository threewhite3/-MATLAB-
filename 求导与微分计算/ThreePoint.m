function df=ThreePoint(func,x0,type,h)
%采用三点公式,求取函数func在x0处的导数
%函数名:func
%求导点:x0
%公式的形式:type(取值为1,2,3)
%离散步长:h
%导数值:df
if nargin==3
    h=0.1;
else if(nargin==4&&h==0.0)
        disp('h不能为0!');
        return;
    end
end
y0=subs(sym(func),findsym(sym(func)),x0);
y1=subs(sym(func),findsym(sym(func)),x0+h);
y2=subs(sym(func),findsym(sym(func)),x0+2*h);
y_1=subs(sym(func),findsym(sym(func)),x0-h);
y_2=subs(sym(func),findsym(sym(func)),x0-2*h);
switch type
    case 1,
        df=(-3*y0+4*y1-y2)/(2*h);  %用第一个公式求导
    case 2,
        df=(3*y0-4*y_1+y_2)/(2*h);  %用第二个公式求导
    case 3,
        df=(y1-y_1)/(2*h);         %用第三个公式求导
end