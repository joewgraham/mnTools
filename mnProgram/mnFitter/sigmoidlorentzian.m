function lorentzian = sigmoidlorentzian(x,y,parameter)

residuals = y - (parameter(1)-parameter(2).*log((parameter(3)./(x-parameter(4)))-1));
%lorentzian = sum(log(1+(abs(residuals)).^2));

lorentzian = sum(abs(residuals));

