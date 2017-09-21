function [power,nSIR] = PowerControl(vals,no_BS,N,distance,n,idx)

[low, l_index] = min(vals, [], 1);
[high, h_index] = max(vals, [], 1);
PathGain = zeros(N,no_BS);
power = ones(1,no_BS);

for i = 1:no_BS
   for j = 1:N
      PathGain(i,j) = 1/(distance(i,j)^n);
   end
end

power_ratio = sqrt(low/high);

if (no_BS == 2)
    power(h_index) = power_ratio*power(l_index);
elseif(no_BS == 3)
    power = TripleReuse(PathGain,idx);
elseif(no_BS == 4)
    power = Quadruple_Reuse(PathGain,idx);
end

nSIR = Downlink(no_BS,N,distance,n,power);

end

