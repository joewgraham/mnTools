function rmse = exponentialoffsetrmse(x,y,parameter)
rmse = sqrt(sum((y-(parameter(3)+parameter(1)*exp(x*parameter(2)))).^2)/length(x));



