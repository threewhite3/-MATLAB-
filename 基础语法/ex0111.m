clear;
clc;

%for—≠ª∑
m=1;
n=-1;
if n<0
    error('input must be positive,stopped');
end
tic
for k=2:n
    m=m*k;
end
toc
