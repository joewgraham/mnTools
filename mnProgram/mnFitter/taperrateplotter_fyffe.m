function taperrateplotter(data)

[bifdiameter,index] = sort([data.population.bifurcation.piece.proximaldiameter]);
biftaperrate = [data.population.bifurcation.piece.taperrate];
biftaperrate = biftaperrate(index);


% Mean
dist(1).type = 'exponential';
dist(1).parameter(1) = -5.647e-2;
dist(1).parameter(2) = -1.925e-1;
dist(1).parameter(3) = 2.738e-2;
dist(1).parameter(4) = NaN;
% dist(1).type = 'sigmoid';
% dist(1).parameter(1) = 4.907e-2;
% dist(1).parameter(2) = 1.692e-2;
% dist(1).parameter(3) = 7.276e1;
% dist(1).parameter(4) = -1.043e-1;

% Standard Deviation
dist(2).type = 'power';
dist(2).parameter(1) = 2.946e-2;
dist(2).parameter(2) = 4.906e-1;
dist(2).parameter(3) = 6.320e-2;
dist(2).parameter(4) = NaN;
% dist(2).type = 'power';
% dist(2).parameter(1) = 8.894e-2;
% dist(2).parameter(2) = 2.299e-1;
% dist(2).parameter(3) = NaN;
% dist(2).parameter(4) = NaN;

% Skewness
dist(3).type = 'exponential';
dist(3).parameter(1) = -8.770e0;
dist(3).parameter(2) = -7.155e-1;
dist(3).parameter(3) = 3.457e-2;
dist(3).parameter(4) = NaN;
% dist(3).type = 'sigmoid';
% dist(3).parameter(1) = 1.159e1;
% dist(3).parameter(2) = 1.696e0;
% dist(3).parameter(3) = 5.437e3;
% dist(3).parameter(4) = 2.126e-1;
% dist(3).type = 'exponential';
% dist(3).parameter(1) = -8.201e0;
% dist(3).parameter(2) = -7.105e-1;
% dist(3).parameter(3) = NaN;
% dist(3).parameter(4) = NaN;

% Kurtosis
dist(4).type = 'exponential';
dist(4).parameter(1) = 3.652e1;
dist(4).parameter(2) = -4.723e-1;
dist(4).parameter(3) = 9.475e0;
dist(4).parameter(4) = NaN;
% dist(4).type = 'exponential';
% dist(4).parameter(1) = 3.102e1;
% dist(4).parameter(2) = -1.651e-1;
% dist(4).parameter(3) = NaN;
% dist(4).parameter(4) = NaN;
% dist(4).type = 'power';
% dist(4).parameter(1) = 2.820e1;
% dist(4).parameter(2) = -4.205e-1;
% dist(4).parameter(3) = NaN;
% dist(4).parameter(4) = NaN;


for i = 1:length(bifdiameter)

	for j = 1:length(dist)

		if strcmp(dist(j).type,'linear') == 1
			dist(j).value = dist(j).parameter(1) * bifdiameter(i) + dist(j).parameter(2);
		elseif strcmp(dist(j).type,'exponential') == 1
			dist(j).value = dist(j).parameter(3) + dist(j).parameter(1) * exp(bifdiameter(i)*dist(j).parameter(2));
		elseif strcmp(dist(j).type,'power') == 1
			dist(j).value = dist(j).parameter(3) + dist(j).parameter(1) * (bifdiameter(i) ^ dist(j).parameter(2));
		elseif strcmp(dist(j).type,'sigmoid') == 1
			dist(j).value = dist(j).parameter(1) - dist(j).parameter(2) * log((dist(j).parameter(3)/(bifdiameter(i)-dist(j).parameter(4)))-1);
		else
			disp('Error in ''taperrateplotter.m''.');
		end

	end
	
	biftaperratesample(i) = pearsrnd(dist(1).value,dist(2).value,dist(3).value,dist(4).value);
	
	if isnan(biftaperratesample(i))
		disp('Error with bif sampling.');
		disp(sprintf('  Diameter     : %f',bifdiameter(i)));
		disp(sprintf('  Actual Taper : %f',biftaperrate(i)));
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
plot(bifdiameter,biftaperrate,'gs');
hold on;
plot(bifdiameter,biftaperratesample,'bo');







% Termination Taper Rate

[termdiameter,index] = sort([data.population.termination.piece.proximaldiameter]);
termtaperrate = [data.population.termination.piece.taperrate];
termtaperrate = termtaperrate(index);


% Mean
dist(1).type = 'exponential';
dist(1).parameter(1) = 4.349e-1;
dist(1).parameter(2) = 4.597e-2;
dist(1).parameter(3) = -4.627e-1;
dist(1).parameter(4) = NaN;
% dist(1).type = 'linear';
% dist(1).parameter(1) = 2.217e-2;
% dist(1).parameter(2) = -3.006e-2;
% dist(1).parameter(3) = NaN;
% dist(1).parameter(4) = NaN;

% Standard Deviation
dist(2).type = 'exponential';
dist(2).parameter(1) = 3.731e0;
dist(2).parameter(2) = 4.963e-3;
dist(2).parameter(3) = -3.679e0;
dist(2).parameter(4) = NaN;
% dist(2).type = 'power';
% dist(2).parameter(1) = 7.100e-2;
% dist(2).parameter(2) = 3.453e-1;
% dist(2).parameter(3) = NaN;
% dist(2).parameter(4) = NaN;

% Skewness
dist(3).type = 'exponential';
dist(3).parameter(1) = -8.284e0;
dist(3).parameter(2) = -1.457e0;
dist(3).parameter(3) = 9.111e-1;
dist(3).parameter(4) = NaN;
% dist(3).type = 'exponential';
% dist(3).parameter(1) = -1.045e1;
% dist(3).parameter(2) = -2.285e0;
% dist(3).parameter(3) = NaN;
% dist(3).parameter(4) = NaN;

% Kurtosis
dist(4).type = 'power';
dist(4).parameter(1) = 3.333e1;
dist(4).parameter(2) = -3.692e-1;
dist(4).parameter(3) = -1.533e1;
dist(4).parameter(4) = NaN;
% dist(4).type = 'power';
% dist(4).parameter(1) = 1.896e1;
% dist(4).parameter(2) = -6.326e-1;
% dist(4).parameter(3) = NaN;
% dist(4).parameter(4) = NaN;


for i = 1:length(termdiameter)

	for j = 1:length(dist)

		if strcmp(dist(j).type,'linear') == 1
			dist(j).value = dist(j).parameter(1) * termdiameter(i) + dist(j).parameter(2);
		elseif strcmp(dist(j).type,'exponential') == 1
			dist(j).value = dist(j).parameter(3) + dist(j).parameter(1) * exp(termdiameter(i)*dist(j).parameter(2));
		elseif strcmp(dist(j).type,'power') == 1
			dist(j).value = dist(j).parameter(3) + dist(j).parameter(1) * (termdiameter(i) ^ dist(j).parameter(2));
		elseif strcmp(dist(j).type,'sigmoid') == 1
			dist(j).value = dist(j).parameter(1) - dist(j).parameter(2) * log((dist(j).parameter(3)/(termdiameter(i)-dist(j).parameter(4)))-1);
		else
			disp('Error in ''taperrateplotter.m''.');
		end

	end
	
	termtaperratesample(i) = pearsrnd(dist(1).value,dist(2).value,dist(3).value,dist(4).value);
	
	if isnan(termtaperratesample(i))
		disp('Error with term sampling.');
		disp(sprintf('  Diameter     : %f',termdiameter(i)));
		disp(sprintf('  Actual Taper : %f',termtaperrate(i)));
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
plot(termdiameter,termtaperrate,'gs');
hold on;
plot(termdiameter,termtaperratesample,'bo');


