Lp = zeros(3,3);
for i = 1:3
    for j = 1:3;
        Lp(i,j) = distance(i,j)^2;
    end
end

hm = 1.5;
fc = 1800;
hb = 10;
A_hm = hm*((1.1*log10(fc))-0.7)*hm -(1.56*log10(fc)-0.8);

Lp2 = zeros(3,3);
for i = 1:3
    for j = 1:3
        Lp2(i,j) = 46.3+33.9*log10(fc)-13.82*log10(hb)-A_hm+(44.9-6.55*log10(hb))*log10(distance(i,j)/1000)+3;
    end
end