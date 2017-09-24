function [nSIR,new_BS,h_index] = AccessControl(no_BS,N,distance,n,power)
%Turn off the base station that has the lowest SIR value and recalculate
%the SIR values

%set variables
dist = distance;
findLowest = zeros(1,no_BS);

%sum the distances of the base station to each mobile
for i = 1:no_BS
    findLowest(i) = sum(distance(i,:));
end

[largest, h_index] = max(findLowest, [], 2); %find the largest distance and its index

dist(h_index,:) = [];   %remove the row that has the largest distance
new_BS = no_BS - 1;
nSIR = Downlink(new_BS,N,dist,n,power); %calculate the SIR values when access control has been applied

end