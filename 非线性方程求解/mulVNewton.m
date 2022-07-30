function [r,n]=mulVNewton(x0,eps)
    %��ţ�ٷ�������Է������һ����
    %��ʼ����������x0
    %�������ȣ�eps
    %��������r
    %����������n
    
    if nargin==1
        A=eye(length(x0));   %AȡΪ��λ��
    else
        if nargin==2
            eps=1e-4;
        end
    end
    
    r=x0-myf(x0)/A;
    n=1;
    tol=1;
    while tol>eps
        x0=r;
        r=x0-myf(x0)/A;
        y=r-x0;
        z=myf(r)-myf(x0);
        A1=A+(z-y*A)'*y/norm(y);   %����A
        A=A1;
        n=n+1;
        if n>100000
            disp('��������̫�࣬���ܲ�������');
            return;
        end
        tol=norm(r-x0);
    end
end

function f=myf(x)
    f(1)=0.5*sin(x(1))+0.1*cos(x(2)*x(1))-x(1);
    f(2)=0.5*cos(x(1))-0.1*sin(x(2))-x(2);
    f=[f(1) f(2)];
end

function df=dmyf(x)
    df=[0.5*cos(x(1))-0.1*x(2)*sin(x(2)*x(1))-1 -0.1*x(1)*sin(x(2)*x(1)); -0.5*sin(x(1)) -0.1*cos(x(2))-1];
end
    
