function f=DCS(x,y,x0)
%�õ������㷨����֪���ݵ�������ʽ��ʽ�Ĳ�ֵ��ʽ
%��֪���ݵ��x��������:x
%��֪���ݵ��y��������:y
%��ֵ���x����:x0
%��õ������ʽ��ʽ�Ĳ�ֵ��ʽ����x0���Ĳ�ֵ:f

syms t;
if(length(x)==length(y))
    n=length(x);
    c(1:n)=0.0;
else 
    disp('x��y��ά�������!');
    return;
end
c(1)=y(1);
for(i=1:n-1)
    for(j=i+1:n)
        y1(j)=(x(j)-x(i))/(y(j)-y(i));
    end
    c(i+1)=y1(i+1);
    y=y1;
end
f=c(n);
for(i=1:n-1)
    f=c(n-i)+(t-x(n-i))/f;
    f=vpa(f,6);
    if(i==n-1)
        if(nargin==3)
            f=subs(f,'t',x0);
        else
            f=vpa(f,6);
        end
    end
end