function [parameter,rmse]=linearfitter(x,y)

x = x(isfinite(y));
y = y(isfinite(y));

sumx  = 0;
sumy  = 0;
sumxy = 0;
sumx2 = 0;
sumy2 = 0;

for i=1:length(x)
    sumx = sumx + x(i);
    sumy = sumy + y(i);
    sumxy = sumxy + x(i)*y(i);
    sumx2 = sumx2 + x(i)^2;
    sumy2 = sumy2 + y(i)^2;
end

parameter1 = ((length(x)*sumxy)-(sumx*sumy))/((length(x)*sumx2)-(sumx^2));
parameter2 = (sumy - parameter1*sumx)/length(x);
parameter = [parameter1 parameter2];
rmse = linearrmse(x,y,parameter);