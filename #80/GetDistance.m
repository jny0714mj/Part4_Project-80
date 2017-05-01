function [distance] = GetDistance(x,y,N,BS,no_BS)

%set distance array
%distance(1,N) -> for base-station 1 Nth mobile
%distance(2,N) -> for base-station 2 Nth mobile
distance = zeros(no_BS,N);

for i = 1:no_BS %number of base_station
    for j = 1:N %number of mobiles
        distance(i,j) = sqrt((x(j) - BS(i,1)) ^2 + (y(j) - BS(i,2)) ^2);
    end
end

end