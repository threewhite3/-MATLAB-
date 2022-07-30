function I=IntGaussHermite(f,n,AK,XK)
%��˹-�������ع�ʽ����f�ڸ����������Ľ��ƻ���
%������:f
%������������:n
%�Զ����˹-�������ع�ʽ�е�ϵ��:AK
%�Զ����˹-�������ع�ʽ�еĽڵ�����:XK
%����ֵ:I

if n<6&&nargin==2
    AK=0;
    XK=0;
else
    I=sum(AK.*subs(sym(f),findsym(sym(f)),XK));
end

switch n
    case 2,
        I=0.886227*(subs(sym(f),findsym(sym(f)),0.707107)+...
            subs(sym(f),findsym(sym(f)),-0.707107));
    case 3,
        I=1.181636*subs(sym(f),findsym(sym(f)),0)+...
            0.295409*(subs(sym(f),findsym(sym(f)),1.224745)+...
            subs(sym(f),findsym(sym(f)),-1.224745));
    case 4,
        I=0.544444*(subs(sym(f),findsym(sym(f)),0.524548)+...
            subs(sym(f),findsym(sym(f)),-0.524548))+...
            0.1*(subs(sym(f),findsym(sym(f)),1.650680)+...
            subs(sym(f),findsym(sym(f)),-1.650680));
    case 5,
        I=0.945309*subs(sym(f),findsym(sym(f)),0)+...
            0.393619*(subs(sym(f),findsym(sym(f)),0.958572)+...
            subs(sym(f),findsym(sym(f)),-0.958572))+...
            0.199532*(subs(sym(f),findsym(sym(f)),7.085710)+...
            subs(sym(f),findsym(sym(f)),-7.085710));
end
I=vpa(I,6);