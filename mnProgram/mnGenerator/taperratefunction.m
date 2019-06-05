function taperrate = taperratefunction(branchtype,proximaldiameter,proximalpathlength,input,piecelength)

if strcmp(branchtype,'b') == 1
    
    if strcmp(input.taperrate.bifurcation.mode,'independent')
        distribution = input.taperrate.bifurcation.distribution;
        mean         = input.taperrate.bifurcation.mean;
        sd           = input.taperrate.bifurcation.sd;
        skew         = input.taperrate.bifurcation.skew;
        kurt         = input.taperrate.bifurcation.kurt;
        constant     = input.taperrate.bifurcation.const;
        minimum      = input.taperrate.bifurcation.min;
        maximum      = input.taperrate.bifurcation.max;
        
    else
        distribution = 'pearson';
        constant = NaN;
        minimum = input.taperrate.bifurcation.min;
        maximum = input.taperrate.bifurcation.max;
        clear singlebindata mean sd skew kurt;
        
        if strcmp(input.taperrate.bifurcation.dependent.mean.type,'independent')
            mean = input.taperrate.bifurcation.mean;
        elseif strcmp(input.taperrate.bifurcation.dependent.mean.type,'singlebin')
            eval(['singlebindata = proximal' input.taperrate.bifurcation.dependent.mean.singlebin.dependent ';']);
            if strcmp('linear',input.taperrate.bifurcation.dependent.mean.singlebin.fit)
                mean = input.taperrate.bifurcation.dependent.mean.singlebin.parameter(1) * singlebindata + input.taperrate.bifurcation.dependent.mean.singlebin.parameter(2);
            elseif strcmp('exponential',input.taperrate.bifurcation.dependent.mean.singlebin.fit)
                if ~isnan(input.taperrate.bifurcation.dependent.mean.singlebin.parameter(3))
                    mean = input.taperrate.bifurcation.dependent.mean.singlebin.parameter(3) + input.taperrate.bifurcation.dependent.mean.singlebin.parameter(1) * exp(input.taperrate.bifurcation.dependent.mean.singlebin.parameter(2) * singlebindata);
                else
                    mean = input.taperrate.bifurcation.dependent.mean.singlebin.parameter(1) * exp(input.taperrate.bifurcation.dependent.mean.singlebin.parameter(2) * singlebindata);
                end
            elseif strcmp('power',input.taperrate.bifurcation.dependent.mean.singlebin.fit)
                if ~isnan(input.taperrate.bifurcation.dependent.mean.singlebin.parameter(3))
                    mean = input.taperrate.bifurcation.dependent.mean.singlebin.parameter(3) + input.taperrate.bifurcation.dependent.mean.singlebin.parameter(1) * (singlebindata ^ input.taperrate.bifurcation.dependent.mean.singlebin.parameter(2));
                else
                    mean = input.taperrate.bifurcation.dependent.mean.singlebin.parameter(1) * (singlebindata ^ input.taperrate.bifurcation.dependent.mean.singlebin.parameter(2));
                end
            elseif strcmp('sigmoid',input.taperrate.bifurcation.dependent.mean.singlebin.fit)
                mean = input.taperrate.bifurcation.dependent.mean.singlebin.parameter(1) - input.taperrate.bifurcation.dependent.mean.singlebin.parameter(2) * log((input.taperrate.bifurcation.dependent.mean.singlebin.parameter(3) / (singlebindata - input.taperrate.bifurcation.dependent.mean.singlebin.parameter(4)))-1);
            else
                disp('Error in bifurcation taper rate function (line 35).');
                keyboard
            end
        elseif strcmp(input.taperrate.bifurcation.dependent.mean.type,'doublebin')
            eval(['firstbindata = proximal' input.taperrate.bifurcation.dependent.mean.doublebin.firstbin ';']);
            eval(['secondbindata = proximal' input.taperrate.bifurcation.dependent.mean.doublebin.secondbin ';']);
            clear parameterfit;
            parameterfit.firstbin.data = firstbindata;
            parameterfit.secondbin.data = secondbindata;
            parameterfit.firstbin.fit = input.taperrate.bifurcation.dependent.mean.doublebin.firstfit;
            parameterfit.parameter(1).fit = input.taperrate.bifurcation.dependent.mean.doublebin.parameter(1).fit;
            parameterfit.parameter(1).parameter = input.taperrate.bifurcation.dependent.mean.doublebin.parameter(1).parameter(~isnan(input.taperrate.bifurcation.dependent.mean.doublebin.parameter(1).parameter));
            parameterfit.parameter(2).fit = input.taperrate.bifurcation.dependent.mean.doublebin.parameter(2).fit;
            parameterfit.parameter(2).parameter = input.taperrate.bifurcation.dependent.mean.doublebin.parameter(2).parameter(~isnan(input.taperrate.bifurcation.dependent.mean.doublebin.parameter(2).parameter));
            if strcmp(input.taperrate.bifurcation.dependent.mean.doublebin.firstfit,'sigmoid')
                parameterfit.parameter(3).fit = input.taperrate.bifurcation.dependent.mean.doublebin.parameter(3).fit;
                parameterfit.parameter(3).parameter = input.taperrate.bifurcation.dependent.mean.doublebin.parameter(3).parameter(~isnan(input.taperrate.bifurcation.dependent.mean.doublebin.parameter(3).parameter));
                parameterfit.parameter(4).fit = input.taperrate.bifurcation.dependent.mean.doublebin.parameter(4).fit;
                parameterfit.parameter(4).parameter = input.taperrate.bifurcation.dependent.mean.doublebin.parameter(4).parameter(~isnan(input.taperrate.bifurcation.dependent.mean.doublebin.parameter(4).parameter));
            end
            mean = parameterfitter(parameterfit);
        end
        
        
        
        if strcmp(input.taperrate.bifurcation.dependent.sd.type,'independent')
            sd = input.taperrate.bifurcation.sd;
        elseif strcmp(input.taperrate.bifurcation.dependent.sd.type,'singlebin')
            eval(['singlebindata = proximal' input.taperrate.bifurcation.dependent.sd.singlebin.dependent ';']);
            if strcmp('linear',input.taperrate.bifurcation.dependent.sd.singlebin.fit)
                sd = input.taperrate.bifurcation.dependent.sd.singlebin.parameter(1) * singlebindata + input.taperrate.bifurcation.dependent.sd.singlebin.parameter(2);
            elseif strcmp('exponential',input.taperrate.bifurcation.dependent.sd.singlebin.fit)
                if ~isnan(input.taperrate.bifurcation.dependent.sd.singlebin.parameter(3))
                    sd = input.taperrate.bifurcation.dependent.sd.singlebin.parameter(3) + input.taperrate.bifurcation.dependent.sd.singlebin.parameter(1) * exp(input.taperrate.bifurcation.dependent.sd.singlebin.parameter(2) * singlebindata);
                else
                    sd = input.taperrate.bifurcation.dependent.sd.singlebin.parameter(1) * exp(input.taperrate.bifurcation.dependent.sd.singlebin.parameter(2) * singlebindata);
                end
            elseif strcmp('power',input.taperrate.bifurcation.dependent.sd.singlebin.fit)
                if ~isnan(input.taperrate.bifurcation.dependent.sd.singlebin.parameter(3))
                    sd = input.taperrate.bifurcation.dependent.sd.singlebin.parameter(3) + input.taperrate.bifurcation.dependent.sd.singlebin.parameter(1) * (singlebindata ^ input.taperrate.bifurcation.dependent.sd.singlebin.parameter(2));
                else
                    sd = input.taperrate.bifurcation.dependent.sd.singlebin.parameter(1) * (singlebindata ^ input.taperrate.bifurcation.dependent.sd.singlebin.parameter(2));
                end
            elseif strcmp('sigmoid',input.taperrate.bifurcation.dependent.sd.singlebin.fit)
                sd = input.taperrate.bifurcation.dependent.sd.singlebin.parameter(1) - input.taperrate.bifurcation.dependent.sd.singlebin.parameter(2) * log((input.taperrate.bifurcation.dependent.sd.singlebin.parameter(3) / (singlebindata - input.taperrate.bifurcation.dependent.sd.singlebin.parameter(4)))-1);
            else
                disp('Error in bifurcation taper rate function (line 73).');
                keyboard
            end
        elseif strcmp(input.taperrate.bifurcation.dependent.sd.type,'doublebin')
            eval(['firstbindata = proximal' input.taperrate.bifurcation.dependent.sd.doublebin.firstbin ';']);
            eval(['secondbindata = proximal' input.taperrate.bifurcation.dependent.sd.doublebin.secondbin ';']);
            clear parameterfit;
            parameterfit.firstbin.data = firstbindata;
            parameterfit.secondbin.data = secondbindata;
            parameterfit.firstbin.fit = input.taperrate.bifurcation.dependent.sd.doublebin.firstfit;
            parameterfit.parameter(1).fit = input.taperrate.bifurcation.dependent.sd.doublebin.parameter(1).fit;
            parameterfit.parameter(1).parameter = input.taperrate.bifurcation.dependent.sd.doublebin.parameter(1).parameter;
            parameterfit.parameter(2).fit = input.taperrate.bifurcation.dependent.sd.doublebin.parameter(2).fit;
            parameterfit.parameter(2).parameter = input.taperrate.bifurcation.dependent.sd.doublebin.parameter(2).parameter;
            if strcmp(input.taperrate.bifurcation.dependent.sd.doublebin.firstfit,'sigmoid')
                parameterfit.parameter(3).fit = input.taperrate.bifurcation.dependent.sd.doublebin.parameter(3).fit;
                parameterfit.parameter(3).parameter = input.taperrate.bifurcation.dependent.sd.doublebin.parameter(3).parameter;
                parameterfit.parameter(4).fit = input.taperrate.bifurcation.dependent.sd.doublebin.parameter(4).fit;
                parameterfit.parameter(4).parameter = input.taperrate.bifurcation.dependent.sd.doublebin.parameter(4).parameter;
            end
            sd = parameterfitter(parameterfit);
        end
        
        
        
        if strcmp(input.taperrate.bifurcation.dependent.skew.type,'independent')
            skew = input.taperrate.bifurcation.skew;
        elseif strcmp(input.taperrate.bifurcation.dependent.skew.type,'singlebin')
            eval(['singlebindata = proximal' input.taperrate.bifurcation.dependent.skew.singlebin.dependent ';']);
            if strcmp('linear',input.taperrate.bifurcation.dependent.skew.singlebin.fit)
                skew = input.taperrate.bifurcation.dependent.skew.singlebin.parameter(1) * singlebindata + input.taperrate.bifurcation.dependent.skew.singlebin.parameter(2);
            elseif strcmp('exponential',input.taperrate.bifurcation.dependent.skew.singlebin.fit)
                if ~isnan(input.taperrate.bifurcation.dependent.skew.singlebin.parameter(3))
                    skew = input.taperrate.bifurcation.dependent.skew.singlebin.parameter(3) + input.taperrate.bifurcation.dependent.skew.singlebin.parameter(1) * exp(input.taperrate.bifurcation.dependent.skew.singlebin.parameter(2) * singlebindata);
                else
                    skew = input.taperrate.bifurcation.dependent.skew.singlebin.parameter(1) * exp(input.taperrate.bifurcation.dependent.skew.singlebin.parameter(2) * singlebindata);
                end
            elseif strcmp('power',input.taperrate.bifurcation.dependent.skew.singlebin.fit)
                if ~isnan(input.taperrate.bifurcation.dependent.skew.singlebin.parameter(3))
                    skew = input.taperrate.bifurcation.dependent.skew.singlebin.parameter(3) + input.taperrate.bifurcation.dependent.skew.singlebin.parameter(1) * (singlebindata ^ input.taperrate.bifurcation.dependent.skew.singlebin.parameter(2));
                else
                    skew = input.taperrate.bifurcation.dependent.skew.singlebin.parameter(1) * (singlebindata ^ input.taperrate.bifurcation.dependent.skew.singlebin.parameter(2));
                end
            elseif strcmp('sigmoid',input.taperrate.bifurcation.dependent.skew.singlebin.fit)
                skew = input.taperrate.bifurcation.dependent.skew.singlebin.parameter(1) - input.taperrate.bifurcation.dependent.skew.singlebin.parameter(2) * log((input.taperrate.bifurcation.dependent.skew.singlebin.parameter(3) / (singlebindata - input.taperrate.bifurcation.dependent.skew.singlebin.parameter(4)))-1);
            else
                disp('Error in bifurcation taper rate function (line 111).');
                keyboard
            end
        elseif strcmp(input.taperrate.bifurcation.dependent.skew.type,'doublebin')
            eval(['firstbindata = proximal' input.taperrate.bifurcation.dependent.skew.doublebin.firstbin ';']);
            eval(['secondbindata = proximal' input.taperrate.bifurcation.dependent.skew.doublebin.secondbin ';']);
            clear parameterfit;
            parameterfit.firstbin.data = firstbindata;
            parameterfit.secondbin.data = secondbindata;
            parameterfit.firstbin.fit = input.taperrate.bifurcation.dependent.skew.doublebin.firstfit;
            parameterfit.parameter(1).fit = input.taperrate.bifurcation.dependent.skew.doublebin.parameter(1).fit;
            parameterfit.parameter(1).parameter = input.taperrate.bifurcation.dependent.skew.doublebin.parameter(1).parameter;
            parameterfit.parameter(2).fit = input.taperrate.bifurcation.dependent.skew.doublebin.parameter(2).fit;
            parameterfit.parameter(2).parameter = input.taperrate.bifurcation.dependent.skew.doublebin.parameter(2).parameter;
            if strcmp(input.taperrate.bifurcation.dependent.skew.doublebin.firstfit,'sigmoid')
                parameterfit.parameter(3).fit = input.taperrate.bifurcation.dependent.skew.doublebin.parameter(3).fit;
                parameterfit.parameter(3).parameter = input.taperrate.bifurcation.dependent.skew.doublebin.parameter(3).parameter;
                parameterfit.parameter(4).fit = input.taperrate.bifurcation.dependent.skew.doublebin.parameter(4).fit;
                parameterfit.parameter(4).parameter = input.taperrate.bifurcation.dependent.skew.doublebin.parameter(4).parameter;
            end
            skew = parameterfitter(parameterfit);
        end
        
        
        
        if strcmp(input.taperrate.bifurcation.dependent.kurt.type,'independent')
            kurt = input.taperrate.bifurcation.kurt;
        elseif strcmp(input.taperrate.bifurcation.dependent.kurt.type,'singlebin')
            eval(['singlebindata = proximal' input.taperrate.bifurcation.dependent.kurt.singlebin.dependent ';']);
            if strcmp('linear',input.taperrate.bifurcation.dependent.kurt.singlebin.fit)
                kurt = input.taperrate.bifurcation.dependent.kurt.singlebin.parameter(1) * singlebindata + input.taperrate.bifurcation.dependent.kurt.singlebin.parameter(2);
            elseif strcmp('exponential',input.taperrate.bifurcation.dependent.kurt.singlebin.fit)
                if ~isnan(input.taperrate.bifurcation.dependent.kurt.singlebin.parameter(3))
                    kurt = input.taperrate.bifurcation.dependent.kurt.singlebin.parameter(3) + input.taperrate.bifurcation.dependent.kurt.singlebin.parameter(1) * exp(input.taperrate.bifurcation.dependent.kurt.singlebin.parameter(2) * singlebindata);
                else
                    kurt = input.taperrate.bifurcation.dependent.kurt.singlebin.parameter(1) * exp(input.taperrate.bifurcation.dependent.kurt.singlebin.parameter(2) * singlebindata);
                end
            elseif strcmp('power',input.taperrate.bifurcation.dependent.kurt.singlebin.fit)
                if ~isnan(input.taperrate.bifurcation.dependent.kurt.singlebin.parameter(3))
                    kurt = input.taperrate.bifurcation.dependent.kurt.singlebin.parameter(3) + input.taperrate.bifurcation.dependent.kurt.singlebin.parameter(1) * (singlebindata ^ input.taperrate.bifurcation.dependent.kurt.singlebin.parameter(2));
                else
                    kurt = input.taperrate.bifurcation.dependent.kurt.singlebin.parameter(1) * (singlebindata ^ input.taperrate.bifurcation.dependent.kurt.singlebin.parameter(2));
                end
            elseif strcmp('sigmoid',input.taperrate.bifurcation.dependent.kurt.singlebin.fit)
                kurt = input.taperrate.bifurcation.dependent.kurt.singlebin.parameter(1) - input.taperrate.bifurcation.dependent.kurt.singlebin.parameter(2) * log((input.taperrate.bifurcation.dependent.kurt.singlebin.parameter(3) / (singlebindata - input.taperrate.bifurcation.dependent.kurt.singlebin.parameter(4)))-1);
            else
                disp('Error in bifurcation taper rate function (line 149).');
                keyboard
            end
        elseif strcmp(input.taperrate.bifurcation.dependent.kurt.type,'doublebin')
            eval(['firstbindata = proximal' input.taperrate.bifurcation.dependent.kurt.doublebin.firstbin ';']);
            eval(['secondbindata = proximal' input.taperrate.bifurcation.dependent.kurt.doublebin.secondbin ';']);
            clear parameterfit;
            parameterfit.firstbin.data = firstbindata;
            parameterfit.secondbin.data = secondbindata;
            parameterfit.firstbin.fit = input.taperrate.bifurcation.dependent.kurt.doublebin.firstfit;
            parameterfit.parameter(1).fit = input.taperrate.bifurcation.dependent.kurt.doublebin.parameter(1).fit;
            parameterfit.parameter(1).parameter = input.taperrate.bifurcation.dependent.kurt.doublebin.parameter(1).parameter;
            parameterfit.parameter(2).fit = input.taperrate.bifurcation.dependent.kurt.doublebin.parameter(2).fit;
            parameterfit.parameter(2).parameter = input.taperrate.bifurcation.dependent.kurt.doublebin.parameter(2).parameter;
            if strcmp(input.taperrate.bifurcation.dependent.kurt.doublebin.firstfit,'sigmoid')
                parameterfit.parameter(3).fit = input.taperrate.bifurcation.dependent.kurt.doublebin.parameter(3).fit;
                parameterfit.parameter(3).parameter = input.taperrate.bifurcation.dependent.kurt.doublebin.parameter(3).parameter;
                parameterfit.parameter(4).fit = input.taperrate.bifurcation.dependent.kurt.doublebin.parameter(4).fit;
                parameterfit.parameter(4).parameter = input.taperrate.bifurcation.dependent.kurt.doublebin.parameter(4).parameter;
            end
            kurt = parameterfitter(parameterfit);
        end
    end
    
elseif strcmp(branchtype,'t') == 1
    
    if strcmp(input.taperrate.termination.mode,'independent')
        distribution = input.taperrate.termination.distribution;
        mean         = input.taperrate.termination.mean;
        sd           = input.taperrate.termination.sd;
        skew         = input.taperrate.termination.skew;
        kurt         = input.taperrate.termination.kurt;
        constant     = input.taperrate.termination.const;
        minimum      = input.taperrate.termination.min;
        maximum      = input.taperrate.termination.max;
        
    else
        distribution = 'pearson';
        constant = NaN;
        minimum = input.taperrate.termination.min;
        maximum = input.taperrate.termination.max;
        clear singlebindata mean sd skew kurt;
        
        if strcmp(input.taperrate.termination.dependent.mean.type,'independent')
            mean = input.taperrate.termination.mean;
        elseif strcmp(input.taperrate.termination.dependent.mean.type,'singlebin')
            eval(['singlebindata = proximal' input.taperrate.termination.dependent.mean.singlebin.dependent ';']);
            if strcmp('linear',input.taperrate.termination.dependent.mean.singlebin.fit)
                mean = input.taperrate.termination.dependent.mean.singlebin.parameter(1) * singlebindata + input.taperrate.termination.dependent.mean.singlebin.parameter(2);
            elseif strcmp('exponential',input.taperrate.termination.dependent.mean.singlebin.fit)
                if ~isnan(input.taperrate.termination.dependent.mean.singlebin.parameter(3))
                    mean = input.taperrate.termination.dependent.mean.singlebin.parameter(3) + input.taperrate.termination.dependent.mean.singlebin.parameter(1) * exp(input.taperrate.termination.dependent.mean.singlebin.parameter(2) * singlebindata);
                else
                    mean = input.taperrate.termination.dependent.mean.singlebin.parameter(1) * exp(input.taperrate.termination.dependent.mean.singlebin.parameter(2) * singlebindata);
                end
            elseif strcmp('power',input.taperrate.termination.dependent.mean.singlebin.fit)
                if ~isnan(input.taperrate.termination.dependent.mean.singlebin.parameter(3))
                    mean = input.taperrate.termination.dependent.mean.singlebin.parameter(3) + input.taperrate.termination.dependent.mean.singlebin.parameter(1) * (singlebindata ^ input.taperrate.termination.dependent.mean.singlebin.parameter(2));
                else
                    mean = input.taperrate.termination.dependent.mean.singlebin.parameter(1) * (singlebindata ^ input.taperrate.termination.dependent.mean.singlebin.parameter(2));
                end
            elseif strcmp('sigmoid',input.taperrate.termination.dependent.mean.singlebin.fit)
                mean = input.taperrate.termination.dependent.mean.singlebin.parameter(1) - input.taperrate.termination.dependent.mean.singlebin.parameter(2) * log((input.taperrate.termination.dependent.mean.singlebin.parameter(3) / (singlebindata - input.taperrate.termination.dependent.mean.singlebin.parameter(4)))-1);
            else
                disp('Error in termination taper rate function.');
                keyboard
            end
        elseif strcmp(input.taperrate.termination.dependent.mean.type,'doublebin')
            eval(['firstbindata = proximal' input.taperrate.termination.dependent.mean.doublebin.firstbin ';']);
            eval(['secondbindata = proximal' input.taperrate.termination.dependent.mean.doublebin.secondbin ';']);
            clear parameterfit;
            parameterfit.firstbin.data = firstbindata;
            parameterfit.secondbin.data = secondbindata;
            parameterfit.firstbin.fit = input.taperrate.termination.dependent.mean.doublebin.firstfit;
            parameterfit.parameter(1).fit = input.taperrate.termination.dependent.mean.doublebin.parameter(1).fit;
            parameterfit.parameter(1).parameter = input.taperrate.termination.dependent.mean.doublebin.parameter(1).parameter;
            parameterfit.parameter(2).fit = input.taperrate.termination.dependent.mean.doublebin.parameter(2).fit;
            parameterfit.parameter(2).parameter = input.taperrate.termination.dependent.mean.doublebin.parameter(2).parameter;
            if strcmp(input.taperrate.termination.dependent.mean.doublebin.firstfit,'sigmoid')
                parameterfit.parameter(3).fit = input.taperrate.termination.dependent.mean.doublebin.parameter(3).fit;
                parameterfit.parameter(3).parameter = input.taperrate.termination.dependent.mean.doublebin.parameter(3).parameter;
                parameterfit.parameter(4).fit = input.taperrate.termination.dependent.mean.doublebin.parameter(4).fit;
                parameterfit.parameter(4).parameter = input.taperrate.termination.dependent.mean.doublebin.parameter(4).parameter;
            end
            mean = parameterfitter(parameterfit);
        end
        
        
        
        if strcmp(input.taperrate.termination.dependent.sd.type,'independent')
            sd = input.taperrate.termination.sd;
        elseif strcmp(input.taperrate.termination.dependent.sd.type,'singlebin')
            eval(['singlebindata = proximal' input.taperrate.termination.dependent.sd.singlebin.dependent ';']);
            if strcmp('linear',input.taperrate.termination.dependent.sd.singlebin.fit)
                sd = input.taperrate.termination.dependent.sd.singlebin.parameter(1) * singlebindata + input.taperrate.termination.dependent.sd.singlebin.parameter(2);
            elseif strcmp('exponential',input.taperrate.termination.dependent.sd.singlebin.fit)
                if ~isnan(input.taperrate.termination.dependent.sd.singlebin.parameter(3))
                    sd = input.taperrate.termination.dependent.sd.singlebin.parameter(3) + input.taperrate.termination.dependent.sd.singlebin.parameter(1) * exp(input.taperrate.termination.dependent.sd.singlebin.parameter(2) * singlebindata);
                else
                    sd = input.taperrate.termination.dependent.sd.singlebin.parameter(1) * exp(input.taperrate.termination.dependent.sd.singlebin.parameter(2) * singlebindata);
                end
            elseif strcmp('power',input.taperrate.termination.dependent.sd.singlebin.fit)
                if ~isnan(input.taperrate.termination.dependent.sd.singlebin.parameter(3))
                    sd = input.taperrate.termination.dependent.sd.singlebin.parameter(3) + input.taperrate.termination.dependent.sd.singlebin.parameter(1) * (singlebindata ^ input.taperrate.termination.dependent.sd.singlebin.parameter(2));
                else
                    sd = input.taperrate.termination.dependent.sd.singlebin.parameter(1) * (singlebindata ^ input.taperrate.termination.dependent.sd.singlebin.parameter(2));
                end
            elseif strcmp('sigmoid',input.taperrate.termination.dependent.sd.singlebin.fit)
                sd = input.taperrate.termination.dependent.sd.singlebin.parameter(1) - input.taperrate.termination.dependent.sd.singlebin.parameter(2) * log((input.taperrate.termination.dependent.sd.singlebin.parameter(3) / (singlebindata - input.taperrate.termination.dependent.sd.singlebin.parameter(4)))-1);
            else
                disp('Error in termination taper rate function.');
                keyboard
            end
        elseif strcmp(input.taperrate.termination.dependent.sd.type,'doublebin')
            eval(['firstbindata = proximal' input.taperrate.termination.dependent.sd.doublebin.firstbin ';']);
            eval(['secondbindata = proximal' input.taperrate.termination.dependent.sd.doublebin.secondbin ';']);
            clear parameterfit;
            parameterfit.firstbin.data = firstbindata;
            parameterfit.secondbin.data = secondbindata;
            parameterfit.firstbin.fit = input.taperrate.termination.dependent.sd.doublebin.firstfit;
            parameterfit.parameter(1).fit = input.taperrate.termination.dependent.sd.doublebin.parameter(1).fit;
            parameterfit.parameter(1).parameter = input.taperrate.termination.dependent.sd.doublebin.parameter(1).parameter;
            parameterfit.parameter(2).fit = input.taperrate.termination.dependent.sd.doublebin.parameter(2).fit;
            parameterfit.parameter(2).parameter = input.taperrate.termination.dependent.sd.doublebin.parameter(2).parameter;
            if strcmp(input.taperrate.termination.dependent.sd.doublebin.firstfit,'sigmoid')
                parameterfit.parameter(3).fit = input.taperrate.termination.dependent.sd.doublebin.parameter(3).fit;
                parameterfit.parameter(3).parameter = input.taperrate.termination.dependent.sd.doublebin.parameter(3).parameter;
                parameterfit.parameter(4).fit = input.taperrate.termination.dependent.sd.doublebin.parameter(4).fit;
                parameterfit.parameter(4).parameter = input.taperrate.termination.dependent.sd.doublebin.parameter(4).parameter;
            end
            sd = parameterfitter(parameterfit);
        end
        
        
        
        if strcmp(input.taperrate.termination.dependent.skew.type,'independent')
            skew = input.taperrate.termination.skew;
        elseif strcmp(input.taperrate.termination.dependent.skew.type,'singlebin')
            eval(['singlebindata = proximal' input.taperrate.termination.dependent.skew.singlebin.dependent ';']);
            if strcmp('linear',input.taperrate.termination.dependent.skew.singlebin.fit)
                skew = input.taperrate.termination.dependent.skew.singlebin.parameter(1) * singlebindata + input.taperrate.termination.dependent.skew.singlebin.parameter(2);
            elseif strcmp('exponential',input.taperrate.termination.dependent.skew.singlebin.fit)
                if ~isnan(input.taperrate.termination.dependent.skew.singlebin.parameter(3))
                    skew = input.taperrate.termination.dependent.skew.singlebin.parameter(3) + input.taperrate.termination.dependent.skew.singlebin.parameter(1) * exp(input.taperrate.termination.dependent.skew.singlebin.parameter(2) * singlebindata);
                else
                    skew = input.taperrate.termination.dependent.skew.singlebin.parameter(1) * exp(input.taperrate.termination.dependent.skew.singlebin.parameter(2) * singlebindata);
                end
            elseif strcmp('power',input.taperrate.termination.dependent.skew.singlebin.fit)
                if ~isnan(input.taperrate.termination.dependent.skew.singlebin.parameter(3))
                    skew = input.taperrate.termination.dependent.skew.singlebin.parameter(3) + input.taperrate.termination.dependent.skew.singlebin.parameter(1) * (singlebindata ^ input.taperrate.termination.dependent.skew.singlebin.parameter(2));
                else
                    skew = input.taperrate.termination.dependent.skew.singlebin.parameter(1) * (singlebindata ^ input.taperrate.termination.dependent.skew.singlebin.parameter(2));
                end
            elseif strcmp('sigmoid',input.taperrate.termination.dependent.skew.singlebin.fit)
                skew = input.taperrate.termination.dependent.skew.singlebin.parameter(1) - input.taperrate.termination.dependent.skew.singlebin.parameter(2) * log((input.taperrate.termination.dependent.skew.singlebin.parameter(3) / (singlebindata - input.taperrate.termination.dependent.skew.singlebin.parameter(4)))-1);
            else
                disp('Error in termination taper rate function.');
                keyboard
            end
        elseif strcmp(input.taperrate.termination.dependent.skew.type,'doublebin')
            eval(['firstbindata = proximal' input.taperrate.termination.dependent.skew.doublebin.firstbin ';']);
            eval(['secondbindata = proximal' input.taperrate.termination.dependent.skew.doublebin.secondbin ';']);
            clear parameterfit;
            parameterfit.firstbin.data = firstbindata;
            parameterfit.secondbin.data = secondbindata;
            parameterfit.firstbin.fit = input.taperrate.termination.dependent.skew.doublebin.firstfit;
            parameterfit.parameter(1).fit = input.taperrate.termination.dependent.skew.doublebin.parameter(1).fit;
            parameterfit.parameter(1).parameter = input.taperrate.termination.dependent.skew.doublebin.parameter(1).parameter;
            parameterfit.parameter(2).fit = input.taperrate.termination.dependent.skew.doublebin.parameter(2).fit;
            parameterfit.parameter(2).parameter = input.taperrate.termination.dependent.skew.doublebin.parameter(2).parameter;
            if strcmp(input.taperrate.termination.dependent.skew.doublebin.firstfit,'sigmoid')
                parameterfit.parameter(3).fit = input.taperrate.termination.dependent.skew.doublebin.parameter(3).fit;
                parameterfit.parameter(3).parameter = input.taperrate.termination.dependent.skew.doublebin.parameter(3).parameter;
                parameterfit.parameter(4).fit = input.taperrate.termination.dependent.skew.doublebin.parameter(4).fit;
                parameterfit.parameter(4).parameter = input.taperrate.termination.dependent.skew.doublebin.parameter(4).parameter;
            end
            skew = parameterfitter(parameterfit);
        end
        
        
        
        if strcmp(input.taperrate.termination.dependent.kurt.type,'independent')
            kurt = input.taperrate.termination.kurt;
        elseif strcmp(input.taperrate.termination.dependent.kurt.type,'singlebin')
            eval(['singlebindata = proximal' input.taperrate.termination.dependent.kurt.singlebin.dependent ';']);
            if strcmp('linear',input.taperrate.termination.dependent.kurt.singlebin.fit)
                kurt = input.taperrate.termination.dependent.kurt.singlebin.parameter(1) * singlebindata + input.taperrate.termination.dependent.kurt.singlebin.parameter(2);
            elseif strcmp('exponential',input.taperrate.termination.dependent.kurt.singlebin.fit)
                if ~isnan(input.taperrate.termination.dependent.kurt.singlebin.parameter(3))
                    kurt = input.taperrate.termination.dependent.kurt.singlebin.parameter(3) + input.taperrate.termination.dependent.kurt.singlebin.parameter(1) * exp(input.taperrate.termination.dependent.kurt.singlebin.parameter(2) * singlebindata);
                else
                    kurt = input.taperrate.termination.dependent.kurt.singlebin.parameter(1) * exp(input.taperrate.termination.dependent.kurt.singlebin.parameter(2) * singlebindata);
                end
            elseif strcmp('power',input.taperrate.termination.dependent.kurt.singlebin.fit)
                if ~isnan(input.taperrate.termination.dependent.kurt.singlebin.parameter(3))
                    kurt = input.taperrate.termination.dependent.kurt.singlebin.parameter(3) + input.taperrate.termination.dependent.kurt.singlebin.parameter(1) * (singlebindata ^ input.taperrate.termination.dependent.kurt.singlebin.parameter(2));
                else
                    kurt = input.taperrate.termination.dependent.kurt.singlebin.parameter(1) * (singlebindata ^ input.taperrate.termination.dependent.kurt.singlebin.parameter(2));
                end
            elseif strcmp('sigmoid',input.taperrate.termination.dependent.kurt.singlebin.fit)
                kurt = input.taperrate.termination.dependent.kurt.singlebin.parameter(1) - input.taperrate.termination.dependent.kurt.singlebin.parameter(2) * log((input.taperrate.termination.dependent.kurt.singlebin.parameter(3) / (singlebindata - input.taperrate.termination.dependent.kurt.singlebin.parameter(4)))-1);
            else
                disp('Error in termination taper rate function.');
                keyboard
            end
        elseif strcmp(input.taperrate.termination.dependent.kurt.type,'doublebin')
            eval(['firstbindata = proximal' input.taperrate.termination.dependent.kurt.doublebin.firstbin ';']);
            eval(['secondbindata = proximal' input.taperrate.termination.dependent.kurt.doublebin.secondbin ';']);
            clear parameterfit;
            parameterfit.firstbin.data = firstbindata;
            parameterfit.secondbin.data = secondbindata;
            parameterfit.firstbin.fit = input.taperrate.termination.dependent.kurt.doublebin.firstfit;
            parameterfit.parameter(1).fit = input.taperrate.termination.dependent.kurt.doublebin.parameter(1).fit;
            parameterfit.parameter(1).parameter = input.taperrate.termination.dependent.kurt.doublebin.parameter(1).parameter;
            parameterfit.parameter(2).fit = input.taperrate.termination.dependent.kurt.doublebin.parameter(2).fit;
            parameterfit.parameter(2).parameter = input.taperrate.termination.dependent.kurt.doublebin.parameter(2).parameter;
            if strcmp(input.taperrate.termination.dependent.kurt.doublebin.firstfit,'sigmoid')
                parameterfit.parameter(3).fit = input.taperrate.termination.dependent.kurt.doublebin.parameter(3).fit;
                parameterfit.parameter(3).parameter = input.taperrate.termination.dependent.kurt.doublebin.parameter(3).parameter;
                parameterfit.parameter(4).fit = input.taperrate.termination.dependent.kurt.doublebin.parameter(4).fit;
                parameterfit.parameter(4).parameter = input.taperrate.termination.dependent.kurt.doublebin.parameter(4).parameter;
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

if kurt < (1 + skew^2)
    disp('       Warning: increasing kurtosis in taperrate distribution.');
    kurt = 1.01*(1 + skew^2);
end
    
outputtaperrate.distribution = distribution;
outputtaperrate.mean         = mean;
outputtaperrate.sd           = sd;
outputtaperrate.skew         = skew;
outputtaperrate.kurt         = kurt;
outputtaperrate.const        = constant;
outputtaperrate.min          = minimum;
outputtaperrate.max          = maximum;

distdiam = -1;

if strcmp(branchtype,'b')
    mindiameter = input.minbifurcationdiameter;
else
    mindiameter = input.mindiameter;
end

resamplecount = 0;

while distdiam <= mindiameter && resamplecount <= input.resampleattempts
    if resamplecount > 0
        disp(['         Resampling. Attempt #' int2str(resamplecount)]);
    end
    
    if strcmp(outputtaperrate.distribution,'pearson') == 1
        lastwarn('');
        [blank,type] = pearsrnd(mean,sd,skew,kurt,0,0);
        [lastmsg, lastid] = lastwarn;
        if strcmp(lastid,'MATLAB:divideByZero') == 1 || isnan(type) == 1
            if strcmp(branchtype,'b')
                disp('       Sampled bif taper from normal instead of Pearson.');
                disp(sprintf('         Proximal diameter: %f',proximaldiameter));
                disp(sprintf('         Taper Mean: %f',outputtaperrate.mean));
                disp(sprintf('         Taper StDv: %f',outputtaperrate.sd));
                disp(sprintf('         Taper Skew: %f',outputtaperrate.skew));
                disp(sprintf('         Taper Kurt: %f',outputtaperrate.kurt));
            else
                disp('       Sampled term taper from normal instead of Pearson.');
                disp(sprintf('         Proximal diameter: %f',proximaldiameter));
                disp(sprintf('         Taper Mean: %f',outputtaperrate.mean));
                disp(sprintf('         Taper StDv: %f',outputtaperrate.sd));
                disp(sprintf('         Taper Skew: %f',outputtaperrate.skew));
                disp(sprintf('         Taper Kurt: %f',outputtaperrate.kurt));
            end
            %             disp(sprintf('Bifurcation Diam: %f',proximaldiameter));
            %             disp(sprintf('Mean: %f',mean));
            %             disp(sprintf('SD  : %f',sd));
            %             disp(sprintf('Skew: %f',skew));
            %             disp(sprintf('Kurt: %f',kurt));
            outputtaperrate.distribution = 'normal';
            taperrate = samplefunction(outputtaperrate);
            disp(sprintf('       Sample Taper: %f',taperrate));
        else
            taperrate = samplefunction(outputtaperrate);
        end
    else
        taperrate = samplefunction(outputtaperrate);
        %disp(sprintf('Taper Rate: %f',taperrate));
    end
    
    distdiam = proximaldiameter - (taperrate * piecelength);
    if distdiam <= mindiameter && resamplecount == 0
        disp(sprintf('       Warning: sampled taper resulted in subminimal diameter (%s).',branchtype));
        %disp(sprintf('         Neuron: %d',mnnum));
        %disp(sprintf('         Piece:  %d',piecenum));
    end
    %disp(sprintf('Taper rate:      %f',taperrate));
    %disp(sprintf('Distal Diameter: %f',distdiam));
    
    resamplecount = resamplecount + 1;
end

if distdiam <= 0
    disp('Error: Diameter < 0; check ''taperratefunction.m''.');
    keyboard;
end
if isnan(taperrate) == 1 || isreal(taperrate) ~= 1
    disp('Error: Problem with taper rate.');
    keyboard;
end
if isnan(taperrate) == 1 || isreal(taperrate) ~= 1
    disp('Error: Problem with taper rate.');
    keyboard;
end

