function [Y, InitialMatrix] = parse_csv_file(file_path)
  % path -> a relative path to the .csv file
  
  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed

  % TODO: parse_csv_file implementation
  file = fopen(file_path, 'r');
  i = 1;
  while (!feof(file))
    line = fgetl(file);
    rem = line;
    j = 1;
    while strcmp(rem, "") == 0
      [tok, rem] = strtok(rem, ",");
      InitialMatrix{i, j} = tok;
      j++;
    endwhile
    i++; 
  endwhile
  InitialMatrix(1, :) = [];
  n = rows(InitialMatrix);
  m = columns(InitialMatrix);
  for i = 1:n
    Y(i, 1)= str2double(InitialMatrix{i, 1});
  endfor
  InitialMatrix(:, 1) = [];
endfunction