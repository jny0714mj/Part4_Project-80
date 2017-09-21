function [power] = TripleReuse(PathGain,idx)

a1 = PathGain(1,idx(1))*PathGain(1,idx(3));
b1 = PathGain(2,idx(3))*PathGain(1,idx(1));
c1 = PathGain(3,idx(3))*PathGain(2,idx(1));
d1 = PathGain(3,idx(3))*PathGain(3,idx(1));
a2 = PathGain(2,idx(2))*PathGain(2,idx(3));
b2 = PathGain(1,idx(3))*PathGain(2,idx(2));
c2 = PathGain(1,idx(2))*PathGain(3,idx(3));
d2 = PathGain(3,idx(3))*PathGain(3,idx(2));

now = 1;

if (now == 1)
    p1 = [a1 b1 (-c1-d1)];
    r = roots(p1);
    now = 2;
    
    if(now ==2)
        p2 = [a2 b2*r(2) (-c2*r(2)-d2)];
        r2 = roots(p2);
        now =1;
    end
    
end

prev_r = 1;
prev_r2 = 1;

while ((r(2) ~= prev_r) & (r2(2) ~= prev_r2))
    if (now == 1)
        p1 = [a1 b1*r2(2) (-c1*r2(2)-d1)];
        prev_r = r;
        r = roots(p1);
        now = 2;
    end
    if(now ==2)
        p2 = [a2 b2*r(2) (-c2*r(2)-d2)];
        prev_r2 = r2;
        r2 = roots(p2);
        now = 1;
    end
    
end

power = ones(1,3);
power(1) = r(2);
power(2) = r2(2);

end