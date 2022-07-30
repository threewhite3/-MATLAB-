function I=SmartSimpson(f,a,b,eps)
%����Ӧ����ɭ���ַ�����f������[a,b]�ϵĶ�����
%������:f
%��������:a
%��������:b
%���־���:eps
%����ֵ:I

if nargin==3
    eps=1e-4;
end
e=5*eps;
I=SubSmartSimpson(f,a,b,e);
I=vpa(I,5);
end

function q=SubSmartSimpson(f,a,b,eps)
QA=IntSimpson(f,a,b,1,eps);
QLeft=IntSimpson(f,a,(a+b)/2,1,eps);
QRight=IntSimpson(f,(a+b)/2,b,1,eps);

if(abs(QLeft+QRight-QA)<=eps)
    q=QA;
else
    q=SubSmartSimpson(f,a,(a+b)/2,eps)+SubSmartSimpson(f,(a+b)/2,b,eps);  %�ݹ鹫ʽ
end
q=vpa(q,5);
end