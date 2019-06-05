function lorentzian = exponentiallorentzian(x,y,parameter)

residuals = log(y) - log(parameter(1)* exp(x * parameter(2)));
lorentzian = sum(log(1+(abs(residuals)).^2));

