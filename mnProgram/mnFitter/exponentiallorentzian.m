function lorentzian = exponentiallorentzian(x,y,parameter)

residuals = y - (parameter(1)* exp(x * parameter(2)));
%lorentzian = sum(log(1+(abs(residuals)).^2));
lorentzian = sum(abs(residuals));