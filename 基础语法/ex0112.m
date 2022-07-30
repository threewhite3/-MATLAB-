function m=ex0112(n)
if n<=1
    m=1;
else 
    m=n*ex0112(n-1);
end
end