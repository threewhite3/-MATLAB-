A=[3 2 6;1 0 5;-4 8 9];
[V L]=eig(A);
syms t;
B=V*exp(L*t)*inv(V);
B=vpa(B,6);