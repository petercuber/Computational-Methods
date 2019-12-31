function y = sc(p0,x,omega,epsilon,n)
%松弛法加速收敛
%p0为初始根
%x为求得的根序列
%omega为松弛因子
%epsilon为误差容限
%n为最大迭代次数
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

