function [cost grad] = costFunctionOneHiddenLayer(nnParams, ...
                                   inputLayerSizeNoBias, ...
                                   hiddenLayerSizeNoBias, ...
                                   numBuckets, ...
                                   X, y, lambda)
%costFunctionOneHiddenLayer Implements the neural network cost function for a two layer
%neural network which performs classification
%   [cost grad] = NNCOSTFUNCTON(nnParams, hiddenLayerSizeNoBias, numBuckets, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nnParams and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

inputLayerSizeWithBias = inputLayerSizeNoBias + 1;
hiddenLayerSizeWithBias = hiddenLayerSizeNoBias + 1;

% Reshape nnParams back into the parameters theta1 and theta2, the weight matrices
% for our 2 layer neural network
theta1 = reshape(nnParams(1:hiddenLayerSizeNoBias * inputLayerSizeWithBias), ...
                 hiddenLayerSizeNoBias, inputLayerSizeWithBias);

theta2 = reshape(nnParams((1 + (hiddenLayerSizeNoBias * inputLayerSizeWithBias)):end), ...
                 numBuckets, hiddenLayerSizeWithBias);

%show_matrix("theta1", theta1);
%show_matrix("theta2", theta2);
% Setup some useful variables
numTrainingExamples = rows(X);
         
% You need to return the following variables correctly 
cost = 0;
theta1Grad = zeros(size(theta1));
theta2Grad = zeros(size(theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable cost. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         theta1Grad and theta2Grad. You should return the partial derivatives of
%         the cost function with respect to theta1 and theta2 in theta1Grad and
%         theta2Grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to theta1Grad
%               and theta2Grad from Part 2.
%

% PS1('>> ');
% cd 'C:\Users\charity\Desktop\ex4\ex4'
% addpath 'C:\Users\charity\Desktop\ex4\ex4'

% Part 1
% X is 5 x 3
% theta1 is 3 x 4
% theta2 is 2 x 4
% inputLayerWithBias is 5 x 4
% inputTimesTheta1 is 3 x 5
% hiddenLayerNoBias is 3 x 5
% hiddenLayerWithBias is 4 x 5
% hiddenTimesTheta2 is 2 x 5
% outputLayer is 2 x 5
inputLayerWithBias = [ones(numTrainingExamples, 1) X];
%show_matrix("inputLayerWithBias", inputLayerWithBias);
inputTimesTheta1 = theta1 * inputLayerWithBias';
%show_matrix("inputTimesTheta1", inputTimesTheta1);
hiddenLayerNoBias = sigmoid(inputTimesTheta1);
%show_matrix("hiddenLayerNoBias", hiddenLayerNoBias);
hiddenLayerWithBias = [ones(1, numTrainingExamples); hiddenLayerNoBias];
%show_matrix("hiddenLayerWithBias", hiddenLayerWithBias);
hiddenTimesTheta2 = theta2 * hiddenLayerWithBias;
%show_matrix("hiddenTimesTheta2", hiddenTimesTheta2);
outputLayer = sigmoid(hiddenTimesTheta2);
%show_matrix("outputLayer", outputLayer);
% outputDerivative is the derivative of the error between the hidden layer and the output layer.
% This is the measurement of the error that only theta2 contributes to the cost.
% outputDerivative is 2 x 5
outputDerivative = zeros(size(outputLayer));

for i=1:numTrainingExamples,
% currentTarget is 1 x 2 (one row of the target matrix)
% y is 5 x 1
	currentTarget = zeros(1,numBuckets);
        currentTarget(y(i))=1;	
	outputDerivative(:,i) = outputLayer(:,i)-currentTarget';
	cost += sum(-1 * currentTarget * log(outputLayer(:,i)) - (1 - currentTarget) * log(1 - outputLayer(:,i)));
end;
%show_matrix("outputDerivative", outputDerivative);
cost /= numTrainingExamples;

% theta1NoBias is 3 x 3
theta1NoBias = theta1(:,2:end);
% theta2NoBias is 2 x 3
theta2NoBias = theta2(:,2:end);
%show_matrix("theta1NoBias", theta1NoBias);
%show_matrix("theta2NoBias", theta2NoBias);

cost += (lambda/(2*numTrainingExamples))*(sum(sum(theta1NoBias .^2)) + sum(sum(theta2NoBias .^2)));

% hiddenDerivativeWithBias is the derivative of the error between the input layer and the hidden layer.
% This is the measurement of the error that only theta1 contributes to the cost.
% hiddenDerivativeWithBias is 4 x 5
hiddenDerivativeWithBias = theta2' * outputDerivative;
%show_matrix("hiddenDerivativeWithBias", hiddenDerivativeWithBias);

hiddenDerivativeWithBias = hiddenDerivativeWithBias .* sigmoidGradient([ones(1,numTrainingExamples); inputTimesTheta1]);
%show_matrix("hiddenDerivativeWithBias", hiddenDerivativeWithBias);

% hiddenDerivativeNoBias is 3 x 5
hiddenDerivativeNoBias = hiddenDerivativeWithBias(2:end,:);
%show_matrix("hiddenDerivativeNoBias", hiddenDerivativeNoBias);

% theta1Grad is 3 x 4
theta1Grad = hiddenDerivativeNoBias * inputLayerWithBias;
theta1Grad /= numTrainingExamples;
theta1Grad += (lambda/numTrainingExamples) * [zeros(rows(theta1NoBias), 1) theta1NoBias];
%show_matrix("theta1Grad", theta1Grad);

% theta2Grad is 2 x 4
theta2Grad = outputDerivative * hiddenLayerWithBias';
theta2Grad /= numTrainingExamples;
theta2Grad += (lambda/numTrainingExamples) * [zeros(rows(theta2NoBias), 1) theta2NoBias];
%show_matrix("theta2Grad", theta2Grad);
% =========================================================================

% Unroll gradients
grad = [theta1Grad(:) ; theta2Grad(:)];
%show_matrix("grad", grad);

%disp("==============================");
end
