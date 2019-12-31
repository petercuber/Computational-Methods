function f = simpsonb(ffunc,a,b,n,epsilon)
%�䲽����������ɭ�����
%ffuncΪ���ֺ���
%aΪ�������ޣ�bΪ��������
%nΪ��������epsilonΪ�������
%Edited_by_lyr_2019.12.31

h = (b-a)/2;
x = a:h:b;
% S0 = feval(ffunc,a) + feval(ffunc,b);
S0 = 1 + feval(ffunc,b);%matlab�޷����sin(0)/0
S1 = feval(ffunc,a+h);
S2 = 0;
y0 = (S0 + 4*S1 + S2)*h/3;

h = h/2;
x = a:h:b;
S2 = S1 + S2;
S1 = sum(feval(ffunc,x(2:2:end-1)));
y1 = (S0 + 4*S1 + 2*S2)*h/3;
delta = abs(y1-y0);
y0 = y1;
i = 1;
while delta > epsilon & i < n
    h = h/2;
    x = a:h:b;
    S2 = S1 + S2;
    S1 = sum(feval(ffunc,x(2:2:end-1)));
    y1 = (S0 + 4*S1 + 2*S2)*h/3;
    delta = abs(y1-y0);
    y0 = y1;
    i = i + 1;
end
f = y0;
vpa(y0,8)
h
i