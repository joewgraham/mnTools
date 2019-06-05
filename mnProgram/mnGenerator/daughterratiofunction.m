function daughterratio = daughterratiofunction(distaldiameter,distalpathlength,rallratio,input)

if strcmp(input.daughterratio.mode,'independent')
	distribution = input.daughterratio.distribution;        
	mean         = input.daughterratio.mean;
	sd           = input.daughterratio.sd;
	skew         = input.daughterratio.skew;
	kurt         = input.daughterratio.kurt;
	constant     = input.daughterratio.const;
	minimum      = input.daughterratio.min;
	maximum      = input.daughterratio.max;
	if strcmp(distribution,'gamma')
		gammaa = input.daughterratio.gamma.a;
		gammab = input.daughterratio.gamma.b;
	end
	
else
	distribution = 'pearson';
	constant = NaN;
	minimum  = input.daughterratio.min;
	maximum  = input.daughterratio.max;
	clear drfactor mean sd skew kurt;
	
	if strcmp(input.daughterratio.dependent.mean.type,'singlebin')
		eval(['drfactor = distal' input.daughterratio.dependent.mean.singlebin.dependent ';']);
		if strcmp('linear',input.daughterratio.dependent.mean.singlebin.fit)
			mean = input.daughterratio.dependent.mean.singlebin.parameter(1) * drfactor + input.daughterratio.dependent.mean.singlebin.parameter(2);
		elseif strcmp('exponential',input.daughterratio.dependent.mean.singlebin.fit)
			mean = input.daughterratio.dependent.mean.singlebin.parameter(1) * exp(input.daughterratio.dependent.mean.singlebin.parameter(2) * drfactor);
		elseif strcmp('power',input.daughterratio.dependent.mean.singlebin.fit)
			mean = input.daughterratio.dependent.mean.singlebin.parameter(1) * (drfactor ^ input.daughterratio.dependent.mean.singlebin.parameter(2));
		elseif strcmp('sigmoid',input.daughterratio.dependent.mean.singlebin.fit)
			mean = input.daughterratio.dependent.mean.singlebin.parameter(1) - input.daughterratio.dependent.mean.singlebin.parameter(2) * log((input.daughterratio.dependent.mean.singlebin.parameter(3) / (drfactor - input.daughterratio.dependent.mean.singlebin.parameter(4)))-1);
		else
			disp('Error in daughter ratio function.');
			keyboard
		end
	elseif strcmp(input.daughterratio.dependent.mean.type,'doublebin')
		eval(['firstbindata = distal' input.daughterratio.dependent.mean.doublebin.firstbin ';']);
		eval(['secondbindata = distal' input.daughterratio.dependent.mean.doublebin.secondbin ';']);
		clear parameterfit;
		parameterfit.firstbin.data = firstbindata;
		parameterfit.secondbin.data = secondbindata;
		parameterfit.firstbin.fit = input.daughterratio.dependent.mean.doublebin.firstfit;
		parameterfit.parameter(1).fit = input.daughterratio.dependent.mean.doublebin.parameter(1).fit;
		parameterfit.parameter(1).parameter = input.daughterratio.dependent.mean.doublebin.parameter(1).parameter(~isnan(input.daughterratio.dependent.mean.doublebin.parameter(1).parameter));
		parameterfit.parameter(2).fit = input.daughterratio.dependent.mean.doublebin.parameter(2).fit;
		parameterfit.parameter(2).parameter = input.daughterratio.dependent.mean.doublebin.parameter(2).parameter(~isnan(input.daughterratio.dependent.mean.doublebin.parameter(2).parameter));
		if strcmp(input.daughterratio.dependent.mean.doublebin.firstfit,'sigmoid')
			parameterfit.parameter(3).fit = input.daughterratio.dependent.mean.doublebin.parameter(3).fit;
			parameterfit.parameter(3).parameter = input.daughterratio.dependent.mean.doublebin.parameter(3).parameter(~isnan(input.daughterratio.dependent.mean.doublebin.parameter(3).parameter));
			parameterfit.parameter(4).fit = input.daughterratio.dependent.mean.doublebin.parameter(4).fit;
			parameterfit.parameter(4).parameter = input.daughterratio.dependent.mean.doublebin.parameter(4).parameter(~isnan(input.daughterratio.dependent.mean.doublebin.parameter(4).parameter));
		end
		mean = parameterfitter(parameterfit);
	end
	
	
	
	if strcmp(input.daughterratio.dependent.sd.type,'singlebin')
		eval(['drfactor = distal' input.daughterratio.dependent.sd.singlebin.dependent ';']);
		if strcmp('linear',input.daughterratio.dependent.sd.singlebin.fit)
			sd = input.daughterratio.dependent.sd.singlebin.parameter(1) * drfactor + input.daughterratio.dependent.sd.singlebin.parameter(2);
		elseif strcmp('exponential',input.daughterratio.dependent.sd.singlebin.fit)
			sd = input.daughterratio.dependent.sd.singlebin.parameter(1) * exp(input.daughterratio.dependent.sd.singlebin.parameter(2) * drfactor);
		elseif strcmp('power',input.daughterratio.dependent.sd.singlebin.fit)
			sd = input.daughterratio.dependent.sd.singlebin.parameter(1) * (drfactor ^ input.daughterratio.dependent.sd.singlebin.parameter(2));
		elseif strcmp('sigmoid',input.daughterratio.dependent.sd.singlebin.fit)
			sd = input.daughterratio.dependent.sd.singlebin.parameter(1) - input.daughterratio.dependent.sd.singlebin.parameter(2) * log((input.daughterratio.dependent.sd.singlebin.parameter(3) / (drfactor - input.daughterratio.dependent.sd.singlebin.parameter(4)))-1);
		else
			disp('Error in daughter ratio function.');
			keyboard
		end
	elseif strcmp(input.daughterratio.dependent.sd.type,'doublebin')
		eval(['firstbindata = distal' input.daughterratio.dependent.sd.doublebin.firstbin ';']);
		eval(['secondbindata = distal' input.daughterratio.dependent.sd.doublebin.secondbin ';']);
		clear parameterfit;
		parameterfit.firstbin.data = firstbindata;
		parameterfit.secondbin.data = secondbindata;
		parameterfit.firstbin.fit = input.daughterratio.dependent.sd.doublebin.firstfit;
		parameterfit.parameter(1).fit = input.daughterratio.dependent.sd.doublebin.parameter(1).fit;
		parameterfit.parameter(1).parameter = input.daughterratio.dependent.sd.doublebin.parameter(1).parameter;
		parameterfit.parameter(2).fit = input.daughterratio.dependent.sd.doublebin.parameter(2).fit;
		parameterfit.parameter(2).parameter = input.daughterratio.dependent.sd.doublebin.parameter(2).parameter;
		if strcmp(input.daughterratio.dependent.sd.doublebin.firstfit,'sigmoid')
			parameterfit.parameter(3).fit = input.daughterratio.dependent.sd.doublebin.parameter(3).fit;
			parameterfit.parameter(3).parameter = input.daughterratio.dependent.sd.doublebin.parameter(3).parameter;
			parameterfit.parameter(4).fit = input.daughterratio.dependent.sd.doublebin.parameter(4).fit;
			parameterfit.parameter(4).parameter = input.daughterratio.dependent.sd.doublebin.parameter(4).parameter;
		end
		sd = parameterfitter(parameterfit);
	end
	
	
	
	if strcmp(input.daughterratio.dependent.skew.type,'singlebin')
		eval(['drfactor = distal' input.daughterratio.dependent.skew.singlebin.dependent ';']);
		if strcmp('linear',input.daughterratio.dependent.skew.singlebin.fit)
			skew = input.daughterratio.dependent.skew.singlebin.parameter(1) * drfactor + input.daughterratio.dependent.skew.singlebin.parameter(2);
		elseif strcmp('exponential',input.daughterratio.dependent.skew.singlebin.fit)
			skew = input.daughterratio.dependent.skew.singlebin.parameter(1) * exp(input.daughterratio.dependent.skew.singlebin.parameter(2) * drfactor);
		elseif strcmp('power',input.daughterratio.dependent.skew.singlebin.fit)
			skew = input.daughterratio.dependent.skew.singlebin.parameter(1) * (drfactor ^ input.daughterratio.dependent.skew.singlebin.parameter(2));
		elseif strcmp('sigmoid',input.daughterratio.dependent.skew.singlebin.fit)
			skew = input.daughterratio.dependent.skew.singlebin.parameter(1) - input.daughterratio.dependent.skew.singlebin.parameter(2) * log((input.daughterratio.dependent.skew.singlebin.parameter(3) / (drfactor - input.daughterratio.dependent.skew.singlebin.parameter(4)))-1);
		else
			disp('Error in daughter ratio function.');
			keyboard
		end
	elseif strcmp(input.daughterratio.dependent.skew.type,'doublebin')
		eval(['firstbindata = distal' input.daughterratio.dependent.skew.doublebin.firstbin ';']);
		eval(['secondbindata = distal' input.daughterratio.dependent.skew.doublebin.secondbin ';']);
		clear parameterfit;
		parameterfit.firstbin.data = firstbindata;
		parameterfit.secondbin.data = secondbindata;
		parameterfit.firstbin.fit = input.daughterratio.dependent.skew.doublebin.firstfit;
		parameterfit.parameter(1).fit = input.daughterratio.dependent.skew.doublebin.parameter(1).fit;
		parameterfit.parameter(1).parameter = input.daughterratio.dependent.skew.doublebin.parameter(1).parameter;
		parameterfit.parameter(2).fit = input.daughterratio.dependent.skew.doublebin.parameter(2).fit;
		parameterfit.parameter(2).parameter = input.daughterratio.dependent.skew.doublebin.parameter(2).parameter;
		if strcmp(input.daughterratio.dependent.skew.doublebin.firstfit,'sigmoid')
			parameterfit.parameter(3).fit = input.daughterratio.dependent.skew.doublebin.parameter(3).fit;
			parameterfit.parameter(3).parameter = input.daughterratio.dependent.skew.doublebin.parameter(3).parameter;
			parameterfit.parameter(4).fit = input.daughterratio.dependent.skew.doublebin.parameter(4).fit;
			parameterfit.parameter(4).parameter = input.daughterratio.dependent.skew.doublebin.parameter(4).parameter;
		end
		skew = parameterfitter(parameterfit);
	end
	
	
	
	if strcmp(input.daughterratio.dependent.kurt.type,'singlebin')
		eval(['drfactor = distal' input.daughterratio.dependent.kurt.singlebin.dependent ';']);
		if strcmp('linear',input.daughterratio.dependent.kurt.singlebin.fit)
			kurt = input.daughterratio.dependent.kurt.singlebin.parameter(1) * drfactor + input.daughterratio.dependent.kurt.singlebin.parameter(2);
		elseif strcmp('exponential',input.daughterratio.dependent.kurt.singlebin.fit)
			kurt = input.daughterratio.dependent.kurt.singlebin.parameter(1) * exp(input.daughterratio.dependent.kurt.singlebin.parameter(2) * drfactor);
		elseif strcmp('power',input.daughterratio.dependent.kurt.singlebin.fit)
			kurt = input.daughterratio.dependent.kurt.singlebin.parameter(1) * (drfactor ^ input.daughterratio.dependent.kurt.singlebin.parameter(2));
		elseif strcmp('sigmoid',input.daughterratio.dependent.kurt.singlebin.fit)
			kurt = input.daughterratio.dependent.kurt.singlebin.parameter(1) - input.daughterratio.dependent.kurt.singlebin.parameter(2) * log((input.daughterratio.dependent.kurt.singlebin.parameter(3) / (drfactor - input.daughterratio.dependent.kurt.singlebin.parameter(4)))-1);
		else
			disp('Error in daughter ratio function.');
			keyboard
		end
	elseif strcmp(input.daughterratio.dependent.kurt.type,'doublebin')
		eval(['firstbindata = distal' input.daughterratio.dependent.kurt.doublebin.firstbin ';']);
		eval(['secondbindata = distal' input.daughterratio.dependent.kurt.doublebin.secondbin ';']);
		clear parameterfit;
		parameterfit.firstbin.data = firstbindata;
		parameterfit.secondbin.data = secondbindata;
		parameterfit.firstbin.fit = input.daughterratio.dependent.kurt.doublebin.firstfit;
		parameterfit.parameter(1).fit = input.daughterratio.dependent.kurt.doublebin.parameter(1).fit;
		parameterfit.parameter(1).parameter = input.daughterratio.dependent.kurt.doublebin.parameter(1).parameter;
		parameterfit.parameter(2).fit = input.daughterratio.dependent.kurt.doublebin.parameter(2).fit;
		parameterfit.parameter(2).parameter = input.daughterratio.dependent.kurt.doublebin.parameter(2).parameter;
		if strcmp(input.daughterratio.dependent.kurt.doublebin.firstfit,'sigmoid')
			parameterfit.parameter(3).fit = input.daughterratio.dependent.kurt.doublebin.parameter(3).fit;
			parameterfit.parameter(3).parameter = input.daughterratio.dependent.kurt.doublebin.parameter(3).parameter;
			parameterfit.parameter(4).fit = input.daughterratio.dependent.kurt.doublebin.parameter(4).fit;
			parameterfit.parameter(4).parameter = input.daughterratio.dependent.kurt.doublebin.parameter(4).parameter;
		end
		kurt = parameterfitter(parameterfit);
	end
end

outputdaughterratio.distribution = distribution;
outputdaughterratio.mean         = mean;
outputdaughterratio.sd           = sd;
outputdaughterratio.skew         = skew;
outputdaughterratio.kurt         = kurt;
outputdaughterratio.const        = constant;
outputdaughterratio.min          = minimum;
outputdaughterratio.max          = maximum;


if isfinite(input.mindiameter)
	mindiameter = input.mindiameter;
else
	mindiameter = 0;
end
smallerdiameter = mindiameter - 1;
daughterratiocount = 0;

while (smallerdiameter < mindiameter) && daughterratiocount <= 10

	if strcmp(outputdaughterratio.distribution,'pearson') == 1
		lastwarn('');
		[blank,type] = pearsrnd(mean,sd,skew,kurt,0,0);
		[lastmsg, lastid] = lastwarn;
		if strcmp(lastid,'MATLAB:divideByZero') == 1 || isnan(type) == 1
			disp('       Sampled daughter ratio from normal instead of Pearson.');
			%             disp(sprintf('Bifurcation Diam: %f',distaldiameter));
			%             disp(sprintf('Mean: %f',mean));
			%             disp(sprintf('SD  : %f',sd));
			%             disp(sprintf('Skew: %f',skew));
			%             disp(sprintf('Kurt: %f',kurt));
			outputdaughterratio.distribution = 'normal';
			daughterratio = samplefunction(outputdaughterratio);
		else 
			daughterratio = samplefunction(outputdaughterratio);
		end
	elseif strcmp(outputdaughterratio.distribution,'gamma') == 1
		outputdaughterratio.gammaa = gammaa;
		outputdaughterratio.gammab = gammab;
		outputdaughterratio.min = minimum - 1;
		outputdaughterratio.max = maximum - 1;
		daughterratio = samplefunction(outputdaughterratio);
		daughterratio = daughterratio + 1;
	else
		daughterratio = samplefunction(outputdaughterratio);
		%disp(sprintf('Daughter ratio: %f',daughterratio));
	end

	smallerdiameter = ( ( (rallratio*(distaldiameter^input.rallratio.rallexponent))/(1+(1/(daughterratio^input.rallratio.rallexponent))) )^(1/input.rallratio.rallexponent) ) / daughterratio;
	
	if smallerdiameter < mindiameter
		disp('       Resampling daughter ratio to avoid min diameter.');
		if daughterratiocount == 10
			disp('       Resampling did not work.');
		end
	end
	daughterratiocount = daughterratiocount + 1;
end

if isnan(daughterratio) == 1 || isreal(daughterratio) ~= 1 || daughterratio < 1
	disp('Error: Problem with daughter ratio.');
	keyboard;
end



















