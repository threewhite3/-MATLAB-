clear;
clc;
a=[1 50 80 30 45 90 100];
af=zeros(1,length(a));   %Ԥ�ȷ����ڴ�
for n=1:length(a)
    if(a(n)>100)   %����100��
        af(n)=2;
        fprintf('\n\a bad data??\n');
    break;
    elseif a(n)>=60
        af(n)=1;  %С��100��,����60��
    elseif a(n)>=0
        af(n)=0;   %С��60��,����0��
    else
        af(n)=-1;
        fprintf('\n\a bad data??\n');
    break;
    end
end
af