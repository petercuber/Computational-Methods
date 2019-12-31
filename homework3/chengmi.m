function lambda = chengmi(A,epsilon)
%乘幂法求解矩阵的最大特征值,及其对应的特征向量。
%A为输入矩阵，epsilon为误差容限。
%Edited_by_lyr_2019.12.31

[n,n] = size(A);
z = ones(n,1);%先定义特征向量为1向量。
y = A*z;
x = abs(y);
i = find(x==max(x));
if length(i)>1
    i = i(1);
end
lambda = y(i);
delta = sum(abs(y/lambda-z));
z = y/lambda;
count = 1;
while delta > epsilon
    y = A*z;
    x = abs(y);
    i = find(x==max(x));
    if length(i)>1
        i = i(1);
    end
    lambda = y(i);
    delta = sum(abs(y/lambda-z));
    z = y/lambda;
    count = count + 1;
end
z
