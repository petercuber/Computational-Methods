function x = czjsdd(ffunc,p0,epsilon,n)
%插值加速迭代法求根
%ffunc为函数
%p0为初始根
%epsilon为误差容限
%n为最大迭代次数
%Edited_by_lyr_2019.12.31

phi = ffunc;
x(1) = feval(phi,p0);
z(1) = x(1);
z(2) = feval(phi,x(1));
x(2) = x(1) + (x(1)-p0)*(x(1)-z(2))/(p0-x(1)-x(1)+z(2));
delta = abs(x(2)-x(1));
i = 2;
while delta > epsilon & i < n
    i = i+1;
    z(i) = feval(phi,x(i-1));
    x(i) = x(i-1) + (x(i-1)-x(i-2))*(x(i-1)-z(i))/(x(i-2)-z(i-1)-x(i-1)+z(i));
    delta = abs(x(i)-x(i-1));
end
vpa(z,10)
vpa(x,10)
i
