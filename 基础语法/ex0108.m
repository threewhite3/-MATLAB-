clear;
clc;
n=1;
a=[9 2 4 3 5 6 8 0];
min=inf;
while n<=8
    if a(n)<min
        min=a(n);
    end
    n=n+1;
end
min