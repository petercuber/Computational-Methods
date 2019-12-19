function [L,R,y,x] = doolittle(A,b)
% format rat
[n,n] = size(A);
L = eye(n);
R = zeros(n,n);
y = zeros(n,1);
x = zeros(n,1);
R(1,:) = A(1,:);
y(1) = b(1);
L([2:n],1) = A([2:n],1)/R(1,1);
for i = 2:n
    R(i,[i:end]) = A(i,[i:end]) - L(i,:)*R(:,[i:end]);
    L([i+1:end],i) = (A([i+1:end],i) - L([i+1:end],:)*R(:,i))/R(i,i);
    y(i) = b(i)-L(i,:)*y(:);
end
x(n) = y(n)/R(n,n);
for j = n-1:-1:1
    x(j) = (y(j)-R(j,[j+1:n])*x(j+1:n))/R(j,j);
end
L
R
y
x