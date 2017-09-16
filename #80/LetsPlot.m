figure(1);
%hold;

txt_BS = 'ABCDEFGHIJKLMNOP';
txt_M = '123456';
colour = 'rgbkmc';

for i = 1:N
    scatter(x(i),y(i),'blue');
    text(x(i)+1,y(i)+1,txt_M(i));
    hold on;
    
end
for j = 1:no_BS
    scatter(BS_X(j),BS_Y(j),'black');
    text(BS_X(j)+1,BS_Y(j)+1,txt_BS(j));
    hold on;
end
hold off;
