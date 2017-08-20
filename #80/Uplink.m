function Up = Uplink(no_BS,N,distance,n)

%create empty array size of N
if (no_BS >= N)
    UP = zeros(no_BS,N); %temp size = 2
end
if (no_BS < N)
    UP = zeros(N,no_BS,N);
end
%power = [1,1,1,2,1];

if (no_BS >= N)
    for i = 1:no_BS
        for j = 1:N
            a = 1/(distance(i,j)^n);
            b = 0;
           % desired_power = power(i);
           % interference_power = 0;
            for k = 1:N
                if (k ~= j)
                    b = b + (1/(distance(i,k))^n);
                end
            end
            UP(i,j) = (a/b);
            Up = 10*log10(UP);
          
        end
    end
end
end
%disp(Up)