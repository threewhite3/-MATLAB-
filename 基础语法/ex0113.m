function p=ex0113(a,b)
%�����ʽa,b�ĺ�p
if nargin==1   %�����������Ϊ1,��һ��Ĭ�ϲ���Ϊȫ0����
    b=zeros(4,1);
elseif nargin==0
    error('empty input');    %�����������Ϊ0,����
end
a=a(:).';   %����ת��
b=b(:).';   %����ת��
na=length(a);  %a�����������������ֵ
nb=length(b);  %b�����������������ֵ
p=[zeros(1,nb-na) a]+[zeros(1,na-nb) b];  %����ʽ���