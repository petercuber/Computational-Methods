function lambda = fanmi(A,p,epsilon)
%乘幂法求解矩阵在某值附近的特征值,及其对应的特征向量。
%A为输入矩阵，p为特征值估计值，epsilon为误差容限。
%Edited_by_lyr_2019.12.31

[n,n] = size(A);
B = A - p*eye(n);
z = ones(n,1);
y = B\z;
x = abs(y);
i = find(x==max(x));
m = y(i);
delta = sum(abs(y/m-z));
z = y/m;
count = 1;
while delta > epsilon & count < 2
    y = B\z;
    x = abs(y);
    i = find(x==max(x));
    m = y(i);
    delta = sum(abs(y/m-z));
    z = y/m;
    count = count + 1;
end
lambda = p + 1/m;
z
