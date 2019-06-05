function rmse = exponentialoffsetrmseweighted(x,y,weights,parameter)
rmse = sqrt(sum(weights.*((y-(parameter(3)+parameter(1)*exp(x*parameter(2)))).^2))/length(x));