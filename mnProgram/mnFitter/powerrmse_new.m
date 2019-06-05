function rmse = powerrmse(x,y,parameter)
rmse = sqrt(sum((log(y)-log(parameter(1)*(log(x).^parameter(2)))).^2)/length(x));



