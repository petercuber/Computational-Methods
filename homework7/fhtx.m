function f = fhtx(ffunc,a,b,n)
%�������������������
%ffuncΪ���ֺ���
%aΪ�������ޣ�bΪ��������
%nΪ�ڵ���
%Edited_by_lyr_2019.12.31

h = (b-a)/n;
x = a:h:b;
y = zeros(1,length(x));
y(1) = 1;%matlab�޷����sin(0)/0
y(2:end) = feval(ffunc,x(2:end));
f = 0;
for i = 1:n
    f = f + (y(i) + y(i+1))*h/2;
end
vpa(f,8)

