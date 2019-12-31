function lambda = qrsuan(A,epsilon)
%QR算法求解矩阵的所有特征值,及其对应的特征向量。
%A为输入矩阵，epsilon为误差容限。
%Edited_by_lyr_2019.12.31

[n,n] = size(A);
u = zeros(n,1);
b= A(:,1);
c = -sign(b(2))*sqrt(b(2:n)'*b(2:n));
rho = sqrt(2*c*(c-b(2)));
u(2) = (b(2) - c)/rho;
u(3:n) = b(3:n)/rho;
H = eye(n) - 2*u*u';
A = H*A*H';
for i = 3:n
    u = zeros(n,1);
    b = A(:,i-1);
    c = -sign(b(i))*sqrt(b(i:n)'*b(i:n));
    rho = sqrt(2*c*(c-b(i)));
    u(i) = (b(i) - c)/rho;
    u(i+1:n) = b(i+1:n)/rho;
    H = eye(n) - 2*u*u';
    A = H*A*H';
end
lambda = diag(A);
for i = 1:n-1
    T = eye(n);
    theta = atan(A(i+1,i)/A(i,i));
    c = cos(theta);s = sin(theta);
    R = [c,s;-s,c];
    T([i,i+1],[i,i+1]) = R;
    A = T*A*T';
end
err = norm(diag(A)-lambda); 
lambda = diag(A);
count = 1;
while err > epsilon
    for i = 1:n-1
        T = eye(n);
        theta = atan(A(i+1,i)/A(i,i));
        c = cos(theta);s = sin(theta);
        R = [c,s;-s,c];
        T([i,i+1],[i,i+1]) = R;
        A = T*A*T';
    end
    err = norm(diag(A)-lambda);
    lambda = diag(A);
    count = count + 1;
end
