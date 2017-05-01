function array()

x = randi(100 ,1 , 100); %Mobile x axis
y = randi(100, 1 , 100); %Mobile y axis

%location of basestations
BS1 = [10,20];
BS2 = [90,90];

%get the distance between mobile and basestation 1 and 2
for i = 1:100
    mdist1(i) = sqrt((x(i) - BS1(1)) ^2 + (y(i) - BS1(2)) ^2);
    mdist2(i) = sqrt((x(i) - BS2(1)) ^2 + (y(i) - BS2(2)) ^2);
end

PT1 = 10;
PT2 = 10;
n = 2; %at free space (n value varies)

%get signal to interference ratio
for i = 1:100
 SI(i) = (PT1/PT2) * (mdist2(i)/mdist1(i));
 SIR(i) = 10 * log10(SI(i));   
end

%Downlink calculation - from mobile to base station
SIR_DOWN1 = 10*n*(log10(mdist2(1))- log10(mdist1(1)));
SIR_DOWN2 = 10*n*(log10(mdist2(2))- log10(mdist1(2)));

%Uplink calculation - from base station to mobile
SIR_UP1 = 10*n*(log10(mdist1(2)) - log10(mdist1(1)));
SIR_UP2 = 10*n*(log10(mdist2(2)) - log10(mdist2(2)));

%find out which base station is closer to each mobile
for i = 1:100
   
   if (mdist1(i) >= mdist2(i))
       connect(i) = 1;
   else
       connect(i) = 2;
   end

end

disp(connect);

scatter(x,y);
hold;
scatter(BS1(1),BS1(2),'r');
scatter(BS2(1),BS2(2),'r');


end
