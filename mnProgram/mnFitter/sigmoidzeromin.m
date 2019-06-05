function output = sigmoidzeromin(parameters,input)
output = parameters(1) - parameters(2).*log((parameters(3)./(input))-1);