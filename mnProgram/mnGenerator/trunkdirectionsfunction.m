function [trunkelevation,trunkazimuth] = trunkdirectionsfunction(input,trunk)

for trunknum = 1:trunk.number
    
    clear elevationinput;
    clear azimuthinput;
    
    elevationfromcentroid = trunk.elevationfromcentroid(trunknum);
    azimuthfromcentroid = trunk.azimuthfromcentroid(trunknum);
    
    if strcmp(input.trunkelevation.dependence,'none')
        
        if strcmp(input.trunkelevation.distribution,'constant')
            elevationinput.distribution = 'constant';
            elevationinput.min = input.trunkelevation.parameter(1).value;
            elevationinput.max = input.trunkelevation.parameter(2).value;
        elseif strcmp(input.trunkelevation.distribution,'uniform')
            elevationinput.distribution = 'uniform';
            elevationinput.min = input.trunkelevation.parameter(1).value;
            elevationinput.max = input.trunkelevation.parameter(2).value;
        elseif strcmp(input.trunkelevation.distribution,'normal')
            elevationinput.distribution = 'normal';
            elevationinput.mean = input.trunkelevation.parameter(1).value;
            elevationinput.sd   = input.trunkelevation.parameter(2).value;
            elevationinput.min = NaN;
            elevationinput.max = NaN;
        elseif strcmp(input.trunkelevation.distribution,'pearson')
            elevationinput.distribution = 'pearson';
            elevationinput.mean = input.trunkelevation.parameter(1).value;
            elevationinput.sd   = input.trunkelevation.parameter(2).value;
            elevationinput.skew = input.trunkelevation.parameter(3).value;
            elevationinput.kurt = input.trunkelevation.parameter(4).value;
            elevationinput.min = NaN;
            elevationinput.max = NaN;
        else
            disp('Error in ''trunkdirectionsfunction''.');
            keyboard
        end
        
        
    elseif strcmp(input.trunkelevation.dependence,'elevationfromcentroid')
        if strcmp(input.trunkelevation.distribution,'normal')
            elevationinput.distribution = 'normal';
            elevationinput.min = NaN;
            elevationinput.max = NaN;
            if strcmp(input.trunkelevation.parameter(1).fit,'linear')
                elevationinput.mean = input.trunkelevation.parameter(1).parameter(1) * elevationfromcentroid + input.trunkelevation.parameter(1).parameter(2);
            elseif strcmp(input.trunkelevation.parameter(1).fit,'exponential')
                elevationinput.mean = input.trunkelevation.parameter(1).parameter(1) * exp(elevationfromcentroid * input.trunkelevation.parameter(1).parameter(2));
            elseif strcmp(input.trunkelevation.parameter(1).fit,'power')
                elevationinput.mean = input.trunkelevation.parameter(1).parameter(1) * (elevationfromcentroid ^ input.trunkelevation.parameter(1).parameter(2));
            else
                disp('Error in ''trunkdirectionsfunction''.');
                keyboard
            end
            if strcmp(input.trunkelevation.parameter(2).fit,'linear')
                elevationinput.sd = input.trunkelevation.parameter(2).parameter(1) * elevationfromcentroid + input.trunkelevation.parameter(2).parameter(2);
            elseif strcmp(input.trunkelevation.parameter(2).fit,'exponential')
                elevationinput.sd = input.trunkelevation.parameter(2).parameter(1) * exp(elevationfromcentroid * input.trunkelevation.parameter(2).parameter(2));
            elseif strcmp(input.trunkelevation.parameter(2).fit,'power')
                elevationinput.sd = input.trunkelevation.parameter(2).parameter(1) * (elevationfromcentroid ^ input.trunkelevation.parameter(2).parameter(2));
            else
                disp('Error in ''trunkdirectionsfunction''.');
                keyboard
            end
        else
            disp('Error in ''trunkdirectionsfunction'', only normal distribution allowed.');
            keyboard
        end
        
    else
        disp('Error in ''trunkdirectionsfunction''.');
        keyboard
    end
    
    trunkelevation(trunknum) = samplefunction(elevationinput);
    if trunkelevation(trunknum) > 90
        trunkelevation(trunknum) = 180 - trunkelevation(trunknum);
    elseif trunkelevation(trunknum) < -90
        trunkelevation(trunknum) = -(180 + trunkelevation(trunknum));
    end
    
    
    if strcmp(input.trunkazimuth.dependence,'none')
        
        if strcmp(input.trunkazimuth.distribution,'constant')
            azimuthinput.distribution = 'constant';
            azimuthinput.min = input.trunkazimuth.parameter(1).value;
            azimuthinput.max = input.trunkazimuth.parameter(2).value;
        elseif strcmp(input.trunkazimuth.distribution,'uniform')
            azimuthinput.distribution = 'uniform';
            azimuthinput.min = input.trunkazimuth.parameter(1).value;
            azimuthinput.max = input.trunkazimuth.parameter(2).value;
        elseif strcmp(input.trunkazimuth.distribution,'normal')
            azimuthinput.distribution = 'normal';
            azimuthinput.mean = input.trunkazimuth.parameter(1).value;
            azimuthinput.sd   = input.trunkazimuth.parameter(2).value;
            azimuthinput.min = NaN;
            azimuthinput.max = NaN;
        elseif strcmp(input.trunkazimuth.distribution,'pearson')
            azimuthinput.distribution = 'pearson';
            azimuthinput.mean = input.trunkazimuth.parameter(1).value;
            azimuthinput.sd   = input.trunkazimuth.parameter(2).value;
            azimuthinput.skew = input.trunkazimuth.parameter(3).value;
            azimuthinput.kurt = input.trunkazimuth.parameter(4).value;
            azimuthinput.min = NaN;
            azimuthinput.max = NaN;
        else
            disp('Error in ''trunkdirectionsfunction''.');
            keyboard
        end
        
        
    elseif strcmp(input.trunkazimuth.dependence,'azimuthfromcentroid')
        if strcmp(input.trunkazimuth.distribution,'normal')
            azimuthinput.distribution = 'normal';
            azimuthinput.min = NaN;
            azimuthinput.max = NaN;
            if strcmp(input.trunkazimuth.parameter(1).fit,'linear')
                azimuthinput.mean = input.trunkazimuth.parameter(1).parameter(1) * azimuthfromcentroid + input.trunkazimuth.parameter(1).parameter(2);
            elseif strcmp(input.trunkazimuth.parameter(1).fit,'exponential')
                azimuthinput.mean = input.trunkazimuth.parameter(1).parameter(1) * exp(azimuthfromcentroid * input.trunkazimuth.parameter(1).parameter(2));
            elseif strcmp(input.trunkazimuth.parameter(1).fit,'power')
                azimuthinput.mean = input.trunkazimuth.parameter(1).parameter(1) * (azimuthfromcentroid ^ input.trunkazimuth.parameter(1).parameter(2));
            else
                disp('Error in ''trunkdirectionsfunction''.');
                keyboard
            end
            if strcmp(input.trunkazimuth.parameter(2).fit,'linear')
                azimuthinput.sd = input.trunkazimuth.parameter(2).parameter(1) * azimuthfromcentroid + input.trunkazimuth.parameter(2).parameter(2);
            elseif strcmp(input.trunkazimuth.parameter(2).fit,'exponential')
                azimuthinput.sd = input.trunkazimuth.parameter(2).parameter(1) * exp(azimuthfromcentroid * input.trunkazimuth.parameter(2).parameter(2));
            elseif strcmp(input.trunkazimuth.parameter(2).fit,'power')
                azimuthinput.sd = input.trunkazimuth.parameter(2).parameter(1) * (azimuthfromcentroid ^ input.trunkazimuth.parameter(2).parameter(2));
            else
                disp('Error in ''trunkdirectionsfunction''.');
                keyboard
            end
        else
            disp('Error in ''trunkdirectionsfunction'', only normal distribution allowed.');
            keyboard
        end
        
    else
        disp('Error in ''trunkdirectionsfunction''.');
        keyboard
    end
    
    trunkazimuth(trunknum) = samplefunction(azimuthinput);
    if trunkazimuth(trunknum) > 360
        trunkazimuth(trunknum) = trunkazimuth(trunknum) -360;
    elseif trunkazimuth(trunknum) < 0
        trunkazimuth(trunknum) = 360 + trunkazimuth(trunknum);
    end
    
end

if max(abs(trunkelevation)) > 90 || min(trunkazimuth) < 0 || max(trunkazimuth) > 360
    disp('See trunkdirectionsfunction.');
    keyboard;
end