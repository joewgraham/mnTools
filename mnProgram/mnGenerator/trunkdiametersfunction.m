function trunkdiameter = trunkdiametersfunction(input,trunk,soma)

for trunknum = 1:trunk.number;
    
    if strcmp(input.trunkdiameter.dependence,'none')
        
        if strcmp(input.trunkdiameter.distribution,'constant')
            diameterinput.distribution = 'constant';
            diameterinput.min = input.trunkdiameter.parameter(1).value;
            diameterinput.max = input.trunkdiameter.parameter(2).value;
        elseif strcmp(input.trunkdiameter.distribution,'uniform')
            diameterinput.distribution = 'uniform';
            diameterinput.min = input.trunkdiameter.parameter(1).value;
            diameterinput.max = input.trunkdiameter.parameter(2).value;
        elseif strcmp(input.trunkdiameter.distribution,'normal')
            diameterinput.distribution = 'normal';
            diameterinput.mean = input.trunkdiameter.parameter(1).value;
            diameterinput.sd   = input.trunkdiameter.parameter(2).value;
            diameterinput.min = 0;
            diameterinput.max = NaN;
        elseif strcmp(input.trunkdiameter.distribution,'pearson')
            diameterinput.distribution = 'pearson';
            diameterinput.mean = input.trunkdiameter.parameter(1).value;
            diameterinput.sd   = input.trunkdiameter.parameter(2).value;
            diameterinput.skew = input.trunkdiameter.parameter(3).value;
            diameterinput.kurt = input.trunkdiameter.parameter(4).value;
            diameterinput.min = 0;
            diameterinput.max = NaN;
        else
            disp('Error in ''trunkdirectionsfunction''.');
            keyboard
        end
        
    elseif strcmp(input.trunkdiameter.dependence,'soma.diameter') || strcmp(input.trunkdiameter.dependence,'soma.csa') || strcmp(input.trunkdiameter.dependence,'soma.volume')
        
        eval(['somasize = ' input.trunkdiameter.dependence ';']);
        
        if strcmp(input.trunkdiameter.distribution,'normal')
            diameterinput.distribution = 'normal';
            diameterinput.min = 0;
            diameterinput.max = NaN;
            if strcmp(input.trunkdiameter.parameter(1).fit,'linear')
                diameterinput.mean = input.trunkdiameter.parameter(1).parameter(1) * somasize + input.trunkdiameter.parameter(1).parameter(2);
            elseif strcmp(input.trunkdiameter.parameter(1).fit,'exponential')
                diameterinput.mean = input.trunkdiameter.parameter(1).parameter(1) * exp(somasize * input.trunkdiameter.parameter(1).parameter(2));
            elseif strcmp(input.trunkdiameter.parameter(1).fit,'power')
                diameterinput.mean = input.trunkdiameter.parameter(1).parameter(1) * (somasize ^ input.trunkdiameter.parameter(1).parameter(2));
            else
                disp('Error in ''trunkdirectionsfunction''.');
                keyboard
            end
            if strcmp(input.trunkdiameter.parameter(2).fit,'linear')
                diameterinput.sd = input.trunkdiameter.parameter(2).parameter(1) * somasize + input.trunkdiameter.parameter(2).parameter(2);
            elseif strcmp(input.trunkdiameter.parameter(2).fit,'exponential')
                diameterinput.sd = input.trunkdiameter.parameter(2).parameter(1) * exp(somasize * input.trunkdiameter.parameter(2).parameter(2));
            elseif strcmp(input.trunkdiameter.parameter(2).fit,'power')
                diameterinput.sd = input.trunkdiameter.parameter(2).parameter(1) * (somasize ^ input.trunkdiameter.parameter(2).parameter(2));
            else
                disp('Error in ''trunkdirectionsfunction''.');
                keyboard
            end
        else
            disp('Error in ''trunkdirectionsfunction'', only normal distribution allowed.');
            keyboard
        end
        
    else
        disp('Error in ''trunkdiametersfunction''.');
        keyboard
    end
    
    trunkdiameter(trunknum) = samplefunction(diameterinput);
    
end

if min(trunkdiameter) <= 0
    disp('   Error: trunk diameter <= 0');
    keyboard;
end


% % Original version
% for i=1:numbertrunks
%     
%     trunkdiameters(i)=samplefunction(trunkdiameterpop);
%     
% end
% 
% trunkdiameters=trunkdiameters';
% 
% if min(trunkdiameters) <= 0
%     disp('   Error: trunk diameter <= 0');
%     keyboard;
% end
