
[low, l_index] = min(vals, [], 1);
[high, h_index] = max(vals, [], 1);

for i = 1:no_BS
   if (h_index == i)
       highest = nSIR(i,idx(i));
   elseif (l_index == i)
       lowest = nSIR(i,idx(i));
   else
       middle = i;
   end
end



thatratio = lowest/highest;
a = new_p(h_index).^2;
b = new_p(h_index)*new_p(middle);
c = new_p(l_index).^2 + new_p(l_index)*new_p(middle);
p = [a b -c*thatratio];
r = roots(p);
for i = 1:2
   if r(i) > 0
   %    disp('tawse');
   %    disp(r(i));
       new_p(h_index) = r(i);
   end
end
nSIR =  Downlink(no_BS,N,distance,n,new_p);
disp(10*log10(nSIR));
disp(new_p);


[vals,idx] = getConnection(nSIR,no_BS);
