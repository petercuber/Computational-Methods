function [L,R,y,x] = crout(A,b)
% format rat
[n,n] = size(A);
L = zeros(n,n);
R = eye(n);
y = zeros(n,1);
x = zeros(n,1);
L(:,1) = A(:,1);
R(1,[2:n]) = A(1,[2:n])/L(1,1);
y(1) = b(1)/L(1,1);
for i = 2:n
    L([i:end],i) = A([i:end],i) - L([i:end],:)*R(:,i);
    R(i,[i+1:end]) = (A(i,[i+1:end]) - L(i,:)*R(:,[i+1:end]))/L(i,i);
    y(i) = (b(i)-L(i,:)*y(:))/L(i,i);
end
x(n) = y(n)/R(n,n);
for j = n-1:-1:1
    x(j) = (y(j)-R(j,[j+1:n])*x(j+1:n))/R(j,j);
end
L
R
y
x