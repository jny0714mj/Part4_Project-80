function [x,y] = create_mobile(N,manual)

%creating random position for mobiles
if manual == 1
    x = [33	81	100	99
];
    y = [13	24	3	61
];
end

if manual == 0
   
    x = randi(100 ,1 , N); %Mobile x axis
    y = randi(100, 1 , N); %Mobile y axis
 
end

end