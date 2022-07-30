% 产生基函数
function p=fem_basis_ftn(N,S)
% p(i,s,1:3):基函数ftn phi_i系数,共s个子区域
% N(n,1:2): 第n个节点的x和y坐标
% S(s,1:3): 第s个子区域的节点#s
N_n=size(N,1);   %总结点数
N_s=size(S,1);  %总区域数

for n=1:N_n
    for s=1:N_s
        for i=1:3
            A(i,1:3)=[1 N(S(s,i),1:2)];
            b(i)=(S(s,i)==n);
        end
        pnt=A\b';
        for i=1:3
            p(n,s,i)=pnt(i);
        end
    end
 end
% bx0=inline('y^2','y');   %边界条件
% bxf=inline('4^2*cos(y)','y');
% by0=inline('x^2','x');
% byf=inline('4^2*cos(x)','x');
% D=[0 4 0 4];
% MaxIter=400;
% MinErr=1e-4;
% [U x y]=Helmholtz(f,g,bx0,bxf,by0,byf,D,Mx,My,MinErr,MaxIter);
% clf;
% mesh(x,y,U);