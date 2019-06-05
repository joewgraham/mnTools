function [daughterelevation,daughterazimuth] = daughterdirectionfunction(daughters,daughteranglepop,parentelevation,parentazimuth,firstdaughterxdirection,firstdaughterydirection,firstdaughterzdirection)

if daughters==0
    
    daughterangle     = samplefunction(daughteranglepop);
    daughterelevation = parentelevation+daughterangle;
    daughterangle     = samplefunction(daughteranglepop);
    daughterazimuth   = parentazimuth+daughterangle;
      
elseif daughters==1
    
    interdaughterangle = daughteranglepop.minangle - 1;
    
    while interdaughterangle < daughteranglepop.minangle
        
        daughterangle     = samplefunction(daughteranglepop);
        daughterelevation = parentelevation+daughterangle;
        daughterangle     = samplefunction(daughteranglepop);
        daughterazimuth   = parentazimuth+daughterangle;

        x = sin((pi()/180) * (90-daughterelevation)) * cos((pi()/180) * (daughterazimuth));
        y = sin((pi()/180) * (90-daughterelevation)) * sin((pi()/180) * (daughterazimuth));
        z = cos((pi()/180) * (90-daughterelevation));

        direction              = [x y z];
        firstdaughterdirection = [firstdaughterxdirection firstdaughterydirection firstdaughterzdirection];

        interdaughterangle=acos(dot(direction,firstdaughterdirection))*(180/pi);
    
    end
    
else
    
    disp('Error: attempting to add third branch to bifurcation point.');
    keyboard;
    
end

