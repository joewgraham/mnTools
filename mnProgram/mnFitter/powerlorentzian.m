function lorentzian = powerlorentzian(x,y,parameter)

residuals = y - (parameter(1)* (x .^ parameter(2)));
%lorentzian = sum(log(1+(abs(residuals)).^2));

lorentzian = sum(abs(residuals));

