bs_count = 0;
threshold = 0;
for g = 1:N
    if ((val(g)>15) && (inx(g) == 6))
        threshold = threshold + 1;
    end
end
disp(threshold);