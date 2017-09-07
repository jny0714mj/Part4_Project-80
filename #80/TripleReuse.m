
if (no_BS == 3)
    if (now == 1)
        p1 = [a1 b1 (-c1-d1)];
        r = roots(p1);
        now = 2;
        
    elseif(now ==2)
        p2 = [a2 b2*r(2) (-c2*r(2)-d2)];
        r2 = roots(p2);
        now = 3;
    else
        p1 = [a1 b1*r2(2) (-c1*r2(2)-d1)];
        r = roots(p1);
        now = 2;
        
    end
end