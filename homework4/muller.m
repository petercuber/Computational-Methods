function x = muller(ffunc,p0,p1,epsilon,n)
%改进弦割---Muller法求根
%ffunc为函数
%p0,p1为初始根
%epsilon为误差容限
%n为最大迭代次数
%Edited_by_lyr_2019.12.31

f = ffunc;
f1 = feval(f,p0);
f2 = feval(f,p1);
x(1) = p1;
x(2) = p1 - f2*(p1-p0)/(f2-f1);
f3 = feval(f,x(2));
g1 = (f2-f1)/(p1-p0);
g11 = (f3-f2)/(x(2)-x(1));
g2 = (g11-g1)/(x(2)-p0);
j1 = ((g2*(x(2)+x(1))-g11) + sqrt(g11*g11 + (x(2)-x(1))*(x(2)-x(1))*g2*g2 - 2*(f3+f2)*g2))/(2*g2);
j2 = ((g2*(x(2)+x(1))-g11) - sqrt(g11*g11 + (x(2)-x(1))*(x(2)-x(1))*g2*g2 - 2*(f3+f2)*g2))/(2*g2);
pd = [abs(j1-x(2)),abs(j2-x(2))];
if pd(1) < pd(2)
    x(3) = j1;
else
    x(3) = j2;
end
delta = abs(x(3)-x(2));
i = 3;
while delta > epsilon & i < n
    i = i+1;
    f1 = f2;
    f2 = f3;    
    f3 = feval(f,x(i-1));
    g1 = g11;
    g11 = (f3-f2)/(x(i-1)-x(i-2));
    g2 = (g11-g1)/(x(i-1)-x(i-2));
    j1 = ((g2*(x(i-1)+x(i-2))-g11) + sqrt(g11*g11 + (x(i-1)-x(i-2))*(x(i-1)-x(i-2))*g2*g2 - 2*(f3+f2)*g2))/(2*g2);
    j2 = ((g2*(x(i-1)+x(i-2))-g11) - sqrt(g11*g11 + (x(i-1)-x(i-2))*(x(i-1)-x(i-2))*g2*g2 - 2*(f3+f2)*g2))/(2*g2);
    pd = [abs(j1-x(2)),abs(j2-x(2))];
    if pd(1) < pd(2)
        x(i) = j1;
    else
        x(i) = j2;
    end
    delta = abs(x(i)-x(i-1));
end
vpa(x,10)
i