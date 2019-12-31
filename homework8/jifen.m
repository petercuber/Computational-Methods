function z = jifen(ffunc,a,b,h,y0)
%适用于各隐式算法
%ffunc为方程右端函数（整理后）
%a为积分下限，b为积分上限
%h为步长，y0为起始值
%Edited_by_lyr_2019.12.31

x = a:h:b;
n = length(x);
z(1) = y0;
for i = 1:n-1
    z(i+1) = feval(ffunc,x(i),z(i));
end
vpa(z,10)

