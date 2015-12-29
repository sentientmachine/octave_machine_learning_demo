function [X Y crossValidationSetX crossValidationSetY] = loadTrainingData(fileNameX, fileNameY, doCrossValidation, crossValidationPercent)

  X = load(fileNameX);
  Y = load(fileNameY);

  numTrainingExamples = rows(X);
  if (doCrossValidation == 1)
    
    %show_matrix2("X before randomize", X);
    %show_matrix2("Y before randomize", Y);

    [unnecessaryValue,indexes] = sort(rand(1,numTrainingExamples));
    X = X(indexes,:);
    Y = Y(indexes,:);

    %show_matrix2("X after randomize", X);
    %show_matrix2("X after randomize", Y);
    
    indexOfSplit = floor(numTrainingExamples * crossValidationPercent);

    crossValidationSetX = X(1:indexOfSplit,:);
    crossValidationSetY = Y(1:indexOfSplit,:);

    X = X((indexOfSplit+1):end,:);
    Y = Y((indexOfSplit+1):end,:);

    %show_matrix2("X after split", X);
    %show_matrix2("Y after split", Y);

    %show_matrix2("crossValidationSetX", crossValidationSetX);
    %show_matrix2("crossValidationSetY", crossValidationSetY);

  else
    crossValidationSetX = 0;
    crossValidationSetY = 0;
  end

end
