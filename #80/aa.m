tmp = zeros(no_BS,1);
tmp = [distance tmp];
DOWN = zeros(no_BS,no_BS);

for i = 1:no_BS
    for j = 1:no_BS
        a =0;
        % DOWN(i,j) = log10(distance(j,i))+ DOWN(i,j);
        for k = 1:N
            if (k ~= j)
                a = a + tmp(k,i);
                %DOWN(i,j)=DOWN(i,j) - log10(distance(k,i));
            end
        end
        DOWN(i,j) = 10*n*(log10(tmp(j,i))-log10(a));
    end
end
