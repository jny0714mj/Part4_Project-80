tmp = zeros(no_BS,1);
tmp = [distance tmp];
temp = zeros(N,N,no_BS);
n = 2;
for l =  1:no_BS
    this = distance;
    this(l,:) = [];
    for i = 1:N
        for j = 1:N
            a =(1/distance(j,i))^n;
            b = 0;
            for k = 1:N
                if (k ~= j)
                    b = b + this(k,i);
                end
            end
            temp(i,j,l) = b;
        end
    end
end