function primarydendritediameters=primarydendritediametersfunction(numberprimarydendrites,primarydendritediameterpop)
% 

for i=1:numberprimarydendrites
    
    primarydendritediameters(i)=samplefunction(primarydendritediameterpop);
    
end

primarydendritediameters=primarydendritediameters';
