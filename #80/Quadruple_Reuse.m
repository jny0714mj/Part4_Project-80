function [power] = Quadruple_Reuse(PathGain,idx)
%To find the transmitting power of base stations to balance out the SIR
%values in Quadruple reuse

%define coefficients for polynominal equations
a1 = PathGain(1,idx(1))*PathGain(1,idx(4));
b1 = PathGain(2,idx(4))*PathGain(1,idx(1));
c1 = PathGain(3,idx(4))*PathGain(1,idx(1));
d1 = PathGain(4,idx(4))*PathGain(2,idx(1));
e1 = PathGain(4,idx(4))*PathGain(3,idx(1));
f1 = PathGain(4,idx(4))*PathGain(4,idx(1));

a2 = PathGain(2,idx(4))*PathGain(2,idx(2));
b2 = PathGain(3,idx(4))*PathGain(2,idx(2));
c2 = PathGain(1,idx(4))*PathGain(2,idx(2));
d2 = PathGain(4,idx(4))*PathGain(1,idx(2));
e2 = PathGain(4,idx(4))*PathGain(3,idx(2));
f2 = PathGain(4,idx(4))*PathGain(4,idx(2));

a3 = PathGain(3,idx(4))*PathGain(3,idx(3));
b3 = PathGain(1,idx(4))*PathGain(3,idx(3));
c3 = PathGain(2,idx(4))*PathGain(3,idx(3));
d3 = PathGain(4,idx(4))*PathGain(1,idx(3));
e3 = PathGain(4,idx(4))*PathGain(2,idx(3));
f3 = PathGain(4,idx(4))*PathGain(4,idx(3));

now = 1;

%find the roots of each polynominal that corresponding to each base
%station's transmitting power
if (now == 1)
    p1 = [a1 (b1+c1) (-d1-e1-f1)];
    r = roots(p1);
    now = 2;
    
    if(now ==2)
        p2 = [a2 (b2 + c2*r(2)) (-d2*r(2)-e2-f2)];
        r2 = roots(p2);
        now = 3;
    end
    
    if(now == 3)
        p3 = [a3 (b3*r(2)+c3*r2(2)) (-d3*r(2)-e3*r2(2)-f3)];
        r3 = roots(p3);
        now = 1;
        
    end
end

prev_r = 1;
prev_r2 = 1;
prev_r3 = 1;

%iterative process to find transmitting powers
while ((r(2) ~= prev_r) & (r2(2) ~= prev_r2) & (r3() ~= prev_r3))
    if (now == 1)
        p1 = [a1 (b1*r2(2)+c1*r3(2)) (-d1*r2(2)-e1*r3(2)-f1)];
        prev_r = r;
        r = roots(p1);
        now = 2;
    end
    if(now ==2)
        p2 = [a2 (b2*r3(2) + c2*r(2)) (-d2*r(2)-e2*r3(2)-f2)];
        prev_r2 = r2;
        r2 = roots(p2);
        now = 3;
    end
    if(now == 3)
        p3 = [a3 (b3*r(2)+c3*r2(2)) (-d3*r(2)-e3*r2(2)-f3)];
        prev_r3 = r3;
        r3 = roots(p3);
        now = 1;
    end
    
end

power = ones(1,4);
power(1) = r(2);    %power for base station1
power(2) = r2(2);   %power for base station2
power(3) = r3(2);   %power for base station3


end