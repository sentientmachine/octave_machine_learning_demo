function logisticTest()
   fileNameX = "testingdata01.txt";
   fileNameY = "answerdata01.txt";
   X = load(fileNameX);
   show_matrix("input_layer", X);
   numTrainingExamples = rows(X);
   inputLayerSizeNoBias = columns(X);
   inputLayerSizeWithBias = inputLayerSizeNoBias + 1;
   Y = load(fileNameY);
   
   show_matrix("Y", Y);
   hiddenLayerSizeNoBias = inputLayerSizeNoBias;
   
   show_matrix("hiddenLayerSizeNoBias", hiddenLayerSizeNoBias);
   hiddenLayerSizeWithBias = hiddenLayerSizeNoBias + 1;
   numBuckets = 2;
   % Hard coded for 1 hidden layer
   initialTheta1 = rand(hiddenLayerSizeNoBias,inputLayerSizeWithBias) * 2 - 1;
   initialTheta2 = rand(numBuckets,hiddenLayerSizeWithBias) * 2 - 1;

   show_matrix("initialTheta1", initialTheta1);
   show_matrix("initialTheta2", initialTheta2);
   % Unroll parameters
   initialNNParams = [initialTheta1(:) ; initialTheta2(:)];
   % Weight regularization parameter (we set this to 0 here).
   show_matrix("initialNNParams", initialNNParams);
   lambda = 0;
   % Maximum iterations to run. Increase later once we are done debugging.
   options = optimset('MaxIter', 10);
   % Create "short hand" for the cost function to be minimized
   costFunction = @(p) costFunctionOneHiddenLayer(p, ...
      inputLayerSizeNoBias, hiddenLayerSizeNoBias, numBuckets, X, Y, lambda);
   [nnParams, cost] = fmincg(costFunction, initialNNParams, options);
   
   cost
   % Obtain Theta1 and Theta2 back from nnParams
   Theta1 = reshape(initialNNParams(1:hiddenLayerSizeNoBias * inputLayerSizeWithBias),
      hiddenLayerSizeNoBias, inputLayerSizeWithBias)
   Theta2 = reshape(initialNNParams((1 + (hiddenLayerSizeNoBias * inputLayerSizeWithBias)):end),
      numBuckets, hiddenLayerSizeWithBias)


   disp("Input features:");
   X
   disp("Output features:");
   Y

   disp("enter in new feature data followed by the enter key:\n");
   testFeatureRow = []
   for i = 1:columns(X)
       ans = input(strcat("Enter feature: ", mat2str(i), "\n ")); 
       testFeatureRow = [testFeatureRow, ans];
   endfor

   testFeatureRow
   

end


warning('off', 'Octave:possible-matlab-short-circuit-operator');
logisticTest();


disp("done")
