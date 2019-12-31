function y = sc(p0,x,omega,epsilon,n)
%�ɳڷ���������
%p0Ϊ��ʼ��
%xΪ��õĸ�����
%omegaΪ�ɳ�����
%epsilonΪ�������
%nΪ����������
%Edited_by_lyr_2019.12.31

p = [p0 x];
y(1) = omega*p(2) + (1-omega)*p(1);
y(2) = omega*p(3) + (1-omega)*p(2);
delta = abs(y(2)-y(1));
i = 2;
while delta > epsilon & i < n
    i = i+1;
    y(i) = omega*p(i+1) + (1-omega)*p(i);
    delta = abs(y(i)-y(i-1));
end
vpa(y,10)
i

