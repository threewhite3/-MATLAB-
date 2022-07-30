clear;
clc;
%产生节点
N=[-1 0;-1 -1;-1/2 -1;0 -1;1/2 -1;1 -1;1 0;1 1;1/2 1;0 1;
    -1/2 1;-1 1;-1/2 -1/4;-5/8 -7/16;-3/4 -5/8;-1/2 -5/8;
    -1/4 -5/8;-3/8 -7/16;0 0;1/2 1/4;5/8 7/16;3/4 5/8;
    1/2 5/8;1/4 5/8;3/8 7/16;-9/16 -17/32;-7/16 -17/32;
    -1/2 -7/16;9/16 17/32;7/16 17/32;1/2 7/16];
N_b=12;      %边缘节点数
%分割区域
S=[1 11 12; 1 11 19;10 11 19;4 5 19;5 7 19;5 6 7;1 2 15;2 3 15;
    3 15 17;3 4 17;4 17 19;13 17 19;1 13 15;7 8 22;8 9 22;
    9 22 24;9 10 24;10 19 24;19 20 24;7 19 20;7 20 22;13 14 18;
    14 15 16;16 17 18;20 21 25;21 22 23;23 24 25;14 26 28;
    16 26 27;18 27 28;21 29 31;23 29 30;25 30 31;
    26 27 28;29 30 31];   %子区域
f11='-(norm([x,y]+[0.5 0.5])<0.01)-(norm([x,y]-[0.5 0.5])<0.01)';
f=inline(f11,'x','y');
g=inline('0','x','y');
N_n=size(N,1);   %总节点数
N_i=N_n-N_b;    %内部节点数
c=zeros(1,N_n);   %边界节点和内部节点的取值
p=fem_basis_ftn(N,S);
[U,c]=fem_coef(f,g,p,c,N,S,N_i);
%输出图形
figure(1);
clf;
trimesh(S,N(:,1),N(:,2),c);
N_s=size(S,1);   %子区域总数
x0=-1;
xf=1;
y0=-1;
yf=1;
Mx=16;
dx=(xf-x0)/Mx;
xi=x0+[0:Mx]*dx;
My=16;
dy=(yf-y0)/My;
yi=y0+[0:My]*dy;
for i=1:length(xi)
    for j=1:length(yi)
        for s=1:N_s
            if inpolygon(xi(i),yi(j),N(S(s,:),1),N(S(s,:),2))>0
                Z(i,j)=U(s,:)*[1 xi(i) yi(j)]';
                break;
            end
        end
    end
end
figure(2);
clf;
mesh(xi,yi,Z);
xlabel('x');
ylabel('y');
zlabel('z');

bx0=inline('0');
bxf=inline('0');
by0=inline('0');
byf=inline('0');
[U,x,y]=Helmholtz(f,g,bx0,bxf,by0,byf,[x0 xf y0 yf],Mx,My,1e-4,100);
figure(3);
clf;
mesh(x,y,U);
xlabel('x');
ylabel('y');
zlabel('U');