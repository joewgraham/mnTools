function lorentzian = exponentialoffsetlorentzianweighted(x,y,weights,parameter)

residuals = y - (parameter(3)+parameter(1)* exp(x * parameter(2)));
weightedresiduals = weights.*residuals;
lorentzian = sum(log(1+(abs(weightedresiduals)).^2));

