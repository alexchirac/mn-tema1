function [path] = heuristic_greedy (start_position, probabilities, Adj)
	% start_position -> the starting point in the labyrinth
	% probabilities -> vector of associated probabilities: including WIN and LOSE
	% Adj -> adjacency matrix
	
	% path -> the states chosen by the algorithm
  
  % TODO: heuristic_greedy implementation
  path(1, 1) = start_position;
  visited(1, 1) = start_position;
  while columns(path)
    pos = path(end);
    if probabilities(pos, 1) == 1
      break
    endif
    prob = -1;
    neigh = 0;
    for i = 1:columns(Adj)
      if (Adj(pos, i) == 1)
        if (any(visited != i) && probabilities(i, 1) > prob)
          neigh = i;
          prob = probabilities(i, 1);
        endif
      endif
    endfor
    if neigh == 0
      path(end) = [];
    else
      visited(end + 1) = neigh;
      path(end + 1) = neigh;
    endif
  endwhile
  path = path';
endfunction
