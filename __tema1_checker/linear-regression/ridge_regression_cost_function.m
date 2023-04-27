function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of 
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function

  % TODO: ridge_regression_cost_function implementation
  m = columns(FeatureMatrix);
  n = rows(FeatureMatrix);
  s = 0;
  Theta(1,:) = [];
  for i = 1:n
    term = FeatureMatrix(i, :) * Theta - Y(i, 1);
    s = s + term * term;
  endfor
  s = s / 2 / n;
  sum = 0;
  for i = 1:m
    sum = sum + Theta(i, 1) * Theta(i, 1);
  endfor
  sum = lambda * sum;
  Error = sum + s;
endfunction