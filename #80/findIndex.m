function [idx] = findIndex(SIR,vals,no_BS)
%set an array
allPossibleIndex = [];

%find all the possible connection of optimum SIR values
for i = 1:no_BS
    allPossibleIndex = [allPossibleIndex;find(SIR == vals(i))];
end

semiIndex = zeros(length(allPossibleIndex),2);

%find the index of mobiles and base stations
for i = 1:length(allPossibleIndex)
    semiIndex(i,2) = ceil(allPossibleIndex(i)/no_BS);
    t = rem(allPossibleIndex(i),no_BS);
    if (t == 0)
        semiIndex(i,1) = no_BS;
    else
        semiIndex(i,1) = t;
    end
end

findDuplicate = semiIndex;

%find if any base stations or mobiles paired up with more than one device
%then set the 
for i = 2:length(allPossibleIndex)
    for j = i-1:-1:1
        if findDuplicate(i,1) == findDuplicate(j,1)
            findDuplicate(i,:) = 0;
        elseif findDuplicate(i,2) == findDuplicate(j,2)
            findDuplicate(i,:) = 0;
        end
    end
end

%remove all the 0's in an array
for i = length(findDuplicate):-1:1
    if findDuplicate(i,1) == 0
        findDuplicate(i,:) = [];
    end
end

finalIndex = sortrows(findDuplicate);   %sort the array
idx = zeros(1,no_BS);

for i = 1:no_BS
   idx(i) = finalIndex(i,2);
end

end