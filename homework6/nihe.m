function c = nihe(x,y,n)
%Edited_by_lyr_2019.12.31

% syms t fx(t)
A = zeros(n,n);
b = zeros(n,1);
% for i = 1:n
%     phi(i) = t^(i-1);
% end
for i = 1:n
    b(i) = sum(y.*(x.^(i-1)));
    for j = i:n
        A(i,j) = sum(x.^(i-1+j-1));
        A(j,i) = A(i,j);
    end
end
c = cramer(A,b);
% fx(t) = phi*c'


%¼ÆËãÆ«²î
% final = fx(x);


final = [];
m = length(x);
for j = 1:m
    fx = 0;
    u = x(j);
    for i = 1:n
        fx = fx + c(i)*u.^(i-1);
    end
    final(j) = fx;
end
em = max(abs(final-y))
e = sum((final-y).^2)


