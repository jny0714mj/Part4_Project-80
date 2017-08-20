function [vals,idx] = getConnection(temp,no_BS)
idxfinder = temp;
[vals,idx] = max(temp,[],2);
anyRepeated = ~all(diff(sort(idx)));
values = [];
if (anyRepeated >0)
    disp('asd');
    for i = 1:no_BS
        [row,column] = size(temp);
        themax = max(max(temp));
        values = [values,themax];
        index = find(temp == themax);
        remainder = rem(index,row);
        round = ceil(index/column);
        if (remainder > 0)
            temp(remainder,:) = [];
            
        elseif (remainder == 0)
            temp(row,:) = [];
        end
        
        temp(:,round) = [];
    end
    
    vals = values;
    
    for i = 1:no_BS
        index = find(idxfinder == vals(i));
        remainder = rem(index,no_BS);
        if remainder == 0
            idx(i) = no_BS;
        else
            idx(i) = remainder;
        end
    end
    
end


end