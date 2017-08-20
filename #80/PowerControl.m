function [power,testing] = PowerControl(vals,power,no_BS,N,distance,n)

[low, l_index] = min(vals, [], 1);
[high, h_index] = max(vals, [], 1);

power_ratio = sqrt(low/high);
disp(power_ratio);
if (no_BS == 2)
    power(h_index) = power_ratio*power(l_index);
end

if(no_BS > 2)
    
    addup = 0;
    for i = 1:no_BS
        if (i ~= h_index)
            addup = power(i)+addup;
        end
    end
    P = power_ratio*(addup);
    power(h_index) = P;
    
end


disp(vals);
testing = Downlink(no_BS,N,distance,n,power);

disp(10*log10(testing));

end

