function rallratioplotter(analysis)

[diameter,index] = sort([analysis.bifurcation.cable.distaldiameter.values]);
rallratio1 = [analysis.bifurcation.cable.rallratio1.values];
rallratio1 = rallratio1(index);


% Mean
dist(1).type = 'exponential';
dist(1).parameter(1) = 5.914e-1;
dist(1).parameter(2) = -9.906e-1;
dist(1).parameter(3) = 1.279e0;
dist(1).parameter(4) = NaN;
% Fyffe:
% dist(1).type = 'exponential';
% dist(1).parameter(1) = 3.676e0;
% dist(1).parameter(2) = -1.200e0;
% dist(1).parameter(3) = 1.064e0;
% dist(1).parameter(4) = NaN;

% Standard Deviation
dist(2).type = 'exponential';
dist(2).parameter(1) = 7.135e-1;
dist(2).parameter(2) = -1.218e0;
dist(2).parameter(3) = 2.224e-1;
dist(2).parameter(4) = NaN;
% Fyffe:
% dist(2).type = 'exponential';
% dist(2).parameter(1) = 3.084e0;
% dist(2).parameter(2) = -1.071e0;
% dist(2).parameter(3) = 2.329e-1;
% dist(2).parameter(4) = NaN;

% Skewness
dist(3).type = 'exponential';
dist(3).parameter(1) = 7.903e0;
dist(3).parameter(2) = -1.307e0;
dist(3).parameter(3) = -1.218e-2;
dist(3).parameter(4) = NaN;
% Fyffe:
% dist(3).type = 'exponential';
% dist(3).parameter(1) = 5.133e0;
% dist(3).parameter(2) = -1.353e0;
% dist(3).parameter(3) = 3.673e-1;
% dist(3).parameter(4) = NaN;

% Kurtosis
dist(4).type = 'exponential';
dist(4).parameter(1) = 1.886e1;
dist(4).parameter(2) = -1.057e0;
dist(4).parameter(3) = 3.382e0;
dist(4).parameter(4) = NaN;
% Fyffe:
% dist(4).type = 'exponential';
% dist(4).parameter(1) = 2.280e1;
% dist(4).parameter(2) = -1.825e0;
% dist(4).parameter(3) = 2.997e0;
% dist(4).parameter(4) = NaN;


for i = 1:length(diameter)

	for j = 1:length(dist)

		if strcmp(dist(j).type,'linear') == 1
			dist(j).value = dist(j).parameter(1) * diameter(i) + dist(j).parameter(2);
		elseif strcmp(dist(j).type,'exponential') == 1
			dist(j).value = dist(j).parameter(3) + dist(j).parameter(1) * exp(diameter(i)*dist(j).parameter(2));
		elseif strcmp(dist(j).type,'power') == 1
			dist(j).value = dist(j).parameter(3) + dist(j).parameter(1) * (diameter(i) ^ dist(j).parameter(2));
		elseif strcmp(dist(j).type,'sigmoid') == 1
			dist(j).value = dist(j).parameter(1) - dist(j).parameter(2) * log((dist(j).parameter(3)/(diameter(i)-dist(j).parameter(4)))-1);
		else
			disp('Error in ''rallratioplotter2.m''.');
		end

	end
	
		
	rallratio1sample(i) = pearsrnd(dist(1).value,dist(2).value,dist(3).value,dist(4).value);
	
	if isnan(rallratio1sample(i))
		disp('Error with sampling.');
		disp(sprintf('  Diameter     : %f',diameter(i)));
		disp(sprintf('  Actual Rall Ratio : %f',rallratio1(i)));
		disp(sprintf('      Mean: %f',dist(1).value));
		disp(sprintf('      StDv: %f',dist(2).value));
		disp(sprintf('      Skew: %f',dist(3).value));
		disp(sprintf('      Kurt: %f',dist(4).value));
		disp(sprintf('  Normal Sample: %f',dist(1).value+dist(2).value*randn));
		disp(sprintf('  Normal Sample: %f',dist(1).value+dist(2).value*randn));
		disp(sprintf('  Normal Sample: %f',dist(1).value+dist(2).value*randn));
		disp(sprintf('  Normal Sample: %f',dist(1).value+dist(2).value*randn));
		disp(' ');
	end	
		
	
end

figure;
plot(diameter,rallratio1,'gs','MarkerSize',5);
hold on;
plot(diameter,rallratio1sample,'b.','MarkerSize',5);

