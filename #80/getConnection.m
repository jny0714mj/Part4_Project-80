function [vals,idx,vector] = getConnection(SIR,no_BS)
%To find the best combination and index of SIR values

idxfinder = SIR;
values = [];
vector = 0;

[vals,idx] = max(SIR,[],2);
anyRepeated = ~all(diff(sort(idx))); %see if more than one base stations or mobiles have paired up with same device

%if more than one mobiles or base stations paired up with same device
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
        %find the values
        for i = 1:no_BS
            [row,column] = size(SIR);
            themax = max(max(SIR));
            values = [values,themax];
            index = find(SIR == themax);
            remainder = rem(index(1),row);
            round = ceil(index(1)/column);
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
                [idx] = findIndex(idxfinder,vals,no_BS);

            end
        end
    end
end

end