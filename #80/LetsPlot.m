
%{
figure(1);
 hold;

%txt_BS = 'ABCDEFGHIJKLMNOP';
%txt_M = ['123456789','10'];

for therow = 1:N
    scatter(x(therow),y(therow),'yellow');
    text(x(therow),y(therow),txt_M(therow));
end
for thecol = 1:no_BS
    scatter(BS(thecol,1),BS(thecol,2),'r');
   text(BS(thecol,1),BS(thecol,2),txt_BS(thecol));
end
%}

[val,inx] = max(A,[],1);

for i = 1:N
    if (inx(i) ==1 && val(i)>10)
        scatter(x(i),y(i),'r');
        drawnow;
        hold on;
        
    elseif (inx(i) == 5 && val(i)>10)
        scatter(x(i),y(i),'y');
        drawnow;
        hold on;
        
    elseif (inx(i) == 2&& val(i)>10)
        scatter(x(i),y(i),'black');
        drawnow;
        hold on;
        
    elseif (inx(i) == 3&& val(i)>10)
        scatter(x(i),y(i),'b');
        drawnow;
        hold on;
        
    elseif (inx(i) == 4&& val(i)>10)
        scatter(x(i),y(i),'green');
        drawnow;
        hold on;
        
    elseif (inx(i) == 5&& val(i)>10)
        scatter(x(i),y(i),'m');
        drawnow;
        hold on;
        
    elseif (inx(i) == 6&& val(i)>10)
        scatter(x(i),y(i),'c');
        drawnow;
        hold on;
    end
    
    
    
    
end