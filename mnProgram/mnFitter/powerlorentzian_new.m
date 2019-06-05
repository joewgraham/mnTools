function lorentzian = powerlorentzian(x,y,parameter)

residuals = log(y) - log(parameter(1)* (log(x) .^ parameter(2)));
lorentzian = sum(log(1+(abs(residuals)).^2));

