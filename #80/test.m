A = Down;
row = zeros(1,no_BS);
col = zeros(1,N);
for i = 1:no_BS
    for j = 1:N
        num = max(A(:));
        [row(j), col(j)] = ind2sub(size(A),find(A==num));
        A(row(j),:) = -inf;
        A(:,col(j)) = -inf;
       
        if (A(:,:) == -inf)
            disp(row)
            disp(col)
            return
        end     
                
    end
end 



% MaxValue = -Inf;
 %row = 0;
 %column = 0;
 %for i = 1:size(A, 1)
  %   for j = 1:size(A, 2)
   %      if A(i, j) > MaxValue
    %         MaxValue = A(i, j);
     %        row = i
      %       column = j
             %disp(row)
             %disp(column)
             %A(i,:) = -inf;
             %A(:,j) = -inf;
       %  end
     %end
 %end