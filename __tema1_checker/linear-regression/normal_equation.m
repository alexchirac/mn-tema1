function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % tol -> the learning rate
  % iter -> the number of iterations
  % tol -> the tolerance level for convergence of the conjugate gradient method

  % Theta -> the vector of weights
  
  % TODO: normal_equation implementation
  A = FeatureMatrix' * FeatureMatrix;
  b = FeatureMatrix' * Y;
  Theta = zeros(columns(A),1);
  r1 = b - A * Theta;
  v = r1;
  tol = tol * tol;
  k = 1;
  while k < iter && r1' * r1 > tol
    t = (r1' * r1) / (v' * A * v);
    Theta = Theta + t * v;
    r2 = r1 - t * A * v;
    s = (r2' * r2) / (r1' * r1);
    v = r2 + s * v;
    r1 = r2;
    k = k + 1;
  endwhile
  n = rows(Theta);
  for i=n+1:-1:2
    Theta(i,1) = Theta(i-1,1);
  endfor
  Theta(1,1) = 0;
endfunction