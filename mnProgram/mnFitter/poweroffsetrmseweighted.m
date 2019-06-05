function rmse = poweroffsetrmseweighted(x,y,weights,parameter)
rmse = sqrt(sum(weights.*(y-(parameter(3)+parameter(1)*(x.^parameter(2)))).^2)/length(x));