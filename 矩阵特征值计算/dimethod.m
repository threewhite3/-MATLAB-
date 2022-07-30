function [l,v]=dimethod(A,x0,u,eps)
%λ�����ݷ��������ĳ���������������ֵ�����Ӧ����������
%��֪����:A
%������ʼ����:x0
%����:u
%�����ľ���:eps
%��õľ�����u���������ֵ:l
%��õľ��������ֵl��Ӧ����������:v
if nargin==3
    eps=1e-6;
end
N=size(A);
n=N(1,1);   %nΪA�Ľ�
v=x0;
M=5000;
m=0;
l=0;
for(k=1:M)
    y=(A-u*eye(n,n))\v;
    m=max(y);
    v=y/m;
    if(abs(m-1)<eps)
        l=l/m+u;
        return;
    else
        if(k==M)
            disp('��������̫��,�����ٶ�̫��!');
            l=l/m+u;
        else
            l=m;
        end
    end
end