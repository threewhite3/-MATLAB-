r=80;
M=160;
p=exp(-r);
S1=0;
for k=1:M       %嵌套方法
    p=p*r/k;
    S1=S1+p;
end
S1
S2=0;
for k=1:M               %非嵌套方法
    p=r^k/factorial(k);
    S2=S2+p;
end
S2*exp(-r);
S2