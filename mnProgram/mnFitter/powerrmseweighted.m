function rmse = powerrmseweighted(x,y,weights,parameter)
rmse = sqrt(sum(weights.*(y-(parameter(1)*(x.^parameter(2)))).^2)/length(x));