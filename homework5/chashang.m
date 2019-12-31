function c = chashang(x,y,n)
%Çón½×²îÉÌ
%Edited_by_lyr_2019.12.31

c = zeros(n,n);
m = length(y);
y = reshape(y,m,1);
x = reshape(x,m,1);
c(:,1) = y;
for i = 1:n-1
    c([i+1:end],i+1) = (c([i+1:end],i)-c([i:end-1],i))./(x(i+1:end)-x(1:end-i));
end

    