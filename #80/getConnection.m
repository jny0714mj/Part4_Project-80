function [temp] = getConnection(distance, N)

temp = zeros(1,N);

for i = 1:N
    if (distance(1,i)<= distance(2,i))
        temp(i) = 1;
    else
        temp(i) = 2;
    end
end

end