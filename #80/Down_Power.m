function Powercontrol = Down_Power(no_BS,N,distance,n)

%create empty array size of N
if (no_BS <= N)
    DOWN = zeros(no_BS,N); %temp size = 2
end
if (no_BS > N)
    DOWN = zeros(N,no_BS,N);
end

if (no_BS <= N)
    for i = 1:N
        for j = 1:no_BS
            a = 1/(distance(j,i)^n);
            b = 0;
            for k = 1:no_BS
                if (k ~= j)
                    b = b + 1/(distance(k,i)^n);
                end
            end
            DOWN(j,i) = (a/b);
            Down = 10*log10(DOWN);
        end
    end
end

end