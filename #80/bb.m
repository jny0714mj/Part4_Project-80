wavelength = (3 * 10^8)/(150 * 10^6);
new = zeros(no_BS,no_BS);

for i = 1:no_BS
    for j = 1:N
       FSLP = ((4 * pi * distance(i,j))/wavelength);
       new(i,j) =  Down(i,j) - log10(FSLP);
    end
end


hm = 1.5;
fc = 150;
hb = 10;
A_hm = ((1.1*log10(fc))-0.7)*hm -(1.56*log10(fc)-0.8);

Lp2 = zeros(3,3);
newww = zeros(no_BS,no_BS);
for i = 1:3
    for j = 1:3
        Lp2(i,j) = 46.3+33.9*log10(fc)-13.82*log10(hb)-A_hm+(44.9-6.55*log10(hb))*log10(distance(i,j)/1000)+3;
        Lp2 = log10(Lp2);
        newww(i,j) = Down(i,j) - (Lp2(i,j));
    end
end

thresh = 0;

for i = 1:no_BS
    for j = 1:N
        
    end
    
end
    