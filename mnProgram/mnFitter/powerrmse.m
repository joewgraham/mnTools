function rmse = powerrmse(x,y,parameter)
rmse = sqrt(sum((y-(parameter(1)*(x.^parameter(2)))).^2)/length(x));



