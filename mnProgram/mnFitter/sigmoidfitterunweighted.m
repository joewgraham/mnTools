function [parameter,rmse] = sigmoidfitterunweighted(x,y,weights)
% parameter1: halfmax
% parameter2: steepness
% parameter3: maxasym
% parameter4: minasym
% y = parameter1-(parameter2.*log((parameter3./(x-parameter4))-1);
% y = halfmax   -(steepness .*log((maxasym   ./(x-minasym   ))-1);

x = x(isfinite(y));
y = y(isfinite(y));
if nargin > 2
	weights = weights(isfinite(y));
    weights = weights / sum(weights);
end

%parameter1 = (range(y)/2)+min(y);
parameter1 = median(y);
parameter2 = range(y)/range(x);
parameter3 = max(x)+(0.01*max(x));
parameter4 = min(x)/20;

lowerbound = [-Inf -Inf max(x)+1 -Inf];
upperbound = [Inf Inf Inf min(x)];

% figure;
% plot(x,y,'o');
% hold on;
% plot(x,(parameter1-(parameter2.*log((parameter3./(x-parameter4))-1))),'b');

parameter = [parameter1 parameter2 parameter3 parameter4];
parameter = lsqcurvefit(@sigmoid, parameter, x, y, lowerbound, upperbound , optimset('Display','off'));
rmse = sigmoidrmse(x,y,parameter);

% plot(x,(parameter1-(parameter2.*log((parameter3./(x-parameter4))-1))),'g');

parameter = fminsearchbnd(@(parameter) sigmoidrmse(x,y,parameter) , parameter , lowerbound, upperbound , optimset('Display','off'));
rmse = sigmoidrmse(x,y,parameter);

% plot(x,(parameter1-(parameter2.*log((parameter3./(x-parameter4))-1))),'r');

if nargin > 2
	rmse = [sigmoidrmse(x,y,parameter) sigmoidrmseweighted(x,y,weights,parameter)];
end