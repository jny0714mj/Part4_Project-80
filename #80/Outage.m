function outp = Outage(Down,no_BS,N)

I = find(Down>5);
connected = size(I,1);
total_Comb = no_BS * N;
outp = (connected/total_Comb)*100;
%disp(outp);

end