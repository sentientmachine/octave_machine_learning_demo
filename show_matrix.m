function show_matrix(name, matrix, precision)
  %if the number of arguments coming in is 3 then we can proceed
  if (nargin == 3) 
    rows = rows(matrix);
    cols = columns(matrix);
  
    mystr = "";
    format = strcat("%9.", num2str(precision), "f");
    for i = 1:rows
      for j = 1:cols
        mystr = strcat(mystr, sprintf(format, matrix(i,j)));
        if (j ~= cols)
          mystr = strcat(mystr, ",");
        endif
      endfor
      if i ~= rows 
        mystr = strcat(mystr, " ;");
      endif
    endfor
    disp(sprintf("%-20s %s [ %s ] ", name, mat2str(size(matrix)), mystr)) 
  else
    %this is so the user can invoke show_matrix(name, matrix), and
    %it defaults to 3 units precision.
    show_matrix(name, matrix, 2);
  endif
end
