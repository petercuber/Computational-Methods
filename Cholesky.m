function [L,y,x] = Cholesky(A,b)
% format rat
[n,n] = size(A);
L = zeros(n,n);
y = zeros(n,1);
x = zeros(n,1);
L(1,1) = sqrt(A(1,1));
L([2:n],1) = A([2:n],1)/L(1,1);
y(1) = b(1)/L(1,1);
for i = 2:n
    L(i,i) = sqrt(A(i,i)-L(i,:)*L(i,:)');
    L([i+1:n],i) = (A([i+1:n],i)-L([i+1:n],:)*L(i,:)')/L(i,i);
    y(i) = (b(i)-L(i,:)*y(:))/L(i,i);
end
x(n) = y(n)/L(n,n);
for j = n-1:-1:1
    x(j) = (y(j)-L([j+1:n],j)'*x(j+1:n))/L(j,j)';
end
L
y
x
