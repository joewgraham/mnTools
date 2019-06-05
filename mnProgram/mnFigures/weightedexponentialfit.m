function [a,b,rmse]= weightedexponentialfit(x,y,weights)

x = x(find(isfinite(y)));
y = y(find(isfinite(y)));
weights = weights(find(isfinite(y)));

x2 = x(find(y>0));
y2 = y(find(y>0));

n = length(x2);

exp1 = 0;
exp2 = 0;
exp3 = 0;
exp4 = 0;
exp5 = 0;
sumlny = 0;

for i=1:n
    exp1 = exp1 + (x2(i)^2)*y2(i);
    exp2 = exp2 + y2(i)*log(y2(i));
    exp3 = exp3 + x2(i)*y2(i);
    exp4 = exp4 + x2(i)*y2(i)*log(y2(i));
    exp5 = exp5 + y2(i);
    sumlny = sumlny + log(y2(i));   
end

a = exp(((exp1*exp2)-(exp3*exp4))/((exp5*exp1)-(exp3^2)));
b = ((exp5*exp4)-(exp3*exp2))/((exp5*exp1)-(exp3^2));

inputparameters = [a b];

figure;
errorbar(x,y,weights*(range(y)/(10*max(weights))),'ok');
%plot(x,y,'ok');
hold on;
plot(x,a*exp(x*b));

[parameters,residuals,jacobian,sigma,mse] = nlinfit(x,y,@exponentialfunction,inputparameters);

yw = sqrt(weights).*y;
weightedexponentialfunction = @(inputparameters,x) sqrt(weights).*exponentialfunction(inputparameters,x);
[weightedparameters,weightedresiduals,weightedjacobian,weightedsigma,weightedmse] = nlinfit(x,yw,weightedexponentialfunction,inputparameters,statset('Robust','on'));

a = weightedparameters(1);
b = weightedparameters(2);
rmse = sqrt(weightedmse);

figure;
errorbar(x,y,weights*(range(y)/(10*max(weights))),'ok');
%plot(x,y,'ok');
hold on;
plot(x,a*exp(x*b));