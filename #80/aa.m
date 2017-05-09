tmp = zeros(no_BS,1);
tmp = [distance tmp];
temp = zeros(no_BS,no_BS);
n = 2;
for i = 1:N
    for j = 1:no_BS
        a =(1/distance(j,i))^n;
        b = 0;
        for k = 1:no_BS
            if (k ~= j)
                b = b + distance(k,i);
            end
        end
        temp(i,j) = b;
    end
end