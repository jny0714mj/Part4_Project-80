runtime = 3;
prop = zeros(runtime,1);
for i = 1:runtime
   run;
   prop(i) = Outage;
end