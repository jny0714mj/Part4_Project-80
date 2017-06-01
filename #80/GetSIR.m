
PT1 = 10;
PT2 = 10;
%create empty array size of N
if (no_BS == N)
    DOWN = zeros(N,N); %temp size = 2
end
if (no_BS ~=N)
    DOWN = zeros(N,N,no_BS);
end
UP = zeros(1,2);


%at this stage just get mobile 1 and 2 's SIR(down and up) value with two base station
%Downlink calculation - from mobile to base-station
%DOWN(i,j) -> i = base station%row, j = mobile%column
if (no_BS <= N)
    for i = 1:no_BS
        for j = 1:N
            a =(1/distance(i,j))^n;
            b = 0;
            % DOWN(i,j) = log10(distance(j,i))+ DOWN(i,j);
            for k = 1:N
                if (k ~= j)
                    b = b + (1/(distance(i,k)))^n;
                    %DOWN(i,j)=DOWN(i,j) - log10(distance(k,i));
                end
            end
            DOWN(i,j) = a/b;
            %DOWN(i,j) = 10*n*(log10((1/distance(j,i)))-log10(a));
            Down = 10*log10(DOWN);
        end
    end
end

if (no_BS >N)
    for l =  1:no_BS
        this = distance;
        this(l,:) = [];
        for i = 1:N
            for j = 1:N
                a =(1/this(j,i))^n;
                b = 0;
                for k = 1:N
                    if (k ~= j)
                        b = b + (1/(this(k,i)))^n;
                    end
                end
                DOWN(i,j,l) = a/b;
                Down = 10*log10(DOWN);
            end
        end
    end
end


%Uplink calculation - from base-station to mobile
UP(1) = 10*n*(log10(distance(1,2))-log10(distance(1,1)));
UP(2) = 10*n*(log10(distance(2,2)) - log10(distance(2,1)));
