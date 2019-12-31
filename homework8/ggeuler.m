function z = ggeuler(ffunc,a,b,h,y0)
%ŷ���Ľ���
%ffuncΪ�����Ҷ˺���
%aΪ�������ޣ�bΪ��������
%hΪ������y0Ϊ��ʼֵ
%Edited_by_lyr_2019.12.31

x = a:h:b;
n = length(x);
z(1) = y0;
for i = 1:n-1
    temp = z(i) + h*feval(ffunc,x(i),y(i));
    z(i+1) = z(i) + h/2*(feval(ffunc,x(i),z(i))+feval(ffunc,x(i+1),temp));
end
vpa(z,10)