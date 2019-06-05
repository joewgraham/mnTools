function [parameter,rmse]=powerfitterconstant(x,y,weights)

x = x(isfinite(y));
y = y(isfinite(y));
positivex = x(y>0);
positivey = y(y>0);
negativex = x(y<0);
negativey = y(y<0);
if nargin > 2
	weights = weights(isfinite(y));
	weights = weights / sum(weights);
end

power1 = 0;
power2 = 0;
power3 = 0;
power4 = 0;
sumlny = 0;

if length(positivey) >= length (negativey)

    for i=1:length(positivex)
        power1 = power1 + (log(positivex(i))*log(positivey(i)));
        power2 = power2 + log(positivex(i));
        power3 = power3 + log(positivey(i));
        power4 = power4 + (log(positivex(i))^2);
        sumlny = sumlny + log(positivey(i));
    end

    parameter2 = ((length(positivex)*power1)-(power2*power3))/((length(positivex)*power4)-(power2^2));
    parameter1 = exp((power3-(parameter2*power2))/length(positivex));
	parameter3 = 0;
    parameter = [parameter1 parameter2 parameter3];

else

    for i=1:length(negativex)
        power1 = power1 + (log(negativex(i))*log(abs(negativey(i))));
        power2 = power2 + log(negativex(i));
        power3 = power3 + log(abs(negativey(i)));
        power4 = power4 + (log(negativex(i))^2);
        sumlny = sumlny + log(abs(negativey(i)));
    end

    parameter2 = ((length(negativex)*power1)-(power2*power3))/((length(negativex)*power4)-(power2^2));
    parameter1 = -(exp((power3-(parameter2*power2))/length(negativex)));
	parameter3 = 0;
    parameter = [parameter1 parameter2 parameter3];
    
end

% Comment following line in order to exclude zeroes from analysis
parameter = fminsearch(@(parameter) powerrmseconstant(x,y,parameter) , parameter , optimset('Display','off'));

rmse = powerrmseconstant(x,y,parameter);
if nargin > 2
	parameter = fminsearch(@(parameter) powerrmseweightedconstant(x,y,weights,parameter) , parameter);
	rmse = [powerrmseconstant(x,y,parameter) powerrmseweightedconstant(x,y,weights,parameter)];
end
