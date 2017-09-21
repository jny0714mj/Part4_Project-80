function DOWN = Downlink(no_BS,N,distance,n,power)

%create empty array size of N
DOWN = zeros(no_BS,N);

if (no_BS <= N)
    for i = 1:N
        for j = 1:no_BS
           desire = power(j)/(distance(j,i)^n);
           interference = 0;
            for k = 1:no_BS
                if (k ~= j)
                    interference = interference + (power(k))/((distance(k,i))^n);
                end
            end
            DOWN(j,i) = (desire/interference);
        end
    end
end
end