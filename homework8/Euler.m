function z = Euler(ffunc,a,b,h,y0)
%������ŷ����
%ffuncΪ�����Ҷ˺���
%aΪ�������ޣ�bΪ��������
%hΪ������y0Ϊ��ʼֵ
%Edited_by_lyr_2019.12.31

x = a:h:b;
n = length(x);
z(1) = y0;
for i = 1:n-1
    z(i+1) = z(i) + h*feval(ffunc,x(i),z(i));
end
vpa(z,10)
