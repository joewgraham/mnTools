function rmse = poweroffsetrmse(x,y,parameter)
rmse = sqrt(sum((y-(parameter(3)+parameter(1)*(x.^parameter(2)))).^2)/length(x));



