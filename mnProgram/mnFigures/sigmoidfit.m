function [minasym,maxasym,halfmax,steepness,fitx,fity,r2] = sigmoidfit(x,y,xlim)

x = x(find(isfinite(y)));
y = y(find(isfinite(y)));

origx = x;
origy = y;

%insertion
%x = x(find(y~=0));
%y = y(find(y~=0));
%insertion


minasym   = min(x)/20;
maxasym   = max(x)+(0.01*max(x));
halfmax   = (range(y)/2)+min(y);
steepness = range(y)/range(x);

initialvalues = [minasym maxasym halfmax steepness];
%keyboard;
parameters = lsqcurvefit(@sigmoidfunction, initialvalues, x, y);

minasym   = parameters(1);
maxasym   = parameters(2);
halfmax   = parameters(3);
steepness = parameters(4);

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
    sserr = sserr + (origy(i) - (halfmax - steepness * log( (maxasym / (origx(i) - minasym)) - 1 )))^2;
    sstot = sstot + (origy(i) - mean(origy))^2;
end
r2=1-(sserr/sstot);


fitx = (xlim(1):(xlim(2)-xlim(1))/100:xlim(2));
fity = halfmax - steepness .* log( (maxasym ./ (fitx - minasym)) - 1 );



