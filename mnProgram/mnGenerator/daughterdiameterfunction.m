function diameter = daughterdiameterfunction(daughters,daughterratio,rallratio,rallexponent,parentdiameter,firstdaughterdiameter)

if daughters==0
    
    %diameter=((rallratio*parentdiameter^rallexponent)*(daughterratio/(1+daughterratio)))^(1/rallexponent);
	
	diameter = ( (rallratio*(parentdiameter^rallexponent))/(1+(1/(daughterratio^rallexponent))) )^(1/rallexponent);
   
elseif daughters==1
    
    diameter=firstdaughterdiameter/daughterratio;
    
else
    
    disp('Error: attempting to add third branch to bifurcation point.');
    keyboard;
    
end

if isnan(diameter) == 1 || isreal(diameter) ~= 1
    disp('Error: problem with daughter diameter.');
    keyboard;
end