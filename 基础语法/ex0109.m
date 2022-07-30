%function ex0109()
N=100000;
a=[1:N];
x=1;
tic   %初始化时钟
p1=sum(a.*x.^[N-1:-1:0]);  %按照(*)求值
p1,toc  %时钟停止,获得执行时间
tic,p2=a(1);
for i=2:N   %嵌套计算
    p2=p2*x+a(i);
end
p2,toc
tic,p3=polyval(a,x),toc  %用matlab自带函数求值