function df=MidPoint(func,x0,h)
%�����е㹫ʽ,��ȡ����func��x0���ĵ���
%������:func
%�󵼵�:x0
%��ɢ����:h
%����ֵ:df
if nargin==2
    h=0.1;   %hĬ��ֵΪ0.1
else if (nargin==3&&h==0.0)
        disp('h����Ϊ0!');
        return;
    end
end
y1=subs(sym(func),findsym(sym(func)),x0+h);
y2=subs(sym(func),findsym(sym(func)),x0-h);
df=(y1-y2)/(2*h);  %�е㹫ʽ