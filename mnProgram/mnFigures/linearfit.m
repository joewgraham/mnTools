function [m,b,fitx,fity,r2]=linearfit(x,y,xlim)

warning('off', 'MATLAB:divideByZero');

%insertion
x = x(find(y~=0));
y = y(find(y~=0));
%insertion

x = x(find(isfinite(y)));
y = y(find(isfinite(y)));
n = length(x);




sumx=0;
sumy=0;
sumxy=0;
sumx2=0;
sumy2=0;


for i=1:n
    sumx = sumx + x(i);
    sumy = sumy + y(i);
    sumxy = sumxy + x(i)*y(i);
    sumx2 = sumx2 + x(i)^2;
    sumy2 = sumy2 + y(i)^2;
end

m = ((n*sumxy)-(sumx*sumy))/((n*sumx2)-(sumx^2));
b = (sumy - m*sumx)/n;
r2 = (((n*sumxy)-sumx*sumy)/((((n*sumx2)-sumx^2)^0.5)*(((n*sumy2)-sumy^2)^0.5)))^2;


fitx=(xlim(1):(xlim(2)-xlim(1))/100:xlim(2));
fity=m*fitx+b;

warning('on', 'MATLAB:divideByZero');