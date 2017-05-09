
figure(1);
hold;

txt_BS = ['A','B','C','D','E'];
txt_M = ['1','2','3','4','5'];

for i = 1:N
    scatter(x(i),y(i),'yellow');
    text(x(i),y(i),txt_M(i));
end
for j = 1:no_BS
    scatter(BS(j,1),BS(j,2),'r');
    text(BS(j,1),BS(j,2),txt_BS(j));
end
