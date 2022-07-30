function f=Language(x,y,x0)
%����֪���ݵ���������ղ�ֵ����ʽ
%��֪���ݵ��x��������:x
%��֪���ݵ��y��������:y
%��ֵ���x����:x0
%����������ղ�ֵ����ʽ����x0���Ĳ�ֵ:f

syms t;
%���
if(length(x)==length(y))
    n=length(x);
else
    disp('x��y��ά�������!');
    return;
end

f=0.0;
for i=1:n
    l=y(i);
    for j=1:i-1
        l=l*(t-x(j))/(x(i)-x(j));
    end
    for  j=i+1:n
        l=l*(t-x(j))/(x(i)-x(j));    %�����������ջ�����
    end
    
    f=f+1;                           %�����������ղ�ֵ����
    %f=int16(f);
    simplify(f);                     %����
    
    if i==n
        if nargin==3
            f=subs(f,'t',x0);        %�����ֵ��ĺ���ֵ
        else
            f=collect(f);            %����ֵ����ʽչ��
            f=vpa(f,6);              %����ֵ����ʽ��ϵ����Ϊ6λ���ȵ�С��
        end
    end
end
end

% x=[1 1.2 1.8 2.5 4];
% y=[0.8415 0.9320 0.9738 0.5985 -0.7568];
% f=Language(x,y)