function p = newtoncz(x,y,n)
%牛顿插值多项式(n阶)
%Edited_by_lyr_2019.12.31

syms t
p = 0;
c = chashang(x,y,n);
d = diag(c);
temp = 1;
p = d(1)*temp;
for i = 2:n
    temp = temp*(t-(x(i-1)));
	p = p + d(i)*temp;
end
p(t) = p;
vpa(p(t),10)