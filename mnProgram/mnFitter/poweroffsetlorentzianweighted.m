function lorentzian = poweroffsetlorentzianweighted(x,y,weights,parameter)

residuals = y - (parameter(3)+parameter(1)* (x .^ parameter(2)));
weightedresiduals = weights.*residuals;
lorentzian = sum(log(1+(abs(weightedresiduals)).^2));

