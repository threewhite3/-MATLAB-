function [l,v,s]=pmethod(A,x0,eps)
%�ݷ�������������ֵ������������
%��֪����:A
%������ʼ����:x0
%��������:eps
%��õľ�������ֵ:l
%��õľ�������������:v
%��������:s
if nargin==2
    eps=1e-6;
end
v=x0;  %vΪ����������
M=5000;   %������������
m=0;
l=0;
for(k=1:M)
    y=A*v;
    m=max(y);    %mΪ��ģ���ķ���
    v=y/m;
    
    if(abs(m-1)<eps)
        l=m;   %�ﵽ����,�˳�,lΪ������ֵ
        s=k;   %sΪ��������
        return;
    else
        if(k==M)
            disp('��������̫��,�����ٶ�̫��!');
            l=m;
            s=m;
        else
            l=m;
        end
    end
end