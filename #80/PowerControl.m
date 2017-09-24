function [power,nSIR] = PowerControl(vals,no_BS,N,distance,n,idx)
%this function is to find the power of transmitters
%to balance out the SIR values

%find the higest and lowest best combination pair values and index
[low, l_index] = min(vals, [], 1);
[high, h_index] = max(vals, [], 1);

%create empty array for path gain and power
PathGain = zeros(N,no_BS);
power = ones(1,no_BS);

%calculate path gain
for i = 1:no_BS
   for j = 1:N
      PathGain(i,j) = 1/(distance(i,j)^n);
   end
end

if (no_BS == 2)
    power_ratio = sqrt(low/high);
    power(h_index) = power_ratio*power(l_index);
    
elseif(no_BS == 3)
    power = TripleReuse(PathGain,idx);
    
elseif(no_BS == 4)
    power = Quadruple_Reuse(PathGain,idx);
end

nSIR = Downlink(no_BS,N,distance,n,power);

end

