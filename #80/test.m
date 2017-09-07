%{
for hello = 1:20
    [vals,idx] = getConnection(testing,no_BS);
    [power,testing] = PowerControl(vals,power,no_BS,N,distance,n);
end

[low, l_index] = min(vals, [], 1);
[high, h_index] = max(vals, [], 1);
theavg = sqrt(high*low);
a = theavg/high;
b = theavg/low;


new_dist = distance;
new_dist(BS_NO,:) = [];
no_BS = no_BS-1;

[vals,idx] = getConnection(nSIR,no_BS);

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

thatratio = highest/lowest;
a = new_p(l_index).^2;
b = new_p(l_index)*new_p(middle);
c = new_p(h_index).^2 + new_p(h_index)*new_p(middle);
p = [a b -c*thatratio];
r = roots(p);
for i = 1:2
   if r(i) > 0
   %    disp('tawse');
   %    disp(r(i));
       new_p(l_index) = r(i);
   end
end
nSIR =  Downlink(no_BS,N,distance,n,new_p);
disp(10*log10(nSIR));
disp(new_p);

%}
g = zeros(N,no_BS);
for i = 1:no_BS
   for j = 1:N
      g(i,j) = 1/(distance(i,j)^n);
   end
end

a1=g(1,3)*g(1,1);
b1 = g(2,3)*g(1,1);
c1 = g(3,3)*g(2,1);
d1 = g(3,3)*g(3,1);
a2 = g(2,2)*g(2,3);
b2 = g(1,3)*g(2,2);
c2 = g(1,2)*g(3,3);
d2 = g(3,3)*g(3,2);
