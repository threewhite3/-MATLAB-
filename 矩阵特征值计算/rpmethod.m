function [l,v,s]=rpmethod(A,x0,eps)
%�����̼����ݷ���Գƾ����������ֵ������������
%��֪����:A
%������ʼ����:x0
%�����ľ���:eps
%��õľ�������ֵ:l
%��õľ�������������:v
%��������:s
if nargin==2
    eps=1e-6;
end
v=x0;  %vΪ����������
M=5000;  %������������
m=0;
l=0;
for(k=1:M)
    y=A*v;
    m=(y'*v)/(v'*v);  %mΪ������
    if(rank(m)>1)
        m=(y*v')/(v*v');
    end
    v=y/m;
    if(abs(m-1)<eps)
        l=m;   %���ﾫ��,�˳�,lΪ������ֵ
        s=k;
        return;
    else
        if(k==M)
            disp('��������̫��,�����ٶ�̫��!');
            l=m;
            s=M;
        else
            l=m;
        end
    end
end