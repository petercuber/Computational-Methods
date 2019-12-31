function z = tixing(ffunc,a,b,h,y0,m,epsilon)
%���η�
%ffuncΪ�����Ҷ˺���
%aΪ�������ޣ�bΪ��������
%hΪ������y0Ϊ��ʼֵ
%Edited_by_lyr_2019.12.31

x = a:h:b;
n = length(x);
z(1) = y0;
for i = 1:n-1
    temp = z(i) + h*feval(ffunc,x(i),z(i));
    z(i+1) = z(i) + h/2*(feval(ffunc,x(i),z(i))+feval(ffunc,x(i+1),temp));
    j = 1;
    z1 = z(i+1);
    z2 = z(i) + h/2*(feval(ffunc,x(i),z(i))+feval(ffunc,x(i+1),z1));
    delta = abs(z2-z1);
    z1 = z2;
    while delta > epsilon & j < m
        z2 = z(i) + h/2*(feval(ffunc,x(i),z(i))+feval(ffunc,x(i+1),z1));
        delta = abs(z2-z1);
        z1 = z2;
        j = j+1;
    end
    z(i+1) = z1;
end
vpa(z,10)