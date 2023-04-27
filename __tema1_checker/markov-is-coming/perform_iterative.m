function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)
	% G -> iteration matrix
	% c -> iteration vector
	% x0 -> initial solution
	% tol -> accepted tolerance (norm of the difference between two solutions)
	% max_steps -> the maximum number of iterations
	
	% x -> final solution
	% err -> last calculated difference (as an euclidean norm)
	% steps -> actual number of steps performed

   % TODO: perform_iterative implementation
   for i = 1:max_steps + 1
    p = G * x0 + c;
    err = norm(x0 - p);
    %n2 = norm(x0);
    %err = abs(n1 - n2);
    if err < tol
      break
    endif
    x0 = p;
  endfor
  x = p;
  steps = i;
endfunction
