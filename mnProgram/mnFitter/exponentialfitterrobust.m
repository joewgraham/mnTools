function [parameter,rmse]=exponentialfitterrobust(x,y,varargin)

if nargin > 2
    weights = varargin{1};
    weights = weights(isfinite(y));
    weights = weights / sum(weights);
end
x = x(isfinite(y));
y = y(isfinite(y));
positivex = x(y>0);
positivey = y(y>0);
negativex = x(y<0);
negativey = y(y<0);

exp1 = 0;
exp2 = 0;
exp3 = 0;
exp4 = 0;
exp5 = 0;
sumlny = 0;

if length(positivey) >= length (negativey)

    for i=1:length(positivex)
        exp1 = exp1 + (positivex(i)^2)*positivey(i);
        exp2 = exp2 + positivey(i)*log(positivey(i));
        exp3 = exp3 + positivex(i)*positivey(i);
        exp4 = exp4 + positivex(i)*positivey(i)*log(positivey(i));
        exp5 = exp5 + positivey(i);
        sumlny = sumlny + log(positivey(i));
    end

    parameter1 = exp(((exp1*exp2)-(exp3*exp4))/((exp5*exp1)-(exp3^2)));
    parameter2 = ((exp5*exp4)-(exp3*exp2))/((exp5*exp1)-(exp3^2));
    parameter = [parameter1 parameter2];

else

    for i=1:length(negativex)
        exp1 = exp1 + (negativex(i)^2)*abs(negativey(i));
        exp2 = exp2 + abs(negativey(i))*log(abs(negativey(i)));
        exp3 = exp3 + negativex(i)*abs(negativey(i));
        exp4 = exp4 + negativex(i)*abs(negativey(i))*log(abs(negativey(i)));
        exp5 = exp5 + abs(negativey(i));
        sumlny = sumlny + log(abs(negativey(i)));
    end

    parameter1 = -(exp(((exp1*exp2)-(exp3*exp4))/((exp5*exp1)-(exp3^2))));
    parameter2 = ((exp5*exp4)-(exp3*exp2))/((exp5*exp1)-(exp3^2));
    parameter = [parameter1 parameter2];

end


parameter = fminsearch(@(parameter) exponentiallorentzian(x,y,parameter) , parameter , optimset('Display','off'));
rmse = exponentialrmse(x,y,parameter);
if nargin > 2
	rmse = [exponentialrmse(x,y,parameter) exponentialrmseweighted(x,y,weights,parameter)];
end


