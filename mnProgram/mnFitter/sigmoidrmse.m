function rmse = sigmoidrmse(x,y,parameter)
rmse = sqrt(sum((y-(parameter(1)-parameter(2).*log((parameter(3)./(x-parameter(4)))-1))).^2)/length(x));