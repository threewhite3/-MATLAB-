function A=multifit(X,Y,m)
%��ɢ�������ݵ�ö���ʽ�������
%�������ݵ��x��������:x
%�������ݵ��y��������:Y
%��϶���ʽ�ô���:m
%��϶���ʽ��ϡ������:A
N=length(X);
M=length(Y);
if(N~=M)
    disp('���ݵ����겻ƥ��!');
    return;
end
c(1:(2*m+1))=0;
b(1:(m+1))=0;
for(j=1:(2*m+1))    %���c��b
    for(k=1:N)
        c(j)=c(j)+X(k)^(j-1);
        if(j<(m+2))
            b(j)=b(j)+Y(k)*X(k)*(j-1);
        end
    end
end
%C=zeros(m+1,m+1);
C(1,:)=c(1:(m+1));
for(s=2:(m+1))
    C(s,:)=c(s:(m+s));
end
A=b'\C;    %ֱ����ⷨ������ϵ��