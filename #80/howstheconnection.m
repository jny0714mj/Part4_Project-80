
figure(2);
for k = 1:no_BS
    scatter(BS_X(k),BS_Y(k),colour(k));
    hold on;
    scatter(x(idx(k)),y(idx(k)),colour(k));
    text(BS_X(k)+1,BS_Y(k)+1,txt_BS(k));
    text(x(idx(k))+1,y(idx(k))+1,txt_M(idx(k)));
    hold on;
end
hold off;
