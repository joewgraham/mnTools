function trunkdistances = distancesfromcentroidfunction(input,numbertrunks,soma)

for trunknum = 1:length(numbertrunks)
    
    if strcmp(input.distancefromcentroid.dependence,'none')
        
        if strcmp(input.distancefromcentroid.distribution,'constant')
            distanceinput.distribution = 'constant';
            distanceinput.min = input.distancefromcentroid.parameter(1).value;
            distanceinput.max = input.distancefromcentroid.parameter(2).value;
        elseif strcmp(input.distancefromcentroid.distribution,'uniform')
            distanceinput.distribution = 'uniform';
            distanceinput.min = input.distancefromcentroid.parameter(1).value;
            distanceinput.max = input.distancefromcentroid.parameter(2).value;
        elseif strcmp(input.distancefromcentroid.distribution,'normal')
            distanceinput.distribution = 'normal';
            distanceinput.mean = input.distancefromcentroid.parameter(1).value;
            distanceinput.sd   = input.distancefromcentroid.parameter(2).value;
        elseif strcmp(input.distancefromcentroid.distribution,'pearson')
            distanceinput.distribution = 'pearson';
            distanceinput.mean = input.distancefromcentroid.parameter(1).value;
            distanceinput.sd   = input.distancefromcentroid.parameter(2).value;
            distanceinput.skew = input.distancefromcentroid.parameter(3).value;
            distanceinput.kurt = input.distancefromcentroid.parameter(4).value;
        else
            disp('Error in ''distancesfromcentroidfunction''.');
            keyboard
        end
        
        
    elseif strcmp(input.distancefromcentroid.dependence,'soma.diameter') || strcmp(input.distancefromcentroid.dependence,'soma.csa') || strcmp(input.distancefromcentroid.dependence,'soma.volume')
        eval(['distancevariable = ' input.distancefromcentroid.dependence ';']);
        distanceinput.min = NaN;
        distanceinput.max = NaN;
        if strcmp(input.distancefromcentroid.distribution,'normal')
            distanceinput.distribution = 'normal';
            if strcmp(input.distancefromcentroid.parameter(1).fit,'linear')
                distanceinput.mean = input.distancefromcentroid.parameter(1).parameter(1) * distancevariable + input.distancefromcentroid.parameter(1).parameter(2);
            elseif strcmp(input.distancefromcentroid.parameter(1).fit,'exponential')
                distanceinput.mean = input.distancefromcentroid.parameter(1).parameter(1) * exp(distancevariable * input.distancefromcentroid.parameter(1).parameter(2));
            elseif strcmp(input.distancefromcentroid.parameter(1).fit,'power')
                distanceinput.mean = input.distancefromcentroid.parameter(1).parameter(1) * (distancevariable ^ input.distancefromcentroid.parameter(1).parameter(2));
            else
                disp('Error in ''distancesfromcentroidfunction''.');
                keyboard
            end
            if strcmp(input.distancefromcentroid.parameter(2).fit,'linear')
                distanceinput.sd = input.distancefromcentroid.parameter(2).parameter(1) * distancevariable + input.distancefromcentroid.parameter(2).parameter(2);
            elseif strcmp(input.distancefromcentroid.parameter(2).fit,'exponential')
                distanceinput.sd = input.distancefromcentroid.parameter(2).parameter(1) * exp(distancevariable * input.distancefromcentroid.parameter(2).parameter(2));
            elseif strcmp(input.distancefromcentroid.parameter(2).fit,'power')
                distanceinput.sd = input.distancefromcentroid.parameter(2).parameter(1) * (distancevariable ^ input.distancefromcentroid.parameter(2).parameter(2));
            else
                disp('Error in ''distancesfromcentroidfunction''.');
                keyboard
            end
        else
            disp('Error in ''distancesfromcentroidfunction'', only normal distribution allowed.');
            keyboard
        end
        
    else
        disp('Error in ''distancesfromcentroidfunction''.');
        keyboard
    end
    
    trunkdistances(trunknum) = samplefunction(distanceinput);
    
end