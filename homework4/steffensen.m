function x = steffensen(ffunc,p0,epsilon,n)
%˹�ط�ɭ���������
%ffuncΪ����
%p0Ϊ��ʼ��
%epsilonΪ�������
%nΪ����������
%Edited_by_lyr_2019.12.31

phi = ffunc;
x(1) = feval(phi,p0);
x(2) = feval(phi,x(1));
x(3) = x(2) - (x(2)-x(1))*(x(2)-x(1))/(x(2)-2*x(1)+p0);
delta = abs(x(3)-x(2));
i = 3;
while delta > epsilon & i < n
    i = i+1;
    x(i) = feval(phi,x(i-1));
    x(i+1) = feval(phi,x(i));
    x(i+2) = x(i+1) - (x(i+1)-x(i))*(x(i+1)-x(i))/(x(i+1)-2*x(i)+x(i-1));
    delta = abs(x(i+2)-x(i+1));
    i = i+2;
end
vpa(x,10)
i
