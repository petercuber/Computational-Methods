function lambda = chengmi(A,epsilon)
%���ݷ���������������ֵ,�����Ӧ������������
%AΪ�������epsilonΪ������ޡ�
%Edited_by_lyr_2019.12.31

[n,n] = size(A);
z = ones(n,1);%�ȶ�����������Ϊ1������
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
