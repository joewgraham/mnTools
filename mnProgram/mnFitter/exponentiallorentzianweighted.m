function lorentzian = exponentiallorentzianweighted(x,y,weights,parameter)

residuals = y - (parameter(1)* exp(x * parameter(2)));
weightedresiduals = weights.*residuals;
%lorentzian = sum(log(1+(abs(weightedresiduals)).^2));

lorentzian = sum(abs(weightedresiduals));

