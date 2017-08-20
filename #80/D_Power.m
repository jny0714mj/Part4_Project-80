
d = zeros(N,N);

for i = 1:no_BS
    for j = 1:N
d(i,j) = (1/distance(i,j))^n;
    end
end

D_SIR1 = zeros(1,2);
D_SIR2 = zeros(1,2);

P_ratio = sqrt((d(2,1)*d(2,2))/(d(1,1)*d(1,2)));

if (no_BS == 2) && (N == 2)
    for i = 1:2
        for j = 1:2
            if (j == 1)
            D_SIR1_u = d(j,1)*P_ratio;
            else 
                D_SIR1_u = (d(j,1))/P_ratio;
            end
            
            D_SIR1_b = 0;
            
            for k = 1:no_BS
                if (k ~= j) 
                    D_SIR1_b = D_SIR1_b + d(k,1);
                end
            end
            
            if (j == 1)
            D_SIR2_u = d(j,2)*P_ratio;
            else
                D_SIR2_u = (d(j,2))/P_ratio;
            end
            D_SIR2_b = 0;
            
            for k = 1:no_BS
                if (k ~= j) 
                    D_SIR2_b = D_SIR2_b + d(k,2);
                end
            end
            
            D_SIR1(1,j) = 10*log10(D_SIR1_u/D_SIR1_b);
            %log_SIR1 = 10*log10(SIR1);
            D_SIR2(1,j) = 10*log10(D_SIR2_u/D_SIR2_b);
            %log_SIR2 = 10*log10(SIR2);
          
        end
    end
end