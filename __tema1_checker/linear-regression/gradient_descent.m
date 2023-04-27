function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % n -> the number of predictors
  % m -> the number of trainings
  % alpha -> the learning rate
  % iter -> the number of iterations

  % Theta -> the vector of weights

  % TODO: gradient_descent implementation
  Theta = zeros(n, 1);
  for i = 1:iter
    for j = 1:n
      s = 0;
      for k = 1:m
        s = s + (FeatureMatrix(k,:) * Theta - Y(k,1)) * FeatureMatrix(k, j);
      endfor
      s = s / m;
      Theta1(j, 1) = Theta(j, 1) - alpha * s;
    endfor
    Theta = Theta1;
  endfor
  for i=n+1:-1:2
    Theta(i,1) = Theta(i-1,1)
  endfor
  Theta(1, 1) = 0;
endfunction