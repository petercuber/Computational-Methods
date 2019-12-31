function y = aitken(p0,x,omega,epsilon,n)
%Aitken法加速收敛
%p0为初始根
%x为求得的根序列
%omega为松弛因子
%epsilon为误差容限
%n为最大迭代次数
%Edited_by_lyr_2019.12.31

p = [p0 x];
y(1) = 0;
y(2) = p(3)-(p(3)-p(2))*(p(3)-p(2))/(p(3)-2*p(2)+p(1));
y(3) = p(4)-(p(4)-p(3))*(p(4)-p(3))/(p(4)-2*p(3)+p(2));
delta = abs(y(3)-y(2));
i = 3;
while delta > epsilon & i < n
    i = i+1;
    y(i) = p(i+1)-(p(i+1)-p(i))*(p(i+1)-p(i))/(p(i+1)-2*p(i)+p(i-1));
    delta = abs(y(i)-y(i-1));
end
vpa(y,10)
i