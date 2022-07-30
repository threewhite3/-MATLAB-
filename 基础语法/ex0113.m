function p=ex0113(a,b)
%求多项式a,b的和p
if nargin==1   %输入参数个数为1,另一个默认参数为全0向量
    b=zeros(4,1);
elseif nargin==0
    error('empty input');    %输入参数个数为0,报错
end
a=a(:).';   %矩阵转置
b=b(:).';   %矩阵转置
na=length(a);  %a矩阵行数和列数最大值
nb=length(b);  %b矩阵行数和列数最大值
p=[zeros(1,nb-na) a]+[zeros(1,na-nb) b];  %多项式相加