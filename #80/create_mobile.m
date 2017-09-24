function [x,y] = create_mobile(N,manual)

%locate mobiles manually
if manual == 1
    x = [33	81	100	99
        ];
    y = [13	24	3	61
        ];
    
%creating random position for mobiles
elseif manual == 0
    
    x = randi(100 ,1 , N); %Mobile x axis
    y = randi(100, 1 , N); %Mobile y axis
    
end

end