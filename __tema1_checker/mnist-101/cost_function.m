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
    hidden(i, :) = a';
    a = [1; a];
    z = Theta2 * a;
    [a] = sigmoid(z);
    result(i, :) = a';
  endfor
  % TODO3: Compute the error in the output layer and perform backpropagation
  for i=1:rows(result)
    a = result(i, :);
    err3 = a' - y(i,1);
    
  endfor
  % TODO4: Determine the gradients
  
  % TODO5: Final J and grad

endfunction
