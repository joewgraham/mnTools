function samplestatistics(analysis)

diameter = analysis.diameter.diameter;


totalmean1 = mean(analysis.bifurcation.cable.rallratio1.values);

for i = 1:length(analysis.diameter.rallratio)
	
	n = length(analysis.diameter.rallratio(i).values);
	stdvsum = 0;
	skewsum = 0;
	kurtsum = 0;
	
	for j = 1:n
		
		stdvsum = stdvsum + (analysis.diameter.rallratio1(i).values(j) - totalmean1)^2;
		skewsum = skewsum + (analysis.diameter.rallratio1(i).values(j) - totalmean1)^3;
		kurtsum = kurtsum + (analysis.diameter.rallratio1(i).values(j) - totalmean1)^4;
		
	end
	
	variance(i) = (1/n)*stdvsum;
	samplestdv1(i) = variance(i)^0.5;
	sampleskew1(i) = ((1/n)*skewsum)/(variance(i)^1.5);
	samplekurt1(i) = ((1/n)*kurtsum)/(variance(i)^2.0);
	weight1(i) = length(analysis.diameter.rallratio1(i).values);
end	

figure;
plot(analysis.diameter.diameter,samplestdv1,'o');
title('1.0 Sample Standard Deviation');

figure;
plot(analysis.diameter.diameter,sampleskew1,'o');
title('1.0 Sample Skewness');

figure;
plot(analysis.diameter.diameter,samplekurt1,'o');
title('1.0 Sample Kurtosis');









totalmean15 = mean(analysis.bifurcation.cable.rallratio.values);

for i = 1:length(analysis.diameter.rallratio)
	
	n = length(analysis.diameter.rallratio(i).values);
	stdvsum = 0;
	skewsum = 0;
	kurtsum = 0;
	
	for j = 1:n
		
		stdvsum = stdvsum + (analysis.diameter.rallratio(i).values(j) - totalmean15)^2;
		skewsum = skewsum + (analysis.diameter.rallratio(i).values(j) - totalmean15)^3;
		kurtsum = kurtsum + (analysis.diameter.rallratio(i).values(j) - totalmean15)^4;
		
	end
	
	variance(i) = (1/n)*stdvsum;
	samplestdv15(i) = variance(i)^0.5;
	sampleskew15(i) = ((1/n)*skewsum)/(variance(i)^1.5);
	samplekurt15(i) = ((1/n)*kurtsum)/(variance(i)^2.0);
	weight15(i) = length(analysis.diameter.rallratio(i).values);
	
end	

figure;
plot(analysis.diameter.diameter,samplestdv15,'o');
title('1.5 Sample Standard Deviation');

figure;
plot(analysis.diameter.diameter,sampleskew15,'o');
title('1.5 Sample Skewness');

figure;
plot(analysis.diameter.diameter,samplekurt15,'o');
title('1.5 Sample Kurtosis');









totalmean2 = mean(analysis.bifurcation.cable.rallratio2.values);

for i = 1:length(analysis.diameter.rallratio2)
	
	n = length(analysis.diameter.rallratio2(i).values);
	stdvsum = 0;
	skewsum = 0;
	kurtsum = 0;
	
	for j = 1:n
		
		stdvsum = stdvsum + (analysis.diameter.rallratio2(i).values(j) - totalmean2)^2;
		skewsum = skewsum + (analysis.diameter.rallratio2(i).values(j) - totalmean2)^3;
		kurtsum = kurtsum + (analysis.diameter.rallratio2(i).values(j) - totalmean2)^4;
		
	end
	
	variance(i) = (1/n)*stdvsum;
	samplestdv2(i) = variance(i)^0.5;
	sampleskew2(i) = ((1/n)*skewsum)/(variance(i)^1.5);
	samplekurt2(i) = ((1/n)*kurtsum)/(variance(i)^2.0);
	weight2(i) = length(analysis.diameter.rallratio2(i).values);
	
end	

figure;
plot(analysis.diameter.diameter,samplestdv2,'o');
title('2.0 Sample Standard Deviation');

figure;
plot(analysis.diameter.diameter,sampleskew2,'o');
title('2.0 Sample Skewness');

figure;
plot(analysis.diameter.diameter,samplekurt2,'o');
title('2.0 Sample Kurtosis');









totalmean3 = mean(analysis.bifurcation.cable.rallratio3.values);

for i = 1:length(analysis.diameter.rallratio3)
	
	n = length(analysis.diameter.rallratio3(i).values);
	stdvsum = 0;
	skewsum = 0;
	kurtsum = 0;
	
	for j = 1:n
		
		stdvsum = stdvsum + (analysis.diameter.rallratio3(i).values(j) - totalmean3)^2;
		skewsum = skewsum + (analysis.diameter.rallratio3(i).values(j) - totalmean3)^3;
		kurtsum = kurtsum + (analysis.diameter.rallratio3(i).values(j) - totalmean3)^4;
		
	end
	
	variance(i) = (1/n)*stdvsum;
	samplestdv3(i) = variance(i)^0.5;
	sampleskew3(i) = ((1/n)*skewsum)/(variance(i)^1.5);
	samplekurt3(i) = ((1/n)*kurtsum)/(variance(i)^2.0);
	weight3(i) = length(analysis.diameter.rallratio3(i).values);
end	

figure;
plot(analysis.diameter.diameter,samplestdv3,'o');
title('3.0 Sample Standard Deviation');

figure;
plot(analysis.diameter.diameter,sampleskew3,'o');
title('3.0 Sample Skewness');

figure;
plot(analysis.diameter.diameter,samplekurt3,'o');
title('3.0 Sample Kurtosis');


keyboard