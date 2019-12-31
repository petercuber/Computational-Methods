function [lambda,kexi] = jacobi(A,epsilon)
%雅可比法求解矩阵的所有特征值,及其对应的特征向量。
%A为输入矩阵，epsilon为误差容限。
%Edited_by_lyr_2019.12.31

% format rat
[n,n] = size(A);
P = eye(n);
L = eye(n);
R = eye(n);
lambda = diag(A);
B = diag(diag(A));
C = abs(A-B);
d = max(C(:));
[i,j] = find(C==d);
i(1) = [];j(1) = [];
theta = 0.5*atan(2*d/(A(i,i)-A(j,j)));
s = sin(theta);
c = cos(theta);
L(i,i) = c;L(j,j) = c;
L(i,j) = s;L(j,i) = -s;
R(i,i) = c;R(j,j) = c;
R(i,j) = -s;R(j,i) = s;
A = L*A*R;
Pn = P*R;
err = norm(lambda-diag(A),'fro');
lambda = diag(A);
P = Pn;
count = 1;
while err > epsilon 
    L = eye(n);
    R = eye(n);
    B = diag(diag(A));
    C = abs(A-B);
    d = max(C(:));
    [i,j] = find(C==d);
    if length(i) > 1
        i(1) = [];j(1) = [];
    end
    theta = 0.5*atan(2*d/(A(i,i)-A(j,j)));
    s = sin(theta);
    c = cos(theta);
    L(i,i) = c;L(j,j) = c;
    L(i,j) = s;L(j,i) = -s;
    R(i,i) = c;R(j,j) = c;
    R(i,j) = -s;R(j,i) = s;
    A = L*A*R;
    Pn = P*R;
    err = norm(lambda-diag(A),'fro');
    lambda = diag(A);
    P = Pn;
    count = count + 1;
end
lambda = diag(A);
kexi = P
count







