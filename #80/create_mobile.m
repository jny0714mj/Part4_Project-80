function [x,y] = create_mobile(N,manual)

%creating random position for mobiles
if manual == 1
    x = [2	99	94
];
    y = [27	67	8
];
end

if manual == 0
   
    x = randi(100 ,1 , N); %Mobile x axis
    y = randi(100, 1 , N); %Mobile y axis
 
end

end