function x = jddd(ffunc,p0,epsilon,n)
%�򵥵��������
%ffuncΪ����
%p0Ϊ��ʼ��
%epsilonΪ�������
%nΪ����������
%Edited_by_lyr_2019.12.31

phi = ffunc;
x(1) = feval(phi,p0);
x(2) = feval(phi,x(1));
delta = abs(x(2)-x(1));
i = 2;
while delta > epsilon | i < n
    i = i+1;
    x(i) = feval(phi,x(i-1));
    delta = abs(x(i)-x(i-1));
end
vpa(x,10)
i
