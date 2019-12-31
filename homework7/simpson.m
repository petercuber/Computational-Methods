function f = simpson(ffunc,a,b,n)
%定步长复化辛普森求积分
%ffunc为积分函数
%a为积分下限，b为积分上限
%n为节点数
%Edited_by_lyr_2019.12.31

h = (b-a)/n/2;
x = a:h:b;
y = zeros(1,length(x));
y(1) = 1;%matlab无法求解sin(0)/0
y(2:end) = feval(ffunc,x(2:end));
f = 0;
j = 1;
for i = 1:n
    f = f + (y(j) + 4*y(j+1) + y(j+2))*h/3;
    j = j + 2;
end
vpa(f,8)
