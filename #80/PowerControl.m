function [power] = PowerControl(vals,power,no_BS)

[low, l_index] = min(vals, [], 1);
[high, h_index] = max(vals, [], 1);

power_ratio = sqrt(low/high);

if (no_BS == 2)
    power(h_index) = power_ratio*power(l_index);
end

end

