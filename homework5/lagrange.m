function l = lagrange(x,y,n)
%拉格朗日插值多项式(n阶)
%Edited_by_lyr_2019.12.31

syms t
l = 0;
m = length(x);
x = reshape(x,m,1);
xn = t*ones(m,1);
a = xn-x;
for i = 1:n
    b = x(i)*ones(m,1);
    c = b - x;
    c(i) = 1;
    l = l + prod(a)/a(i)/prod(c)*y(i);
end
l(t) = l;
vpa(l(t),10)
