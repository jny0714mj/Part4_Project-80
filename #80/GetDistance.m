function [distance] = GetDistance(x,y,N,BS,no_BS)

%set distance array
%distance(N,1) -> for base-station 1 Nth mobile
%distance(N,2) -> for base-station 2 Nth mobile
distance = zeros(no_BS,N);

for i = 1:N %number of mobiles %row
    for j = 1:no_BS %number of base_station %column
        distance(i,j) = sqrt((x(j) - BS(i,1)) ^2 + (y(j) - BS(i,2)) ^2);
    end
end

end