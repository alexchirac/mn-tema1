function [J, grad] = cost_function(params, X, y, lambda, ...
                   input_layer_size, hidden_layer_size, ...
                   output_layer_size)

  % params -> vector containing the weights from the two matrices
  %           Theta1 and Theta2 in an unrolled form (as a column vector)
  % X -> the feature matrix containing the training examples
  % y -> a vector containing the labels (from 1 to 10) for each
  %      training example
  % lambda -> the regularization constant/parameter
  % [input|hidden|output]_layer_size -> the sizes of the three layers
  
  % J -> the cost function for the current parameters
  % grad -> a column vector with the same length as params
  % These will be used for optimization using fmincg
  
  % TODO: cost_function implementation

  % TODO1: get Theta1 and Theta2 (from params). Hint: reshape
  n = rows(params);
  s1 = input_layer_size;
  s2 = hidden_layer_size;
  s3 = output_layer_size;
  Theta1 = reshape(params(1:s2 * (s1 + 1)), s2, s1 + 1);
  Theta2 = reshape(params(s2 * (s1 + 1) + 1:n), s3, s2 + 1);

  % TODO2: Forward propagation
  for i=1:rows(X)
    a = X(i,:);
    a = [1; a'];
    z = Theta1 * a;
    vecz(i, :) = z';
    [a] = sigmoid(z);
    a = [1; a];
    hidden(i, :) = a';
    z = Theta2 * a;
    [a] = sigmoid(z);
    result(i, :) = a';
  endfor
  % TODO3: Compute the error in the output layer and perform backpropagation
  delta1 = zeros(s2, s1 + 1);
  delta2 = zeros(s3, s2 + 1);
  
  for i=1:rows(result)
    a = result(i, :);
    err3 = a' - y(i,1);
    delta2 = delta2 + err3 * hidden(i, :);
    err2 = (Theta2' * err3) .* [1; (sigmoid(vecz(i, :)) .* (1 - sigmoid(vecz(i, :))))'];
    err2(1,:) = [];
    delta1 = delta1 + err2 * [1, X(i,:)];
  endfor
  % TODO4: Determine the gradients
  delta1 = delta1 / rows(X);
  delta2 = delta2 / rows(X);
  for i = 1:s2
    for j = 2:s1 + 1
      delta1(i,j) += lambda / rows(X) * delta1(i,j);
    endfor
  endfor
  for i = 1:s3
    for j = 2:s2 + 1
      delta2(i,j) += lambda / rows(X) * delta2(i,j);
    endfor
  endfor
  grad1 = delta1(:);
  grad2 = delta2(:);
  grad = [grad1; grad2];
  % TODO5: Final J and grad
  grad = 0;
  J = 0;
endfunction
