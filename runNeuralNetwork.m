function outputLayer = runNeuralNetwork(nnParams, ...
                                   inputLayerSizeNoBias, ...
                                   hiddenLayerSizeNoBias, ...
                                   numBuckets, ...
                                   X)

inputLayerSizeWithBias = inputLayerSizeNoBias + 1;
hiddenLayerSizeWithBias = hiddenLayerSizeNoBias + 1;

% Reshape nnParams back into the parameters theta1 and theta2, the weight matrices
% for our 2 layer neural network
theta1 = reshape(nnParams(1:hiddenLayerSizeNoBias * inputLayerSizeWithBias), ...
                 hiddenLayerSizeNoBias, inputLayerSizeWithBias);

theta2 = reshape(nnParams((1 + (hiddenLayerSizeNoBias * inputLayerSizeWithBias)):end), ...
                 numBuckets, hiddenLayerSizeWithBias);

% Setup some useful variables
numTrainingExamples = rows(X);

inputLayerWithBias = [ones(numTrainingExamples, 1) X];
inputTimesTheta1 = theta1 * inputLayerWithBias';
hiddenLayerNoBias = sigmoid(inputTimesTheta1);
hiddenLayerWithBias = [ones(1, numTrainingExamples); hiddenLayerNoBias];
hiddenTimesTheta2 = theta2 * hiddenLayerWithBias;
outputLayer = sigmoid(hiddenTimesTheta2);

end
