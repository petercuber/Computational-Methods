function y = rk(ffunc,a,b,h,y0)
%龙格-库塔法求解
%ffunc为方程右端函数
%a为积分下限，b为积分上限
%h为步长，y0为起始值
%Edited_by_lyr_2019.12.31

x = a:h:b;
n = length(x);
y(1) = y0;
for i = 1:n
    k1 = h*feval(ffunc,x(i),y(i));
    k2 = h*feval(ffunc,x(i)+h/2,y(i)+k1/2); 
    k3 = h*feval(ffunc,x(i)+h/2,y(i)+k2/2);
    k4 = h*feval(ffunc,x(i)+h,y(i)+k3);
    y(i+1) = y(i) + (k1 + 2*k2 + 2*k3 + k4)/6;
end
vpa(y,10)






