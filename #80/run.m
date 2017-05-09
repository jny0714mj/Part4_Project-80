
N = 3; %number of mobiles
no_BS = 3;%number of base station


%create random mobile position
[x,y] = create_mobile(N);

%setting the base station location
%BS = [x1, y1; - base station 1
%      x2, y2] - base station 2
BS = [10,20;
      15,5;
      60,70;
      30,50];

%calculate the distance between each base station and mobile
distance = GetDistance(x,y,N,BS,no_BS);

%[DOWN,UP] = GetSIR(distance,N,no_BS);
%temp = getConnection(distance,N);
LetsPlot;
