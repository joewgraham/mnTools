function taperrate = sigmoidfunction(parameters,diameter)
taperrate = parameters(3) - parameters(4).*log((parameters(2)./(diameter-parameters(1)))-1);