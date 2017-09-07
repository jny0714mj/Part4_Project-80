function [x,y] = create_mobile(N,manual)

%creating random position for mobiles
if manual == 1
    x = zeros(1,N);
    y = zeros(1,N);
    for i = 1:N
        for j = 1:N;
            x(j*i)= j;
            y(i*j) = i;
        end
       
       
    end
    x = [50,0,75,75];
    y = [50,0,25,75];
end

if manual == 0
   
    x = randi(100 ,1 , N); %Mobile x axis
    y = randi(100, 1 , N); %Mobile y axis
 
end

end