function [l,r,y,x] = chase(a,b,c,d)
% format rat
n = length(b);
l = zeros(n,1);
r = zeros(n-1,1);
y = zeros(n,1);
x = zeros(n,1);
l(1) = b(1);
y(1) = d(1)/l(1);
for i = 2:n
    r(i-1) = c(i-1)/l(i-1);
    l(i) = b(i) - a(i-1)*r(i-1);
    y(i) = (d(i) - a(i-1)*y(i-1))/l(i);
end
x(n) = y(n);
for j = n-1:-1:1
    x(j) =  y(j) - r(j)*x(j+1);
end
l
r
y
x

