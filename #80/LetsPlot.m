function LetsPlot(x,y,BS)

figure(1);
scatter(x,y);
hold;

scatter(BS(1,1),BS(1,2),'r');
scatter(BS(2,1),BS(2,2),'r');
scatter(BS(3,1),BS(3,2),'r');

figure(2);

end