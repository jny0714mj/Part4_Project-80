
g = zeros(N,no_BS);
for i = 1:no_BS
   for j = 1:N
      g(i,j) = 1/(distance(i,j)^n);
   end
end

if (no_BS == 3)
    a1=g(1,3)*g(1,1);
    b1 = g(2,3)*g(1,1);
    c1 = g(3,3)*g(2,1);
    d1 = g(3,3)*g(3,1);
    a2 = g(2,2)*g(2,3);
    b2 = g(1,3)*g(2,2);
    c2 = g(1,2)*g(3,3);
    d2 = g(3,3)*g(3,2);
elseif (no_BS == 4)
    a1 = g(1,1)*g(1,4);
    b1 = (g(2,4)*g(1,1));
    c1 = (g(3,4)*g(1,1));
    d1 = g(4,4)*g(2,1);
    e1 = g(4,4)*g(3,1);
    f1 = g(4,4)*g(4,1);
    
    a2 = g(2,4)*g(2,2);
    b2 = (g(3,4)*g(2,2));
    c2 = (g(1,4)*g(2,2)); 
    d2 = g(4,4)*g(1,2);
    e2 = g(4,4)*g(3,2);
    f2 = g(4,4)*g(4,2);
    
    a3 = g(3,4)*g(3,3);
    b3 = (g(1,4)*g(3,3));
    c3 = (g(2,4)*g(3,3));
    d3 = g(4,4)*g(1,3);
    e3 = g(4,4)*g(2,3);
    f3 = g(4,4)*g(4,3);
end
now = 1;