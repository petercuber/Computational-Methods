function x = scdd(ffunc,p0,omega,epsilon,n)
%松弛迭代法求根
%ffunc为函数
%p0为初始根
%omega为松弛因子
%epsilon为误差容限
%n为最大迭代次数
%Edited_by_lyr_2019.12.31

phi = ffunc;
p(1) = feval(phi,p0);
x(1) = omega*p(1) + (1-omega)*p0;
p(2) = feval(phi,x(1));
x(2) = omega*p(2) + (1-omega)*x(1);
delta = abs(x(2)-x(1));
i = 2;
while delta > epsilon & i < n
    i = i+1;
    p(i) = feval(phi,x(i-1));
    x(i) = omega*p(i) + (1-omega)*x(i-1);
    delta = abs(x(i)-x(i-1));
end
vpa(x,10)
i
