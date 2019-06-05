function rallratio = rallratiofunction(distaldiameter,distalpathlength,inputrallratio)

if strcmp(inputrallratio.mode,'independent')
	distribution = inputrallratio.distribution;        
	mean         = inputrallratio.mean;
	sd           = inputrallratio.sd;
	skew         = inputrallratio.skew;
	kurt         = inputrallratio.kurt;
	constant     = inputrallratio.const;
	minimum      = inputrallratio.min;
	maximum      = inputrallratio.max;
	
else
	distribution = 'pearson';
	constant = NaN;
	minimum = inputrallratio.min;
	maximum = inputrallratio.max;
	clear singlebindata mean sd skew kurt;
	
	if strcmp(inputrallratio.dependent.mean.type,'independent')
		mean = inputrallratio.mean;
	elseif strcmp(inputrallratio.dependent.mean.type,'singlebin')
		eval(['singlebindata = distal' inputrallratio.dependent.mean.singlebin.dependent ';']);
		if strcmp('linear',inputrallratio.dependent.mean.singlebin.fit)
			mean = inputrallratio.dependent.mean.singlebin.parameter(1) * singlebindata + inputrallratio.dependent.mean.singlebin.parameter(2);
		elseif strcmp('exponential',inputrallratio.dependent.mean.singlebin.fit)
			if ~isnan(inputrallratio.dependent.mean.singlebin.parameter(3))
				mean = inputrallratio.dependent.mean.singlebin.parameter(3) + inputrallratio.dependent.mean.singlebin.parameter(1) * exp(inputrallratio.dependent.mean.singlebin.parameter(2) * singlebindata);
			else
				mean = inputrallratio.dependent.mean.singlebin.parameter(1) * exp(inputrallratio.dependent.mean.singlebin.parameter(2) * singlebindata);
			end
		elseif strcmp('power',inputrallratio.dependent.mean.singlebin.fit)
			if ~isnan(inputrallratio.dependent.mean.singlebin.parameter(3))
				mean = inputrallratio.dependent.mean.singlebin.parameter(3) + inputrallratio.dependent.mean.singlebin.parameter(1) * (singlebindata ^ inputrallratio.dependent.mean.singlebin.parameter(2));
			else
				mean = inputrallratio.dependent.mean.singlebin.parameter(1) * (singlebindata ^ inputrallratio.dependent.mean.singlebin.parameter(2));
			end
		elseif strcmp('sigmoid',inputrallratio.dependent.mean.singlebin.fit)
			mean = inputrallratio.dependent.mean.singlebin.parameter(1) - inputrallratio.dependent.mean.singlebin.parameter(2) * log((inputrallratio.dependent.mean.singlebin.parameter(3) / (singlebindata - inputrallratio.dependent.mean.singlebin.parameter(4)))-1);
		else
			disp('Error in rall ratio function.');
			keyboard
		end
	elseif strcmp(inputrallratio.dependent.mean.type,'doublebin')
		eval(['firstbindata = distal' inputrallratio.dependent.mean.doublebin.firstbin ';']);
		eval(['secondbindata = distal' inputrallratio.dependent.mean.doublebin.secondbin ';']);
		clear parameterfit;
		parameterfit.firstbin.data = firstbindata;
		parameterfit.secondbin.data = secondbindata;
		parameterfit.firstbin.fit = inputrallratio.dependent.mean.doublebin.firstfit;
		parameterfit.parameter(1).fit = inputrallratio.dependent.mean.doublebin.parameter(1).fit;
		parameterfit.parameter(1).parameter = inputrallratio.dependent.mean.doublebin.parameter(1).parameter(~isnan(inputrallratio.dependent.mean.doublebin.parameter(1).parameter));
		parameterfit.parameter(2).fit = inputrallratio.dependent.mean.doublebin.parameter(2).fit;
		parameterfit.parameter(2).parameter = inputrallratio.dependent.mean.doublebin.parameter(2).parameter(~isnan(inputrallratio.dependent.mean.doublebin.parameter(2).parameter));
		if strcmp(inputrallratio.dependent.mean.doublebin.firstfit,'sigmoid')
			parameterfit.parameter(3).fit = inputrallratio.dependent.mean.doublebin.parameter(3).fit;
			parameterfit.parameter(3).parameter = inputrallratio.dependent.mean.doublebin.parameter(3).parameter(~isnan(inputrallratio.dependent.mean.doublebin.parameter(3).parameter));
			parameterfit.parameter(4).fit = inputrallratio.dependent.mean.doublebin.parameter(4).fit;
			parameterfit.parameter(4).parameter = inputrallratio.dependent.mean.doublebin.parameter(4).parameter(~isnan(inputrallratio.dependent.mean.doublebin.parameter(4).parameter));
		end
		mean = parameterfitter(parameterfit);
	end
	
	
	if strcmp(inputrallratio.dependent.sd.type,'independent')
		sd = inputrallratio.sd;
% 	elseif strcmp(inputrallratio.dependent.sd.type,'singlebin')
    else
		eval(['singlebindata = distal' inputrallratio.dependent.sd.singlebin.dependent ';']);
		if strcmp('linear',inputrallratio.dependent.sd.singlebin.fit)
			sd = inputrallratio.dependent.sd.singlebin.parameter(1) * singlebindata + inputrallratio.dependent.sd.singlebin.parameter(2);
		elseif strcmp('exponential',inputrallratio.dependent.sd.singlebin.fit)
			if ~isnan(inputrallratio.dependent.sd.singlebin.parameter(3))
				sd = inputrallratio.dependent.sd.singlebin.parameter(3) + inputrallratio.dependent.sd.singlebin.parameter(1) * exp(inputrallratio.dependent.sd.singlebin.parameter(2) * singlebindata);
			else
				sd = inputrallratio.dependent.sd.singlebin.parameter(1) * exp(inputrallratio.dependent.sd.singlebin.parameter(2) * singlebindata);
			end
		elseif strcmp('power',inputrallratio.dependent.sd.singlebin.fit)
			if ~isnan(inputrallratio.dependent.sd.singlebin.parameter(3))
				sd = inputrallratio.dependent.sd.singlebin.parameter(3) + inputrallratio.dependent.sd.singlebin.parameter(1) * (singlebindata ^ inputrallratio.dependent.sd.singlebin.parameter(2));
			else
				sd = inputrallratio.dependent.sd.singlebin.parameter(1) * (singlebindata ^ inputrallratio.dependent.sd.singlebin.parameter(2));
			end
		elseif strcmp('sigmoid',inputrallratio.dependent.sd.singlebin.fit)
			sd = inputrallratio.dependent.sd.singlebin.parameter(1) - inputrallratio.dependent.sd.singlebin.parameter(2) * log((inputrallratio.dependent.sd.singlebin.parameter(3) / (singlebindata - inputrallratio.dependent.sd.singlebin.parameter(4)))-1);
		else
			disp('Error in rall ratio function.');
			keyboard
		end
% 	elseif strcmp(inputrallratio.dependent.sd.type,'doublebin')
% 		eval(['firstbindata = distal' inputrallratio.dependent.sd.doublebin.firstbin ';']);
% 		eval(['secondbindata = distal' inputrallratio.dependent.sd.doublebin.secondbin ';']);
% 		clear parameterfit;
% 		parameterfit.firstbin.data = firstbindata;
% 		parameterfit.secondbin.data = secondbindata;
% 		parameterfit.firstbin.fit = inputrallratio.dependent.sd.doublebin.firstfit;
% 		parameterfit.parameter(1).fit = inputrallratio.dependent.sd.doublebin.parameter(1).fit;
% 		parameterfit.parameter(1).parameter = inputrallratio.dependent.sd.doublebin.parameter(1).parameter;
% 		parameterfit.parameter(2).fit = inputrallratio.dependent.sd.doublebin.parameter(2).fit;
% 		parameterfit.parameter(2).parameter = inputrallratio.dependent.sd.doublebin.parameter(2).parameter;
% 		if strcmp(inputrallratio.dependent.sd.doublebin.firstfit,'sigmoid')
% 			parameterfit.parameter(3).fit = inputrallratio.dependent.sd.doublebin.parameter(3).fit;
% 			parameterfit.parameter(3).parameter = inputrallratio.dependent.sd.doublebin.parameter(3).parameter;
% 			parameterfit.parameter(4).fit = inputrallratio.dependent.sd.doublebin.parameter(4).fit;
% 			parameterfit.parameter(4).parameter = inputrallratio.dependent.sd.doublebin.parameter(4).parameter;
% 		end
% 		sd = parameterfitter(parameterfit);
	end
	
	
	
	if strcmp(inputrallratio.dependent.skew.type,'independent')
		skew = inputrallratio.skew;
	elseif strcmp(inputrallratio.dependent.skew.type,'singlebin')
		eval(['singlebindata = distal' inputrallratio.dependent.skew.singlebin.dependent ';']);
		if strcmp('linear',inputrallratio.dependent.skew.singlebin.fit)
			skew = inputrallratio.dependent.skew.singlebin.parameter(1) * singlebindata + inputrallratio.dependent.skew.singlebin.parameter(2);
		elseif strcmp('exponential',inputrallratio.dependent.skew.singlebin.fit)
			if ~isnan(inputrallratio.dependent.skew.singlebin.parameter(3))
				skew = inputrallratio.dependent.skew.singlebin.parameter(3) + inputrallratio.dependent.skew.singlebin.parameter(1) * exp(inputrallratio.dependent.skew.singlebin.parameter(2) * singlebindata);
			else	
				skew = inputrallratio.dependent.skew.singlebin.parameter(1) * exp(inputrallratio.dependent.skew.singlebin.parameter(2) * singlebindata);
			end
		elseif strcmp('power',inputrallratio.dependent.skew.singlebin.fit)
			if ~isnan(inputrallratio.dependent.skew.singlebin.parameter(3))
				skew = inputrallratio.dependent.skew.singlebin.parameter(3) + inputrallratio.dependent.skew.singlebin.parameter(1) * (singlebindata ^ inputrallratio.dependent.skew.singlebin.parameter(2));				
			else
				skew = inputrallratio.dependent.skew.singlebin.parameter(1) * (singlebindata ^ inputrallratio.dependent.skew.singlebin.parameter(2));
			end
		elseif strcmp('sigmoid',inputrallratio.dependent.skew.singlebin.fit)
			skew = inputrallratio.dependent.skew.singlebin.parameter(1) - inputrallratio.dependent.skew.singlebin.parameter(2) * log((inputrallratio.dependent.skew.singlebin.parameter(3) / (singlebindata - inputrallratio.dependent.skew.singlebin.parameter(4)))-1);
		else
			disp('Error in rall ratio function.');
			keyboard
		end
	elseif strcmp(inputrallratio.dependent.skew.type,'doublebin')
		eval(['firstbindata = distal' inputrallratio.dependent.skew.doublebin.firstbin ';']);
		eval(['secondbindata = distal' inputrallratio.dependent.skew.doublebin.secondbin ';']);
		clear parameterfit;
		parameterfit.firstbin.data = firstbindata;
		parameterfit.secondbin.data = secondbindata;
		parameterfit.firstbin.fit = inputrallratio.dependent.skew.doublebin.firstfit;
		parameterfit.parameter(1).fit = inputrallratio.dependent.skew.doublebin.parameter(1).fit;
		parameterfit.parameter(1).parameter = inputrallratio.dependent.skew.doublebin.parameter(1).parameter;
		parameterfit.parameter(2).fit = inputrallratio.dependent.skew.doublebin.parameter(2).fit;
		parameterfit.parameter(2).parameter = inputrallratio.dependent.skew.doublebin.parameter(2).parameter;
		if strcmp(inputrallratio.dependent.skew.doublebin.firstfit,'sigmoid')
			parameterfit.parameter(3).fit = inputrallratio.dependent.skew.doublebin.parameter(3).fit;
			parameterfit.parameter(3).parameter = inputrallratio.dependent.skew.doublebin.parameter(3).parameter;
			parameterfit.parameter(4).fit = inputrallratio.dependent.skew.doublebin.parameter(4).fit;
			parameterfit.parameter(4).parameter = inputrallratio.dependent.skew.doublebin.parameter(4).parameter;
		end
		skew = parameterfitter(parameterfit);
	end
	
	
	
	if strcmp(inputrallratio.dependent.kurt.type,'independent')
		kurt = inputrallratio.kurt;
	elseif strcmp(inputrallratio.dependent.kurt.type,'singlebin')
		eval(['singlebindata = distal' inputrallratio.dependent.kurt.singlebin.dependent ';']);
		if strcmp('linear',inputrallratio.dependent.kurt.singlebin.fit)
			kurt = inputrallratio.dependent.kurt.singlebin.parameter(1) * singlebindata + inputrallratio.dependent.kurt.singlebin.parameter(2);
		elseif strcmp('exponential',inputrallratio.dependent.kurt.singlebin.fit)
			if ~isnan(inputrallratio.dependent.kurt.singlebin.parameter(3))
				kurt = inputrallratio.dependent.kurt.singlebin.parameter(3) + inputrallratio.dependent.kurt.singlebin.parameter(1) * exp(inputrallratio.dependent.kurt.singlebin.parameter(2) * singlebindata);			
			else
				kurt = inputrallratio.dependent.kurt.singlebin.parameter(1) * exp(inputrallratio.dependent.kurt.singlebin.parameter(2) * singlebindata);
			end
		elseif strcmp('power',inputrallratio.dependent.kurt.singlebin.fit)
			if ~isnan(inputrallratio.dependent.kurt.singlebin.parameter(3))
				kurt = inputrallratio.dependent.kurt.singlebin.parameter(3) + inputrallratio.dependent.kurt.singlebin.parameter(1) * (singlebindata ^ inputrallratio.dependent.kurt.singlebin.parameter(2));				
			else
				kurt = inputrallratio.dependent.kurt.singlebin.parameter(1) * (singlebindata ^ inputrallratio.dependent.kurt.singlebin.parameter(2));
			end
		elseif strcmp('sigmoid',inputrallratio.dependent.kurt.singlebin.fit)
			kurt = inputrallratio.dependent.kurt.singlebin.parameter(1) - inputrallratio.dependent.kurt.singlebin.parameter(2) * log((inputrallratio.dependent.kurt.singlebin.parameter(3) / (singlebindata - inputrallratio.dependent.kurt.singlebin.parameter(4)))-1);
		else
			disp('Error in rall ratio function.');
			keyboard
		end
	elseif strcmp(inputrallratio.dependent.kurt.type,'doublebin')
		eval(['firstbindata = distal' inputrallratio.dependent.kurt.doublebin.firstbin ';']);
		eval(['secondbindata = distal' inputrallratio.dependent.kurt.doublebin.secondbin ';']);
		clear parameterfit;
		parameterfit.firstbin.data = firstbindata;
		parameterfit.secondbin.data = secondbindata;
		parameterfit.firstbin.fit = inputrallratio.dependent.kurt.doublebin.firstfit;
		parameterfit.parameter(1).fit = inputrallratio.dependent.kurt.doublebin.parameter(1).fit;
		parameterfit.parameter(1).parameter = inputrallratio.dependent.kurt.doublebin.parameter(1).parameter;
		parameterfit.parameter(2).fit = inputrallratio.dependent.kurt.doublebin.parameter(2).fit;
		parameterfit.parameter(2).parameter = inputrallratio.dependent.kurt.doublebin.parameter(2).parameter;
		if strcmp(inputrallratio.dependent.kurt.doublebin.firstfit,'sigmoid')
			parameterfit.parameter(3).fit = inputrallratio.dependent.kurt.doublebin.parameter(3).fit;
			parameterfit.parameter(3).parameter = inputrallratio.dependent.kurt.doublebin.parameter(3).parameter;
			parameterfit.parameter(4).fit = inputrallratio.dependent.kurt.doublebin.parameter(4).fit;
			parameterfit.parameter(4).parameter = inputrallratio.dependent.kurt.doublebin.parameter(4).parameter;
		end
		kurt = parameterfitter(parameterfit);
	end
end

outputrallratio.distribution = distribution;
outputrallratio.mean         = mean;
outputrallratio.sd           = sd;
outputrallratio.skew         = skew;
outputrallratio.kurt         = kurt;
outputrallratio.const        = constant;
outputrallratio.min          = minimum;
outputrallratio.max          = maximum;

if strcmp(outputrallratio.distribution,'pearson') == 1
	lastwarn('');
	[blank,type] = pearsrnd(mean,sd,skew,kurt,0,0);
	[lastmsg, lastid] = lastwarn;
	if strcmp(lastid,'MATLAB:divideByZero') == 1 || isnan(type) == 1
		disp('       Sampled Rall ratio from normal instead of Pearson.');
		            disp(sprintf('         Parent Diam: %f',distaldiameter));
		            disp(sprintf('         Mean: %f',mean));
		            disp(sprintf('         SD  : %f',sd));
		            disp(sprintf('         Skew: %f',skew));
		            disp(sprintf('         Kurt: %f',kurt));
		outputrallratio.distribution = 'normal';
		rallratio = samplefunction(outputrallratio);
		disp(sprintf('         Ratio: %f',rallratio));
	else 
		rallratio = samplefunction(outputrallratio);
	end
else
	rallratio = samplefunction(outputrallratio);
	%disp(sprintf('rall ratio: %f',rallratio));
end

if isnan(rallratio) == 1 || isreal(rallratio) ~= 1 || rallratio < 0 || isinf(rallratio) == 1
	disp('Error: Problem with rall ratio.');
	keyboard;
end

