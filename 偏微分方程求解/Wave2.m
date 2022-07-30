%     ˫����ƫ΢�ַ���    
%     ��ά��������
function [u,x,y,t]=Wave2(A,D,T,it0,ilt0,bxyt,Mx,My,N)
%�ⷽ�� A * (u_xx+u_yy) =u_tt    �߽� D(1)<= x <=D(2), D(3)<= y <=D(4), 0<= t <=T
%��ʼ����: u(x,y,0)=it0(x,y), u_t(x,y,0)=ilt0(x,y)
%�߽�����: u(x,y,t)=bxyt(x,y,t)
%Mx:��x��ĵȷֶ���
%My:��y��ĵȷֶ���
%N:ʱ����ĵȷֶ���
dx=(D(2)-D(1))/Mx;
x=D(1)+[0:Mx]*dx;
dy=(D(4)-D(3))/My;
y=D(3)+[0:My]'*dy;
dt=T/N;
t=[0:N]*dt;
%��ʼ��
u=zeros(My+1,Mx+1);
ut=zeros(My+1,Mx+1);
for j=2:Mx
    for i=2:My
        u(i,j)=it0(x(j),y(i));
        ut(i,j)=ilt0(x(j),y(i));
    end
end

rx=A*(dt*dt)/dx/dx;
ry=A*(dt*dt)/dy/dy;
rxy1=1-rx-ry;
rxy2=2*rxy1;
u_1=u;
for k=0:N
    t=k*dt;
    for i=1:My+1
        u(i,[1,Mx+1])=[bxyt(x(1),y(i),t) bxyt(x(Mx+1),y(i),t)];
    end
    for j=1:Mx+1
        u([1,My+1],j)=[bxyt(x(j),y(1),t) bxyt(x(j),y(My+1),t)];
    end
    if k==0
        for i=2:My
            for j=2:Mx
                u(i,j)=0.5*(rx*(u_1(i,j-1)+u_1(i,j+1))+...
                    ry*(u_1(i-1,j)+u_1(i+1,j)))+rxy1*u(i,j)+dt*ut(i,j);
            end
        end
    else
        for i=2:My
            for j=2:Mx
                u(i,j)=rx*(u_1(i,j-1)+u_1(i,j+1))+ry*(u_1(i-1,j)+u_1(i+1,j))+rxy2*u(i,j)-u_2(i,j);
            end
        end
    end
    u_2=u_1;
    u_1=u;
end