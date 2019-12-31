function lambda = fanmi2(A,p,epsilon)
%乘幂法求解矩阵在某值附近的特征值,及其对应的特征向量。
%A为输入矩阵，p为特征值估计值，epsilon为误差容限。
%Edited_by_lyr_2019.12.31

[n,n] = size(A);
B = A - p*eye(n);
z = ones(n,1);
y = zeros(n,1);
u = zeros(n,1);
L = eye(n);
R = zeros(n,n);
R(1,:) = B(1,:);
L([2:n],1) = B([2:n],1)/R(1,1);
for i = 2:n
    R(i,[i:end]) = B(i,[i:end]) - L(i,:)*R(:,[i:end]);
    L([i+1:end],i) = (B([i+1:end],i) - L([i+1:end],:)*R(:,i))/R(i,i);
end
y(n) = z(n)/R(n,n);
for j = n-1:-1:1
    y(j) = (z(j)-R(j,[j+1:n])*y(j+1:n))/R(j,j);
end
x = abs(y);
i = find(x==max(x));
m = y(i);
z = L*ones(n,1);
delta = sum(abs(y/m-z));
z = y/m;
u(1) = z(1);
for j = 2:n
    u(j) = (z(j)-L(j,[1:j-1])*u(1:j-1))/L(j,j);
end
count = 1;
while delta > epsilon & count < 2
    y(n) = u(n)/R(n,n);
    for j = n-1:-1:1
        y(j) = (u(j)-R(j,[j+1:n])*y(j+1:n))/R(j,j);
    end
    x = abs(y);
    i = find(x==max(x));
    m = y(i);
    delta = sum(abs(y/m-z));
    z = y/m;
    u(1) = z(1);
    for j = 2:n
        u(j) = (z(j)-L(j,[1:j-1])*u(1:j-1))/L(j,j);
    end
    count = count + 1;
end
lambda = p + 1/m;
z

