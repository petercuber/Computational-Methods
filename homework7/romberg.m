function z = romberg(ffunc,a,b,n,k)
%龙贝格法求积分
%ffunc为积分函数
%a为积分下限，b为积分上限
%n为节点数
%k为迭代次数
%Edited_by_lyr_2019.12.31

h = b - a;
z = zeros(k,k);
% y(1) = 1;%matlab无法求解sin(0)/0
% y0 = feval(ffunc,a);
y0 = 1;
y1 = feval(ffunc,b);
z(1,1) = (y0 + y1)*h/2;
for i = 1:k-1
    h = h/2;
    x = a:h:b;
    yn = feval(ffunc,x(2:2:end-1));
    z(i+1,1) = z(i,1)/2 + sum(yn)*h;
end
z([2:end],2) = z([2:end],1)*4/3 - z([1:end-1],1)/3;
z([3:end],3) = z([3:end],2)*16/15 - z([2:end-1],2)/15;
z([4:end],4) = z([4:end],3)*64/63 - z([3:end-1],3)/63;
vpa(z,8)