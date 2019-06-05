function taperrate = sigmoidfunctionzeromin(parameters,diameter)
taperrate = parameters(2) - parameters(3).*log((parameters(1)./diameter)-1);