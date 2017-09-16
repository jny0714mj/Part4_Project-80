function [nSIR,no_BS] = bb(no_BS,N,distance,n,power,order)

dist = distance;
dist(order,:) = [];
no_BS = no_BS - 1;
nSIR = Downlink(no_BS,N,dist,n,power);


end