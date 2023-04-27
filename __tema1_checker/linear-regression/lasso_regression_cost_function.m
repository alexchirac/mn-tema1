function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of 
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function

  % TODO: lasso_regression_cost_function implementation
  m = columns(FeatureMatrix);
  n = rows(FeatureMatrix);
  norm = 0;
  for i = 1:m
    norm = norm + abs(Theta(i, 1));
  endfor
  norm = norm * lambda;
  s = 0;
  Theta(1,:) = [];
  for i = 1:n
    term = Y(i, 1) - FeatureMatrix(i, :) * Theta;
    s = s + term * term;
  endfor
  s = s / n;
  Error = s + norm;
endfunction