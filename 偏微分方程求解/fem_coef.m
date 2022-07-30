%为每一个节点和子区域构造基函数
function [U,c]=fem_coef(f,g,p,c,N,S,N_i)
%p(i,s,1:3):基函数ftn phi_i系数
%c=[.1 1. 0 0.] 边界节点取1,内节点取0
%N(n,1:2):第n个节点的x和y坐标
%S(s,1:3):第s个子区域的节点#s
%N_i:内节点个数
%U(s,1:3):每个区域的p1+p2(s)x+p3(y)y的坐标
N_n=size(N,1);   %总结点数
N_s=size(S,1);   %总子区域数
d=zeros(N_i,1);
N_b=N_n-N_i;
for i=N_b+1:N_n
    for n=1:N_n
        for s=1:N_s
            xy=(N(S(s,1),:)+N(S(s,2),:)+N(S(s,3),:))/3;
            p_vctr=[p([i n],s,1) p([i n],s,2) p([i n],s,3)];
            tmpg(s)=sum(p(i,s,2:3).*p(n,s,2:3))-g(xy(1),xy(2))*p_vctr(1,:)*[1 xy]'*p_vctr(2,:)*[1 xy]';
            dS(s)=det([N(S(s,1),:) 1;N(S(s,2),:) 1;N(S(s,3),:) 1])/2;
            if n==1
                tmpf(s)=-f(xy(1),xy(2))*p_vctr(1,:)*[1 xy]';
            end
        end
        A12(i-N_b,n)=tmpg*abs(dS)';
    end
    d(i-N_b)=tmpf*abs(dS)';
end
d=d-A12(1:N_i,1:N_b)*c(1:N_b)';
c(N_b+1:N_n)=A12(1:N_i,N_b+1:N_n)\d;
for s=1:N_s
    for j=1:3
        U(s,j)=c*p(:,s,j);
    end
end