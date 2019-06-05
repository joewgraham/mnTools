function [parameter1,parameter2,parameter3,rmse] = sigmoidfitterzeromin(x,y)
% parameter1: halfmax
% parameter2: steepness
% parameter3: maxasym
% y = parameter1-(parameter2.*log((parameter3./(x))-1);
% y = halfmax   -(steepness .*log((maxasym   ./(x))-1);

x = x(isfinite(y));
y = y(isfinite(y));

%parameter1 = (range(y)/2)+min(y);
parameter1 = median(y);
parameter2 = range(y)/range(x);
parameter3 = max(x)+(0.01*max(x));

lowerbound = [-Inf -Inf max(x)+1];
upperbound = [Inf Inf Inf];

% figure;
% plot(x,y,'o');
% hold on;
% plot(x,(parameter1-(parameter2.*log((parameter3./(x))-1))),'b');

parameter = [parameter1 parameter2 parameter3];
parameter = lsqcurvefit(@sigmoidzeromin, parameter, x, y, lowerbound, upperbound , optimset('Display','off'));

parameter1 = parameter(1);
parameter2 = parameter(2);
parameter3 = parameter(3);
rmse = sigmoidrmsezeromin(x,y,parameter);

% plot(x,(parameter1-(parameter2.*log((parameter3./(x))-1))),'g');

parameter = fminsearchbnd(@(parameter) sigmoidrmsezeromin(x,y,parameter) , parameter, lowerbound, upperbound , optimset('Display','off'));

parameter1 = parameter(1);
parameter2 = parameter(2);
parameter3 = parameter(3);
rmse = sigmoidrmsezeromin(x,y,parameter);

% plot(x,(parameter1-(parameter2.*log((parameter3./(x))-1))),'r');
