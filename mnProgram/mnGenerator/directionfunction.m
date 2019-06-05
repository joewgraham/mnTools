function [xdirection,ydirection,zdirection] = directionfunction(elevation,azimuth)

mnoptions;

if strcmp(option.mnimport.vertical,'x')
    xdirection = cos((pi()/180)*(90-elevation));
    ydirection = sin((pi()/180)*(90-elevation))*cos((pi()/180)*azimuth);
    zdirection = sin((pi()/180)*(90-elevation))*sin((pi()/180)*azimuth);
elseif strcmp(option.mnimport.vertical,'y')
    xdirection = sin((pi()/180)*(90-elevation))*cos((pi()/180)*azimuth);
    ydirection = cos((pi()/180)*(90-elevation));
    zdirection = -sin((pi()/180)*(90-elevation))*sin((pi()/180)*azimuth);
elseif strcmp(option.mnimport.vertical,'z')
    xdirection = sin((pi()/180)*(90-elevation))*cos((pi()/180)*azimuth);
    ydirection = sin((pi()/180)*(90-elevation))*sin((pi()/180)*azimuth);
    zdirection = cos((pi()/180)*(90-elevation));
else
    disp('Error in mnoptions: option.mnimport.vertical.');
    keyboard
end


