function rmse = powerrmseweighted(x,y,weights,parameter)
rmse = sqrt(sum(weights.*(log(y)-log(parameter(1)*(log(x).^parameter(2)))).^2)/length(x));