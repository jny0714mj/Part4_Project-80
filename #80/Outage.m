function outp = Outage(SIRvalue,no_BS)

A = SIRvalue;
[val,idx] = max(A,[],2);
anyRepeated = ~all(diff(sort(idx)));
values = [];
if (anyRepeated >0)
    for i = 1:4;
        [row,column] = size(A);
        themax = max(max(A));
        values(end+1) = themax;
        index = find(A == themax);
        remainder = rem(index,row);
        if (remainder > 0)
           A(remainder,:) = []; 
        end
        if (remainder == 0)
                A(row,:) = [];
        end
    end
    val = values;
end



I = find(val>5);
connected = size(I,1);
total_Comb = no_BS;
outp = (connected/total_Comb)*100;
disp(outp);

end