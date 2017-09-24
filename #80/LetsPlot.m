%To visualise the arrangement of mobiles and base stations, the graph
%displaying their locations has been plotted

figure;

txt_BS = 'ABCDEFGHIJKLMNOP';    %text to label base stations
txt_M = '123456789';    %text to label mobiles
colour = 'rgbkmc';  %list of colours

%Plotting the mobiles and base stations before any techniques has been
%applied.
subplot(2,2,1);
for i = 1:N     %plotting mobiles
    scatter(x(i),y(i),'o','MarkerFaceColor','red');
    text(x(i)+1,y(i)+1,txt_M(i));
    hold on;
    
end
for j = 1:no_BS     %plotting base stations
    scatter(BS_X(j),BS_Y(j),'s','MarkerFaceColor','black');
    text(BS_X(j)+1,BS_Y(j)+1,txt_BS(j));
    hold on;
end
title('BEFORE');

hold off;

%plotting the mobiles and base stations that has been paired up. Same
%colour of mobile and base station indicate they have been paired up.
subplot(2,2,2)
for k = 1:no_BS
    scatter(BS_X(k),BS_Y(k),'s','MarkerFaceColor',colour(k));
    hold on;
   
    text(BS_X(k)+1,BS_Y(k)+1,txt_BS(k));

    for i = 1:N
        if (idx(k) == i)
            scatter(x(i),y(i),'o','MarkerFaceColor',colour(k));
            text(x(i)+1,y(i)+1,txt_M(i));
            hold on;
        end
    end
end
title('AFTER');

hold off;

%plotting the mobiles and base stations when access control has been
%applied
subplot(2,2,3)
a_index = a_idx;
a_index(off_BS) = 0;
for k = 1:no_BS
    if (k ~= off_BS)
        scatter(BS_X(k),BS_Y(k),'s','MarkerFaceColor',colour(k));
        hold on;
        text(BS_X(k)+1,BS_Y(k)+1,txt_BS(k));
        for i = 1:N
            if (idx(k) == i)
                scatter(x(i),y(i),'o','MarkerFaceColor',colour(k));
                text(x(i)+1,y(i)+1,txt_M(i));
                hold on;
            end
        end
    end
end
title('ACCESS CONTROL');

axis([0 100 0 100]);    %fix the axis of 100 by 100
hold off;
