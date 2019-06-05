function rmse = exponentialrmse(x,y,parameter)
rmse = sqrt(sum((log(y)-log(parameter(1)*exp(x*parameter(2)))).^2)/length(x));



