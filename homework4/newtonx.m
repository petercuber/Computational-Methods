function y = newtonx(ffunc,p0,epsilon,n)
%�Ľ�ţ�ٵ��������
%ffuncΪ����
%p0Ϊ��ʼ��
%epsilonΪ�������
%nΪ����������
%Edited_by_lyr_2019.12.31

syms p phi(p)
f = ffunc;
fx = diff(ffunc);
fxx = diff(diff(ffunc));
phi(p) = p - (fx(p)-sign(fx(p))*sqrt(fx(p)*fx(p)-2*f(p)*fxx(p)))/fxx(p);
% phi(p) = p - 2*f(p)/(fx(p)+sign(fx(p))*sqrt(fx(p)*fx(p)-2*f(p)*fxx(p)));
x(1) = feval(phi,p0);
x(2) = feval(phi,x(1));
delta = abs(x(2)-x(1));
i = 2;
while delta > epsilon & i < n
    i = i+1;
    x(i) = feval(phi,(x(i-1)));
    delta = abs(x(i)-x(i-1));
end
vpa(x,10)
i
