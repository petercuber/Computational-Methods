function f = simpson(ffunc,a,b,n)
%��������������ɭ�����
%ffuncΪ���ֺ���
%aΪ�������ޣ�bΪ��������
%nΪ�ڵ���
%Edited_by_lyr_2019.12.31

h = (b-a)/n/2;
x = a:h:b;
y = zeros(1,length(x));
y(1) = 1;%matlab�޷����sin(0)/0
y(2:end) = feval(ffunc,x(2:end));
f = 0;
j = 1;
for i = 1:n
    f = f + (y(j) + 4*y(j+1) + y(j+2))*h/3;
    j = j + 2;
end
vpa(f,8)
