function [Link] = get_link_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings
  
  % Link -> the link matrix associated to the given labyrinth
  
  % TODO: get_link_matrix implementation
  m = columns(Labyrinth);
  n = rows(Labyrinth);
  Link = spalloc(m * n + 2, m * n + 2, m * n * 4);
  for i = 1:n
    for j = 1:m
      
      if (i != n)
        if (floor(mod(Labyrinth(i, j), 8) / 4) == 0)
          Link((i - 1) * m + j, m * i + j) = 1;
          Link(m * i + j, (i - 1) * m + j) = 1;
        endif
      endif
            
      if (j != m)
        if (floor(mod(Labyrinth(i, j), 4) / 2) == 0)
          Link((i - 1) * m + j, (i - 1) * m + j + 1) = 1;
          Link((i - 1) * m + j + 1, (i - 1) * m + j) = 1;
        endif
      endif
      
      
      if (i == 1 && floor(Labyrinth(i, j) / 8) == 0)
        Link((i - 1) * m + j, m * n + 1) = 1;
      endif
      
      if (i == n && floor(mod(Labyrinth(i, j), 8) / 4) == 0)
        Link((i - 1) * m + j, m * n + 1) = 1;
      endif
      
      if (j == 1 && mod(Labyrinth(i, j), 2) == 0)
        Link((i - 1) * m + j, m * n + 2) = 1;
      endif
      
      if (j == m && floor(mod(Labyrinth(i, j), 4) / 2) == 0)
        Link((i - 1) * m + j, m * n + 2) = 1;
      endif
      
    endfor
  endfor

  for i = 1:(m * n)
    nr = sum(Link(i,:));
    Link(i,:) = Link(i,:) / nr;
  endfor
  Link(m * n + 1, m * n + 1) = 1;
  Link(m * n + 2, m * n + 2) = 1;
endfunction
