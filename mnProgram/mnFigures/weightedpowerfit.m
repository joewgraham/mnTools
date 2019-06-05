function [a,b,rmse]= weightedpowerfit(x,y,weights)

x = x(find(isfinite(y)));
y = y(find(isfinite(y)));
weights = weights(find(isfinite(y)));

x2 = x(find(y>0));
y2 = y(find(y>0));

n = length(x2);

power1 = 0;
power2 = 0;
power3 = 0;
power4 = 0;
sumlny = 0;

for i=1:n
    power1 = power1 + (log(x2(i))*log(y2(i)));
    power2 = power2 + log(x2(i));
    power3 = power3 + log(y2(i));
    power4 = power4 + (log(x2(i))^2);
    sumlny = sumlny + log(y2(i));
end

b = ((length(x2)*power1)-(power2*power3))/((length(x2)*power4)-(power2^2));
a = exp((power3-(b*power2))/length(x2));

inputparameters = [a b];

[parameters,residuals,jacobian,sigma,mse] = nlinfit(x,y,@powerfunction,inputparameters);

parameters
figure;
errorbar(x,y,weights*(range(y)/(10*max(weights))),'ok');
%plot(x,y,'ok');
hold on;
plot(x,parameters(1)*x.^parameters(2));

yw = sqrt(weights).*y;
weightedpowerfunction = @(inputparameters,x) sqrt(weights).*powerfunction(inputparameters,x);
[weightedparameters,weightedresiduals,weightedjacobian,weightedsigma,weightedmse] = nlinfit(x,yw,weightedpowerfunction,inputparameters,statset('Robust','on'));

a = weightedparameters(1);
b = weightedparameters(2);
rmse = sqrt(weightedmse);

figure;
errorbar(x,y,weights*(range(y)/(10*max(weights))),'ok');
%plot(x,y,'ok');
hold on;
plot(x,a*x.^b);