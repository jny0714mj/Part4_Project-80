runtime = 100;
prop = zeros(runtime,1);

for i = 1:runtime
    N = 10; %number of mobiles
    no_BS = 4;%number of base station
    n = 3; %at free space (n value varies)
    
    %create random mobile position
    [x,y] = create_mobile(N);
    
    %setting the base station location
    %BS = [x1, y1; - base station 1
    %      x2, y2] - base station 2
    BS = [35,50;
        60,50;
        85,50;
        50,10];
    
    %calculate the distance between each base station and mobile
    distance = GetDistance(x,y,N,BS,no_BS);
    Down = Downlink(no_BS,N,distance,n);
    %LetsPlot;
    outp = Outage(Down,no_BS,N);
    prop(i) = outp;
end

disp(mean(prop));