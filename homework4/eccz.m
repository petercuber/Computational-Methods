function x = eccz(ffunc,p0,p1,epsilon,n)
%�Ľ��Ҹ�---���β�ֵ�����
%ffuncΪ����
%p0,p1Ϊ��ʼ��
%epsilonΪ�������
%nΪ����������
%Edited_by_lyr_2019.12.31

f = ffunc;
f1 = feval(f,p0);
f2 = feval(f,p1);
x(1) = p1;
x(2) = p1 - f2*(p1-p0)/(f2-f1);
f3 = feval(f,x(2));
x(3) = x(2) - (x(2)-x(1))/(f3-f2)*f3 + ((x(2)-x(1))/(f3-f2) - (p1-p0)/(f2-f1))*f3*f2/(f3-f1);
delta = abs(x(2)-x(1));
i = 3;
while delta > epsilon & i < n
    i = i+1;
    f1 = f2;
    f2 = f3;
    f3 = feval(f,x(i-1));
    x(i) = x(i-1) - (x(i-1)-x(i-2))/(f3-f2)*f3 + ((x(i-1)-x(i-2))/(f3-f2) - (x(i-2)-x(i-3))/(f2-f1))*f3*f2/(f3-f1);
    delta = abs(x(i)-x(i-1));
end
vpa(x,10)
i