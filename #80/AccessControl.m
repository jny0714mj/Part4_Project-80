function [nSIR,new_BS] = AccessControl(no_BS,N,distance,n,power)

dist = distance;
findLowest = zeros(1,no_BS);
for i = 1:no_BS
    findLowest(i) = sum(distance(i,:));
end
[lowest, l_index] = min(findLowest, [], 1);

dist(l_index,:) = [];
new_BS = no_BS - 1;
nSIR = Downlink(new_BS,N,dist,n,power);
disp(nSIR);

end