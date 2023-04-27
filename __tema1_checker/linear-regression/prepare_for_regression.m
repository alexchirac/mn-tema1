function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  % InitialMatrix -> the matrix that must be transformed

  % FeatureMatrix -> the matrix with all training examples
  
  % TODO: prepare_for_regression implementation
  for i = 1:rows(InitialMatrix)
    k = 1;
    for j = 1:columns(InitialMatrix)
      if strcmp(InitialMatrix{i, j}, "yes") == 1
        FeatureMatrix(i, k) = 1;
        k = k + 1;
        continue
      endif
      if strcmp(InitialMatrix{i, j}, "no") == 1
        FeatureMatrix(i, k) = 0;
        k = k + 1;
        continue
      endif
      if strcmp(InitialMatrix{i, j}, "semi-furnished") == 1
        FeatureMatrix(i, k) = 1;
        FeatureMatrix(i, k + 1) = 0;
        k = k + 2;
        continue
      endif
      if strcmp(InitialMatrix{i, j}, "unfurnished") == 1
        FeatureMatrix(i, k) = 0;
        FeatureMatrix(i, k + 1) = 1;
        k = k + 2;
        continue
      endif
      if strcmp(InitialMatrix{i, j}, "furnished") == 1
        FeatureMatrix(i, k) = 0;
        FeatureMatrix(i, k + 1) = 0;
        k = k + 2;
        continue
      endif
      FeatureMatrix(i, k) = str2num(InitialMatrix{i, j});
      k = k + 1;
    endfor
  endfor
endfunction