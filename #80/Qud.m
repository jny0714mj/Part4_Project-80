if (no_BS == 4)
    if (now == 1)
        p1 = [a1 (b1+c1) (-d1-e1-f1)];
        r = roots(p1);
        now = 2;
        
    elseif(now ==2)
        p2 = [a2 (b2 + c2*r(2)) (-d2*r(2)-e2-f2)];
        r2 = roots(p2);
        now = 3;
    elseif(now == 3)
        p3 = [a3 (b3*r(2)+c3*r2(2)) (-d3*r(2)-e3*r2(2)-f3)];
        r3 = roots(p3);
        now = 4;
    elseif now == 4
        p1 = [a1 (b1*r2(2)+c1*r3(2)*r2(2)) (-d1*r2(2)-e1*r3(2)-f1)];
        r = roots(p1);
        now = 5;
    else
        p2 = [a2 (b2*r3(2) + c2*r(2)) (-d2*r(2)-e2*r3(2)-f2)];
        r2 = roots(p2);
        now = 3;
        
    end
end