function [data,analysis]   = diameteranalyzer(data,analysis)

disp('   Diameter analysis started.');

warning('off', 'MATLAB:divideByZero');

for i = 1:length(data.individual)
    diameterbinlengths(i) = length(data.individual(i).diameterbins);
end

[maxdiameterbin,maxlocation] = max(diameterbinlengths);

for i = 1:maxdiameterbin
    data.population.diameterbins(i).rallratio.values            = [];
    data.population.diameterbins(i).rallratio1.values           = [];
    data.population.diameterbins(i).rallratio2.values           = [];
	data.population.diameterbins(i).rallratio3.values           = [];
    data.population.diameterbins(i).daughterratio.values        = [];
    data.population.diameterbins(i).parentdaughterratio.values  = [];
    data.population.diameterbins(i).parentdaughter2ratio.values = [];
    data.population.diameterbins(i).meandiameter.values         = [];
    data.population.diameterbins(i).taperrate.values            = [];
    data.population.diameterbins(i).piecelength.values          = [];
end
    

for i = 1:length(data.individual)
    
    for j = 1:length(data.individual(i).diameterbins)
        
        data.individual(i).diameterbins(j).length                      = 0;
        data.individual(i).diameterbins(j).surfacearea                 = 0;
        data.individual(i).diameterbins(j).volume                      = 0;
        data.individual(i).diameterbins(j).numbersegments              = 0;
        data.individual(i).diameterbins(j).numberbifurcations          = 0;
        data.individual(i).diameterbins(j).numberterminations          = 0;
        data.individual(i).diameterbins(j).numberbifurcatingbranches   = 0;
        data.individual(i).diameterbins(j).numberterminatingbranches   = 0;
        data.individual(i).diameterbins(j).rallratio.values            = [];
        data.individual(i).diameterbins(j).rallratio1.values           = [];
        data.individual(i).diameterbins(j).rallratio2.values           = [];
		data.individual(i).diameterbins(j).rallratio3.values           = [];
        data.individual(i).diameterbins(j).daughterratio.values        = [];
        data.individual(i).diameterbins(j).parentdaughterratio.values  = [];
        data.individual(i).diameterbins(j).parentdaughter2ratio.values = [];
        data.individual(i).diameterbins(j).meandiameter.values         = [];
        data.individual(i).diameterbins(j).taperrate.values            = [];
        data.individual(i).diameterbins(j).piecelength.values          = [];
        
        
        if isfield(data.individual(i).diameterbins(j).piece,'id') == 1
        
            data.individual(i).diameterbins(j).length                      = sum([data.individual(i).diameterbins(j).piece.length]);
            data.individual(i).diameterbins(j).surfacearea                 = sum([data.individual(i).diameterbins(j).piece.surfacearea]);
            data.individual(i).diameterbins(j).volume                      = sum([data.individual(i).diameterbins(j).piece.volume]);
            data.individual(i).diameterbins(j).numbersegments              = length(unique([data.individual(i).diameterbins(j).piece.cable]));
            data.individual(i).diameterbins(j).numberbifurcations          = 0;
            data.individual(i).diameterbins(j).numberterminations          = 0;
            data.individual(i).diameterbins(j).numberbifurcatingbranches   = 0;
            data.individual(i).diameterbins(j).numberterminatingbranches   = 0;
            data.individual(i).diameterbins(j).rallratio.values            = [data.individual(i).diameterbins(j).piece.rallratio];
            data.individual(i).diameterbins(j).rallratio1.values           = [data.individual(i).diameterbins(j).piece.rallratio1];
            data.individual(i).diameterbins(j).rallratio2.values           = [data.individual(i).diameterbins(j).piece.rallratio2];
			data.individual(i).diameterbins(j).rallratio3.values           = [data.individual(i).diameterbins(j).piece.rallratio3];
            data.individual(i).diameterbins(j).daughterratio.values        = [data.individual(i).diameterbins(j).piece.daughterratio];
            data.individual(i).diameterbins(j).parentdaughterratio.values  = [data.individual(i).diameterbins(j).piece.parentdaughterratio];
            data.individual(i).diameterbins(j).parentdaughter2ratio.values = [data.individual(i).diameterbins(j).piece.parentdaughter2ratio];
            data.individual(i).diameterbins(j).meandiameter.values         = ([data.individual(i).diameterbins(j).piece.proximaldiameter]+[data.individual(i).diameterbins(j).piece.distaldiameter])/2;            
            data.individual(i).diameterbins(j).taperrate.values            = [data.individual(i).diameterbins(j).piece.taperrate];
            data.individual(i).diameterbins(j).piecelength.values          = [data.individual(i).diameterbins(j).piece.length];
            
            for k = 1:length(data.individual(i).diameterbins(j).piece)           
                if strcmp(data.individual(i).diameterbins(j).piece(k).distaltype,'bifurcation')==1
                    data.individual(i).diameterbins(j).numberbifurcations = 1 + data.individual(i).diameterbins(j).numberbifurcations;
                end
                if strcmp(data.individual(i).diameterbins(j).piece(k).distaltype,'termination')==1
                    data.individual(i).diameterbins(j).numberterminations = 1 + data.individual(i).diameterbins(j).numberterminations;
                end
                if strcmp(data.individual(i).diameterbins(j).piece(k).proximaltype,'primary    ') ==1 || strcmp(data.individual(i).diameterbins(j).piece(k).proximaltype,'daughter1  ') ==1 || strcmp(data.individual(i).diameterbins(j).piece(k).proximaltype,'daughter2  ') ==1
                    if strcmp(data.individual(i).diameterbins(j).piece(k).branchtype,'b') == 1
                        data.individual(i).diameterbins(j).numberbifurcatingbranches = 1 + data.individual(i).diameterbins(j).numberbifurcatingbranches;
                    elseif strcmp(data.individual(i).diameterbins(j).piece(k).branchtype,'t') == 1
                        data.individual(i).diameterbins(j).numberterminatingbranches = 1 + data.individual(i).diameterbins(j).numberterminatingbranches;
                    else disp('       Error in diameter analyzer: piece branch type not identified.');
                    end
                end
            end   
        end
            

        if isfield(data.population,'diameterbins') == 0; nextvalue = 1;
        elseif j > length(data.population.diameterbins); nextvalue = 1;
        elseif isfield(data.population.diameterbins(j),'length') == 0; nextvalue = 1;
        elseif isfield(data.population.diameterbins(j).length,'values') == 0; nextvalue = 1;
        else nextvalue = 1 + length(data.population.diameterbins(j).length.values);
        end
        data.population.diameterbins(j).length.values(nextvalue)                    = data.individual(i).diameterbins(j).length;
        data.population.diameterbins(j).surfacearea.values(nextvalue)               = data.individual(i).diameterbins(j).surfacearea;
        data.population.diameterbins(j).volume.values(nextvalue)                    = data.individual(i).diameterbins(j).volume;
        data.population.diameterbins(j).numbersegments.values(nextvalue)            = data.individual(i).diameterbins(j).numbersegments;
        data.population.diameterbins(j).numberbifurcations.values(nextvalue)        = data.individual(i).diameterbins(j).numberbifurcations;
        data.population.diameterbins(j).numberterminations.values(nextvalue)        = data.individual(i).diameterbins(j).numberterminations;
        data.population.diameterbins(j).numberbifurcatingbranches.values(nextvalue) = data.individual(i).diameterbins(j).numberbifurcatingbranches;
        data.population.diameterbins(j).numberterminatingbranches.values(nextvalue) = data.individual(i).diameterbins(j).numberterminatingbranches;
        data.population.diameterbins(j).rallratio.values                            = [ [data.population.diameterbins(j).rallratio.values] [data.individual(i).diameterbins(j).rallratio.values] ];
        data.population.diameterbins(j).rallratio1.values                           = [ [data.population.diameterbins(j).rallratio1.values] [data.individual(i).diameterbins(j).rallratio1.values] ];
        data.population.diameterbins(j).rallratio2.values                           = [ [data.population.diameterbins(j).rallratio2.values] [data.individual(i).diameterbins(j).rallratio2.values] ];
		data.population.diameterbins(j).rallratio3.values                           = [ [data.population.diameterbins(j).rallratio3.values] [data.individual(i).diameterbins(j).rallratio3.values] ];
        data.population.diameterbins(j).daughterratio.values                        = [ [data.population.diameterbins(j).daughterratio.values] [data.individual(i).diameterbins(j).daughterratio.values] ];
        data.population.diameterbins(j).parentdaughterratio.values                  = [ [data.population.diameterbins(j).parentdaughterratio.values] [data.individual(i).diameterbins(j).parentdaughterratio.values] ];
        data.population.diameterbins(j).parentdaughter2ratio.values                 = [ [data.population.diameterbins(j).parentdaughter2ratio.values] [data.individual(i).diameterbins(j).parentdaughter2ratio.values] ];
        data.population.diameterbins(j).meandiameter.values                         = [ [data.population.diameterbins(j).meandiameter.values] [data.individual(i).diameterbins(j).meandiameter.values] ];
        data.population.diameterbins(j).taperrate.values                            = [ [data.population.diameterbins(j).taperrate.values] [data.individual(i).diameterbins(j).taperrate.values] ];
        data.population.diameterbins(j).piecelength.values                          = [ [data.population.diameterbins(j).piecelength.values] [data.individual(i).diameterbins(j).piecelength.values] ];
        
        clear nextvalue;

    end
end


for i = 1:length(data.population.diameterbins)
    
    analysis.diameter.diameter(i) = data.individual(maxlocation).diameterbinmiddles(i);
    
    if isfield(data.population.diameterbins(i).length,'values') == 1
    
        analysis.diameter.length(i).values           = data.population.diameterbins(i).length.values;
        analysis.diameter.length(i).mean             = mean([analysis.diameter.length(i).values]);
        analysis.diameter.length(i).std              = std([analysis.diameter.length(i).values]);
        analysis.diameter.length(i).max              = max([analysis.diameter.length(i).values]);
        analysis.diameter.length(i).min              = min([analysis.diameter.length(i).values]);
        analysis.diameter.length(i).skew             = skewness([analysis.diameter.length(i).values],0);
        analysis.diameter.length(i).kurt             = kurtosis([analysis.diameter.length(i).values],0);
        analysis.diameter.length(i).total            = sum([analysis.diameter.length(i).values]);

        analysis.diameter.surfacearea(i).values           = data.population.diameterbins(i).surfacearea.values;
        analysis.diameter.surfacearea(i).mean             = mean([analysis.diameter.surfacearea(i).values]);
        analysis.diameter.surfacearea(i).std              = std([analysis.diameter.surfacearea(i).values]);
        analysis.diameter.surfacearea(i).max              = max([analysis.diameter.surfacearea(i).values]);
        analysis.diameter.surfacearea(i).min              = min([analysis.diameter.surfacearea(i).values]);
        analysis.diameter.surfacearea(i).skew             = skewness([analysis.diameter.surfacearea(i).values],0);
        analysis.diameter.surfacearea(i).kurt             = kurtosis([analysis.diameter.surfacearea(i).values],0);
        analysis.diameter.surfacearea(i).total            = sum([analysis.diameter.surfacearea(i).values]);

        analysis.diameter.volume(i).values           = data.population.diameterbins(i).volume.values;
        analysis.diameter.volume(i).mean             = mean([analysis.diameter.volume(i).values]);
        analysis.diameter.volume(i).std              = std([analysis.diameter.volume(i).values]);
        analysis.diameter.volume(i).max              = max([analysis.diameter.volume(i).values]);
        analysis.diameter.volume(i).min              = min([analysis.diameter.volume(i).values]);
        analysis.diameter.volume(i).skew             = skewness([analysis.diameter.volume(i).values],0);
        analysis.diameter.volume(i).kurt             = kurtosis([analysis.diameter.volume(i).values],0);
        analysis.diameter.volume(i).total            = sum([analysis.diameter.volume(i).values]);

        analysis.diameter.numbersegments(i).values           = data.population.diameterbins(i).numbersegments.values;
        analysis.diameter.numbersegments(i).mean             = mean([analysis.diameter.numbersegments(i).values]);
        analysis.diameter.numbersegments(i).std              = std([analysis.diameter.numbersegments(i).values]);
        analysis.diameter.numbersegments(i).max              = max([analysis.diameter.numbersegments(i).values]);
        analysis.diameter.numbersegments(i).min              = min([analysis.diameter.numbersegments(i).values]);
        analysis.diameter.numbersegments(i).skew             = skewness([analysis.diameter.numbersegments(i).values],0);
        analysis.diameter.numbersegments(i).kurt             = kurtosis([analysis.diameter.numbersegments(i).values],0);
        analysis.diameter.numbersegments(i).total            = sum([analysis.diameter.numbersegments(i).values]);

        analysis.diameter.numberbifurcations(i).values           = data.population.diameterbins(i).numberbifurcations.values;
        analysis.diameter.numberbifurcations(i).mean             = mean([analysis.diameter.numberbifurcations(i).values]);
        analysis.diameter.numberbifurcations(i).std              = std([analysis.diameter.numberbifurcations(i).values]);
        analysis.diameter.numberbifurcations(i).max              = max([analysis.diameter.numberbifurcations(i).values]);
        analysis.diameter.numberbifurcations(i).min              = min([analysis.diameter.numberbifurcations(i).values]);
        analysis.diameter.numberbifurcations(i).skew             = skewness([analysis.diameter.numberbifurcations(i).values],0);
        analysis.diameter.numberbifurcations(i).kurt             = kurtosis([analysis.diameter.numberbifurcations(i).values],0);
        analysis.diameter.numberbifurcations(i).total            = sum([analysis.diameter.numberbifurcations(i).values]);

        analysis.diameter.numberterminations(i).values           = data.population.diameterbins(i).numberterminations.values;
        analysis.diameter.numberterminations(i).mean             = mean([analysis.diameter.numberterminations(i).values]);
        analysis.diameter.numberterminations(i).std              = std([analysis.diameter.numberterminations(i).values]);
        analysis.diameter.numberterminations(i).max              = max([analysis.diameter.numberterminations(i).values]);
        analysis.diameter.numberterminations(i).min              = min([analysis.diameter.numberterminations(i).values]);
        analysis.diameter.numberterminations(i).skew             = skewness([analysis.diameter.numberterminations(i).values],0);
        analysis.diameter.numberterminations(i).kurt             = kurtosis([analysis.diameter.numberterminations(i).values],0);
        analysis.diameter.numberterminations(i).total            = sum([analysis.diameter.numberterminations(i).values]);
        
        analysis.diameter.numberbifurcatingbranches(i).values           = data.population.diameterbins(i).numberbifurcatingbranches.values;
        analysis.diameter.numberbifurcatingbranches(i).mean             = mean([analysis.diameter.numberbifurcatingbranches(i).values]);
        analysis.diameter.numberbifurcatingbranches(i).std              = std([analysis.diameter.numberbifurcatingbranches(i).values]);
        analysis.diameter.numberbifurcatingbranches(i).max              = max([analysis.diameter.numberbifurcatingbranches(i).values]);
        analysis.diameter.numberbifurcatingbranches(i).min              = min([analysis.diameter.numberbifurcatingbranches(i).values]);
        analysis.diameter.numberbifurcatingbranches(i).skew             = skewness([analysis.diameter.numberbifurcatingbranches(i).values],0);
        analysis.diameter.numberbifurcatingbranches(i).kurt             = kurtosis([analysis.diameter.numberbifurcatingbranches(i).values],0);
        analysis.diameter.numberbifurcatingbranches(i).total            = sum([analysis.diameter.numberbifurcatingbranches(i).values]);

        analysis.diameter.numberterminatingbranches(i).values           = data.population.diameterbins(i).numberterminatingbranches.values;
        analysis.diameter.numberterminatingbranches(i).mean             = mean([analysis.diameter.numberterminatingbranches(i).values]);
        analysis.diameter.numberterminatingbranches(i).std              = std([analysis.diameter.numberterminatingbranches(i).values]);
        analysis.diameter.numberterminatingbranches(i).max              = max([analysis.diameter.numberterminatingbranches(i).values]);
        analysis.diameter.numberterminatingbranches(i).min              = min([analysis.diameter.numberterminatingbranches(i).values]);
        analysis.diameter.numberterminatingbranches(i).skew             = skewness([analysis.diameter.numberterminatingbranches(i).values],0);
        analysis.diameter.numberterminatingbranches(i).kurt             = kurtosis([analysis.diameter.numberterminatingbranches(i).values],0);
        analysis.diameter.numberterminatingbranches(i).total            = sum([analysis.diameter.numberterminatingbranches(i).values]);

        analysis.diameter.rallratio(i).values           = data.population.diameterbins(i).rallratio.values;
        analysis.diameter.rallratio(i).mean             = mean([analysis.diameter.rallratio(i).values]);
        analysis.diameter.rallratio(i).std              = std([analysis.diameter.rallratio(i).values]);
        analysis.diameter.rallratio(i).max              = max([analysis.diameter.rallratio(i).values]);
        analysis.diameter.rallratio(i).min              = min([analysis.diameter.rallratio(i).values]);
        analysis.diameter.rallratio(i).skew             = skewness([analysis.diameter.rallratio(i).values],0);
        analysis.diameter.rallratio(i).kurt             = kurtosis([analysis.diameter.rallratio(i).values],0);

        analysis.diameter.rallratio1(i).values           = data.population.diameterbins(i).rallratio1.values;
        analysis.diameter.rallratio1(i).mean             = mean([analysis.diameter.rallratio1(i).values]);
        analysis.diameter.rallratio1(i).std              = std([analysis.diameter.rallratio1(i).values]);
        analysis.diameter.rallratio1(i).max              = max([analysis.diameter.rallratio1(i).values]);
        analysis.diameter.rallratio1(i).min              = min([analysis.diameter.rallratio1(i).values]);
        analysis.diameter.rallratio1(i).skew             = skewness([analysis.diameter.rallratio1(i).values],0);
        analysis.diameter.rallratio1(i).kurt             = kurtosis([analysis.diameter.rallratio1(i).values],0);

        analysis.diameter.rallratio2(i).values           = data.population.diameterbins(i).rallratio2.values;
        analysis.diameter.rallratio2(i).mean             = mean([analysis.diameter.rallratio2(i).values]);
        analysis.diameter.rallratio2(i).std              = std([analysis.diameter.rallratio2(i).values]);
        analysis.diameter.rallratio2(i).max              = max([analysis.diameter.rallratio2(i).values]);
        analysis.diameter.rallratio2(i).min              = min([analysis.diameter.rallratio2(i).values]);
        analysis.diameter.rallratio2(i).skew             = skewness([analysis.diameter.rallratio2(i).values],0);
        analysis.diameter.rallratio2(i).kurt             = kurtosis([analysis.diameter.rallratio2(i).values],0);
		
		analysis.diameter.rallratio3(i).values           = data.population.diameterbins(i).rallratio3.values;
        analysis.diameter.rallratio3(i).mean             = mean([analysis.diameter.rallratio3(i).values]);
        analysis.diameter.rallratio3(i).std              = std([analysis.diameter.rallratio3(i).values]);
        analysis.diameter.rallratio3(i).max              = max([analysis.diameter.rallratio3(i).values]);
        analysis.diameter.rallratio3(i).min              = min([analysis.diameter.rallratio3(i).values]);
        analysis.diameter.rallratio3(i).skew             = skewness([analysis.diameter.rallratio3(i).values],0);
        analysis.diameter.rallratio3(i).kurt             = kurtosis([analysis.diameter.rallratio3(i).values],0);

        analysis.diameter.daughterratio(i).values           = data.population.diameterbins(i).daughterratio.values;
        analysis.diameter.daughterratio(i).mean             = mean([analysis.diameter.daughterratio(i).values]);
        analysis.diameter.daughterratio(i).std              = std([analysis.diameter.daughterratio(i).values]);
        analysis.diameter.daughterratio(i).max              = max([analysis.diameter.daughterratio(i).values]);
        analysis.diameter.daughterratio(i).min              = min([analysis.diameter.daughterratio(i).values]);
        analysis.diameter.daughterratio(i).skew             = skewness([analysis.diameter.daughterratio(i).values],0);
        analysis.diameter.daughterratio(i).kurt             = kurtosis([analysis.diameter.daughterratio(i).values],0);

        analysis.diameter.parentdaughterratio(i).values           = data.population.diameterbins(i).parentdaughterratio.values;
        analysis.diameter.parentdaughterratio(i).mean             = mean([analysis.diameter.parentdaughterratio(i).values]);
        analysis.diameter.parentdaughterratio(i).std              = std([analysis.diameter.parentdaughterratio(i).values]);
        analysis.diameter.parentdaughterratio(i).max              = max([analysis.diameter.parentdaughterratio(i).values]);
        analysis.diameter.parentdaughterratio(i).min              = min([analysis.diameter.parentdaughterratio(i).values]);
        analysis.diameter.parentdaughterratio(i).skew             = skewness([analysis.diameter.parentdaughterratio(i).values],0);
        analysis.diameter.parentdaughterratio(i).kurt             = kurtosis([analysis.diameter.parentdaughterratio(i).values],0);

        analysis.diameter.parentdaughter2ratio(i).values           = data.population.diameterbins(i).parentdaughter2ratio.values;
        analysis.diameter.parentdaughter2ratio(i).mean             = mean([analysis.diameter.parentdaughter2ratio(i).values]);
        analysis.diameter.parentdaughter2ratio(i).std              = std([analysis.diameter.parentdaughter2ratio(i).values]);
        analysis.diameter.parentdaughter2ratio(i).max              = max([analysis.diameter.parentdaughter2ratio(i).values]);
        analysis.diameter.parentdaughter2ratio(i).min              = min([analysis.diameter.parentdaughter2ratio(i).values]);
        analysis.diameter.parentdaughter2ratio(i).skew             = skewness([analysis.diameter.parentdaughter2ratio(i).values],0);
        analysis.diameter.parentdaughter2ratio(i).kurt             = kurtosis([analysis.diameter.parentdaughter2ratio(i).values],0);
       
        analysis.diameter.meandiameter(i).values           = data.population.diameterbins(i).meandiameter.values;
        analysis.diameter.meandiameter(i).mean             = sum([data.population.diameterbins(i).meandiameter.values].*[data.population.diameterbins(i).piecelength.values])/sum([data.population.diameterbins(i).piecelength.values]);
        analysis.diameter.meandiameter(i).std              = std([analysis.diameter.meandiameter(i).values]);
        analysis.diameter.meandiameter(i).max              = max([analysis.diameter.meandiameter(i).values]);
        analysis.diameter.meandiameter(i).min              = min([analysis.diameter.meandiameter(i).values]);
        analysis.diameter.meandiameter(i).skew             = skewness([analysis.diameter.meandiameter(i).values],0);
        analysis.diameter.meandiameter(i).kurt             = kurtosis([analysis.diameter.meandiameter(i).values],0);

        analysis.diameter.taperrate(i).values           = data.population.diameterbins(i).taperrate.values;
        analysis.diameter.taperrate(i).mean             = sum([data.population.diameterbins(i).taperrate.values].*[data.population.diameterbins(i).piecelength.values])/sum([data.population.diameterbins(i).piecelength.values]);
        analysis.diameter.taperrate(i).std              = std([analysis.diameter.taperrate(i).values]);
        analysis.diameter.taperrate(i).max              = max([analysis.diameter.taperrate(i).values]);
        analysis.diameter.taperrate(i).min              = min([analysis.diameter.taperrate(i).values]);
        analysis.diameter.taperrate(i).skew             = skewness([analysis.diameter.taperrate(i).values],0);
        analysis.diameter.taperrate(i).kurt             = kurtosis([analysis.diameter.taperrate(i).values],0);

        analysis.diameter.bifurcationprobability.length(i) = analysis.diameter.numberbifurcations(i).total / analysis.diameter.length(i).total;
        analysis.diameter.terminationprobability.length(i) = analysis.diameter.numberterminations(i).total / analysis.diameter.length(i).total;

        analysis.diameter.bifurcationprobability.surfacearea(i) = analysis.diameter.numberbifurcations(i).total / analysis.diameter.surfacearea(i).total;
        analysis.diameter.terminationprobability.surfacearea(i) = analysis.diameter.numberterminations(i).total / analysis.diameter.surfacearea(i).total;

        analysis.diameter.bifurcationprobability.volume(i) = analysis.diameter.numberbifurcations(i).total / analysis.diameter.volume(i).total;
        analysis.diameter.terminationprobability.volume(i) = analysis.diameter.numberterminations(i).total / analysis.diameter.volume(i).total;
		
		%%Begin calculation of sd, skew and kurt from total mean
		% n = length(analysis.diameter.rallratio(i).values);
		% rrmean = mean(analysis.bifurcation.cable.rallratio.values);
		% rrsdsum = 0;
		% rrsksum = 0;
		% rrkusum = 0;
		% rr1mean = mean(analysis.bifurcation.cable.rallratio1.values);
		%%rr1mean = 1.069;
		% rr1sdsum = 0;
		% rr1sksum = 0;
		% rr1kusum = 0;
		% rr2mean = mean(analysis.bifurcation.cable.rallratio2.values);
		% rr2sdsum = 0;
		% rr2sksum = 0;
		% rr2kusum = 0;
		% rr3mean = mean(analysis.bifurcation.cable.rallratio3.values);
		% rr3sdsum = 0;
		% rr3sksum = 0;
		% rr3kusum = 0;
		
		% for j = 1:n
			% rrsdsum = rrsdsum + (analysis.diameter.rallratio(i).values(j) - rrmean)^2;
			% rrsksum = rrsksum + (analysis.diameter.rallratio(i).values(j) - rrmean)^3;
			% rrkusum = rrkusum + (analysis.diameter.rallratio(i).values(j) - rrmean)^4;
			%%rr1sdsum = rr1sdsum + (analysis.diameter.rallratio1(i).values(j) - rr1mean)^2;
			%%rr1sksum = rr1sksum + (analysis.diameter.rallratio1(i).values(j) - rr1mean)^3;
			%%rr1kusum = rr1kusum + (analysis.diameter.rallratio1(i).values(j) - rr1mean)^4;
			% rr1sdsum = rr1sdsum + (analysis.diameter.rallratio1(i).values(j) - (1.0959+0.6837*analysis.diameter.diameter(i)^-1.2281))^2;
			% rr1sksum = rr1sksum + (analysis.diameter.rallratio1(i).values(j) - (1.0959+0.6837*analysis.diameter.diameter(i)^-1.2281))^3;
			% rr1kusum = rr1kusum + (analysis.diameter.rallratio1(i).values(j) - (1.0959+0.6837*analysis.diameter.diameter(i)^-1.2281))^4;
			% rr2sdsum = rr2sdsum + (analysis.diameter.rallratio2(i).values(j) - rr2mean)^2;
			% rr2sksum = rr2sksum + (analysis.diameter.rallratio2(i).values(j) - rr2mean)^3;
			% rr2kusum = rr2kusum + (analysis.diameter.rallratio2(i).values(j) - rr2mean)^4;
			% rr3sdsum = rr3sdsum + (analysis.diameter.rallratio3(i).values(j) - rr3mean)^2;
			% rr3sksum = rr3sksum + (analysis.diameter.rallratio3(i).values(j) - rr3mean)^3;
			% rr3kusum = rr3kusum + (analysis.diameter.rallratio3(i).values(j) - rr3mean)^4;
		% end
		
		% variance(i) = (1/n)*rrsdsum;
		% analysis.diameter.rallratio(i).popmeanstd = variance(i)^0.5;
		% analysis.diameter.rallratio(i).popmeanskew = ((1/n)*rrsksum)/(variance(i)^1.5);
		% analysis.diameter.rallratio(i).popmeankurt = ((1/n)*rrkusum)/(variance(i)^2.0);
		
		% variance1(i) = (1/n)*rr1sdsum;
		% analysis.diameter.rallratio1(i).popmeanstd = variance1(i)^0.5;
		% analysis.diameter.rallratio1(i).popmeanskew = ((1/n)*rr1sksum)/(variance1(i)^1.5);
		% analysis.diameter.rallratio1(i).popmeankurt = ((1/n)*rr1kusum)/(variance1(i)^2.0);
		
		% variance2(i) = (1/n)*rr2sdsum;
		% analysis.diameter.rallratio2(i).popmeanstd = variance2(i)^0.5;
		% analysis.diameter.rallratio2(i).popmeanskew = ((1/n)*rr2sksum)/(variance2(i)^1.5);
		% analysis.diameter.rallratio2(i).popmeankurt = ((1/n)*rr2kusum)/(variance2(i)^2.0);
		
		% variance3(i) = (1/n)*rr3sdsum;
		% analysis.diameter.rallratio3(i).popmeanstd = variance3(i)^0.5;
		% analysis.diameter.rallratio3(i).popmeanskew = ((1/n)*rr3sksum)/(variance3(i)^1.5);
		% analysis.diameter.rallratio3(i).popmeankurt = ((1/n)*rr3kusum)/(variance3(i)^2.0);
		%%End calculation of sd, skew and kurt from total mean
	
    end
end
    
analysis.diameter = orderfields(analysis.diameter);







% Begin bifurcation diameter analysis

clear diameterbinlengths maxdiameterbin maxlocation;

for i = 1:length(data.individual)
    diameterbinlengths(i) = length(data.individual(i).bifurcation.diameterbins);
end

[maxdiameterbin,maxlocation] = max(diameterbinlengths);

for i = 1:maxdiameterbin
    data.population.bifurcation.diameterbins(i).rallratio.values            = [];
    data.population.bifurcation.diameterbins(i).rallratio1.values           = [];
    data.population.bifurcation.diameterbins(i).rallratio2.values           = [];
	data.population.bifurcation.diameterbins(i).rallratio3.values           = [];
    data.population.bifurcation.diameterbins(i).daughterratio.values        = [];
    data.population.bifurcation.diameterbins(i).parentdaughterratio.values  = [];
    data.population.bifurcation.diameterbins(i).parentdaughter2ratio.values = [];
    data.population.bifurcation.diameterbins(i).meandiameter.values         = [];
    data.population.bifurcation.diameterbins(i).taperrate.values            = [];
    data.population.bifurcation.diameterbins(i).piecelength.values          = [];
end
    

for i = 1:length(data.individual)

    for j = 1:length(data.individual(i).bifurcation.diameterbins)

        data.individual(i).bifurcation.diameterbins(j).length                      = 0;
        data.individual(i).bifurcation.diameterbins(j).surfacearea                 = 0;
        data.individual(i).bifurcation.diameterbins(j).volume                      = 0;
        data.individual(i).bifurcation.diameterbins(j).numbersegments              = 0;
        data.individual(i).bifurcation.diameterbins(j).numberbifurcations          = 0;
        data.individual(i).bifurcation.diameterbins(j).rallratio.values            = [];
        data.individual(i).bifurcation.diameterbins(j).rallratio1.values           = [];
        data.individual(i).bifurcation.diameterbins(j).rallratio2.values           = [];
		data.individual(i).bifurcation.diameterbins(j).rallratio3.values           = [];
        data.individual(i).bifurcation.diameterbins(j).daughterratio.values        = [];
        data.individual(i).bifurcation.diameterbins(j).parentdaughterratio.values  = [];
        data.individual(i).bifurcation.diameterbins(j).parentdaughter2ratio.values = [];
        data.individual(i).bifurcation.diameterbins(j).meandiameter.values         = [];
        data.individual(i).bifurcation.diameterbins(j).taperrate.values            = [];
        data.individual(i).bifurcation.diameterbins(j).piecelength.values          = [];
       
        if isfield(data.individual(i).bifurcation.diameterbins(j).piece,'id') == 1

            data.individual(i).bifurcation.diameterbins(j).length                      = sum([data.individual(i).bifurcation.diameterbins(j).piece.length]);
            data.individual(i).bifurcation.diameterbins(j).surfacearea                 = sum([data.individual(i).bifurcation.diameterbins(j).piece.surfacearea]);
            data.individual(i).bifurcation.diameterbins(j).volume                      = sum([data.individual(i).bifurcation.diameterbins(j).piece.volume]);
            data.individual(i).bifurcation.diameterbins(j).numbersegments              = length(unique([data.individual(i).bifurcation.diameterbins(j).piece.cable]));
            data.individual(i).bifurcation.diameterbins(j).rallratio.values            = [data.individual(i).bifurcation.diameterbins(j).piece.rallratio];
            data.individual(i).bifurcation.diameterbins(j).rallratio1.values           = [data.individual(i).bifurcation.diameterbins(j).piece.rallratio1];
            data.individual(i).bifurcation.diameterbins(j).rallratio2.values           = [data.individual(i).bifurcation.diameterbins(j).piece.rallratio2];
			data.individual(i).bifurcation.diameterbins(j).rallratio3.values           = [data.individual(i).bifurcation.diameterbins(j).piece.rallratio3];
            data.individual(i).bifurcation.diameterbins(j).daughterratio.values        = [data.individual(i).bifurcation.diameterbins(j).piece.daughterratio];
            data.individual(i).bifurcation.diameterbins(j).parentdaughterratio.values  = [data.individual(i).bifurcation.diameterbins(j).piece.parentdaughterratio];
            data.individual(i).bifurcation.diameterbins(j).parentdaughter2ratio.values = [data.individual(i).bifurcation.diameterbins(j).piece.parentdaughter2ratio];
            data.individual(i).bifurcation.diameterbins(j).meandiameter.values         = ([data.individual(i).bifurcation.diameterbins(j).piece.proximaldiameter]+[data.individual(i).bifurcation.diameterbins(j).piece.distaldiameter])/2;            
            data.individual(i).bifurcation.diameterbins(j).taperrate.values            = [data.individual(i).bifurcation.diameterbins(j).piece.taperrate];
            data.individual(i).bifurcation.diameterbins(j).piecelength.values          = [data.individual(i).bifurcation.diameterbins(j).piece.length];
           
        end

        for k = 1:length(data.individual(i).bifurcation.diameterbins(j).piece)
            if strcmp(data.individual(i).bifurcation.diameterbins(j).piece(k).distaltype,'bifurcation')==1
                data.individual(i).bifurcation.diameterbins(j).numberbifurcations = 1 + data.individual(i).bifurcation.diameterbins(j).numberbifurcations;
            end
        end
        
        if isfield(data.population,'diameterbins') == 0; nextvalue = 1;
        elseif j > length(data.population.bifurcation.diameterbins); nextvalue = 1;
        elseif isfield(data.population.bifurcation.diameterbins(j),'length') == 0; nextvalue = 1;
        elseif isfield(data.population.bifurcation.diameterbins(j).length,'values') == 0; nextvalue = 1;
        else nextvalue = 1 + length(data.population.bifurcation.diameterbins(j).length.values);
        end
        data.population.bifurcation.diameterbins(j).length.values(nextvalue)             = data.individual(i).bifurcation.diameterbins(j).length;
        data.population.bifurcation.diameterbins(j).surfacearea.values(nextvalue)        = data.individual(i).bifurcation.diameterbins(j).surfacearea;
        data.population.bifurcation.diameterbins(j).volume.values(nextvalue)             = data.individual(i).bifurcation.diameterbins(j).volume;
        data.population.bifurcation.diameterbins(j).numbersegments.values(nextvalue)     = data.individual(i).bifurcation.diameterbins(j).numbersegments;
        data.population.bifurcation.diameterbins(j).numberbifurcations.values(nextvalue) = data.individual(i).bifurcation.diameterbins(j).numberbifurcations;
        data.population.bifurcation.diameterbins(j).rallratio.values                     = [ [data.population.bifurcation.diameterbins(j).rallratio.values] [data.individual(i).bifurcation.diameterbins(j).rallratio.values] ];
        data.population.bifurcation.diameterbins(j).rallratio1.values                    = [ [data.population.bifurcation.diameterbins(j).rallratio1.values] [data.individual(i).bifurcation.diameterbins(j).rallratio1.values] ];
        data.population.bifurcation.diameterbins(j).rallratio2.values                    = [ [data.population.bifurcation.diameterbins(j).rallratio2.values] [data.individual(i).bifurcation.diameterbins(j).rallratio2.values] ];
		data.population.bifurcation.diameterbins(j).rallratio3.values                    = [ [data.population.bifurcation.diameterbins(j).rallratio3.values] [data.individual(i).bifurcation.diameterbins(j).rallratio3.values] ];
        data.population.bifurcation.diameterbins(j).daughterratio.values                 = [ [data.population.bifurcation.diameterbins(j).daughterratio.values] [data.individual(i).bifurcation.diameterbins(j).daughterratio.values] ];
        data.population.bifurcation.diameterbins(j).parentdaughterratio.values           = [ [data.population.bifurcation.diameterbins(j).parentdaughterratio.values] [data.individual(i).bifurcation.diameterbins(j).parentdaughterratio.values] ];
        data.population.bifurcation.diameterbins(j).parentdaughter2ratio.values          = [ [data.population.bifurcation.diameterbins(j).parentdaughter2ratio.values] [data.individual(i).bifurcation.diameterbins(j).parentdaughter2ratio.values] ];
        data.population.bifurcation.diameterbins(j).meandiameter.values                  = [ [data.population.bifurcation.diameterbins(j).meandiameter.values] [data.individual(i).bifurcation.diameterbins(j).meandiameter.values] ];
        data.population.bifurcation.diameterbins(j).taperrate.values                     = [ [data.population.bifurcation.diameterbins(j).taperrate.values] [data.individual(i).bifurcation.diameterbins(j).taperrate.values] ];
        data.population.bifurcation.diameterbins(j).piecelength.values                   = [ [data.population.bifurcation.diameterbins(j).piecelength.values] [data.individual(i).bifurcation.diameterbins(j).piecelength.values] ];
      
        clear nextvalue;

    end
end


for i = 1:length(data.population.bifurcation.diameterbins)
    
    analysis.bifurcation.diameter.diameter(i) = data.individual(maxlocation).diameterbinmiddles(i);
    
    if isfield(data.population.bifurcation.diameterbins(i).length,'values') == 1
    
        analysis.bifurcation.diameter.length(i).values           = data.population.bifurcation.diameterbins(i).length.values;
        analysis.bifurcation.diameter.length(i).mean             = mean([analysis.bifurcation.diameter.length(i).values]);
        analysis.bifurcation.diameter.length(i).std              = std([analysis.bifurcation.diameter.length(i).values]);
        analysis.bifurcation.diameter.length(i).max              = max([analysis.bifurcation.diameter.length(i).values]);
        analysis.bifurcation.diameter.length(i).min              = min([analysis.bifurcation.diameter.length(i).values]);
        analysis.bifurcation.diameter.length(i).skew             = skewness([analysis.bifurcation.diameter.length(i).values],0);
        analysis.bifurcation.diameter.length(i).kurt             = kurtosis([analysis.bifurcation.diameter.length(i).values],0);
        analysis.bifurcation.diameter.length(i).total            = sum([analysis.bifurcation.diameter.length(i).values]);

        analysis.bifurcation.diameter.surfacearea(i).values           = data.population.bifurcation.diameterbins(i).surfacearea.values;
        analysis.bifurcation.diameter.surfacearea(i).mean             = mean([analysis.bifurcation.diameter.surfacearea(i).values]);
        analysis.bifurcation.diameter.surfacearea(i).std              = std([analysis.bifurcation.diameter.surfacearea(i).values]);
        analysis.bifurcation.diameter.surfacearea(i).max              = max([analysis.bifurcation.diameter.surfacearea(i).values]);
        analysis.bifurcation.diameter.surfacearea(i).min              = min([analysis.bifurcation.diameter.surfacearea(i).values]);
        analysis.bifurcation.diameter.surfacearea(i).skew             = skewness([analysis.bifurcation.diameter.surfacearea(i).values],0);
        analysis.bifurcation.diameter.surfacearea(i).kurt             = kurtosis([analysis.bifurcation.diameter.surfacearea(i).values],0);
        analysis.bifurcation.diameter.surfacearea(i).total            = sum([analysis.bifurcation.diameter.surfacearea(i).values]);

        analysis.bifurcation.diameter.volume(i).values           = data.population.bifurcation.diameterbins(i).volume.values;
        analysis.bifurcation.diameter.volume(i).mean             = mean([analysis.bifurcation.diameter.volume(i).values]);
        analysis.bifurcation.diameter.volume(i).std              = std([analysis.bifurcation.diameter.volume(i).values]);
        analysis.bifurcation.diameter.volume(i).max              = max([analysis.bifurcation.diameter.volume(i).values]);
        analysis.bifurcation.diameter.volume(i).min              = min([analysis.bifurcation.diameter.volume(i).values]);
        analysis.bifurcation.diameter.volume(i).skew             = skewness([analysis.bifurcation.diameter.volume(i).values],0);
        analysis.bifurcation.diameter.volume(i).kurt             = kurtosis([analysis.bifurcation.diameter.volume(i).values],0);
        analysis.bifurcation.diameter.volume(i).total            = sum([analysis.bifurcation.diameter.volume(i).values]);

        analysis.bifurcation.diameter.numbersegments(i).values           = data.population.bifurcation.diameterbins(i).numbersegments.values;
        analysis.bifurcation.diameter.numbersegments(i).mean             = mean([analysis.bifurcation.diameter.numbersegments(i).values]);
        analysis.bifurcation.diameter.numbersegments(i).std              = std([analysis.bifurcation.diameter.numbersegments(i).values]);
        analysis.bifurcation.diameter.numbersegments(i).max              = max([analysis.bifurcation.diameter.numbersegments(i).values]);
        analysis.bifurcation.diameter.numbersegments(i).min              = min([analysis.bifurcation.diameter.numbersegments(i).values]);
        analysis.bifurcation.diameter.numbersegments(i).skew             = skewness([analysis.bifurcation.diameter.numbersegments(i).values],0);
        analysis.bifurcation.diameter.numbersegments(i).kurt             = kurtosis([analysis.bifurcation.diameter.numbersegments(i).values],0);
        analysis.bifurcation.diameter.numbersegments(i).total            = sum([analysis.bifurcation.diameter.numbersegments(i).values]);
        
        analysis.bifurcation.diameter.numberbifurcations(i).values           = data.population.bifurcation.diameterbins(i).numberbifurcations.values;
        analysis.bifurcation.diameter.numberbifurcations(i).mean             = mean([analysis.bifurcation.diameter.numberbifurcations(i).values]);
        analysis.bifurcation.diameter.numberbifurcations(i).std              = std([analysis.bifurcation.diameter.numberbifurcations(i).values]);
        analysis.bifurcation.diameter.numberbifurcations(i).max              = max([analysis.bifurcation.diameter.numberbifurcations(i).values]);
        analysis.bifurcation.diameter.numberbifurcations(i).min              = min([analysis.bifurcation.diameter.numberbifurcations(i).values]);
        analysis.bifurcation.diameter.numberbifurcations(i).skew             = skewness([analysis.bifurcation.diameter.numberbifurcations(i).values],0);
        analysis.bifurcation.diameter.numberbifurcations(i).kurt             = kurtosis([analysis.bifurcation.diameter.numberbifurcations(i).values],0);
        analysis.bifurcation.diameter.numberbifurcations(i).total            = sum([analysis.bifurcation.diameter.numberbifurcations(i).values]);

        analysis.bifurcation.diameter.rallratio(i).values           = data.population.bifurcation.diameterbins(i).rallratio.values;
        analysis.bifurcation.diameter.rallratio(i).mean             = mean([analysis.bifurcation.diameter.rallratio(i).values]);
        analysis.bifurcation.diameter.rallratio(i).std              = std([analysis.bifurcation.diameter.rallratio(i).values]);
        analysis.bifurcation.diameter.rallratio(i).max              = max([analysis.bifurcation.diameter.rallratio(i).values]);
        analysis.bifurcation.diameter.rallratio(i).min              = min([analysis.bifurcation.diameter.rallratio(i).values]);
        analysis.bifurcation.diameter.rallratio(i).skew             = skewness([analysis.bifurcation.diameter.rallratio(i).values],0);
        analysis.bifurcation.diameter.rallratio(i).kurt             = kurtosis([analysis.bifurcation.diameter.rallratio(i).values],0);

        analysis.bifurcation.diameter.rallratio1(i).values           = data.population.bifurcation.diameterbins(i).rallratio1.values;
        analysis.bifurcation.diameter.rallratio1(i).mean             = mean([analysis.bifurcation.diameter.rallratio1(i).values]);
        analysis.bifurcation.diameter.rallratio1(i).std              = std([analysis.bifurcation.diameter.rallratio1(i).values]);
        analysis.bifurcation.diameter.rallratio1(i).max              = max([analysis.bifurcation.diameter.rallratio1(i).values]);
        analysis.bifurcation.diameter.rallratio1(i).min              = min([analysis.bifurcation.diameter.rallratio1(i).values]);
        analysis.bifurcation.diameter.rallratio1(i).skew             = skewness([analysis.bifurcation.diameter.rallratio1(i).values],0);
        analysis.bifurcation.diameter.rallratio1(i).kurt             = kurtosis([analysis.bifurcation.diameter.rallratio1(i).values],0);

        analysis.bifurcation.diameter.rallratio2(i).values           = data.population.bifurcation.diameterbins(i).rallratio2.values;
        analysis.bifurcation.diameter.rallratio2(i).mean             = mean([analysis.bifurcation.diameter.rallratio2(i).values]);
        analysis.bifurcation.diameter.rallratio2(i).std              = std([analysis.bifurcation.diameter.rallratio2(i).values]);
        analysis.bifurcation.diameter.rallratio2(i).max              = max([analysis.bifurcation.diameter.rallratio2(i).values]);
        analysis.bifurcation.diameter.rallratio2(i).min              = min([analysis.bifurcation.diameter.rallratio2(i).values]);
        analysis.bifurcation.diameter.rallratio2(i).skew             = skewness([analysis.bifurcation.diameter.rallratio2(i).values],0);
        analysis.bifurcation.diameter.rallratio2(i).kurt             = kurtosis([analysis.bifurcation.diameter.rallratio2(i).values],0);
		
		analysis.bifurcation.diameter.rallratio3(i).values           = data.population.bifurcation.diameterbins(i).rallratio3.values;
        analysis.bifurcation.diameter.rallratio3(i).mean             = mean([analysis.bifurcation.diameter.rallratio3(i).values]);
        analysis.bifurcation.diameter.rallratio3(i).std              = std([analysis.bifurcation.diameter.rallratio3(i).values]);
        analysis.bifurcation.diameter.rallratio3(i).max              = max([analysis.bifurcation.diameter.rallratio3(i).values]);
        analysis.bifurcation.diameter.rallratio3(i).min              = min([analysis.bifurcation.diameter.rallratio3(i).values]);
        analysis.bifurcation.diameter.rallratio3(i).skew             = skewness([analysis.bifurcation.diameter.rallratio3(i).values],0);
        analysis.bifurcation.diameter.rallratio3(i).kurt             = kurtosis([analysis.bifurcation.diameter.rallratio3(i).values],0);

        analysis.bifurcation.diameter.daughterratio(i).values           = data.population.bifurcation.diameterbins(i).daughterratio.values;
        analysis.bifurcation.diameter.daughterratio(i).mean             = mean([analysis.bifurcation.diameter.daughterratio(i).values]);
        analysis.bifurcation.diameter.daughterratio(i).std              = std([analysis.bifurcation.diameter.daughterratio(i).values]);
        analysis.bifurcation.diameter.daughterratio(i).max              = max([analysis.bifurcation.diameter.daughterratio(i).values]);
        analysis.bifurcation.diameter.daughterratio(i).min              = min([analysis.bifurcation.diameter.daughterratio(i).values]);
        analysis.bifurcation.diameter.daughterratio(i).skew             = skewness([analysis.bifurcation.diameter.daughterratio(i).values],0);
        analysis.bifurcation.diameter.daughterratio(i).kurt             = kurtosis([analysis.bifurcation.diameter.daughterratio(i).values],0);

        analysis.bifurcation.diameter.parentdaughterratio(i).values           = data.population.bifurcation.diameterbins(i).parentdaughterratio.values;
        analysis.bifurcation.diameter.parentdaughterratio(i).mean             = mean([analysis.bifurcation.diameter.parentdaughterratio(i).values]);
        analysis.bifurcation.diameter.parentdaughterratio(i).std              = std([analysis.bifurcation.diameter.parentdaughterratio(i).values]);
        analysis.bifurcation.diameter.parentdaughterratio(i).max              = max([analysis.bifurcation.diameter.parentdaughterratio(i).values]);
        analysis.bifurcation.diameter.parentdaughterratio(i).min              = min([analysis.bifurcation.diameter.parentdaughterratio(i).values]);
        analysis.bifurcation.diameter.parentdaughterratio(i).skew             = skewness([analysis.bifurcation.diameter.parentdaughterratio(i).values],0);
        analysis.bifurcation.diameter.parentdaughterratio(i).kurt             = kurtosis([analysis.bifurcation.diameter.parentdaughterratio(i).values],0);

        analysis.bifurcation.diameter.parentdaughter2ratio(i).values           = data.population.bifurcation.diameterbins(i).parentdaughter2ratio.values;
        analysis.bifurcation.diameter.parentdaughter2ratio(i).mean             = mean([analysis.bifurcation.diameter.parentdaughter2ratio(i).values]);
        analysis.bifurcation.diameter.parentdaughter2ratio(i).std              = std([analysis.bifurcation.diameter.parentdaughter2ratio(i).values]);
        analysis.bifurcation.diameter.parentdaughter2ratio(i).max              = max([analysis.bifurcation.diameter.parentdaughter2ratio(i).values]);
        analysis.bifurcation.diameter.parentdaughter2ratio(i).min              = min([analysis.bifurcation.diameter.parentdaughter2ratio(i).values]);
        analysis.bifurcation.diameter.parentdaughter2ratio(i).skew             = skewness([analysis.bifurcation.diameter.parentdaughter2ratio(i).values],0);
        analysis.bifurcation.diameter.parentdaughter2ratio(i).kurt             = kurtosis([analysis.bifurcation.diameter.parentdaughter2ratio(i).values],0);

        analysis.bifurcation.diameter.meandiameter(i).values           = data.population.bifurcation.diameterbins(i).meandiameter.values;
        analysis.bifurcation.diameter.meandiameter(i).mean             = sum([data.population.bifurcation.diameterbins(i).meandiameter.values].*[data.population.bifurcation.diameterbins(i).piecelength.values])/sum([data.population.bifurcation.diameterbins(i).piecelength.values]);
        analysis.bifurcation.diameter.meandiameter(i).std              = std([analysis.bifurcation.diameter.meandiameter(i).values]);
        analysis.bifurcation.diameter.meandiameter(i).max              = max([analysis.bifurcation.diameter.meandiameter(i).values]);
        analysis.bifurcation.diameter.meandiameter(i).min              = min([analysis.bifurcation.diameter.meandiameter(i).values]);
        analysis.bifurcation.diameter.meandiameter(i).skew             = skewness([analysis.bifurcation.diameter.meandiameter(i).values],0);
        analysis.bifurcation.diameter.meandiameter(i).kurt             = kurtosis([analysis.bifurcation.diameter.meandiameter(i).values],0);

        analysis.bifurcation.diameter.taperrate(i).values           = data.population.bifurcation.diameterbins(i).taperrate.values;
        analysis.bifurcation.diameter.taperrate(i).mean             = sum([data.population.bifurcation.diameterbins(i).taperrate.values].*[data.population.bifurcation.diameterbins(i).piecelength.values])/sum([data.population.bifurcation.diameterbins(i).piecelength.values]);
        analysis.bifurcation.diameter.taperrate(i).std              = std([analysis.bifurcation.diameter.taperrate(i).values]);
        analysis.bifurcation.diameter.taperrate(i).max              = max([analysis.bifurcation.diameter.taperrate(i).values]);
        analysis.bifurcation.diameter.taperrate(i).min              = min([analysis.bifurcation.diameter.taperrate(i).values]);
        analysis.bifurcation.diameter.taperrate(i).skew             = skewness([analysis.bifurcation.diameter.taperrate(i).values],0);
        analysis.bifurcation.diameter.taperrate(i).kurt             = kurtosis([analysis.bifurcation.diameter.taperrate(i).values],0);

        analysis.bifurcation.diameter.bifurcationprobability.length(i)      = analysis.bifurcation.diameter.numberbifurcations(i).total / analysis.bifurcation.diameter.length(i).total;
        analysis.bifurcation.diameter.bifurcationprobability.surfacearea(i) = analysis.bifurcation.diameter.numberbifurcations(i).total / analysis.bifurcation.diameter.surfacearea(i).total;
        analysis.bifurcation.diameter.bifurcationprobability.volume(i)      = analysis.bifurcation.diameter.numberbifurcations(i).total / analysis.bifurcation.diameter.volume(i).total;
    
    end
end
    
analysis.bifurcation.diameter = orderfields(analysis.bifurcation.diameter);









% Begin termination diameter analysis

clear diameterbinlengths maxdiameterbin maxlocation;

for i = 1:length(data.individual)
    diameterbinlengths(i) = length(data.individual(i).termination.diameterbins);
end

[maxdiameterbin,maxlocation] = max(diameterbinlengths);

for i = 1:maxdiameterbin
    data.population.termination.diameterbins(i).meandiameter.values         = [];
    data.population.termination.diameterbins(i).taperrate.values            = [];
    data.population.termination.diameterbins(i).piecelength.values          = [];
end


for i = 1:length(data.individual)

    for j = 1:length(data.individual(i).termination.diameterbins)

        data.individual(i).termination.diameterbins(j).length                      = 0;
        data.individual(i).termination.diameterbins(j).surfacearea                 = 0;
        data.individual(i).termination.diameterbins(j).volume                      = 0;
        data.individual(i).termination.diameterbins(j).numbersegments              = 0;
        data.individual(i).termination.diameterbins(j).numberterminations          = 0;
        data.individual(i).termination.diameterbins(j).meandiameter.values         = [];
        data.individual(i).termination.diameterbins(j).taperrate.values            = [];
        data.individual(i).termination.diameterbins(j).piecelength.values          = [];
       
        if isfield(data.individual(i).termination.diameterbins(j).piece,'id') == 1

            data.individual(i).termination.diameterbins(j).length                      = sum([data.individual(i).termination.diameterbins(j).piece.length]);
            data.individual(i).termination.diameterbins(j).surfacearea                 = sum([data.individual(i).termination.diameterbins(j).piece.surfacearea]);
            data.individual(i).termination.diameterbins(j).volume                      = sum([data.individual(i).termination.diameterbins(j).piece.volume]);
            data.individual(i).termination.diameterbins(j).numbersegments              = length(unique([data.individual(i).termination.diameterbins(j).piece.cable]));
            data.individual(i).termination.diameterbins(j).meandiameter.values         = ([data.individual(i).termination.diameterbins(j).piece.proximaldiameter]+[data.individual(i).termination.diameterbins(j).piece.distaldiameter])/2;            
            data.individual(i).termination.diameterbins(j).taperrate.values            = [data.individual(i).termination.diameterbins(j).piece.taperrate];
            data.individual(i).termination.diameterbins(j).piecelength.values          = [data.individual(i).termination.diameterbins(j).piece.length];           
        end

        for k = 1:length(data.individual(i).termination.diameterbins(j).piece)
            if strcmp(data.individual(i).termination.diameterbins(j).piece(k).distaltype,'termination')==1
                data.individual(i).termination.diameterbins(j).numberterminations = 1 + data.individual(i).termination.diameterbins(j).numberterminations;
            end
        end
        
        if isfield(data.population,'diameterbins') == 0; nextvalue = 1;
        elseif j > length(data.population.termination.diameterbins); nextvalue = 1;
        elseif isfield(data.population.termination.diameterbins(j),'length') == 0; nextvalue = 1;
        elseif isfield(data.population.termination.diameterbins(j).length,'values') == 0; nextvalue = 1;
        else nextvalue = 1 + length(data.population.termination.diameterbins(j).length.values);
        end
        data.population.termination.diameterbins(j).length.values(nextvalue)             = data.individual(i).termination.diameterbins(j).length;
        data.population.termination.diameterbins(j).surfacearea.values(nextvalue)        = data.individual(i).termination.diameterbins(j).surfacearea;
        data.population.termination.diameterbins(j).volume.values(nextvalue)             = data.individual(i).termination.diameterbins(j).volume;
        data.population.termination.diameterbins(j).numbersegments.values(nextvalue)     = data.individual(i).termination.diameterbins(j).numbersegments;
        data.population.termination.diameterbins(j).numberterminations.values(nextvalue) = data.individual(i).termination.diameterbins(j).numberterminations;
        data.population.termination.diameterbins(j).meandiameter.values                  = [ [data.population.termination.diameterbins(j).meandiameter.values] [data.individual(i).termination.diameterbins(j).meandiameter.values] ];
        data.population.termination.diameterbins(j).taperrate.values                     = [ [data.population.termination.diameterbins(j).taperrate.values] [data.individual(i).termination.diameterbins(j).taperrate.values] ];
        data.population.termination.diameterbins(j).piecelength.values                   = [ [data.population.termination.diameterbins(j).piecelength.values] [data.individual(i).termination.diameterbins(j).piecelength.values] ];
        
        clear nextvalue;
    end
end

for i = 1:length(data.population.termination.diameterbins)
    
    analysis.termination.diameter.diameter(i) = data.individual(maxlocation).diameterbinmiddles(i);
    
    if isfield(data.population.termination.diameterbins(i).length,'values') == 1
    
        analysis.termination.diameter.length(i).values           = data.population.termination.diameterbins(i).length.values;
        analysis.termination.diameter.length(i).mean             = mean([analysis.termination.diameter.length(i).values]);
        analysis.termination.diameter.length(i).std              = std([analysis.termination.diameter.length(i).values]);
        analysis.termination.diameter.length(i).max              = max([analysis.termination.diameter.length(i).values]);
        analysis.termination.diameter.length(i).min              = min([analysis.termination.diameter.length(i).values]);
        analysis.termination.diameter.length(i).skew             = skewness([analysis.termination.diameter.length(i).values],0);
        analysis.termination.diameter.length(i).kurt             = kurtosis([analysis.termination.diameter.length(i).values],0);
        analysis.termination.diameter.length(i).total            = sum([analysis.termination.diameter.length(i).values]);

        analysis.termination.diameter.surfacearea(i).values           = data.population.termination.diameterbins(i).surfacearea.values;
        analysis.termination.diameter.surfacearea(i).mean             = mean([analysis.termination.diameter.surfacearea(i).values]);
        analysis.termination.diameter.surfacearea(i).std              = std([analysis.termination.diameter.surfacearea(i).values]);
        analysis.termination.diameter.surfacearea(i).max              = max([analysis.termination.diameter.surfacearea(i).values]);
        analysis.termination.diameter.surfacearea(i).min              = min([analysis.termination.diameter.surfacearea(i).values]);
        analysis.termination.diameter.surfacearea(i).skew             = skewness([analysis.termination.diameter.surfacearea(i).values],0);
        analysis.termination.diameter.surfacearea(i).kurt             = kurtosis([analysis.termination.diameter.surfacearea(i).values],0);
        analysis.termination.diameter.surfacearea(i).total            = sum([analysis.termination.diameter.surfacearea(i).values]);

        analysis.termination.diameter.volume(i).values           = data.population.termination.diameterbins(i).volume.values;
        analysis.termination.diameter.volume(i).mean             = mean([analysis.termination.diameter.volume(i).values]);
        analysis.termination.diameter.volume(i).std              = std([analysis.termination.diameter.volume(i).values]);
        analysis.termination.diameter.volume(i).max              = max([analysis.termination.diameter.volume(i).values]);
        analysis.termination.diameter.volume(i).min              = min([analysis.termination.diameter.volume(i).values]);
        analysis.termination.diameter.volume(i).skew             = skewness([analysis.termination.diameter.volume(i).values],0);
        analysis.termination.diameter.volume(i).kurt             = kurtosis([analysis.termination.diameter.volume(i).values],0);
        analysis.termination.diameter.volume(i).total            = sum([analysis.termination.diameter.volume(i).values]);

        analysis.termination.diameter.numbersegments(i).values           = data.population.termination.diameterbins(i).numbersegments.values;
        analysis.termination.diameter.numbersegments(i).mean             = mean([analysis.termination.diameter.numbersegments(i).values]);
        analysis.termination.diameter.numbersegments(i).std              = std([analysis.termination.diameter.numbersegments(i).values]);
        analysis.termination.diameter.numbersegments(i).max              = max([analysis.termination.diameter.numbersegments(i).values]);
        analysis.termination.diameter.numbersegments(i).min              = min([analysis.termination.diameter.numbersegments(i).values]);
        analysis.termination.diameter.numbersegments(i).skew             = skewness([analysis.termination.diameter.numbersegments(i).values],0);
        analysis.termination.diameter.numbersegments(i).kurt             = kurtosis([analysis.termination.diameter.numbersegments(i).values],0);
        analysis.termination.diameter.numbersegments(i).total            = sum([analysis.termination.diameter.numbersegments(i).values]);
        
        analysis.termination.diameter.numberterminations(i).values           = data.population.termination.diameterbins(i).numberterminations.values;
        analysis.termination.diameter.numberterminations(i).mean             = mean([analysis.termination.diameter.numberterminations(i).values]);
        analysis.termination.diameter.numberterminations(i).std              = std([analysis.termination.diameter.numberterminations(i).values]);
        analysis.termination.diameter.numberterminations(i).max              = max([analysis.termination.diameter.numberterminations(i).values]);
        analysis.termination.diameter.numberterminations(i).min              = min([analysis.termination.diameter.numberterminations(i).values]);
        analysis.termination.diameter.numberterminations(i).skew             = skewness([analysis.termination.diameter.numberterminations(i).values],0);
        analysis.termination.diameter.numberterminations(i).kurt             = kurtosis([analysis.termination.diameter.numberterminations(i).values],0);
        analysis.termination.diameter.numberterminations(i).total            = sum([analysis.termination.diameter.numberterminations(i).values]);

        analysis.termination.diameter.meandiameter(i).values           = data.population.termination.diameterbins(i).meandiameter.values;
        analysis.termination.diameter.meandiameter(i).mean             = sum([data.population.termination.diameterbins(i).meandiameter.values].*[data.population.termination.diameterbins(i).piecelength.values])/sum([data.population.termination.diameterbins(i).piecelength.values]);
        analysis.termination.diameter.meandiameter(i).std              = std([analysis.termination.diameter.meandiameter(i).values]);
        analysis.termination.diameter.meandiameter(i).max              = max([analysis.termination.diameter.meandiameter(i).values]);
        analysis.termination.diameter.meandiameter(i).min              = min([analysis.termination.diameter.meandiameter(i).values]);
        analysis.termination.diameter.meandiameter(i).skew             = skewness([analysis.termination.diameter.meandiameter(i).values],0);
        analysis.termination.diameter.meandiameter(i).kurt             = kurtosis([analysis.termination.diameter.meandiameter(i).values],0);

        analysis.termination.diameter.taperrate(i).values           = data.population.termination.diameterbins(i).taperrate.values;
        analysis.termination.diameter.taperrate(i).mean             = sum([data.population.termination.diameterbins(i).taperrate.values].*[data.population.termination.diameterbins(i).piecelength.values])/sum([data.population.termination.diameterbins(i).piecelength.values]);
        analysis.termination.diameter.taperrate(i).std              = std([analysis.termination.diameter.taperrate(i).values]);
        analysis.termination.diameter.taperrate(i).max              = max([analysis.termination.diameter.taperrate(i).values]);
        analysis.termination.diameter.taperrate(i).min              = min([analysis.termination.diameter.taperrate(i).values]);
        analysis.termination.diameter.taperrate(i).skew             = skewness([analysis.termination.diameter.taperrate(i).values],0);
        analysis.termination.diameter.taperrate(i).kurt             = kurtosis([analysis.termination.diameter.taperrate(i).values],0);

        analysis.termination.diameter.terminationprobability.length(i)      = analysis.termination.diameter.numberterminations(i).total / analysis.termination.diameter.length(i).total;
        analysis.termination.diameter.terminationprobability.surfacearea(i) = analysis.termination.diameter.numberterminations(i).total / analysis.termination.diameter.surfacearea(i).total;
        analysis.termination.diameter.terminationprobability.volume(i)      = analysis.termination.diameter.numberterminations(i).total / analysis.termination.diameter.volume(i).total;
    
    end
end
    
analysis.termination.diameter = orderfields(analysis.termination.diameter);




warning('on', 'MATLAB:divideByZero');