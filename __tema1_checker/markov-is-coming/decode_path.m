function [decoded_path] = decode_path (path, lines, cols)
	% path -> vector containing the order of the states that arrived
	% 		 to a winning position
	% lines -> numeber of lines
	% cols -> number of columns
	
	% decoded_path -> vector of pairs (line_index, column_index)
  %                 corresponding to path states
  % hint: decoded_path does not contain indices for the WIN state

  % TODO: decode_path implementation
  for i = 1:rows(path)
    decoded_path(i, 1) = ceil(path(i, 1) / cols);
    decoded_path(i, 2) = mod(path(i, 1), cols);
    if decoded_path(i, 2) == 0
      decoded_path(i, 2) = cols;
    endif
  endfor
  decoded_path(end,:) = [];
endfunction