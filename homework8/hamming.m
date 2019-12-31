function z = hamming(ffunc,a,b,h,y0)
%Milne-Hamming预测校正公式
%ffunc为方程右端函数
%a为积分下限，b为积分上限
%h为步长，y0为起始值
%Edited_by_lyr_2019.12.31

x = a:h:b;
n = length(x);
z(1) = y0;
z(2) = z(1) + h*feval(ffunc,x(1),z(1));
z(3) = z(2) + h*feval(ffunc,x(2),z(2));
z(4) = z(3) + h*feval(ffunc,x(3),z(3));
for i = 4:n-1
    temp = z(i-3) + 4*h/3*(2*feval(ffunc,x(i),z(i))-feval(ffunc,x(i-1),z(i-1))+2*feval(ffunc,x(i-2),z(i-2)));
    z(i+1) = (9*z(i)-z(i-2)+3*h*feval(ffunc,x(i+1),temp)+2*3*h*feval(ffunc,x(i),z(i))-3*h*feval(ffunc,x(i-1),z(i-1)))/8;
end
vpa(z(i+1),10)
