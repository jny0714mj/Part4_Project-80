function [vals,idx,vector] = getConnection(temp,no_BS)
idxfinder = temp;
[vals,idx] = max(temp,[],2);
anyRepeated = ~all(diff(sort(idx)));
values = [];
vector = 0;
if (anyRepeated >0)
    vector = 1;
    if (range(temp) == 0)
        for k = 1:no_BS
            vals(k) = temp(1,1);
            idx(k) = k;
            vector = 0;
        end
        
    else
        for i = 1:no_BS
            [row,column] = size(temp);
            themax = max(max(temp));
            values = [values,themax];
            index = find(temp == themax);
            remainder = rem(index(1),row);
            round = ceil(index(1)/column);
            if (remainder > 0)
                temp(remainder,:) = [];
                
            elseif (remainder == 0)
                temp(row,:) = [];
            end
            temp(:,round) = [];
        end
        
        vals = values;
        
        for i = 1:no_BS
            
            if (range(idxfinder(i,:))) == 0
                idx(i) = i;
            else
                [idx] = findIndex(idxfinder,vals,no_BS);

            end
        end
    end
end

end