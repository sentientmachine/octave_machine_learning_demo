function verify_theta1_theta2_against_testingdata(X, Y, printResults)
  numTrainingExamples = rows(X);
  load('theta1.mat');
  load('theta2.mat');

  nnParams = [Theta1(:) ; Theta2(:)];

  outputLayer = runNeuralNetwork(nnParams, columns(X), rows(Theta1), rows(Theta2), X);

  [maxOutputValue maxOutputIndex] = max(outputLayer);
  %show_matrix2("maxOutputIndex", maxOutputIndex);
  errorTrainingData = abs(maxOutputIndex' - Y);
  %show_matrix2("errorTrainingData", errorTrainingData);
  totalError = sum(errorTrainingData);
  averageError = totalError / numTrainingExamples;
  totalError
  averageError

  numberRight = sum(maxOutputIndex' == Y)
  numberWrong = numTrainingExamples - numberRight
  percentRight = numberRight/numTrainingExamples
  percentWrong = numberWrong/numTrainingExamples

  if (printResults == 1)
    %show_matrix2("maxOutputIndex", maxOutputIndex);
    %show_matrix2("outputLayer", outputLayer);
    
    outputLayer = outputLayer';
    maxOutputIndex = maxOutputIndex';

    %result = [maxOutputIndex outputLayer];
    
    result = [X Y maxOutputIndex];
    
    disp("feature1 feature2 Y maxOutputIndex"); 
    my = eval(mat2str(result, 'int16'));
    round(my .* 100) ./ 100; 
    output_precision(2) 
    my


  end

end

