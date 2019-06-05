function [a,b,fitx,fity,r2]=powerfit(x,y,xlim)

x = x(find(isfinite(y)));
y = y(find(isfinite(y)));

origx = x;
origy = y;

%insertion
x = x(find(y>0));
y = y(find(y>0));
%insertion

n = length(x);

power1 = 0;
power2 = 0;
power3 = 0;
power4 = 0;
sumlny = 0;

for i=1:n
    power1 = power1 + (log(x(i))*log(y(i)));
    power2 = power2 + log(x(i));
    power3 = power3 + log(y(i));
    power4 = power4 + (log(x(i))^2);
    sumlny = sumlny + log(y(i));
end

b = ((length(x)*power1)-(power2*power3))/((length(x)*power4)-(power2^2));
a = exp((power3-(b*power2))/length(x));

sserr = 0;
sstot = 0;
for i=1:n
    sserr = sserr + (log(y(i))-(log(a)+b*log(x(i))))^2;
    sstot = sstot + (log(y(i))-(sumlny/n))^2;
end
r2=1-(sserr/sstot);

% sserr = 0;
% sstot = 0;
% for i=1:length(x)
%     sserr = sserr + (origy(i) - (a .* (origx(i) .^ b)))^2;
%     sstot = sstot + (origy(i) - mean(origy))^2;
% end
% r2=1-(sserr/sstot);

%fitx=(0:xlim(2)/100:xlim(2));
fitx=(xlim(1):(xlim(2)-xlim(1))/100:xlim(2));
fity=a*(fitx.^b);

clear x;
clear y;
clear n;
clear power1;
clear power2;
clear power3;
clear power4;
clear sumlny;
clear sserr;
clear sstot;