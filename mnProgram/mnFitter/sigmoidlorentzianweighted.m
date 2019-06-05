function lorentzian = sigmoidlorentzianweighted(x,y,weights,parameter)

residuals = y - (parameter(1)-parameter(2).*log((parameter(3)./(x-parameter(4)))-1));
weightedresiduals = weights.*residuals;
%lorentzian = sum(log(1+(abs(weightedresiduals)).^2));

lorentzian = sum(abs(weightedresiduals));