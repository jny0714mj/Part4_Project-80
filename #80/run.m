runtime = 1;
prop = zeros(runtime,1);

for i = 1:runtime
    N = 3; %number of mobiles
    no_BS = 3;%number of base station
    n = 3; %at free space (n value varies)
    
    %create random mobile position
    [x,y] = create_mobile(N,0);
    
    %setting the base station location
    %BS = [x1, y1; - base station 1
    %      x2, y2] - base station 2
    BS_X = [0,0,100,100];%50,70];
    BS_Y = [0,100,0,100];%50,30];
    power = ones(1,no_BS);
    %calculate the distance between each base station and mobile
    distance = GetDistance(x,y,N,BS_X,BS_Y,no_BS);
    
    %SIR = Uplink(no_BS,N,distance,n);
    SIR = Downlink(no_BS,N,distance,n,power);
    
    outp = Outage(SIR,no_BS);
    prop(i) = outp;
    A = SIR;
    
    [vals,idx] = getConnection(A,no_BS);
    [power,testing] = PowerControl(vals,power,no_BS,N,distance,n);
    
end

%disp(mean(prop));