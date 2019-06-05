function output = sigmoid(parameters,input)
output = parameters(1) - parameters(2).*log((parameters(3)./(input-parameters(4)))-1);