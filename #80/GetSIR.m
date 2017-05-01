function [DOWN,UP] = GetSIR(distance,N,no_BS)

PT1 = 10;
PT2 = 10;
n = 2; %at free space (n value varies)
%create empty array size of N
SI = zeros(1,N);
SIR = zeros(1,N);
DOWN = zeros(1,2); %temp size = 2
UP = zeros(1,2);

%get signal to interference ratio
%{
for i = 1:N
 SI(i) = (PT1/PT2+PT3) * (distance(2,i)/distance(1,i));
 SIR(i) = 10 * log10(SI(i));
end
%}

%at this stage just get mobile 1 and 2 's SIR(down and up) value with two base station
%Downlink calculation - from mobile to base-station
%DOWN(i,j) -> i = base station, j = mobile
if (no_BS == N)
    for i = 1:no_BS
        for j = 1:N
            a =0;
            % DOWN(i,j) = log10(distance(j,i))+ DOWN(i,j);
            for k = 1:N
                if (k ~= j)
                    a = a + distance(k,i);
                    %DOWN(i,j)=DOWN(i,j) - log10(distance(k,i));
                end
            end
            DOWN(i,j) = 10*n*(log10(distance(j,i))-log10(a));
        end
    end
end

if(no_BS ~= N)
    
end
%Uplink calculation - from base-station to mobile
UP(1) = 10*n*(log10(distance(1,2))-log10(distance(1,1)));
UP(2) = 10*n*(log10(distance(2,2)) - log10(distance(2,1)));


end