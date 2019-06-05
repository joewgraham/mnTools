function taperrateplotter(analysis)

[bifdiameter,index] = sort([analysis.bifurcation.piece.proximaldiameter]);
biftaperrate = [analysis.bifurcation.piece.taperrate];
biftaperrate = biftaperrate(index);


% Mean
dist(1).type = 'linear';
dist(1).parameter(1) = 4.297e-4;
dist(1).parameter(2) = -5.054e-4;
dist(1).parameter(3) = NaN;
dist(1).parameter(4) = NaN;

% Standard Deviation
dist(2).type = 'linear';
dist(2).parameter(1) = 4.999e-4;
dist(2).parameter(2) = 1.571e-3;
dist(2).parameter(3) = NaN;
dist(2).parameter(4) = NaN;

% Skewness
dist(3).type = 'linear';
dist(3).parameter(1) = 4.032e-1;
dist(3).parameter(2) = -1.226e0;
dist(3).parameter(3) = NaN;
dist(3).parameter(4) = NaN;

% Kurtosis
dist(4).type = 'linear';
dist(4).parameter(1) = -8.469e-1;
dist(4).parameter(2) = 1.622e1;
dist(4).parameter(3) = NaN;
dist(4).parameter(4) = NaN;


bifnancount = 0;

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
		bifnancount = bifnancount + 1;
		bifnandiameter(bifnancount) = bifdiameter(i);
		bifnantaperratesample(bifnancount) = dist(1).value+dist(2).value*randn;
	end	
		
	
end

figure;
plot(bifdiameter,biftaperrate,'gs','MarkerSize',5);
hold on;
plot(bifdiameter,biftaperratesample,'b.','MarkerSize',5);
plot(bifnandiameter,bifnantaperratesample,'r.','MarkerSize',5);






% Termination Taper Rate

[termdiameter,index] = sort([analysis.termination.piece.proximaldiameter]);
termtaperrate = [analysis.termination.piece.taperrate];
termtaperrate = termtaperrate(index);


% Mean
dist(1).type = 'linear';
dist(1).parameter(1) = 1.801e-3;
dist(1).parameter(2) = -1.086e-3;
dist(1).parameter(3) = NaN;
dist(1).parameter(4) = NaN;

% Standard Deviation
dist(2).type = 'linear';
dist(2).parameter(1) = -3.559e-5;
dist(2).parameter(2) = 1.379e-3;
dist(2).parameter(3) = NaN;
dist(2).parameter(4) = NaN;

% Skewness
dist(3).type = 'linear';
dist(3).parameter(1) = -5.935e-1;
dist(3).parameter(2) = 1.683e0;
dist(3).parameter(3) = NaN;
dist(3).parameter(4) = NaN;

% Kurtosis
dist(4).type = 'power';
dist(4).parameter(1) = 1.389e1;
dist(4).parameter(2) = -2.048e0;
dist(4).parameter(3) = 0;
dist(4).parameter(4) = NaN;

termnancount = 0;

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
		termnancount = termnancount + 1;
		termnandiameter(termnancount) = termdiameter(i);
		termnantaperratesample(termnancount) = dist(1).value+dist(2).value*randn;
	end	
		
	
end

figure;
plot(termdiameter,termtaperrate,'rs','MarkerSize',5);
hold on;
plot(termdiameter,termtaperratesample,'b.','MarkerSize',5);
plot(termnandiameter,termnantaperratesample,'g.','MarkerSize',5);


