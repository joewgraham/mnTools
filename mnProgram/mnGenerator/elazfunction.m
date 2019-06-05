function [elevation,azimuth] = elazfunction(proximalxposition,proximalyposition,proximalzposition,distalxposition,distalyposition,distalzposition)

mnoptions;

length = ((proximalxposition-distalxposition)^2+(proximalyposition-distalyposition)^2+(proximalzposition-distalzposition)^2)^0.5;

if strcmp(option.mnimport.vertical,'x')
    elevation = asin((distalxposition-proximalxposition)/length);
    azimuth   = atan2((distalzposition-proximalzposition),(distalyposition-proximalyposition));
elseif strcmp(option.mnimport.vertical,'y')
    elevation = asin((distalyposition-proximalyposition)/length);
    azimuth   = atan2((distalzposition-proximalzposition),(distalxposition-proximalxposition));
elseif strcmp(option.mnimport.vertical,'z')
    elevation = asin((distalzposition-proximalzposition)/length);
    azimuth   = atan2((distalyposition-proximalyposition),(distalxposition-proximalxposition));
else
    disp('Error in mnoptions: option.mnimport.vertical.');
    keyboard
end

if azimuth < 0
    azimuth = azimuth + 2*pi;
end

elevation = elevation * 180 / pi;
azimuth   = azimuth * 180 / pi;

if isnan(elevation) || isnan(azimuth) || isinf(elevation) || isinf(azimuth)
    disp('Warning: NaN or Inf in ''elazfunction''.');
    keyboard;
end

if abs(elevation) > 90 || azimuth < 0 || azimuth > 360
    disp('See elazfunction.');
    keyboard;
end