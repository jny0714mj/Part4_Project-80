for hello = 1:20
    [vals,idx] = getConnection(testing,no_BS);
    [power,testing] = PowerControl(vals,power,no_BS,N,distance,n);
end