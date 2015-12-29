function outputLayer = runNeuralNetwork(inputLayerSizeNoBias, ... 
                                   hiddenLayerSizeNoBias, ... 
                                   numBuckets, ... 
                                   X, theta1, theta2)

   inputLayerSizeWithBias = inputLayerSizeNoBias + 1;
   hiddenLayerSizeWithBias = hiddenLayerSizeNoBias + 1;
   
   numTrainingExamples = rows(X);
   
   inputLayerWithBias = [ones(numTrainingExamples, 1) X]; 
   inputTimesTheta1 = theta1 * inputLayerWithBias';
   hiddenLayerNoBias = sigmoid(inputTimesTheta1);
   hiddenLayerWithBias = [ones(1, numTrainingExamples); hiddenLayerNoBias];
   hiddenTimesTheta2 = theta2 * hiddenLayerWithBias;
   outputLayer = sigmoid(hiddenTimesTheta2);
                                                                                                                 
end

