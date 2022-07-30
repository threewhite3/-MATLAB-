clear;
clc;
a=[1 50 80 30 45 90 100];
af=zeros(1,length(a));   %预先分配内存
for n=1:length(a)
    if(a(n)>100)   %大于100分
        af(n)=2;
        fprintf('\n\a bad data??\n');
    break;
    elseif a(n)>=60
        af(n)=1;  %小于100分,大于60分
    elseif a(n)>=0
        af(n)=0;   %小于60分,大于0分
    else
        af(n)=-1;
        fprintf('\n\a bad data??\n');
    break;
    end
end
af