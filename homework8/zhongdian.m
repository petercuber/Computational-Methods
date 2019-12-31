function z = zhongdian(ffunc,a,b,h,y0)
%适用于中点法
%ffunc为方程右端函数
%a为积分下限，b为积分上限
%h为步长，y0为起始值
%Edited_by_lyr_2019.12.31

x = a:h:b;
n = length(x);
z(1) = y0;
z(2) = z(1) + h*feval(ffunc,x(1),z(1));
for i = 3:n
    z(i) = z(i-2) + 2*h*feval(ffunc,x(i-1),z(i-1));
end
vpa(z,10)


