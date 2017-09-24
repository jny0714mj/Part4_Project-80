function [vals,idx,vector] = getConnection(SIR,no_BS)
%To find the best connected value and the index of mobile which gives the optimum SIR output 

idxfinder = SIR;
values = [];
vector = 0;

[vals,idx] = max(SIR,[],2); %find the largest value in each base station and its mobile index
anyRepeated = ~all(diff(sort(idx))); %see if more than one base stations or mobiles have paired up with same device

%if more than one mobile or base station paired up with same device
if (anyRepeated >0)
    vector = 1;
    
    %when all SIR values are same
    if (range(SIR) == 0)
        for k = 1:no_BS
            vals(k) = SIR(1,1);
            idx(k) = k;
            vector = 0;
        end
        
    else
        %iterative process of finding the optimum SIR values
        for i = 1:no_BS
            [row,column] = size(SIR);
            themax = max(max(SIR)); %find the largest SIR value in the table
            values = [values,themax];   %add the largest SIR value in the other table
            index = find(SIR == themax);    %find the index of the largest SIR value
            remainder = rem(index(1),row);  %find the index of BS
            round = ceil(index(1)/column);  %find the index of mobile
            %remove the column and the row that corresponds to paired
            %mobile and base station
            if (remainder > 0)
                SIR(remainder,:) = [];
                
            elseif (remainder == 0)
                SIR(row,:) = [];
            end
            SIR(:,round) = [];
        end
        
        vals = values;
        
        for i = 1:no_BS
            %when all receivers are receiving same SIR value
            %from same base station
            if (range(idxfinder(i,:))) == 0
                idx(i) = i;
            else
                [idx] = findIndex(idxfinder,vals,no_BS); %find index of the connected mobiles and base stations

            end
        end
    end
end

end