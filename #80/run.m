clear;
runtime = 1;
prop = zeros(runtime,1);

for i = 1:runtime
    
    N = 3; %number of mobiles
    no_BS = 3;%number of base station
    n = 4; %at free space (n value varies)
    
    %create random mobile position
    [x,y] = create_mobile(N,0);
    
    %Setting BS
    [BS_X,BS_Y] = BS_LIST(no_BS);
    if no_BS > N
        no_BS = N;
        [BS_X,BS_Y] = BS_LIST(no_BS);
    end
    
    power = ones(1,no_BS);
    
    %calculate the distance between each base station and mobile
    distance = GetDistance(x,y,N,BS_X,BS_Y,no_BS);
    
    %SIR = Uplink(no_BS,N,distance,n);
    SIR = Downlink(no_BS,N,distance,n,power);
    
    [vals,idx,vector] = getConnection(SIR,no_BS);
    
    %[new_power,pSIR] = PowerControl(vals,no_BS,N,distance,n,idx);
    [aSIR,new_BS] = AccessControl(no_BS,N,distance,n,power);
    
    new_v = 10*log10(vals);
    for j = 1:no_BS
        if (new_v(j) > 5)
            prop(i) = prop(i)+1;
        end
    end
    
    disp(10*log10(SIR));
    disp(10*log10(aSIR));
    %disp(10*log10(pSIR));
end