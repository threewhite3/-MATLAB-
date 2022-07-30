function df=MidPoint(func,x0,h)
%采用中点公式,求取函数func在x0处的导数
%函数名:func
%求导点:x0
%离散步长:h
%导数值:df
if nargin==2
    h=0.1;   %h默认值为0.1
else if (nargin==3&&h==0.0)
        disp('h不能为0!');
        return;
    end
end
y1=subs(sym(func),findsym(sym(func)),x0+h);
y2=subs(sym(func),findsym(sym(func)),x0-h);
df=(y1-y2)/(2*h);  %中点公式