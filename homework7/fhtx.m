function f = fhtx(ffunc,a,b,n)
%定步长复化梯形求积分
%ffunc为积分函数
%a为积分下限，b为积分上限
%n为节点数
%Edited_by_lyr_2019.12.31

h = (b-a)/n;
x = a:h:b;
y = zeros(1,length(x));
y(1) = 1;%matlab无法求解sin(0)/0
y(2:end) = feval(ffunc,x(2:end));
f = 0;
for i = 1:n
    f = f + (y(i) + y(i+1))*h/2;
end
vpa(f,8)

