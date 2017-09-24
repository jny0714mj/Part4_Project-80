clear;
runtime = 1;

for i = 1:runtime
    
    N = 3; %number of mobiles
    no_BS = 3;%number of base station
    n = 4; %propagation exponents
    
    %create random mobile position
    [x,y] = create_mobile(N,0);
    
    %Setting BS
    [BS_X,BS_Y] = BS_LIST(no_BS);
    if no_BS > N
        no_BS = N;
        [BS_X,BS_Y] = BS_LIST(no_BS);
    end
    %basic power is 1
    power = ones(1,no_BS);
    
    %calculate the distance between each base station and mobile
    distance = GetDistance(x,y,N,BS_X,BS_Y,no_BS);
   
    %calculate the SIR values for Downlink propagation
    SIR = Downlink(no_BS,N,distance,n,power);
    
    %find the best connected value and the index of mobile which gives the optimum SIR output 
    [vals,idx,vector] = getConnection(SIR,no_BS);
    
    disp('ORIGINAL');
    disp(10*log10(vals));
    
    %Applying Power Control
    [new_power,pSIR] = PowerControl(vals,no_BS,N,distance,n,idx);   %find the power to balance out the SIR values
    [p_vals,p_idx,p_vector] = getConnection(pSIR,no_BS);    %find the best connected value and the index of mobile which gives the optimum SIR output after power control has been applied
    
    disp('POWER CONTROL');
    disp(10*log10(p_vals));
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %Applying Access Control
    [aSIR,new_BS,off_BS] = AccessControl(no_BS,N,distance,n,power); %Turn off the base station with the lowest SIR value 
    [a_vals,a_idx,a_vector] = getConnection(aSIR,new_BS); %find the best connected value and the index of mobile which gives the optimum SIR output after access control has been applied
    
    disp('ACCESS CONTROL');
    disp(10*log10(a_vals));
    fprintf('BS%i has turned off \n',off_BS);
    
    
end