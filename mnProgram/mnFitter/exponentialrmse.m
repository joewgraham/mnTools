function rmse = exponentialrmse(x,y,parameter)
rmse = sqrt(sum((y-(parameter(1)*exp(x*parameter(2)))).^2)/length(x));



