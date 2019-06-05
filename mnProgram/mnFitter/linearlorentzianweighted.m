function lorentzian = linearlorentzianweighted(x,y,weights,parameter)

residuals = y - ((parameter(1)*x) + parameter(2));
weightedresiduals = weights.*residuals;
%lorentzian = sum(log(1+(abs(weightedresiduals)).^2));

lorentzian = sum(abs(weightedresiduals));