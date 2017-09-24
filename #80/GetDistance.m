function [distance] = GetDistance(x,y,N,BS_X,BS_Y,no_BS)

%set distance array
distance = zeros(no_BS,N);

%distance(N,1) -> for base-station 1 Nth mobile
%distance(N,2) -> for base-station 2 Nth mobile
%eg) distance(2,1) -> distance between 1st mobile to 2nd base station
%     |   Mobile
%-----|--------------------------
% Base|
% Sta-|
% tion|



%calculate the distance between each mobile and base station
for i = 1:N %number of mobiles %row
    for j = 1:no_BS %number of base_station %column
        distance(j,i) = sqrt((x(i) - BS_X(j)) ^2 + (y(i) - BS_Y(j)) ^2);
    end
end

end