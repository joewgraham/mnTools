function [maxasym,halfmax,steepness,fitx,fity,r2] = sigmoidfitzeromin(x,y,xlim)

x = x(find(isfinite(y)));
y = y(find(isfinite(y)));

origx = x;
origy = y;

%insertion
%x = x(find(y~=0));
%y = y(find(y~=0));
%insertion


maxasym   = max(x)+(0.01*max(x));
halfmax   = (range(y)/2)+min(y);
steepness = range(y)/range(x);

initialvalues = [maxasym halfmax steepness];

parameters = lsqcurvefit(@sigmoidfunctionzeromin, initialvalues, x, y);

maxasym   = parameters(1);
halfmax   = parameters(2);
steepness = parameters(3);

% sserr = 0;
% sstot = 0;
% for i=1:length(x)
%     sserr = sserr + (y(i) - (halfmax - steepness * log( (maxasym / (x(i) - minasym)) - 1 )))^2;
%     sstot = sstot + (y(i) - mean(y))^2;
% end
% r2=1-(sserr/sstot);

sserr = 0;
sstot = 0;
for i=1:length(x)
    sserr = sserr + (origy(i) - (halfmax - steepness * log( (maxasym / origx(i)) - 1 )))^2;
    sstot = sstot + (origy(i) - mean(origy))^2;
end
r2=1-(sserr/sstot);


fitx = (xlim(1):(xlim(2)-xlim(1))/100:xlim(2));
fity = halfmax - steepness .* log( (maxasym ./ fitx) - 1 );



