function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  % X -> the loaded dataset with all training examples
  % y -> the corresponding labels
  % percent -> fraction of training examples to be put in training dataset
  
  % X_[train|test] -> the datasets for training and test respectively
  % y_[train|test] -> the corresponding labels
  
  % Example: [X, y] has 1000 training examples with labels and percent = 0.85
  %           -> X_train will have 850 examples
  %           -> X_test will have the other 150 examples

  % TODO: split_dataset implementation
  n = rows(X);
  m = columns(X);
  
  indexes = randperm(n);
  aux = reshape(X(indexes, :), n, m);
  X_train = aux([1:n * percent], :);
  X_test = aux([n * percent + 1:n], :);
  
  aux = reshape(y(indexes), n, 1);
  y_train = aux([1:n * percent], 1);
  y_test = aux([n * percent + 1:n], 1);
endfunction
