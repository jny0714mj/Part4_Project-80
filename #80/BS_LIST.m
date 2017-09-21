%setting the base station location
function [BS_X,BS_Y] = BS_LIST(no_BS)

if no_BS == 2
    BS_X = [0,100];
    BS_Y = [0,100];
elseif no_BS == 3
    BS_X = [0,50,100];
    BS_Y = [0,100,0];
elseif no_BS == 4
    BS_X = [0,100,0,100];
    BS_Y = [0,0,100,100];
elseif no_BS == 5;
    BS_X = [0,100,0,100,50];
    BS_Y = [0,0,100,100,50];
end

end