function [elevationfromcentroid,azimuthfromcentroid] = directionsfromcentroidfunction(input,numbertrunks)

for trunknum = 1:numbertrunks
    
    if strcmp(input.elevationfromcentroid.distribution,'constant')
        elevationinput.distribution = 'constant';
        elevationinput.min = input.elevationfromcentroid.parameter(1).value;
        elevationinput.max = input.elevationfromcentroid.parameter(2).value;
    elseif strcmp(input.elevationfromcentroid.distribution,'uniform')
        elevationinput.distribution = 'uniform';
        elevationinput.min = input.elevationfromcentroid.parameter(1).value;
        elevationinput.max = input.elevationfromcentroid.parameter(2).value;
    elseif strcmp(input.elevationfromcentroid.distribution,'normal')
        elevationinput.distribution = 'normal';
        elevationinput.mean = input.elevationfromcentroid.parameter(1).value;
        elevationinput.sd   = input.elevationfromcentroid.parameter(2).value;
        elevationinput.min = NaN;
        elevationinput.max = NaN;
    elseif strcmp(input.elevationfromcentroid.distribution,'pearson')
        elevationinput.distribution = 'pearson';
        elevationinput.mean = input.elevationfromcentroid.parameter(1).value;
        elevationinput.sd   = input.elevationfromcentroid.parameter(2).value;
        elevationinput.skew = input.elevationfromcentroid.parameter(3).value;
        elevationinput.kurt = input.elevationfromcentroid.parameter(4).value;
        elevationinput.min = NaN;
        elevationinput.max = NaN;
    else
        disp('Error in ''directions from centroid function''.');
        keyboard
    end
    
    elevationfromcentroid(trunknum) = samplefunction(elevationinput);
    if elevationfromcentroid(trunknum) > 90
        elevationfromcentroid(trunknum) = 180 - elevationfromcentroid(trunknum);
    elseif elevationfromcentroid(trunknum) < -90
        elevationfromcentroid(trunknum) = -(180 + elevationfromcentroid(trunknum));
    end
    
    if strcmp(input.azimuthfromcentroid.distribution,'constant')
        azimuthinput.distribution = 'constant';
        azimuthinput.min = input.azimuthfromcentroid.parameter(1).value;
        azimuthinput.max = input.azimuthfromcentroid.parameter(2).value;
    elseif strcmp(input.azimuthfromcentroid.distribution,'uniform')
        azimuthinput.distribution = 'uniform';
        azimuthinput.min = input.azimuthfromcentroid.parameter(1).value;
        azimuthinput.max = input.azimuthfromcentroid.parameter(2).value;
    elseif strcmp(input.azimuthfromcentroid.distribution,'normal')
        azimuthinput.distribution = 'normal';
        azimuthinput.mean = input.azimuthfromcentroid.parameter(1).value;
        azimuthinput.sd   = input.azimuthfromcentroid.parameter(2).value;
        azimuthinput.min = NaN;
        azimuthinput.max = NaN;
    elseif strcmp(input.azimuthfromcentroid.distribution,'pearson')
        azimuthinput.distribution = 'pearson';
        azimuthinput.mean = input.azimuthfromcentroid.parameter(1).value;
        azimuthinput.sd   = input.azimuthfromcentroid.parameter(2).value;
        azimuthinput.skew = input.azimuthfromcentroid.parameter(3).value;
        azimuthinput.kurt = input.azimuthfromcentroid.parameter(4).value;
        azimuthinput.min = NaN;
        azimuthinput.max = NaN;
    else
        disp('Error in ''directions from centroid function''.');
        keyboard
    end
    
    azimuthfromcentroid(trunknum) = samplefunction(azimuthinput);
    if azimuthfromcentroid(trunknum) > 360
        azimuthfromcentroid(trunknum) = azimuthfromcentroid(trunknum) - 360;
    elseif azimuthfromcentroid(trunknum) < 0
        azimuthfromcentroid(trunknum) = 360 + azimuthfromcentroid(trunknum);
    end
    
end

if max(abs(elevationfromcentroid)) > 90 || min(azimuthfromcentroid) < 0 || max(azimuthfromcentroid) > 360
    disp('See directionsfromcentroidfunction.');
    keyboard;
end