function [a,b,fitx,fity,r2]=exponentialfit(x,y,xlim)

x = x(find(isfinite(y)));
y = y(find(isfinite(y)));

origx = x;
origy = y;

%insertion
x = x(find(y>0));
y = y(find(y>0));
%insertion

n = length(x);

exp1 = 0;
exp2 = 0;
exp3 = 0;
exp4 = 0;
exp5 = 0;
sumlny = 0;

for i=1:n
    exp1 = exp1 + (x(i)^2)*y(i);
    exp2 = exp2 + y(i)*log(y(i));
    exp3 = exp3 + x(i)*y(i);
    exp4 = exp4 + x(i)*y(i)*log(y(i));
    exp5 = exp5 + y(i);
    sumlny = sumlny + log(y(i));   
end

a = exp(((exp1*exp2)-(exp3*exp4))/((exp5*exp1)-(exp3^2)));
b = ((exp5*exp4)-(exp3*exp2))/((exp5*exp1)-(exp3^2));

sserr = 0;
sstot = 0;

% for i=1:length(x)
%     sserr = sserr + (origy(i) - (a .*  exp(b.*origx(i)) ))^2;
%     sstot = sstot + (origy(i) - mean(origy))^2;
% end
% r2=1-(sserr/sstot);

for i=1:n
    sserr = sserr + (log(y(i)) - (log(a)+b*x(i)))^2;
    sstot = sstot + (log(y(i)) - (sumlny/n))^2;
end
r2=1-(sserr/sstot);

fitx=(xlim(1):(xlim(2)-xlim(1))/100:xlim(2));
fity=a.*exp(b.*fitx);

clear x;
clear y;
clear n;
clear exp1;
clear exp2;
clear exp3;
clear exp4;
clear exp5;
clear sumlny;
clear sserr;
clear sstot;