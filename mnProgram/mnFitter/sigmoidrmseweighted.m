function rmse = sigmoidrmseweighted(x,y,weights,parameter)
rmse = sqrt(sum(weights.*(y-(parameter(1)-parameter(2).*log((parameter(3)./(x-parameter(4)))-1))).^2)/length(x));