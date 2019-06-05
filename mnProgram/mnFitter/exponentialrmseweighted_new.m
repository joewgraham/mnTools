function rmse = exponentialrmseweighted(x,y,weights,parameter)
rmse = sqrt(sum(weights.*((log(y)-log(parameter(1)*exp(x*parameter(2)))).^2))/length(x));