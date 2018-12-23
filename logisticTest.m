function logisticTest()
    #get the training file, the observations
   fileNameX = "finance_training.txt";

   #get the target file, (the answer key) aka supervisory signal
   fileNameY = "finance_target.txt";

   hiddenLayerUnitsMultiple = 20;   %Number of hidden units relative to number of features.
   numBuckets = 2;
   lambda = 0;
   doCrossValidation=1;  %1 means do cross validation, 0 means don't use cross validation.
   crossValidationPercent=.30;  %Means 30% of the training set rows are reserved for cross validation
   maxIterations=5000;
   
   [X Y crossValidationSetX crossValidationSetY] = loadTrainingData(fileNameX, fileNameY, doCrossValidation, crossValidationPercent);

   numTrainingExamples = rows(X);
   inputLayerSizeNoBias = columns(X);

   hiddenLayerSizeNoBias = inputLayerSizeNoBias * hiddenLayerUnitsMultiple;
   inputLayerSizeWithBias = inputLayerSizeNoBias + 1;
   
   %show_matrix("hiddenLayerSizeNoBias", hiddenLayerSizeNoBias);
   hiddenLayerSizeWithBias = hiddenLayerSizeNoBias + 1;
   % Hard coded for 1 hidden layer
   initialTheta1 = rand(hiddenLayerSizeNoBias,inputLayerSizeWithBias) * 2 - 1;
   initialTheta2 = rand(numBuckets,hiddenLayerSizeWithBias) * 2 - 1;
  

   %show_matrix("initialTheta1", initialTheta1);
   %show_matrix("initialTheta2", initialTheta2);
   % Unroll parameters
   initialNNParams = [initialTheta1(:) ; initialTheta2(:)];
   % Weight regularization parameter (we set this to 0 here).
   %show_matrix("initialNNParams", initialNNParams);
   % Maximum iterations to run. Increase later once we are done debugging.
   options = optimset('MaxIter', maxIterations);
   %options = optimset();
   % Create "short hand" for the cost function to be minimized
   costFunction = @(p) costFunctionOneHiddenLayer(p, ...
      inputLayerSizeNoBias, hiddenLayerSizeNoBias, numBuckets, X, Y, lambda);
   

   [nnParams, cost] = fmincg(costFunction, initialNNParams, options);
   %show_matrix2("cost", cost, 16);
   
   %cost(rows(cost), 1)
   %show_matrix("cost", cost);
   % Obtain Theta1 and Theta2 back from nnParams
   Theta1 = reshape(nnParams(1:hiddenLayerSizeNoBias * inputLayerSizeWithBias),
      hiddenLayerSizeNoBias, inputLayerSizeWithBias);
   Theta2 = reshape(nnParams((1 + (hiddenLayerSizeNoBias * inputLayerSizeWithBias)):end),
      numBuckets, hiddenLayerSizeWithBias);

   save theta1.mat Theta1;
   save theta2.mat Theta2;

   disp("================SUMMARY TRAINING DATA======================");
  
   printResults=0; 
   verify_theta1_theta2_against_testingdata(X, Y, printResults);

   if (doCrossValidation == 1)
     disp("================SUMMARY CROSS VALIDATION DATA==============");

     verify_theta1_theta2_against_testingdata(crossValidationSetX, ... 
                                           crossValidationSetY, printResults=1);
   end

   disp("================SPECIAL CASE TESTS========================");

   X = load(fileNameX);
   Y = load(fileNameY);
   
   verify_theta1_theta2_against_testingdata(X, Y, printResults=1);

end

warning('off', 'Octave:possible-matlab-short-circuit-operator');
logisticTest();

disp("program is done!")

