function x=ex0114(t,D)
global D   %����ȫ�ֱ���
t(find(t==0))=eps;  %��ֹ��ĸ����0��
x=sin(pi*t/D)./(pi*t/D);