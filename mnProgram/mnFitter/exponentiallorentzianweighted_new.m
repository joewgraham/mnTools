function lorentzian = exponentiallorentzianweighted(x,y,weights,parameter)

residuals = log(y) - log(parameter(1)* exp(x * parameter(2)));
weightedresiduals = weights.*residuals;
lorentzian = sum(log(1+(abs(weightedresiduals)).^2));

