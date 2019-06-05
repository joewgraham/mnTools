function taperrate = taperratefunction(branchtype,proximaldiameter,proximalpathlength,inputtaperrate)

if strcmp(branchtype,'b') == 1

    if strcmp(inputtaperrate.bifurcation.mode,'independent')
        distribution = inputtaperrate.bifurcation.distribution;        
        mean         = inputtaperrate.bifurcation.mean;
        sd           = inputtaperrate.bifurcation.sd;
        skew         = inputtaperrate.bifurcation.skew;
        kurt         = inputtaperrate.bifurcation.kurt;
		constant     = inputtaperrate.bifurcation.const;
		minimum      = inputtaperrate.bifurcation.min;
		maximum      = inputtaperrate.bifurcation.max;
        
    else
		distribution = 'pearson';
		constant = NaN;
		minimum = inputtaperrate.bifurcation.min;
		maximum = inputtaperrate.bifurcation.max;
		clear singlebindata mean sd skew kurt;
		
		if strcmp(inputtaperrate.bifurcation.dependent.mean.type,'independent')
			mean = inputtaperrate.bifurcation.mean;
		elseif strcmp(inputtaperrate.bifurcation.dependent.mean.type,'singlebin')
			eval(['singlebindata = proximal' inputtaperrate.bifurcation.dependent.mean.singlebin.dependent ';']);
			if strcmp('linear',inputtaperrate.bifurcation.dependent.mean.singlebin.fit)
				mean = inputtaperrate.bifurcation.dependent.mean.singlebin.parameter(1) * singlebindata + inputtaperrate.bifurcation.dependent.mean.singlebin.parameter(2);
			elseif strcmp('exponential',inputtaperrate.bifurcation.dependent.mean.singlebin.fit)
				if ~isnan(inputtaperrate.bifurcation.dependent.mean.singlebin.parameter(3))
					mean = inputtaperrate.bifurcation.dependent.mean.singlebin.parameter(3) + inputtaperrate.bifurcation.dependent.mean.singlebin.parameter(1) * exp(inputtaperrate.bifurcation.dependent.mean.singlebin.parameter(2) * singlebindata);
				else
					mean = inputtaperrate.bifurcation.dependent.mean.singlebin.parameter(1) * exp(inputtaperrate.bifurcation.dependent.mean.singlebin.parameter(2) * singlebindata);
				end	
			elseif strcmp('power',inputtaperrate.bifurcation.dependent.mean.singlebin.fit)
				if ~isnan(inputtaperrate.bifurcation.dependent.mean.singlebin.parameter(3))
					mean = inputtaperrate.bifurcation.dependent.mean.singlebin.parameter(3) + inputtaperrate.bifurcation.dependent.mean.singlebin.parameter(1) * (singlebindata ^ inputtaperrate.bifurcation.dependent.mean.singlebin.parameter(2));
				else
					mean = inputtaperrate.bifurcation.dependent.mean.singlebin.parameter(1) * (singlebindata ^ inputtaperrate.bifurcation.dependent.mean.singlebin.parameter(2));
				end
			elseif strcmp('sigmoid',inputtaperrate.bifurcation.dependent.mean.singlebin.fit)
				mean = inputtaperrate.bifurcation.dependent.mean.singlebin.parameter(1) - inputtaperrate.bifurcation.dependent.mean.singlebin.parameter(2) * log((inputtaperrate.bifurcation.dependent.mean.singlebin.parameter(3) / (singlebindata - inputtaperrate.bifurcation.dependent.mean.singlebin.parameter(4)))-1);
			else
				disp('Error in bifurcation taper rate function (line 35).');
				keyboard
			end
		elseif strcmp(inputtaperrate.bifurcation.dependent.mean.type,'doublebin')
			eval(['firstbindata = proximal' inputtaperrate.bifurcation.dependent.mean.doublebin.firstbin ';']);
			eval(['secondbindata = proximal' inputtaperrate.bifurcation.dependent.mean.doublebin.secondbin ';']);
			clear parameterfit;
			parameterfit.firstbin.data = firstbindata;
			parameterfit.secondbin.data = secondbindata;
			parameterfit.firstbin.fit = inputtaperrate.bifurcation.dependent.mean.doublebin.firstfit;
			parameterfit.parameter(1).fit = inputtaperrate.bifurcation.dependent.mean.doublebin.parameter(1).fit;
			parameterfit.parameter(1).parameter = inputtaperrate.bifurcation.dependent.mean.doublebin.parameter(1).parameter(~isnan(inputtaperrate.bifurcation.dependent.mean.doublebin.parameter(1).parameter));
			parameterfit.parameter(2).fit = inputtaperrate.bifurcation.dependent.mean.doublebin.parameter(2).fit;
			parameterfit.parameter(2).parameter = inputtaperrate.bifurcation.dependent.mean.doublebin.parameter(2).parameter(~isnan(inputtaperrate.bifurcation.dependent.mean.doublebin.parameter(2).parameter));
			if strcmp(inputtaperrate.bifurcation.dependent.mean.doublebin.firstfit,'sigmoid')
				parameterfit.parameter(3).fit = inputtaperrate.bifurcation.dependent.mean.doublebin.parameter(3).fit;
				parameterfit.parameter(3).parameter = inputtaperrate.bifurcation.dependent.mean.doublebin.parameter(3).parameter(~isnan(inputtaperrate.bifurcation.dependent.mean.doublebin.parameter(3).parameter));
				parameterfit.parameter(4).fit = inputtaperrate.bifurcation.dependent.mean.doublebin.parameter(4).fit;
				parameterfit.parameter(4).parameter = inputtaperrate.bifurcation.dependent.mean.doublebin.parameter(4).parameter(~isnan(inputtaperrate.bifurcation.dependent.mean.doublebin.parameter(4).parameter));
			end
			mean = parameterfitter(parameterfit);
		end
		
		
		
		if strcmp(inputtaperrate.bifurcation.dependent.sd.type,'independent')
			sd = inputtaperrate.bifurcation.sd;
		elseif strcmp(inputtaperrate.bifurcation.dependent.sd.type,'singlebin')
			eval(['singlebindata = proximal' inputtaperrate.bifurcation.dependent.sd.singlebin.dependent ';']);
			if strcmp('linear',inputtaperrate.bifurcation.dependent.sd.singlebin.fit)
				sd = inputtaperrate.bifurcation.dependent.sd.singlebin.parameter(1) * singlebindata + inputtaperrate.bifurcation.dependent.sd.singlebin.parameter(2);
			elseif strcmp('exponential',inputtaperrate.bifurcation.dependent.sd.singlebin.fit)
				if ~isnan(inputtaperrate.bifurcation.dependent.sd.singlebin.parameter(3))
					sd = inputtaperrate.bifurcation.dependent.sd.singlebin.parameter(3) + inputtaperrate.bifurcation.dependent.sd.singlebin.parameter(1) * exp(inputtaperrate.bifurcation.dependent.sd.singlebin.parameter(2) * singlebindata);
				else
					sd = inputtaperrate.bifurcation.dependent.sd.singlebin.parameter(1) * exp(inputtaperrate.bifurcation.dependent.sd.singlebin.parameter(2) * singlebindata);
				end
			elseif strcmp('power',inputtaperrate.bifurcation.dependent.sd.singlebin.fit)
				if ~isnan(inputtaperrate.bifurcation.dependent.sd.singlebin.parameter(3))
					sd = inputtaperrate.bifurcation.dependent.sd.singlebin.parameter(3) + inputtaperrate.bifurcation.dependent.sd.singlebin.parameter(1) * (singlebindata ^ inputtaperrate.bifurcation.dependent.sd.singlebin.parameter(2));
				else
					sd = inputtaperrate.bifurcation.dependent.sd.singlebin.parameter(1) * (singlebindata ^ inputtaperrate.bifurcation.dependent.sd.singlebin.parameter(2));
				end
				elseif strcmp('sigmoid',inputtaperrate.bifurcation.dependent.sd.singlebin.fit)
				sd = inputtaperrate.bifurcation.dependent.sd.singlebin.parameter(1) - inputtaperrate.bifurcation.dependent.sd.singlebin.parameter(2) * log((inputtaperrate.bifurcation.dependent.sd.singlebin.parameter(3) / (singlebindata - inputtaperrate.bifurcation.dependent.sd.singlebin.parameter(4)))-1);
			else
				disp('Error in bifurcation taper rate function (line 73).');
				keyboard
			end
		elseif strcmp(inputtaperrate.bifurcation.dependent.sd.type,'doublebin')
			eval(['firstbindata = proximal' inputtaperrate.bifurcation.dependent.sd.doublebin.firstbin ';']);
			eval(['secondbindata = proximal' inputtaperrate.bifurcation.dependent.sd.doublebin.secondbin ';']);
			clear parameterfit;
			parameterfit.firstbin.data = firstbindata;
			parameterfit.secondbin.data = secondbindata;
			parameterfit.firstbin.fit = inputtaperrate.bifurcation.dependent.sd.doublebin.firstfit;
			parameterfit.parameter(1).fit = inputtaperrate.bifurcation.dependent.sd.doublebin.parameter(1).fit;
			parameterfit.parameter(1).parameter = inputtaperrate.bifurcation.dependent.sd.doublebin.parameter(1).parameter;
			parameterfit.parameter(2).fit = inputtaperrate.bifurcation.dependent.sd.doublebin.parameter(2).fit;
			parameterfit.parameter(2).parameter = inputtaperrate.bifurcation.dependent.sd.doublebin.parameter(2).parameter;
			if strcmp(inputtaperrate.bifurcation.dependent.sd.doublebin.firstfit,'sigmoid')
				parameterfit.parameter(3).fit = inputtaperrate.bifurcation.dependent.sd.doublebin.parameter(3).fit;
				parameterfit.parameter(3).parameter = inputtaperrate.bifurcation.dependent.sd.doublebin.parameter(3).parameter;
				parameterfit.parameter(4).fit = inputtaperrate.bifurcation.dependent.sd.doublebin.parameter(4).fit;
				parameterfit.parameter(4).parameter = inputtaperrate.bifurcation.dependent.sd.doublebin.parameter(4).parameter;
			end
			sd = parameterfitter(parameterfit);
		end
		
		
		
		if strcmp(inputtaperrate.bifurcation.dependent.skew.type,'independent')
			skew = inputtaperrate.bifurcation.skew;
		elseif strcmp(inputtaperrate.bifurcation.dependent.skew.type,'singlebin')
			eval(['singlebindata = proximal' inputtaperrate.bifurcation.dependent.skew.singlebin.dependent ';']);
			if strcmp('linear',inputtaperrate.bifurcation.dependent.skew.singlebin.fit)
				skew = inputtaperrate.bifurcation.dependent.skew.singlebin.parameter(1) * singlebindata + inputtaperrate.bifurcation.dependent.skew.singlebin.parameter(2);
			elseif strcmp('exponential',inputtaperrate.bifurcation.dependent.skew.singlebin.fit)
				if ~isnan(inputtaperrate.bifurcation.dependent.skew.singlebin.parameter(3))
					skew = inputtaperrate.bifurcation.dependent.skew.singlebin.parameter(3) + inputtaperrate.bifurcation.dependent.skew.singlebin.parameter(1) * exp(inputtaperrate.bifurcation.dependent.skew.singlebin.parameter(2) * singlebindata);					
				else
					skew = inputtaperrate.bifurcation.dependent.skew.singlebin.parameter(1) * exp(inputtaperrate.bifurcation.dependent.skew.singlebin.parameter(2) * singlebindata);
				end
			elseif strcmp('power',inputtaperrate.bifurcation.dependent.skew.singlebin.fit)
				if ~isnan(inputtaperrate.bifurcation.dependent.skew.singlebin.parameter(3))
					skew = inputtaperrate.bifurcation.dependent.skew.singlebin.parameter(3) + inputtaperrate.bifurcation.dependent.skew.singlebin.parameter(1) * (singlebindata ^ inputtaperrate.bifurcation.dependent.skew.singlebin.parameter(2));
				else
					skew = inputtaperrate.bifurcation.dependent.skew.singlebin.parameter(1) * (singlebindata ^ inputtaperrate.bifurcation.dependent.skew.singlebin.parameter(2));				
				end
			elseif strcmp('sigmoid',inputtaperrate.bifurcation.dependent.skew.singlebin.fit)
				skew = inputtaperrate.bifurcation.dependent.skew.singlebin.parameter(1) - inputtaperrate.bifurcation.dependent.skew.singlebin.parameter(2) * log((inputtaperrate.bifurcation.dependent.skew.singlebin.parameter(3) / (singlebindata - inputtaperrate.bifurcation.dependent.skew.singlebin.parameter(4)))-1);
			else
				disp('Error in bifurcation taper rate function (line 111).');
				keyboard
			end
		elseif strcmp(inputtaperrate.bifurcation.dependent.skew.type,'doublebin')
			eval(['firstbindata = proximal' inputtaperrate.bifurcation.dependent.skew.doublebin.firstbin ';']);
			eval(['secondbindata = proximal' inputtaperrate.bifurcation.dependent.skew.doublebin.secondbin ';']);
			clear parameterfit;
			parameterfit.firstbin.data = firstbindata;
			parameterfit.secondbin.data = secondbindata;
			parameterfit.firstbin.fit = inputtaperrate.bifurcation.dependent.skew.doublebin.firstfit;
			parameterfit.parameter(1).fit = inputtaperrate.bifurcation.dependent.skew.doublebin.parameter(1).fit;
			parameterfit.parameter(1).parameter = inputtaperrate.bifurcation.dependent.skew.doublebin.parameter(1).parameter;
			parameterfit.parameter(2).fit = inputtaperrate.bifurcation.dependent.skew.doublebin.parameter(2).fit;
			parameterfit.parameter(2).parameter = inputtaperrate.bifurcation.dependent.skew.doublebin.parameter(2).parameter;
			if strcmp(inputtaperrate.bifurcation.dependent.skew.doublebin.firstfit,'sigmoid')
				parameterfit.parameter(3).fit = inputtaperrate.bifurcation.dependent.skew.doublebin.parameter(3).fit;
				parameterfit.parameter(3).parameter = inputtaperrate.bifurcation.dependent.skew.doublebin.parameter(3).parameter;
				parameterfit.parameter(4).fit = inputtaperrate.bifurcation.dependent.skew.doublebin.parameter(4).fit;
				parameterfit.parameter(4).parameter = inputtaperrate.bifurcation.dependent.skew.doublebin.parameter(4).parameter;
			end
			skew = parameterfitter(parameterfit);
		end
		
		
		
		if strcmp(inputtaperrate.bifurcation.dependent.kurt.type,'independent')
			kurt = inputtaperrate.bifurcation.kurt;
		elseif strcmp(inputtaperrate.bifurcation.dependent.kurt.type,'singlebin')
			eval(['singlebindata = proximal' inputtaperrate.bifurcation.dependent.kurt.singlebin.dependent ';']);
			if strcmp('linear',inputtaperrate.bifurcation.dependent.kurt.singlebin.fit)
				kurt = inputtaperrate.bifurcation.dependent.kurt.singlebin.parameter(1) * singlebindata + inputtaperrate.bifurcation.dependent.kurt.singlebin.parameter(2);
			elseif strcmp('exponential',inputtaperrate.bifurcation.dependent.kurt.singlebin.fit)
				if ~isnan(inputtaperrate.bifurcation.dependent.kurt.singlebin.parameter(3))
					kurt = inputtaperrate.bifurcation.dependent.kurt.singlebin.parameter(3) + inputtaperrate.bifurcation.dependent.kurt.singlebin.parameter(1) * exp(inputtaperrate.bifurcation.dependent.kurt.singlebin.parameter(2) * singlebindata);					
				else
					kurt = inputtaperrate.bifurcation.dependent.kurt.singlebin.parameter(1) * exp(inputtaperrate.bifurcation.dependent.kurt.singlebin.parameter(2) * singlebindata);
				end
			elseif strcmp('power',inputtaperrate.bifurcation.dependent.kurt.singlebin.fit)
				if ~isnan(inputtaperrate.bifurcation.dependent.kurt.singlebin.parameter(3))
					kurt = inputtaperrate.bifurcation.dependent.kurt.singlebin.parameter(3) + inputtaperrate.bifurcation.dependent.kurt.singlebin.parameter(1) * (singlebindata ^ inputtaperrate.bifurcation.dependent.kurt.singlebin.parameter(2));					
				else
					kurt = inputtaperrate.bifurcation.dependent.kurt.singlebin.parameter(1) * (singlebindata ^ inputtaperrate.bifurcation.dependent.kurt.singlebin.parameter(2));
				end
			elseif strcmp('sigmoid',inputtaperrate.bifurcation.dependent.kurt.singlebin.fit)
				kurt = inputtaperrate.bifurcation.dependent.kurt.singlebin.parameter(1) - inputtaperrate.bifurcation.dependent.kurt.singlebin.parameter(2) * log((inputtaperrate.bifurcation.dependent.kurt.singlebin.parameter(3) / (singlebindata - inputtaperrate.bifurcation.dependent.kurt.singlebin.parameter(4)))-1);
			else
				disp('Error in bifurcation taper rate function (line 149).');
				keyboard
			end
		elseif strcmp(inputtaperrate.bifurcation.dependent.kurt.type,'doublebin')
			eval(['firstbindata = proximal' inputtaperrate.bifurcation.dependent.kurt.doublebin.firstbin ';']);
			eval(['secondbindata = proximal' inputtaperrate.bifurcation.dependent.kurt.doublebin.secondbin ';']);
			clear parameterfit;
			parameterfit.firstbin.data = firstbindata;
			parameterfit.secondbin.data = secondbindata;
			parameterfit.firstbin.fit = inputtaperrate.bifurcation.dependent.kurt.doublebin.firstfit;
			parameterfit.parameter(1).fit = inputtaperrate.bifurcation.dependent.kurt.doublebin.parameter(1).fit;
			parameterfit.parameter(1).parameter = inputtaperrate.bifurcation.dependent.kurt.doublebin.parameter(1).parameter;
			parameterfit.parameter(2).fit = inputtaperrate.bifurcation.dependent.kurt.doublebin.parameter(2).fit;
			parameterfit.parameter(2).parameter = inputtaperrate.bifurcation.dependent.kurt.doublebin.parameter(2).parameter;
			if strcmp(inputtaperrate.bifurcation.dependent.kurt.doublebin.firstfit,'sigmoid')
				parameterfit.parameter(3).fit = inputtaperrate.bifurcation.dependent.kurt.doublebin.parameter(3).fit;
				parameterfit.parameter(3).parameter = inputtaperrate.bifurcation.dependent.kurt.doublebin.parameter(3).parameter;
				parameterfit.parameter(4).fit = inputtaperrate.bifurcation.dependent.kurt.doublebin.parameter(4).fit;
				parameterfit.parameter(4).parameter = inputtaperrate.bifurcation.dependent.kurt.doublebin.parameter(4).parameter;
			end
			kurt = parameterfitter(parameterfit);
		end
	end

elseif strcmp(branchtype,'t') == 1

    if strcmp(inputtaperrate.termination.mode,'independent')
        distribution = inputtaperrate.termination.distribution;        
        mean         = inputtaperrate.termination.mean;
        sd           = inputtaperrate.termination.sd;
        skew         = inputtaperrate.termination.skew;
        kurt         = inputtaperrate.termination.kurt;
		constant     = inputtaperrate.termination.const;
		minimum      = inputtaperrate.termination.min;
		maximum      = inputtaperrate.termination.max;
        
    else
		distribution = 'pearson';
		constant = NaN;
		minimum = inputtaperrate.termination.min;
		maximum = inputtaperrate.termination.max;
		clear singlebindata mean sd skew kurt;
		
		if strcmp(inputtaperrate.termination.dependent.mean.type,'independent')
			mean = inputtaperrate.termination.mean;
		elseif strcmp(inputtaperrate.termination.dependent.mean.type,'singlebin')
			eval(['singlebindata = proximal' inputtaperrate.termination.dependent.mean.singlebin.dependent ';']);
			if strcmp('linear',inputtaperrate.termination.dependent.mean.singlebin.fit)
				mean = inputtaperrate.termination.dependent.mean.singlebin.parameter(1) * singlebindata + inputtaperrate.termination.dependent.mean.singlebin.parameter(2);
			elseif strcmp('exponential',inputtaperrate.termination.dependent.mean.singlebin.fit)
				if ~isnan(inputtaperrate.termination.dependent.mean.singlebin.parameter(3))
					mean = inputtaperrate.termination.dependent.mean.singlebin.parameter(3) + inputtaperrate.termination.dependent.mean.singlebin.parameter(1) * exp(inputtaperrate.termination.dependent.mean.singlebin.parameter(2) * singlebindata);				
				else
					mean = inputtaperrate.termination.dependent.mean.singlebin.parameter(1) * exp(inputtaperrate.termination.dependent.mean.singlebin.parameter(2) * singlebindata);
				end
			elseif strcmp('power',inputtaperrate.termination.dependent.mean.singlebin.fit)
				if ~isnan(inputtaperrate.termination.dependent.mean.singlebin.parameter(3))
					mean = inputtaperrate.termination.dependent.mean.singlebin.parameter(3) + inputtaperrate.termination.dependent.mean.singlebin.parameter(1) * (singlebindata ^ inputtaperrate.termination.dependent.mean.singlebin.parameter(2));				
				else
					mean = inputtaperrate.termination.dependent.mean.singlebin.parameter(1) * (singlebindata ^ inputtaperrate.termination.dependent.mean.singlebin.parameter(2));
				end
			elseif strcmp('sigmoid',inputtaperrate.termination.dependent.mean.singlebin.fit)
				mean = inputtaperrate.termination.dependent.mean.singlebin.parameter(1) - inputtaperrate.termination.dependent.mean.singlebin.parameter(2) * log((inputtaperrate.termination.dependent.mean.singlebin.parameter(3) / (singlebindata - inputtaperrate.termination.dependent.mean.singlebin.parameter(4)))-1);
			else
				disp('Error in termination taper rate function.');
				keyboard
			end
		elseif strcmp(inputtaperrate.termination.dependent.mean.type,'doublebin')
			eval(['firstbindata = proximal' inputtaperrate.termination.dependent.mean.doublebin.firstbin ';']);
			eval(['secondbindata = proximal' inputtaperrate.termination.dependent.mean.doublebin.secondbin ';']);
			clear parameterfit;
			parameterfit.firstbin.data = firstbindata;
			parameterfit.secondbin.data = secondbindata;
			parameterfit.firstbin.fit = inputtaperrate.termination.dependent.mean.doublebin.firstfit;
			parameterfit.parameter(1).fit = inputtaperrate.termination.dependent.mean.doublebin.parameter(1).fit;
			parameterfit.parameter(1).parameter = inputtaperrate.termination.dependent.mean.doublebin.parameter(1).parameter;
			parameterfit.parameter(2).fit = inputtaperrate.termination.dependent.mean.doublebin.parameter(2).fit;
			parameterfit.parameter(2).parameter = inputtaperrate.termination.dependent.mean.doublebin.parameter(2).parameter;
			if strcmp(inputtaperrate.termination.dependent.mean.doublebin.firstfit,'sigmoid')
				parameterfit.parameter(3).fit = inputtaperrate.termination.dependent.mean.doublebin.parameter(3).fit;
				parameterfit.parameter(3).parameter = inputtaperrate.termination.dependent.mean.doublebin.parameter(3).parameter;
				parameterfit.parameter(4).fit = inputtaperrate.termination.dependent.mean.doublebin.parameter(4).fit;
				parameterfit.parameter(4).parameter = inputtaperrate.termination.dependent.mean.doublebin.parameter(4).parameter;
			end
			mean = parameterfitter(parameterfit);
		end
		
		
		
		if strcmp(inputtaperrate.termination.dependent.sd.type,'independent')
			sd = inputtaperrate.termination.sd;
		elseif strcmp(inputtaperrate.termination.dependent.sd.type,'singlebin')
			eval(['singlebindata = proximal' inputtaperrate.termination.dependent.sd.singlebin.dependent ';']);
			if strcmp('linear',inputtaperrate.termination.dependent.sd.singlebin.fit)
				sd = inputtaperrate.termination.dependent.sd.singlebin.parameter(1) * singlebindata + inputtaperrate.termination.dependent.sd.singlebin.parameter(2);
			elseif strcmp('exponential',inputtaperrate.termination.dependent.sd.singlebin.fit)
				if ~isnan(inputtaperrate.termination.dependent.sd.singlebin.parameter(3))
					sd = inputtaperrate.termination.dependent.sd.singlebin.parameter(3) + inputtaperrate.termination.dependent.sd.singlebin.parameter(1) * exp(inputtaperrate.termination.dependent.sd.singlebin.parameter(2) * singlebindata);				
				else
					sd = inputtaperrate.termination.dependent.sd.singlebin.parameter(1) * exp(inputtaperrate.termination.dependent.sd.singlebin.parameter(2) * singlebindata);
				end
			elseif strcmp('power',inputtaperrate.termination.dependent.sd.singlebin.fit)
				if ~isnan(inputtaperrate.termination.dependent.sd.singlebin.parameter(3))
					sd = inputtaperrate.termination.dependent.sd.singlebin.parameter(3) + inputtaperrate.termination.dependent.sd.singlebin.parameter(1) * (singlebindata ^ inputtaperrate.termination.dependent.sd.singlebin.parameter(2));				
				else
					sd = inputtaperrate.termination.dependent.sd.singlebin.parameter(1) * (singlebindata ^ inputtaperrate.termination.dependent.sd.singlebin.parameter(2));
				end
			elseif strcmp('sigmoid',inputtaperrate.termination.dependent.sd.singlebin.fit)
				sd = inputtaperrate.termination.dependent.sd.singlebin.parameter(1) - inputtaperrate.termination.dependent.sd.singlebin.parameter(2) * log((inputtaperrate.termination.dependent.sd.singlebin.parameter(3) / (singlebindata - inputtaperrate.termination.dependent.sd.singlebin.parameter(4)))-1);
			else
				disp('Error in termination taper rate function.');
				keyboard
			end
		elseif strcmp(inputtaperrate.termination.dependent.sd.type,'doublebin')
			eval(['firstbindata = proximal' inputtaperrate.termination.dependent.sd.doublebin.firstbin ';']);
			eval(['secondbindata = proximal' inputtaperrate.termination.dependent.sd.doublebin.secondbin ';']);
			clear parameterfit;
			parameterfit.firstbin.data = firstbindata;
			parameterfit.secondbin.data = secondbindata;
			parameterfit.firstbin.fit = inputtaperrate.termination.dependent.sd.doublebin.firstfit;
			parameterfit.parameter(1).fit = inputtaperrate.termination.dependent.sd.doublebin.parameter(1).fit;
			parameterfit.parameter(1).parameter = inputtaperrate.termination.dependent.sd.doublebin.parameter(1).parameter;
			parameterfit.parameter(2).fit = inputtaperrate.termination.dependent.sd.doublebin.parameter(2).fit;
			parameterfit.parameter(2).parameter = inputtaperrate.termination.dependent.sd.doublebin.parameter(2).parameter;
			if strcmp(inputtaperrate.termination.dependent.sd.doublebin.firstfit,'sigmoid')
				parameterfit.parameter(3).fit = inputtaperrate.termination.dependent.sd.doublebin.parameter(3).fit;
				parameterfit.parameter(3).parameter = inputtaperrate.termination.dependent.sd.doublebin.parameter(3).parameter;
				parameterfit.parameter(4).fit = inputtaperrate.termination.dependent.sd.doublebin.parameter(4).fit;
				parameterfit.parameter(4).parameter = inputtaperrate.termination.dependent.sd.doublebin.parameter(4).parameter;
			end
			sd = parameterfitter(parameterfit);
		end
		
		
		
		if strcmp(inputtaperrate.termination.dependent.skew.type,'independent')
			skew = inputtaperrate.termination.skew;
		elseif strcmp(inputtaperrate.termination.dependent.skew.type,'singlebin')
			eval(['singlebindata = proximal' inputtaperrate.termination.dependent.skew.singlebin.dependent ';']);
			if strcmp('linear',inputtaperrate.termination.dependent.skew.singlebin.fit)
				skew = inputtaperrate.termination.dependent.skew.singlebin.parameter(1) * singlebindata + inputtaperrate.termination.dependent.skew.singlebin.parameter(2);
			elseif strcmp('exponential',inputtaperrate.termination.dependent.skew.singlebin.fit)
				if ~isnan(inputtaperrate.termination.dependent.skew.singlebin.parameter(3))
					skew = inputtaperrate.termination.dependent.skew.singlebin.parameter(3) + inputtaperrate.termination.dependent.skew.singlebin.parameter(1) * exp(inputtaperrate.termination.dependent.skew.singlebin.parameter(2) * singlebindata);				
				else
					skew = inputtaperrate.termination.dependent.skew.singlebin.parameter(1) * exp(inputtaperrate.termination.dependent.skew.singlebin.parameter(2) * singlebindata);
				end
			elseif strcmp('power',inputtaperrate.termination.dependent.skew.singlebin.fit)
				if ~isnan(inputtaperrate.termination.dependent.skew.singlebin.parameter(3))
					skew = inputtaperrate.termination.dependent.skew.singlebin.parameter(3) + inputtaperrate.termination.dependent.skew.singlebin.parameter(1) * (singlebindata ^ inputtaperrate.termination.dependent.skew.singlebin.parameter(2));				
				else
					skew = inputtaperrate.termination.dependent.skew.singlebin.parameter(1) * (singlebindata ^ inputtaperrate.termination.dependent.skew.singlebin.parameter(2));
				end
			elseif strcmp('sigmoid',inputtaperrate.termination.dependent.skew.singlebin.fit)
				skew = inputtaperrate.termination.dependent.skew.singlebin.parameter(1) - inputtaperrate.termination.dependent.skew.singlebin.parameter(2) * log((inputtaperrate.termination.dependent.skew.singlebin.parameter(3) / (singlebindata - inputtaperrate.termination.dependent.skew.singlebin.parameter(4)))-1);
			else
				disp('Error in termination taper rate function.');
				keyboard
			end
		elseif strcmp(inputtaperrate.termination.dependent.skew.type,'doublebin')
			eval(['firstbindata = proximal' inputtaperrate.termination.dependent.skew.doublebin.firstbin ';']);
			eval(['secondbindata = proximal' inputtaperrate.termination.dependent.skew.doublebin.secondbin ';']);
			clear parameterfit;
			parameterfit.firstbin.data = firstbindata;
			parameterfit.secondbin.data = secondbindata;
			parameterfit.firstbin.fit = inputtaperrate.termination.dependent.skew.doublebin.firstfit;
			parameterfit.parameter(1).fit = inputtaperrate.termination.dependent.skew.doublebin.parameter(1).fit;
			parameterfit.parameter(1).parameter = inputtaperrate.termination.dependent.skew.doublebin.parameter(1).parameter;
			parameterfit.parameter(2).fit = inputtaperrate.termination.dependent.skew.doublebin.parameter(2).fit;
			parameterfit.parameter(2).parameter = inputtaperrate.termination.dependent.skew.doublebin.parameter(2).parameter;
			if strcmp(inputtaperrate.termination.dependent.skew.doublebin.firstfit,'sigmoid')
				parameterfit.parameter(3).fit = inputtaperrate.termination.dependent.skew.doublebin.parameter(3).fit;
				parameterfit.parameter(3).parameter = inputtaperrate.termination.dependent.skew.doublebin.parameter(3).parameter;
				parameterfit.parameter(4).fit = inputtaperrate.termination.dependent.skew.doublebin.parameter(4).fit;
				parameterfit.parameter(4).parameter = inputtaperrate.termination.dependent.skew.doublebin.parameter(4).parameter;
			end
			skew = parameterfitter(parameterfit);
		end
		
		
		
		if strcmp(inputtaperrate.termination.dependent.kurt.type,'independent')
			kurt = inputtaperrate.termination.kurt;
		elseif strcmp(inputtaperrate.termination.dependent.kurt.type,'singlebin')
			eval(['singlebindata = proximal' inputtaperrate.termination.dependent.kurt.singlebin.dependent ';']);
			if strcmp('linear',inputtaperrate.termination.dependent.kurt.singlebin.fit)
				kurt = inputtaperrate.termination.dependent.kurt.singlebin.parameter(1) * singlebindata + inputtaperrate.termination.dependent.kurt.singlebin.parameter(2);
			elseif strcmp('exponential',inputtaperrate.termination.dependent.kurt.singlebin.fit)
				if ~isnan(inputtaperrate.termination.dependent.kurt.singlebin.parameter(3))
					kurt = inputtaperrate.termination.dependent.kurt.singlebin.parameter(3) + inputtaperrate.termination.dependent.kurt.singlebin.parameter(1) * exp(inputtaperrate.termination.dependent.kurt.singlebin.parameter(2) * singlebindata);				
				else
					kurt = inputtaperrate.termination.dependent.kurt.singlebin.parameter(1) * exp(inputtaperrate.termination.dependent.kurt.singlebin.parameter(2) * singlebindata);
				end
			elseif strcmp('power',inputtaperrate.termination.dependent.kurt.singlebin.fit)
				if ~isnan(inputtaperrate.termination.dependent.kurt.singlebin.parameter(3))
					kurt = inputtaperrate.termination.dependent.kurt.singlebin.parameter(3) + inputtaperrate.termination.dependent.kurt.singlebin.parameter(1) * (singlebindata ^ inputtaperrate.termination.dependent.kurt.singlebin.parameter(2));				
				else
					kurt = inputtaperrate.termination.dependent.kurt.singlebin.parameter(1) * (singlebindata ^ inputtaperrate.termination.dependent.kurt.singlebin.parameter(2));
				end
			elseif strcmp('sigmoid',inputtaperrate.termination.dependent.kurt.singlebin.fit)
				kurt = inputtaperrate.termination.dependent.kurt.singlebin.parameter(1) - inputtaperrate.termination.dependent.kurt.singlebin.parameter(2) * log((inputtaperrate.termination.dependent.kurt.singlebin.parameter(3) / (singlebindata - inputtaperrate.termination.dependent.kurt.singlebin.parameter(4)))-1);
			else
				disp('Error in termination taper rate function.');
				keyboard
			end
		elseif strcmp(inputtaperrate.termination.dependent.kurt.type,'doublebin')
			eval(['firstbindata = proximal' inputtaperrate.termination.dependent.kurt.doublebin.firstbin ';']);
			eval(['secondbindata = proximal' inputtaperrate.termination.dependent.kurt.doublebin.secondbin ';']);
			clear parameterfit;
			parameterfit.firstbin.data = firstbindata;
			parameterfit.secondbin.data = secondbindata;
			parameterfit.firstbin.fit = inputtaperrate.termination.dependent.kurt.doublebin.firstfit;
			parameterfit.parameter(1).fit = inputtaperrate.termination.dependent.kurt.doublebin.parameter(1).fit;
			parameterfit.parameter(1).parameter = inputtaperrate.termination.dependent.kurt.doublebin.parameter(1).parameter;
			parameterfit.parameter(2).fit = inputtaperrate.termination.dependent.kurt.doublebin.parameter(2).fit;
			parameterfit.parameter(2).parameter = inputtaperrate.termination.dependent.kurt.doublebin.parameter(2).parameter;
			if strcmp(inputtaperrate.termination.dependent.kurt.doublebin.firstfit,'sigmoid')
				parameterfit.parameter(3).fit = inputtaperrate.termination.dependent.kurt.doublebin.parameter(3).fit;
				parameterfit.parameter(3).parameter = inputtaperrate.termination.dependent.kurt.doublebin.parameter(3).parameter;
				parameterfit.parameter(4).fit = inputtaperrate.termination.dependent.kurt.doublebin.parameter(4).fit;
				parameterfit.parameter(4).parameter = inputtaperrate.termination.dependent.kurt.doublebin.parameter(4).parameter;
			end
			kurt = parameterfitter(parameterfit);
		end
	end

else
    disp('   Branch type error.');
    disp('   See taperratefunction.m');
    keyboard;
end

if sd < 0 
	if strcmp(branchtype,'b') == 1
		disp('       Warning: SD error in bifurcating branch taper.');
	elseif strcmp(branchtype,'t') == 1
		disp('       Warning: SD error in terminating branch taper.');
	end
	disp('         SD < 0 : SD = 0');
	sd = 0;
end

outputtaperrate.distribution = distribution;
outputtaperrate.mean         = mean;
outputtaperrate.sd           = sd;
outputtaperrate.skew         = skew;
outputtaperrate.kurt         = kurt;
outputtaperrate.const        = constant;
outputtaperrate.min          = minimum;
outputtaperrate.max          = maximum;

if strcmp(outputtaperrate.distribution,'pearson') == 1
	lastwarn('');
	[blank,type] = pearsrnd(mean,sd,skew,kurt,0,0);
	[lastmsg, lastid] = lastwarn;
	if strcmp(lastid,'MATLAB:divideByZero') == 1 || isnan(type) == 1
		if strcmp(branchtype,'b')
			disp('       Sampled bif taper from normal instead of Pearson.');
			disp(sprintf('         Proximal diameter: %f',proximaldiameter)); 
		else
			disp('       Sampled term taper from normal instead of Pearson.');
			disp(sprintf('         Proximal diameter: %f',proximaldiameter)); 
		end
		%             disp(sprintf('Bifurcation Diam: %f',proximaldiameter));
		%             disp(sprintf('Mean: %f',mean));
		%             disp(sprintf('SD  : %f',sd));
		%             disp(sprintf('Skew: %f',skew));
		%             disp(sprintf('Kurt: %f',kurt));
		outputtaperrate.distribution = 'normal';
		taperrate = samplefunction(outputtaperrate);
	else 
		taperrate = samplefunction(outputtaperrate);
	end
else
	taperrate = samplefunction(outputtaperrate);
	%disp(sprintf('Taper Rate: %f',taperrate));
end

if isnan(taperrate) == 1 || isreal(taperrate) ~= 1
	disp('Error: Problem with taper rate.');
	keyboard;
end

