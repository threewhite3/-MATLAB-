function c=DFF(f,N)
%离散周期数据点得傅里叶逼近
%已知离散数据点:f
%离散数据点得个数:N
%逼近系数:c
c(1:N)=0;
for(m=1:N)
    for(n=1:N)
        c(m)=c(m)+f(n)*exp(-i*m*n*2*pi/N);
    end
    c(m)=c(m)/N;
end