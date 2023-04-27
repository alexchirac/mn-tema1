function [Y, InitialMatrix] = parse_data_set_file(file_path)
  % path -> a relative path to the .txt file

  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed
  
  % TODO: parse_data_set_file implementation
  file = fopen(file_path, 'r');
  m = fscanf(file, '%d', 1);
  n = fscanf(file, '%d', 1);
  InitialMatrix = cell(m, n);
  for i = 1:m
    Y(i, 1) = fscanf(file, '%d', 1);
    for j = 1:n
      InitialMatrix{i, j} = fscanf(file, '%s', 1);
    endfor
  endfor
endfunction