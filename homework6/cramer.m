function x = cramer(A,b)
%克莱默法则求解线性方程组
%Edited_by_lyr_2019.12.31

n = length(b);
D = det(A);
for i = 1:n
    A1 = A;
    A1(:,i) = b;
    x(i) = det(A1)/D;
end




