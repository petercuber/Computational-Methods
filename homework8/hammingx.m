function z = hammingx(ffunc,a,b,h,y0)
%修正哈明预测-校正公式
%ffunc为方程右端函数
%a为积分下限，b为积分上限
%h为步长，y0为起始值
%Edited_by_lyr_2019.12.31

x = a:h:b;
n = length(x);
z(1) = y0;
z = rk(ffunc,a,b,h,y0);
p0 = 0;c0 = 0;
for i = 4:n-1
    p1 = z(i-3) + 4*h/3*(2*feval(ffunc,x(i),z(i))-feval(ffunc,x(i-1),z(i-1))+2*feval(ffunc,x(i-2),z(i-2)));
    m1 = p1 + 112/121*(c0-p0);
    c1 = (9*z(i)-z(i-2)+3*h*feval(ffunc,x(i+1),m1)+2*3*h*feval(ffunc,x(i),z(i))-3*h*feval(ffunc,x(i-1),z(i-1)))/8;
    z(i+1) = c1 - 9/121*(c1-p1);
    c0 = c1;p0 = p1;
end
vpa(z,10)