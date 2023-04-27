function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples

  % Error -> the error of the regularized cost function

  % TODO: linear_regression_cost_function implementation
  Error = 0;
  m = rows(Y);
  n = columns(FeatureMatrix);
  Theta(1,:) = [];
  for i = 1:m
    h = FeatureMatrix(i, :) * Theta - Y(i, 1);
    Error = Error + h * h;
  endfor
  Error = Error / 2 / m;
endfunction