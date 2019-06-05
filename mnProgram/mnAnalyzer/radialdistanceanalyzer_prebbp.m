function [data,analysis]   = radialdistanceanalyzer(data,analysis)

disp('   Radial distance analysis started.');

warning('off', 'MATLAB:divideByZero');

for i = 1:length(data.individual)
    radialdistancebinlengths(i) = length(data.individual(i).radialdistancebins);
end

maxradialdistancebin = max(radialdistancebinlengths);

for i = 1:maxradialdistancebin
    data.population.radialdistancebins(i).rallratio.values            = [];
    data.population.radialdistancebins(i).rallratio1.values           = [];
    data.population.radialdistancebins(i).rallratio2.values           = [];
	data.population.radialdistancebins(i).rallratio3.values           = [];
    data.population.radialdistancebins(i).daughterratio.values        = [];
    data.population.radialdistancebins(i).parentdaughterratio.values  = [];
    data.population.radialdistancebins(i).parentdaughter2ratio.values = [];
    data.population.radialdistancebins(i).taperrate.values            = [];
	%data.population.radialdistancebins(i).taperratevolume.values      = [];
	%data.population.radialdistancebins(i).taperratesurfacearea.values = [];
    data.population.radialdistancebins(i).taperratelength.values      = [];
end
    

for i = 1:length(data.individual)
    
    for j = 1:length(data.individual(i).radialdistancebins)
        
        data.individual(i).radialdistancebins(j).length                      = sum([data.individual(i).radialdistancebins(j).piece.length]);
        data.individual(i).radialdistancebins(j).surfacearea                 = sum([data.individual(i).radialdistancebins(j).piece.surfacearea]);
        data.individual(i).radialdistancebins(j).volume                      = sum([data.individual(i).radialdistancebins(j).piece.volume]);
        data.individual(i).radialdistancebins(j).numbersegments              = length(unique([data.individual(i).radialdistancebins(j).piece.cable]));
        data.individual(i).radialdistancebins(j).numberbifurcations          = 0;
        data.individual(i).radialdistancebins(j).numberterminations          = 0;
        data.individual(i).radialdistancebins(j).numberbifurcatingbranches   = 0;
        data.individual(i).radialdistancebins(j).numberterminatingbranches   = 0;
        data.individual(i).radialdistancebins(j).rallratio.values            = [data.individual(i).radialdistancebins(j).piece.rallratio];
        data.individual(i).radialdistancebins(j).rallratio1.values           = [data.individual(i).radialdistancebins(j).piece.rallratio1];
        data.individual(i).radialdistancebins(j).rallratio2.values           = [data.individual(i).radialdistancebins(j).piece.rallratio2];
		data.individual(i).radialdistancebins(j).rallratio3.values           = [data.individual(i).radialdistancebins(j).piece.rallratio3];
        data.individual(i).radialdistancebins(j).daughterratio.values        = [data.individual(i).radialdistancebins(j).piece.daughterratio];
        data.individual(i).radialdistancebins(j).parentdaughterratio.values  = [data.individual(i).radialdistancebins(j).piece.parentdaughterratio];
        data.individual(i).radialdistancebins(j).parentdaughter2ratio.values = [data.individual(i).radialdistancebins(j).piece.parentdaughter2ratio];
        data.individual(i).radialdistancebins(j).diameter                    = ((4*data.individual(i).radialdistancebins(j).volume)/(pi()*data.individual(i).radialdistancebins(j).length))^0.5;            
        data.individual(i).radialdistancebins(j).taperrate.values            = [data.individual(i).radialdistancebins(j).piece.taperrate];
		%data.individual(i).radialdistancebins(j).taperratevolume.values      = [data.individual(i).radialdistancebins(j).piece.taperratevolume];
		%data.individual(i).radialdistancebins(j).taperratesurfacearea.values = [data.individual(i).radialdistancebins(j).piece.taperratesurfacearea];
        data.individual(i).radialdistancebins(j).taperratelength.values      = [data.individual(i).radialdistancebins(j).piece.length];
        
        
        for k = 1:length(data.individual(i).radialdistancebins(j).piece)           
            if strcmp(data.individual(i).radialdistancebins(j).piece(k).distaltype,'bifurcation')==1
                data.individual(i).radialdistancebins(j).numberbifurcations = 1 + data.individual(i).radialdistancebins(j).numberbifurcations;
            end
            if strcmp(data.individual(i).radialdistancebins(j).piece(k).distaltype,'termination')==1
                data.individual(i).radialdistancebins(j).numberterminations = 1 + data.individual(i).radialdistancebins(j).numberterminations;
            end
            if strcmp(data.individual(i).radialdistancebins(j).piece(k).proximaltype,'primary    ') ==1 || strcmp(data.individual(i).radialdistancebins(j).piece(k).proximaltype,'daughter1  ') ==1 || strcmp(data.individual(i).radialdistancebins(j).piece(k).proximaltype,'daughter2  ') ==1
                if strcmp(data.individual(i).radialdistancebins(j).piece(k).branchtype,'b') == 1
                    data.individual(i).radialdistancebins(j).numberbifurcatingbranches = 1 + data.individual(i).radialdistancebins(j).numberbifurcatingbranches;
                elseif strcmp(data.individual(i).radialdistancebins(j).piece(k).branchtype,'t') == 1
                    data.individual(i).radialdistancebins(j).numberterminatingbranches = 1 + data.individual(i).radialdistancebins(j).numberterminatingbranches;
                else disp('       Error in radial distance analyzer: piece branch type not identified.');
                end
            end
        end
        
        if isfield(data.population,'radialdistancebins') == 0; nextvalue = 1;
        elseif j > length(data.population.radialdistancebins); nextvalue = 1;
        elseif isfield(data.population.radialdistancebins(j),'length') == 0; nextvalue = 1;
        elseif isfield(data.population.radialdistancebins(j).length,'values') == 0; nextvalue = 1;
        else nextvalue = 1 + length(data.population.radialdistancebins(j).length.values);
        end
        data.population.radialdistancebins(j).length.values(nextvalue)             = data.individual(i).radialdistancebins(j).length;
        data.population.radialdistancebins(j).surfacearea.values(nextvalue)        = data.individual(i).radialdistancebins(j).surfacearea;
        data.population.radialdistancebins(j).volume.values(nextvalue)             = data.individual(i).radialdistancebins(j).volume;
        data.population.radialdistancebins(j).numbersegments.values(nextvalue)     = data.individual(i).radialdistancebins(j).numbersegments;
        data.population.radialdistancebins(j).numberbifurcations.values(nextvalue) = data.individual(i).radialdistancebins(j).numberbifurcations;
        data.population.radialdistancebins(j).numberterminations.values(nextvalue) = data.individual(i).radialdistancebins(j).numberterminations;
        data.population.radialdistancebins(j).numberbifurcatingbranches.values(nextvalue) = data.individual(i).radialdistancebins(j).numberbifurcatingbranches;
        data.population.radialdistancebins(j).numberterminatingbranches.values(nextvalue) = data.individual(i).radialdistancebins(j).numberterminatingbranches;
        data.population.radialdistancebins(j).rallratio.values                     = [ [data.population.radialdistancebins(j).rallratio.values] [data.individual(i).radialdistancebins(j).rallratio.values] ];
        data.population.radialdistancebins(j).rallratio1.values                    = [ [data.population.radialdistancebins(j).rallratio1.values] [data.individual(i).radialdistancebins(j).rallratio1.values] ];
        data.population.radialdistancebins(j).rallratio2.values                    = [ [data.population.radialdistancebins(j).rallratio2.values] [data.individual(i).radialdistancebins(j).rallratio2.values] ];
		data.population.radialdistancebins(j).rallratio3.values                    = [ [data.population.radialdistancebins(j).rallratio3.values] [data.individual(i).radialdistancebins(j).rallratio3.values] ];
        data.population.radialdistancebins(j).daughterratio.values                 = [ [data.population.radialdistancebins(j).daughterratio.values] [data.individual(i).radialdistancebins(j).daughterratio.values] ];
        data.population.radialdistancebins(j).parentdaughterratio.values           = [ [data.population.radialdistancebins(j).parentdaughterratio.values] [data.individual(i).radialdistancebins(j).parentdaughterratio.values] ];
        data.population.radialdistancebins(j).parentdaughter2ratio.values          = [ [data.population.radialdistancebins(j).parentdaughter2ratio.values] [data.individual(i).radialdistancebins(j).parentdaughter2ratio.values] ];
        data.population.radialdistancebins(j).diameter.values(nextvalue)           = data.individual(i).radialdistancebins(j).diameter;
        data.population.radialdistancebins(j).taperrate.values                     = [ [data.population.radialdistancebins(j).taperrate.values] [data.individual(i).radialdistancebins(j).taperrate.values] ];
		%data.population.radialdistancebins(j).taperratevolume.values               = [ [data.population.radialdistancebins(j).taperratevolume.values] [data.individual(i).radialdistancebins(j).taperratevolume.values] ];
		%data.population.radialdistancebins(j).taperratesurfacearea.values          = [ [data.population.radialdistancebins(j).taperratesurfacearea.values] [data.individual(i).radialdistancebins(j).taperratesurfacearea.values] ];
        data.population.radialdistancebins(j).taperratelength.values               = [ [data.population.radialdistancebins(j).taperratelength.values] [data.individual(i).radialdistancebins(j).taperratelength.values] ];
        
        clear nextvalue;
        
    end
end

for i = 1:length(data.population.radialdistancebins)
    
    analysis.radialdistance.radialdistance(i)              = (data.distancebinwidth * i) - (data.distancebinwidth / 2);
    
    analysis.radialdistance.length(i).values           = data.population.radialdistancebins(i).length.values;
    analysis.radialdistance.length(i).mean             = mean([analysis.radialdistance.length(i).values]);
    analysis.radialdistance.length(i).std              = std([analysis.radialdistance.length(i).values]);
    analysis.radialdistance.length(i).max              = max([analysis.radialdistance.length(i).values]);
    analysis.radialdistance.length(i).min              = min([analysis.radialdistance.length(i).values]);
    analysis.radialdistance.length(i).skew             = skewness([analysis.radialdistance.length(i).values],0);
    analysis.radialdistance.length(i).kurt             = kurtosis([analysis.radialdistance.length(i).values],0);
    analysis.radialdistance.length(i).total            = sum([analysis.radialdistance.length(i).values]);
    
    analysis.radialdistance.surfacearea(i).values           = data.population.radialdistancebins(i).surfacearea.values;
    analysis.radialdistance.surfacearea(i).mean             = mean([analysis.radialdistance.surfacearea(i).values]);
    analysis.radialdistance.surfacearea(i).std              = std([analysis.radialdistance.surfacearea(i).values]);
    analysis.radialdistance.surfacearea(i).max              = max([analysis.radialdistance.surfacearea(i).values]);
    analysis.radialdistance.surfacearea(i).min              = min([analysis.radialdistance.surfacearea(i).values]);
    analysis.radialdistance.surfacearea(i).skew             = skewness([analysis.radialdistance.surfacearea(i).values],0);
    analysis.radialdistance.surfacearea(i).kurt             = kurtosis([analysis.radialdistance.surfacearea(i).values],0);
    analysis.radialdistance.surfacearea(i).total            = sum([analysis.radialdistance.surfacearea(i).values]);
    
    analysis.radialdistance.volume(i).values           = data.population.radialdistancebins(i).volume.values;
    analysis.radialdistance.volume(i).mean             = mean([analysis.radialdistance.volume(i).values]);
    analysis.radialdistance.volume(i).std              = std([analysis.radialdistance.volume(i).values]);
    analysis.radialdistance.volume(i).max              = max([analysis.radialdistance.volume(i).values]);
    analysis.radialdistance.volume(i).min              = min([analysis.radialdistance.volume(i).values]);
    analysis.radialdistance.volume(i).skew             = skewness([analysis.radialdistance.volume(i).values],0);
    analysis.radialdistance.volume(i).kurt             = kurtosis([analysis.radialdistance.volume(i).values],0);
    analysis.radialdistance.volume(i).total            = sum([analysis.radialdistance.volume(i).values]);
    
    analysis.radialdistance.numbersegments(i).values           = data.population.radialdistancebins(i).numbersegments.values;
    analysis.radialdistance.numbersegments(i).mean             = mean([analysis.radialdistance.numbersegments(i).values]);
    analysis.radialdistance.numbersegments(i).std              = std([analysis.radialdistance.numbersegments(i).values]);
    analysis.radialdistance.numbersegments(i).max              = max([analysis.radialdistance.numbersegments(i).values]);
    analysis.radialdistance.numbersegments(i).min              = min([analysis.radialdistance.numbersegments(i).values]);
    analysis.radialdistance.numbersegments(i).skew             = skewness([analysis.radialdistance.numbersegments(i).values],0);
    analysis.radialdistance.numbersegments(i).kurt             = kurtosis([analysis.radialdistance.numbersegments(i).values],0);
    analysis.radialdistance.numbersegments(i).total            = sum([analysis.radialdistance.numbersegments(i).values]);
    
    analysis.radialdistance.numberbifurcations(i).values           = data.population.radialdistancebins(i).numberbifurcations.values;
    analysis.radialdistance.numberbifurcations(i).mean             = mean([analysis.radialdistance.numberbifurcations(i).values]);
    analysis.radialdistance.numberbifurcations(i).std              = std([analysis.radialdistance.numberbifurcations(i).values]);
    analysis.radialdistance.numberbifurcations(i).max              = max([analysis.radialdistance.numberbifurcations(i).values]);
    analysis.radialdistance.numberbifurcations(i).min              = min([analysis.radialdistance.numberbifurcations(i).values]);
    analysis.radialdistance.numberbifurcations(i).skew             = skewness([analysis.radialdistance.numberbifurcations(i).values],0);
    analysis.radialdistance.numberbifurcations(i).kurt             = kurtosis([analysis.radialdistance.numberbifurcations(i).values],0);
    analysis.radialdistance.numberbifurcations(i).total            = sum([analysis.radialdistance.numberbifurcations(i).values]);
    
    analysis.radialdistance.numberterminations(i).values           = data.population.radialdistancebins(i).numberterminations.values;
    analysis.radialdistance.numberterminations(i).mean             = mean([analysis.radialdistance.numberterminations(i).values]);
    analysis.radialdistance.numberterminations(i).std              = std([analysis.radialdistance.numberterminations(i).values]);
    analysis.radialdistance.numberterminations(i).max              = max([analysis.radialdistance.numberterminations(i).values]);
    analysis.radialdistance.numberterminations(i).min              = min([analysis.radialdistance.numberterminations(i).values]);
    analysis.radialdistance.numberterminations(i).skew             = skewness([analysis.radialdistance.numberterminations(i).values],0);
    analysis.radialdistance.numberterminations(i).kurt             = kurtosis([analysis.radialdistance.numberterminations(i).values],0);
    analysis.radialdistance.numberterminations(i).total            = sum([analysis.radialdistance.numberterminations(i).values]);
    
    analysis.radialdistance.numberbifurcatingbranches(i).values           = data.population.radialdistancebins(i).numberbifurcatingbranches.values;
    analysis.radialdistance.numberbifurcatingbranches(i).mean             = mean([analysis.radialdistance.numberbifurcatingbranches(i).values]);
    analysis.radialdistance.numberbifurcatingbranches(i).std              = std([analysis.radialdistance.numberbifurcatingbranches(i).values]);
    analysis.radialdistance.numberbifurcatingbranches(i).max              = max([analysis.radialdistance.numberbifurcatingbranches(i).values]);
    analysis.radialdistance.numberbifurcatingbranches(i).min              = min([analysis.radialdistance.numberbifurcatingbranches(i).values]);
    analysis.radialdistance.numberbifurcatingbranches(i).skew             = skewness([analysis.radialdistance.numberbifurcatingbranches(i).values],0);
    analysis.radialdistance.numberbifurcatingbranches(i).kurt             = kurtosis([analysis.radialdistance.numberbifurcatingbranches(i).values],0);
    analysis.radialdistance.numberbifurcatingbranches(i).total            = sum([analysis.radialdistance.numberbifurcatingbranches(i).values]);
    
    analysis.radialdistance.numberterminatingbranches(i).values           = data.population.radialdistancebins(i).numberterminatingbranches.values;
    analysis.radialdistance.numberterminatingbranches(i).mean             = mean([analysis.radialdistance.numberterminatingbranches(i).values]);
    analysis.radialdistance.numberterminatingbranches(i).std              = std([analysis.radialdistance.numberterminatingbranches(i).values]);
    analysis.radialdistance.numberterminatingbranches(i).max              = max([analysis.radialdistance.numberterminatingbranches(i).values]);
    analysis.radialdistance.numberterminatingbranches(i).min              = min([analysis.radialdistance.numberterminatingbranches(i).values]);
    analysis.radialdistance.numberterminatingbranches(i).skew             = skewness([analysis.radialdistance.numberterminatingbranches(i).values],0);
    analysis.radialdistance.numberterminatingbranches(i).kurt             = kurtosis([analysis.radialdistance.numberterminatingbranches(i).values],0);
    analysis.radialdistance.numberterminatingbranches(i).total            = sum([analysis.radialdistance.numberterminatingbranches(i).values]);
    
    analysis.radialdistance.rallratio(i).values           = data.population.radialdistancebins(i).rallratio.values;
    analysis.radialdistance.rallratio(i).mean             = mean([analysis.radialdistance.rallratio(i).values]);
    analysis.radialdistance.rallratio(i).std              = std([analysis.radialdistance.rallratio(i).values]);
    analysis.radialdistance.rallratio(i).max              = max([analysis.radialdistance.rallratio(i).values]);
    analysis.radialdistance.rallratio(i).min              = min([analysis.radialdistance.rallratio(i).values]);
    analysis.radialdistance.rallratio(i).skew             = skewness([analysis.radialdistance.rallratio(i).values],0);
    analysis.radialdistance.rallratio(i).kurt             = kurtosis([analysis.radialdistance.rallratio(i).values],0);
    
    analysis.radialdistance.rallratio1(i).values           = data.population.radialdistancebins(i).rallratio1.values;
    analysis.radialdistance.rallratio1(i).mean             = mean([analysis.radialdistance.rallratio1(i).values]);
    analysis.radialdistance.rallratio1(i).std              = std([analysis.radialdistance.rallratio1(i).values]);
    analysis.radialdistance.rallratio1(i).max              = max([analysis.radialdistance.rallratio1(i).values]);
    analysis.radialdistance.rallratio1(i).min              = min([analysis.radialdistance.rallratio1(i).values]);
    analysis.radialdistance.rallratio1(i).skew             = skewness([analysis.radialdistance.rallratio1(i).values],0);
    analysis.radialdistance.rallratio1(i).kurt             = kurtosis([analysis.radialdistance.rallratio1(i).values],0);
    
    analysis.radialdistance.rallratio2(i).values           = data.population.radialdistancebins(i).rallratio2.values;
    analysis.radialdistance.rallratio2(i).mean             = mean([analysis.radialdistance.rallratio2(i).values]);
    analysis.radialdistance.rallratio2(i).std              = std([analysis.radialdistance.rallratio2(i).values]);
    analysis.radialdistance.rallratio2(i).max              = max([analysis.radialdistance.rallratio2(i).values]);
    analysis.radialdistance.rallratio2(i).min              = min([analysis.radialdistance.rallratio2(i).values]);
    analysis.radialdistance.rallratio2(i).skew             = skewness([analysis.radialdistance.rallratio2(i).values],0);
    analysis.radialdistance.rallratio2(i).kurt             = kurtosis([analysis.radialdistance.rallratio2(i).values],0);
	
	analysis.radialdistance.rallratio3(i).values           = data.population.radialdistancebins(i).rallratio3.values;
    analysis.radialdistance.rallratio3(i).mean             = mean([analysis.radialdistance.rallratio3(i).values]);
    analysis.radialdistance.rallratio3(i).std              = std([analysis.radialdistance.rallratio3(i).values]);
    analysis.radialdistance.rallratio3(i).max              = max([analysis.radialdistance.rallratio3(i).values]);
    analysis.radialdistance.rallratio3(i).min              = min([analysis.radialdistance.rallratio3(i).values]);
    analysis.radialdistance.rallratio3(i).skew             = skewness([analysis.radialdistance.rallratio3(i).values],0);
    analysis.radialdistance.rallratio3(i).kurt             = kurtosis([analysis.radialdistance.rallratio3(i).values],0);
    
    analysis.radialdistance.daughterratio(i).values           = data.population.radialdistancebins(i).daughterratio.values;
    analysis.radialdistance.daughterratio(i).mean             = mean([analysis.radialdistance.daughterratio(i).values]);
    analysis.radialdistance.daughterratio(i).std              = std([analysis.radialdistance.daughterratio(i).values]);
    analysis.radialdistance.daughterratio(i).max              = max([analysis.radialdistance.daughterratio(i).values]);
    analysis.radialdistance.daughterratio(i).min              = min([analysis.radialdistance.daughterratio(i).values]);
    analysis.radialdistance.daughterratio(i).skew             = skewness([analysis.radialdistance.daughterratio(i).values],0);
    analysis.radialdistance.daughterratio(i).kurt             = kurtosis([analysis.radialdistance.daughterratio(i).values],0);
    
    analysis.radialdistance.parentdaughterratio(i).values           = data.population.radialdistancebins(i).parentdaughterratio.values;
    analysis.radialdistance.parentdaughterratio(i).mean             = mean([analysis.radialdistance.parentdaughterratio(i).values]);
    analysis.radialdistance.parentdaughterratio(i).std              = std([analysis.radialdistance.parentdaughterratio(i).values]);
    analysis.radialdistance.parentdaughterratio(i).max              = max([analysis.radialdistance.parentdaughterratio(i).values]);
    analysis.radialdistance.parentdaughterratio(i).min              = min([analysis.radialdistance.parentdaughterratio(i).values]);
    analysis.radialdistance.parentdaughterratio(i).skew             = skewness([analysis.radialdistance.parentdaughterratio(i).values],0);
    analysis.radialdistance.parentdaughterratio(i).kurt             = kurtosis([analysis.radialdistance.parentdaughterratio(i).values],0);
    
    analysis.radialdistance.parentdaughter2ratio(i).values           = data.population.radialdistancebins(i).parentdaughter2ratio.values;
    analysis.radialdistance.parentdaughter2ratio(i).mean             = mean([analysis.radialdistance.parentdaughter2ratio(i).values]);
    analysis.radialdistance.parentdaughter2ratio(i).std              = std([analysis.radialdistance.parentdaughter2ratio(i).values]);
    analysis.radialdistance.parentdaughter2ratio(i).max              = max([analysis.radialdistance.parentdaughter2ratio(i).values]);
    analysis.radialdistance.parentdaughter2ratio(i).min              = min([analysis.radialdistance.parentdaughter2ratio(i).values]);
    analysis.radialdistance.parentdaughter2ratio(i).skew             = skewness([analysis.radialdistance.parentdaughter2ratio(i).values],0);
    analysis.radialdistance.parentdaughter2ratio(i).kurt             = kurtosis([analysis.radialdistance.parentdaughter2ratio(i).values],0);
    
    analysis.radialdistance.diameter(i).values           = data.population.radialdistancebins(i).diameter.values;
    analysis.radialdistance.diameter(i).mean             = mean([analysis.radialdistance.diameter(i).values]);
    analysis.radialdistance.diameter(i).std              = std([analysis.radialdistance.diameter(i).values]);
    analysis.radialdistance.diameter(i).max              = max([analysis.radialdistance.diameter(i).values]);
    analysis.radialdistance.diameter(i).min              = min([analysis.radialdistance.diameter(i).values]);
    analysis.radialdistance.diameter(i).skew             = skewness([analysis.radialdistance.diameter(i).values],0);
    analysis.radialdistance.diameter(i).kurt             = kurtosis([analysis.radialdistance.diameter(i).values],0);
    
    analysis.radialdistance.taperrate(i).values           = data.population.radialdistancebins(i).taperrate.values;
    analysis.radialdistance.taperrate(i).mean             = sum([data.population.radialdistancebins(i).taperrate.values].*[data.population.radialdistancebins(i).taperratelength.values])/sum([data.population.radialdistancebins(i).taperratelength.values]);
    analysis.radialdistance.taperrate(i).std              = std([analysis.radialdistance.taperrate(i).values]);
    analysis.radialdistance.taperrate(i).max              = max([analysis.radialdistance.taperrate(i).values]);
    analysis.radialdistance.taperrate(i).min              = min([analysis.radialdistance.taperrate(i).values]);
    analysis.radialdistance.taperrate(i).skew             = skewness([analysis.radialdistance.taperrate(i).values],0);
    analysis.radialdistance.taperrate(i).kurt             = kurtosis([analysis.radialdistance.taperrate(i).values],0);
	
% 	analysis.radialdistance.taperratevolume(i).values           = data.population.radialdistancebins(i).taperratevolume.values;
%     analysis.radialdistance.taperratevolume(i).mean             = sum([data.population.radialdistancebins(i).taperratevolume.values].*[data.population.radialdistancebins(i).taperratelength.values])/sum([data.population.radialdistancebins(i).taperratelength.values]);
%     analysis.radialdistance.taperratevolume(i).std              = std([analysis.radialdistance.taperratevolume(i).values]);
%     analysis.radialdistance.taperratevolume(i).max              = max([analysis.radialdistance.taperratevolume(i).values]);
%     analysis.radialdistance.taperratevolume(i).min              = min([analysis.radialdistance.taperratevolume(i).values]);
%     analysis.radialdistance.taperratevolume(i).skew             = skewness([analysis.radialdistance.taperratevolume(i).values],0);
%     analysis.radialdistance.taperratevolume(i).kurt             = kurtosis([analysis.radialdistance.taperratevolume(i).values],0);
% 	
% 	analysis.radialdistance.taperratesurfacearea(i).values           = data.population.radialdistancebins(i).taperratesurfacearea.values;
%     analysis.radialdistance.taperratesurfacearea(i).mean             = sum([data.population.radialdistancebins(i).taperratesurfacearea.values].*[data.population.radialdistancebins(i).taperratelength.values])/sum([data.population.radialdistancebins(i).taperratelength.values]);
%     analysis.radialdistance.taperratesurfacearea(i).std              = std([analysis.radialdistance.taperratesurfacearea(i).values]);
%     analysis.radialdistance.taperratesurfacearea(i).max              = max([analysis.radialdistance.taperratesurfacearea(i).values]);
%     analysis.radialdistance.taperratesurfacearea(i).min              = min([analysis.radialdistance.taperratesurfacearea(i).values]);
%     analysis.radialdistance.taperratesurfacearea(i).skew             = skewness([analysis.radialdistance.taperratesurfacearea(i).values],0);
%     analysis.radialdistance.taperratesurfacearea(i).kurt             = kurtosis([analysis.radialdistance.taperratesurfacearea(i).values],0);
    
    analysis.radialdistance.bifurcationprobability.length(i) = analysis.radialdistance.numberbifurcations(i).total / analysis.radialdistance.length(i).total;
    analysis.radialdistance.terminationprobability.length(i) = analysis.radialdistance.numberterminations(i).total / analysis.radialdistance.length(i).total;
    
    analysis.radialdistance.bifurcationprobability.surfacearea(i) = analysis.radialdistance.numberbifurcations(i).total / analysis.radialdistance.surfacearea(i).total;
    analysis.radialdistance.terminationprobability.surfacearea(i) = analysis.radialdistance.numberterminations(i).total / analysis.radialdistance.surfacearea(i).total;
    
    analysis.radialdistance.bifurcationprobability.volume(i) = analysis.radialdistance.numberbifurcations(i).total / analysis.radialdistance.volume(i).total;
    analysis.radialdistance.terminationprobability.volume(i) = analysis.radialdistance.numberterminations(i).total / analysis.radialdistance.volume(i).total;
    
end
    
analysis.radialdistance = orderfields(analysis.radialdistance);







% Begin bifurcation radial distance analysis

clear radialdistancebinlengths maxradialdistancebin;

for i = 1:length(data.individual)
    radialdistancebinlengths(i) = length(data.individual(i).bifurcation.radialdistancebins);
end

maxradialdistancebin = max(radialdistancebinlengths);

for i = 1:maxradialdistancebin
    data.population.bifurcation.radialdistancebins(i).rallratio.values            = [];
    data.population.bifurcation.radialdistancebins(i).rallratio1.values           = [];
    data.population.bifurcation.radialdistancebins(i).rallratio2.values           = [];
	data.population.bifurcation.radialdistancebins(i).rallratio3.values           = [];
    data.population.bifurcation.radialdistancebins(i).daughterratio.values        = [];
    data.population.bifurcation.radialdistancebins(i).parentdaughterratio.values  = [];
    data.population.bifurcation.radialdistancebins(i).parentdaughter2ratio.values = [];
    data.population.bifurcation.radialdistancebins(i).taperrate.values            = [];
	%data.population.bifurcation.radialdistancebins(i).taperratevolume.values      = [];
	%data.population.bifurcation.radialdistancebins(i).taperratesurfacearea.values = [];
    data.population.bifurcation.radialdistancebins(i).taperratelength.values      = [];
end
    

for i = 1:length(data.individual)
    
    for j = 1:length(data.individual(i).bifurcation.radialdistancebins)
        
        data.individual(i).bifurcation.radialdistancebins(j).length                      = sum([data.individual(i).bifurcation.radialdistancebins(j).piece.length]);
        data.individual(i).bifurcation.radialdistancebins(j).surfacearea                 = sum([data.individual(i).bifurcation.radialdistancebins(j).piece.surfacearea]);
        data.individual(i).bifurcation.radialdistancebins(j).volume                      = sum([data.individual(i).bifurcation.radialdistancebins(j).piece.volume]);
        data.individual(i).bifurcation.radialdistancebins(j).numbersegments              = length(unique([data.individual(i).bifurcation.radialdistancebins(j).piece.cable]));
        data.individual(i).bifurcation.radialdistancebins(j).numberbifurcations          = 0;
        data.individual(i).bifurcation.radialdistancebins(j).rallratio.values            = [data.individual(i).bifurcation.radialdistancebins(j).piece.rallratio];
        data.individual(i).bifurcation.radialdistancebins(j).rallratio1.values           = [data.individual(i).bifurcation.radialdistancebins(j).piece.rallratio1];
        data.individual(i).bifurcation.radialdistancebins(j).rallratio2.values           = [data.individual(i).bifurcation.radialdistancebins(j).piece.rallratio2];
		data.individual(i).bifurcation.radialdistancebins(j).rallratio3.values           = [data.individual(i).bifurcation.radialdistancebins(j).piece.rallratio3];
        data.individual(i).bifurcation.radialdistancebins(j).daughterratio.values        = [data.individual(i).bifurcation.radialdistancebins(j).piece.daughterratio];
        data.individual(i).bifurcation.radialdistancebins(j).parentdaughterratio.values  = [data.individual(i).bifurcation.radialdistancebins(j).piece.parentdaughterratio];
        data.individual(i).bifurcation.radialdistancebins(j).parentdaughter2ratio.values = [data.individual(i).bifurcation.radialdistancebins(j).piece.parentdaughter2ratio];
        data.individual(i).bifurcation.radialdistancebins(j).diameter                    = ((4*data.individual(i).bifurcation.radialdistancebins(j).volume)/(pi()*data.individual(i).bifurcation.radialdistancebins(j).length))^0.5;            
        data.individual(i).bifurcation.radialdistancebins(j).taperrate.values            = [data.individual(i).bifurcation.radialdistancebins(j).piece.taperrate];
		%data.individual(i).bifurcation.radialdistancebins(j).taperratevolume.values      = [data.individual(i).bifurcation.radialdistancebins(j).piece.taperratevolume];
		%data.individual(i).bifurcation.radialdistancebins(j).taperratesurfacearea.values = [data.individual(i).bifurcation.radialdistancebins(j).piece.taperratesurfacearea];
        data.individual(i).bifurcation.radialdistancebins(j).taperratelength.values      = [data.individual(i).bifurcation.radialdistancebins(j).piece.length];
  
        for k = 1:length(data.individual(i).bifurcation.radialdistancebins(j).piece)           
            if strcmp(data.individual(i).bifurcation.radialdistancebins(j).piece(k).distaltype,'bifurcation')==1
                data.individual(i).bifurcation.radialdistancebins(j).numberbifurcations = 1 + data.individual(i).bifurcation.radialdistancebins(j).numberbifurcations;
            end
        end
        
        if isfield(data.population,'radialdistancebins') == 0; nextvalue = 1;
        elseif j > length(data.population.bifurcation.radialdistancebins); nextvalue = 1;
        elseif isfield(data.population.bifurcation.radialdistancebins(j),'length') == 0; nextvalue = 1;
        elseif isfield(data.population.bifurcation.radialdistancebins(j).length,'values') == 0; nextvalue = 1;
        else nextvalue = 1 + length(data.population.bifurcation.radialdistancebins(j).length.values);
        end
        data.population.bifurcation.radialdistancebins(j).length.values(nextvalue)             = data.individual(i).bifurcation.radialdistancebins(j).length;
        data.population.bifurcation.radialdistancebins(j).surfacearea.values(nextvalue)        = data.individual(i).bifurcation.radialdistancebins(j).surfacearea;
        data.population.bifurcation.radialdistancebins(j).volume.values(nextvalue)             = data.individual(i).bifurcation.radialdistancebins(j).volume;
        data.population.bifurcation.radialdistancebins(j).numbersegments.values(nextvalue)     = data.individual(i).bifurcation.radialdistancebins(j).numbersegments;
        data.population.bifurcation.radialdistancebins(j).numberbifurcations.values(nextvalue) = data.individual(i).bifurcation.radialdistancebins(j).numberbifurcations;
        data.population.bifurcation.radialdistancebins(j).rallratio.values                     = [ [data.population.bifurcation.radialdistancebins(j).rallratio.values] [data.individual(i).bifurcation.radialdistancebins(j).rallratio.values] ];
        data.population.bifurcation.radialdistancebins(j).rallratio1.values                    = [ [data.population.bifurcation.radialdistancebins(j).rallratio1.values] [data.individual(i).bifurcation.radialdistancebins(j).rallratio1.values] ];
        data.population.bifurcation.radialdistancebins(j).rallratio2.values                    = [ [data.population.bifurcation.radialdistancebins(j).rallratio2.values] [data.individual(i).bifurcation.radialdistancebins(j).rallratio2.values] ];
		data.population.bifurcation.radialdistancebins(j).rallratio3.values                    = [ [data.population.bifurcation.radialdistancebins(j).rallratio3.values] [data.individual(i).bifurcation.radialdistancebins(j).rallratio3.values] ];
        data.population.bifurcation.radialdistancebins(j).daughterratio.values                 = [ [data.population.bifurcation.radialdistancebins(j).daughterratio.values] [data.individual(i).bifurcation.radialdistancebins(j).daughterratio.values] ];
        data.population.bifurcation.radialdistancebins(j).parentdaughterratio.values           = [ [data.population.bifurcation.radialdistancebins(j).parentdaughterratio.values] [data.individual(i).bifurcation.radialdistancebins(j).parentdaughterratio.values] ];
        data.population.bifurcation.radialdistancebins(j).parentdaughter2ratio.values          = [ [data.population.bifurcation.radialdistancebins(j).parentdaughter2ratio.values] [data.individual(i).bifurcation.radialdistancebins(j).parentdaughter2ratio.values] ];
        data.population.bifurcation.radialdistancebins(j).diameter.values(nextvalue)           = data.individual(i).bifurcation.radialdistancebins(j).diameter;
        data.population.bifurcation.radialdistancebins(j).taperrate.values                     = [ [data.population.bifurcation.radialdistancebins(j).taperrate.values] [data.individual(i).bifurcation.radialdistancebins(j).taperrate.values] ];
		%data.population.bifurcation.radialdistancebins(j).taperratevolume.values               = [ [data.population.bifurcation.radialdistancebins(j).taperratevolume.values] [data.individual(i).bifurcation.radialdistancebins(j).taperratevolume.values] ];
		%data.population.bifurcation.radialdistancebins(j).taperratesurfacearea.values          = [ [data.population.bifurcation.radialdistancebins(j).taperratesurfacearea.values] [data.individual(i).bifurcation.radialdistancebins(j).taperratesurfacearea.values] ];
        data.population.bifurcation.radialdistancebins(j).taperratelength.values               = [ [data.population.bifurcation.radialdistancebins(j).taperratelength.values] [data.individual(i).bifurcation.radialdistancebins(j).taperratelength.values] ];
        
        clear nextvalue;
        
    end
end

for i = 1:length(data.population.bifurcation.radialdistancebins)
    analysis.bifurcation.radialdistance.radialdistance(i)              = (data.distancebinwidth * i) - (data.distancebinwidth / 2);
    
    analysis.bifurcation.radialdistance.length(i).values           = data.population.bifurcation.radialdistancebins(i).length.values;
    analysis.bifurcation.radialdistance.length(i).mean             = mean([analysis.bifurcation.radialdistance.length(i).values]);
    analysis.bifurcation.radialdistance.length(i).std              = std([analysis.bifurcation.radialdistance.length(i).values]);
    analysis.bifurcation.radialdistance.length(i).max              = max([analysis.bifurcation.radialdistance.length(i).values]);
    analysis.bifurcation.radialdistance.length(i).min              = min([analysis.bifurcation.radialdistance.length(i).values]);
    analysis.bifurcation.radialdistance.length(i).skew             = skewness([analysis.bifurcation.radialdistance.length(i).values],0);
    analysis.bifurcation.radialdistance.length(i).kurt             = kurtosis([analysis.bifurcation.radialdistance.length(i).values],0);
    analysis.bifurcation.radialdistance.length(i).total            = sum([analysis.bifurcation.radialdistance.length(i).values]);
    
    analysis.bifurcation.radialdistance.surfacearea(i).values           = data.population.bifurcation.radialdistancebins(i).surfacearea.values;
    analysis.bifurcation.radialdistance.surfacearea(i).mean             = mean([analysis.bifurcation.radialdistance.surfacearea(i).values]);
    analysis.bifurcation.radialdistance.surfacearea(i).std              = std([analysis.bifurcation.radialdistance.surfacearea(i).values]);
    analysis.bifurcation.radialdistance.surfacearea(i).max              = max([analysis.bifurcation.radialdistance.surfacearea(i).values]);
    analysis.bifurcation.radialdistance.surfacearea(i).min              = min([analysis.bifurcation.radialdistance.surfacearea(i).values]);
    analysis.bifurcation.radialdistance.surfacearea(i).skew             = skewness([analysis.bifurcation.radialdistance.surfacearea(i).values],0);
    analysis.bifurcation.radialdistance.surfacearea(i).kurt             = kurtosis([analysis.bifurcation.radialdistance.surfacearea(i).values],0);
    analysis.bifurcation.radialdistance.surfacearea(i).total            = sum([analysis.bifurcation.radialdistance.surfacearea(i).values]);
    
    analysis.bifurcation.radialdistance.volume(i).values           = data.population.bifurcation.radialdistancebins(i).volume.values;
    analysis.bifurcation.radialdistance.volume(i).mean             = mean([analysis.bifurcation.radialdistance.volume(i).values]);
    analysis.bifurcation.radialdistance.volume(i).std              = std([analysis.bifurcation.radialdistance.volume(i).values]);
    analysis.bifurcation.radialdistance.volume(i).max              = max([analysis.bifurcation.radialdistance.volume(i).values]);
    analysis.bifurcation.radialdistance.volume(i).min              = min([analysis.bifurcation.radialdistance.volume(i).values]);
    analysis.bifurcation.radialdistance.volume(i).skew             = skewness([analysis.bifurcation.radialdistance.volume(i).values],0);
    analysis.bifurcation.radialdistance.volume(i).kurt             = kurtosis([analysis.bifurcation.radialdistance.volume(i).values],0);
    analysis.bifurcation.radialdistance.volume(i).total            = sum([analysis.bifurcation.radialdistance.volume(i).values]);
    
    analysis.bifurcation.radialdistance.numbersegments(i).values           = data.population.bifurcation.radialdistancebins(i).numbersegments.values;
    analysis.bifurcation.radialdistance.numbersegments(i).mean             = mean([analysis.bifurcation.radialdistance.numbersegments(i).values]);
    analysis.bifurcation.radialdistance.numbersegments(i).std              = std([analysis.bifurcation.radialdistance.numbersegments(i).values]);
    analysis.bifurcation.radialdistance.numbersegments(i).max              = max([analysis.bifurcation.radialdistance.numbersegments(i).values]);
    analysis.bifurcation.radialdistance.numbersegments(i).min              = min([analysis.bifurcation.radialdistance.numbersegments(i).values]);
    analysis.bifurcation.radialdistance.numbersegments(i).skew             = skewness([analysis.bifurcation.radialdistance.numbersegments(i).values],0);
    analysis.bifurcation.radialdistance.numbersegments(i).kurt             = kurtosis([analysis.bifurcation.radialdistance.numbersegments(i).values],0);
    analysis.bifurcation.radialdistance.numbersegments(i).total            = sum([analysis.bifurcation.radialdistance.numbersegments(i).values]);
    
    analysis.bifurcation.radialdistance.numberbifurcations(i).values           = data.population.bifurcation.radialdistancebins(i).numberbifurcations.values;
    analysis.bifurcation.radialdistance.numberbifurcations(i).mean             = mean([analysis.bifurcation.radialdistance.numberbifurcations(i).values]);
    analysis.bifurcation.radialdistance.numberbifurcations(i).std              = std([analysis.bifurcation.radialdistance.numberbifurcations(i).values]);
    analysis.bifurcation.radialdistance.numberbifurcations(i).max              = max([analysis.bifurcation.radialdistance.numberbifurcations(i).values]);
    analysis.bifurcation.radialdistance.numberbifurcations(i).min              = min([analysis.bifurcation.radialdistance.numberbifurcations(i).values]);
    analysis.bifurcation.radialdistance.numberbifurcations(i).skew             = skewness([analysis.bifurcation.radialdistance.numberbifurcations(i).values],0);
    analysis.bifurcation.radialdistance.numberbifurcations(i).kurt             = kurtosis([analysis.bifurcation.radialdistance.numberbifurcations(i).values],0);
    analysis.bifurcation.radialdistance.numberbifurcations(i).total            = sum([analysis.bifurcation.radialdistance.numberbifurcations(i).values]);
    
    analysis.bifurcation.radialdistance.rallratio(i).values           = data.population.bifurcation.radialdistancebins(i).rallratio.values;
    analysis.bifurcation.radialdistance.rallratio(i).mean             = mean([analysis.bifurcation.radialdistance.rallratio(i).values]);
    analysis.bifurcation.radialdistance.rallratio(i).std              = std([analysis.bifurcation.radialdistance.rallratio(i).values]);
    analysis.bifurcation.radialdistance.rallratio(i).max              = max([analysis.bifurcation.radialdistance.rallratio(i).values]);
    analysis.bifurcation.radialdistance.rallratio(i).min              = min([analysis.bifurcation.radialdistance.rallratio(i).values]);
    analysis.bifurcation.radialdistance.rallratio(i).skew             = skewness([analysis.bifurcation.radialdistance.rallratio(i).values],0);
    analysis.bifurcation.radialdistance.rallratio(i).kurt             = kurtosis([analysis.bifurcation.radialdistance.rallratio(i).values],0);
    
    analysis.bifurcation.radialdistance.rallratio1(i).values           = data.population.bifurcation.radialdistancebins(i).rallratio1.values;
    analysis.bifurcation.radialdistance.rallratio1(i).mean             = mean([analysis.bifurcation.radialdistance.rallratio1(i).values]);
    analysis.bifurcation.radialdistance.rallratio1(i).std              = std([analysis.bifurcation.radialdistance.rallratio1(i).values]);
    analysis.bifurcation.radialdistance.rallratio1(i).max              = max([analysis.bifurcation.radialdistance.rallratio1(i).values]);
    analysis.bifurcation.radialdistance.rallratio1(i).min              = min([analysis.bifurcation.radialdistance.rallratio1(i).values]);
    analysis.bifurcation.radialdistance.rallratio1(i).skew             = skewness([analysis.bifurcation.radialdistance.rallratio1(i).values],0);
    analysis.bifurcation.radialdistance.rallratio1(i).kurt             = kurtosis([analysis.bifurcation.radialdistance.rallratio1(i).values],0);
    
    analysis.bifurcation.radialdistance.rallratio2(i).values           = data.population.bifurcation.radialdistancebins(i).rallratio2.values;
    analysis.bifurcation.radialdistance.rallratio2(i).mean             = mean([analysis.bifurcation.radialdistance.rallratio2(i).values]);
    analysis.bifurcation.radialdistance.rallratio2(i).std              = std([analysis.bifurcation.radialdistance.rallratio2(i).values]);
    analysis.bifurcation.radialdistance.rallratio2(i).max              = max([analysis.bifurcation.radialdistance.rallratio2(i).values]);
    analysis.bifurcation.radialdistance.rallratio2(i).min              = min([analysis.bifurcation.radialdistance.rallratio2(i).values]);
    analysis.bifurcation.radialdistance.rallratio2(i).skew             = skewness([analysis.bifurcation.radialdistance.rallratio2(i).values],0);
    analysis.bifurcation.radialdistance.rallratio2(i).kurt             = kurtosis([analysis.bifurcation.radialdistance.rallratio2(i).values],0);
	
	analysis.bifurcation.radialdistance.rallratio3(i).values           = data.population.bifurcation.radialdistancebins(i).rallratio3.values;
    analysis.bifurcation.radialdistance.rallratio3(i).mean             = mean([analysis.bifurcation.radialdistance.rallratio3(i).values]);
    analysis.bifurcation.radialdistance.rallratio3(i).std              = std([analysis.bifurcation.radialdistance.rallratio3(i).values]);
    analysis.bifurcation.radialdistance.rallratio3(i).max              = max([analysis.bifurcation.radialdistance.rallratio3(i).values]);
    analysis.bifurcation.radialdistance.rallratio3(i).min              = min([analysis.bifurcation.radialdistance.rallratio3(i).values]);
    analysis.bifurcation.radialdistance.rallratio3(i).skew             = skewness([analysis.bifurcation.radialdistance.rallratio3(i).values],0);
    analysis.bifurcation.radialdistance.rallratio3(i).kurt             = kurtosis([analysis.bifurcation.radialdistance.rallratio3(i).values],0);
    
    analysis.bifurcation.radialdistance.daughterratio(i).values           = data.population.bifurcation.radialdistancebins(i).daughterratio.values;
    analysis.bifurcation.radialdistance.daughterratio(i).mean             = mean([analysis.bifurcation.radialdistance.daughterratio(i).values]);
    analysis.bifurcation.radialdistance.daughterratio(i).std              = std([analysis.bifurcation.radialdistance.daughterratio(i).values]);
    analysis.bifurcation.radialdistance.daughterratio(i).max              = max([analysis.bifurcation.radialdistance.daughterratio(i).values]);
    analysis.bifurcation.radialdistance.daughterratio(i).min              = min([analysis.bifurcation.radialdistance.daughterratio(i).values]);
    analysis.bifurcation.radialdistance.daughterratio(i).skew             = skewness([analysis.bifurcation.radialdistance.daughterratio(i).values],0);
    analysis.bifurcation.radialdistance.daughterratio(i).kurt             = kurtosis([analysis.bifurcation.radialdistance.daughterratio(i).values],0);
    
    analysis.bifurcation.radialdistance.parentdaughterratio(i).values           = data.population.bifurcation.radialdistancebins(i).parentdaughterratio.values;
    analysis.bifurcation.radialdistance.parentdaughterratio(i).mean             = mean([analysis.bifurcation.radialdistance.parentdaughterratio(i).values]);
    analysis.bifurcation.radialdistance.parentdaughterratio(i).std              = std([analysis.bifurcation.radialdistance.parentdaughterratio(i).values]);
    analysis.bifurcation.radialdistance.parentdaughterratio(i).max              = max([analysis.bifurcation.radialdistance.parentdaughterratio(i).values]);
    analysis.bifurcation.radialdistance.parentdaughterratio(i).min              = min([analysis.bifurcation.radialdistance.parentdaughterratio(i).values]);
    analysis.bifurcation.radialdistance.parentdaughterratio(i).skew             = skewness([analysis.bifurcation.radialdistance.parentdaughterratio(i).values],0);
    analysis.bifurcation.radialdistance.parentdaughterratio(i).kurt             = kurtosis([analysis.bifurcation.radialdistance.parentdaughterratio(i).values],0);
    
    analysis.bifurcation.radialdistance.parentdaughter2ratio(i).values           = data.population.bifurcation.radialdistancebins(i).parentdaughter2ratio.values;
    analysis.bifurcation.radialdistance.parentdaughter2ratio(i).mean             = mean([analysis.bifurcation.radialdistance.parentdaughter2ratio(i).values]);
    analysis.bifurcation.radialdistance.parentdaughter2ratio(i).std              = std([analysis.bifurcation.radialdistance.parentdaughter2ratio(i).values]);
    analysis.bifurcation.radialdistance.parentdaughter2ratio(i).max              = max([analysis.bifurcation.radialdistance.parentdaughter2ratio(i).values]);
    analysis.bifurcation.radialdistance.parentdaughter2ratio(i).min              = min([analysis.bifurcation.radialdistance.parentdaughter2ratio(i).values]);
    analysis.bifurcation.radialdistance.parentdaughter2ratio(i).skew             = skewness([analysis.bifurcation.radialdistance.parentdaughter2ratio(i).values],0);
    analysis.bifurcation.radialdistance.parentdaughter2ratio(i).kurt             = kurtosis([analysis.bifurcation.radialdistance.parentdaughter2ratio(i).values],0);
    
    analysis.bifurcation.radialdistance.diameter(i).values           = data.population.bifurcation.radialdistancebins(i).diameter.values;
    analysis.bifurcation.radialdistance.diameter(i).mean             = mean([analysis.bifurcation.radialdistance.diameter(i).values]);
    analysis.bifurcation.radialdistance.diameter(i).std              = std([analysis.bifurcation.radialdistance.diameter(i).values]);
    analysis.bifurcation.radialdistance.diameter(i).max              = max([analysis.bifurcation.radialdistance.diameter(i).values]);
    analysis.bifurcation.radialdistance.diameter(i).min              = min([analysis.bifurcation.radialdistance.diameter(i).values]);
    analysis.bifurcation.radialdistance.diameter(i).skew             = skewness([analysis.bifurcation.radialdistance.diameter(i).values],0);
    analysis.bifurcation.radialdistance.diameter(i).kurt             = kurtosis([analysis.bifurcation.radialdistance.diameter(i).values],0);
    
    analysis.bifurcation.radialdistance.taperrate(i).values           = data.population.bifurcation.radialdistancebins(i).taperrate.values;
    analysis.bifurcation.radialdistance.taperrate(i).mean             = sum([data.population.bifurcation.radialdistancebins(i).taperrate.values].*[data.population.bifurcation.radialdistancebins(i).taperratelength.values])/sum([data.population.bifurcation.radialdistancebins(i).taperratelength.values]);
    analysis.bifurcation.radialdistance.taperrate(i).std              = std([analysis.bifurcation.radialdistance.taperrate(i).values]);
    analysis.bifurcation.radialdistance.taperrate(i).max              = max([analysis.bifurcation.radialdistance.taperrate(i).values]);
    analysis.bifurcation.radialdistance.taperrate(i).min              = min([analysis.bifurcation.radialdistance.taperrate(i).values]);
    analysis.bifurcation.radialdistance.taperrate(i).skew             = skewness([analysis.bifurcation.radialdistance.taperrate(i).values],0);
    analysis.bifurcation.radialdistance.taperrate(i).kurt             = kurtosis([analysis.bifurcation.radialdistance.taperrate(i).values],0);
	
% 	analysis.bifurcation.radialdistance.taperratevolume(i).values           = data.population.bifurcation.radialdistancebins(i).taperratevolume.values;
%     analysis.bifurcation.radialdistance.taperratevolume(i).mean             = sum([data.population.bifurcation.radialdistancebins(i).taperratevolume.values].*[data.population.bifurcation.radialdistancebins(i).taperratelength.values])/sum([data.population.bifurcation.radialdistancebins(i).taperratelength.values]);
%     analysis.bifurcation.radialdistance.taperratevolume(i).std              = std([analysis.bifurcation.radialdistance.taperratevolume(i).values]);
%     analysis.bifurcation.radialdistance.taperratevolume(i).max              = max([analysis.bifurcation.radialdistance.taperratevolume(i).values]);
%     analysis.bifurcation.radialdistance.taperratevolume(i).min              = min([analysis.bifurcation.radialdistance.taperratevolume(i).values]);
%     analysis.bifurcation.radialdistance.taperratevolume(i).skew             = skewness([analysis.bifurcation.radialdistance.taperratevolume(i).values],0);
%     analysis.bifurcation.radialdistance.taperratevolume(i).kurt             = kurtosis([analysis.bifurcation.radialdistance.taperratevolume(i).values],0);
% 	
% 	analysis.bifurcation.radialdistance.taperratesurfacearea(i).values           = data.population.bifurcation.radialdistancebins(i).taperratesurfacearea.values;
%     analysis.bifurcation.radialdistance.taperratesurfacearea(i).mean             = sum([data.population.bifurcation.radialdistancebins(i).taperratesurfacearea.values].*[data.population.bifurcation.radialdistancebins(i).taperratelength.values])/sum([data.population.bifurcation.radialdistancebins(i).taperratelength.values]);
%     analysis.bifurcation.radialdistance.taperratesurfacearea(i).std              = std([analysis.bifurcation.radialdistance.taperratesurfacearea(i).values]);
%     analysis.bifurcation.radialdistance.taperratesurfacearea(i).max              = max([analysis.bifurcation.radialdistance.taperratesurfacearea(i).values]);
%     analysis.bifurcation.radialdistance.taperratesurfacearea(i).min              = min([analysis.bifurcation.radialdistance.taperratesurfacearea(i).values]);
%     analysis.bifurcation.radialdistance.taperratesurfacearea(i).skew             = skewness([analysis.bifurcation.radialdistance.taperratesurfacearea(i).values],0);
%     analysis.bifurcation.radialdistance.taperratesurfacearea(i).kurt             = kurtosis([analysis.bifurcation.radialdistance.taperratesurfacearea(i).values],0);
    
    analysis.bifurcation.radialdistance.bifurcationprobability.length(i)      = analysis.bifurcation.radialdistance.numberbifurcations(i).total / analysis.bifurcation.radialdistance.length(i).total;
    analysis.bifurcation.radialdistance.bifurcationprobability.surfacearea(i) = analysis.bifurcation.radialdistance.numberbifurcations(i).total / analysis.bifurcation.radialdistance.surfacearea(i).total;
    analysis.bifurcation.radialdistance.bifurcationprobability.volume(i)      = analysis.bifurcation.radialdistance.numberbifurcations(i).total / analysis.bifurcation.radialdistance.volume(i).total;
    
end
    
analysis.bifurcation.radialdistance = orderfields(analysis.bifurcation.radialdistance);









% Begin termination radial distance analysis

clear radialdistancebinlengths maxradialdistancebin;

for i = 1:length(data.individual)
    radialdistancebinlengths(i) = length(data.individual(i).termination.radialdistancebins);
end

maxradialdistancebin = max(radialdistancebinlengths);

for i = 1:maxradialdistancebin
    data.population.termination.radialdistancebins(i).taperrate.values            = [];
	%data.population.termination.radialdistancebins(i).taperratevolume.values      = [];
	%data.population.termination.radialdistancebins(i).taperratesurfacearea.values = [];
    data.population.termination.radialdistancebins(i).taperratelength.values      = [];
end
    

for i = 1:length(data.individual)
    
    for j = 1:length(data.individual(i).termination.radialdistancebins)
        
        if isfield(data.individual(i).termination.radialdistancebins(j).piece,'id') == 1
        
            data.individual(i).termination.radialdistancebins(j).length                      = sum([data.individual(i).termination.radialdistancebins(j).piece.length]);
            data.individual(i).termination.radialdistancebins(j).surfacearea                 = sum([data.individual(i).termination.radialdistancebins(j).piece.surfacearea]);
            data.individual(i).termination.radialdistancebins(j).volume                      = sum([data.individual(i).termination.radialdistancebins(j).piece.volume]);
            data.individual(i).termination.radialdistancebins(j).numbersegments              = length(unique([data.individual(i).termination.radialdistancebins(j).piece.cable]));
            data.individual(i).termination.radialdistancebins(j).numberterminations          = 0;
            data.individual(i).termination.radialdistancebins(j).diameter                    = ((4*data.individual(i).termination.radialdistancebins(j).volume)/(pi()*data.individual(i).termination.radialdistancebins(j).length))^0.5;            
            data.individual(i).termination.radialdistancebins(j).taperrate.values            = [data.individual(i).termination.radialdistancebins(j).piece.taperrate];
			%data.individual(i).termination.radialdistancebins(j).taperratevolume.values      = [data.individual(i).termination.radialdistancebins(j).piece.taperratevolume];
			%data.individual(i).termination.radialdistancebins(j).taperratesurfacearea.values = [data.individual(i).termination.radialdistancebins(j).piece.taperratesurfacearea];
            data.individual(i).termination.radialdistancebins(j).taperratelength.values      = [data.individual(i).termination.radialdistancebins(j).piece.length];

            for k = 1:length(data.individual(i).termination.radialdistancebins(j).piece)
                if strcmp(data.individual(i).termination.radialdistancebins(j).piece(k).distaltype,'termination')==1
                    data.individual(i).termination.radialdistancebins(j).numberterminations = 1 + data.individual(i).termination.radialdistancebins(j).numberterminations;
                end
            end

            if isfield(data.population,'radialdistancebins') == 0; nextvalue = 1;
            elseif j > length(data.population.termination.radialdistancebins); nextvalue = 1;
            elseif isfield(data.population.termination.radialdistancebins(j),'length') == 0; nextvalue = 1;
            elseif isfield(data.population.termination.radialdistancebins(j).length,'values') == 0; nextvalue = 1;
            else nextvalue = 1 + length(data.population.termination.radialdistancebins(j).length.values);
            end
            data.population.termination.radialdistancebins(j).length.values(nextvalue)             = data.individual(i).termination.radialdistancebins(j).length;
            data.population.termination.radialdistancebins(j).surfacearea.values(nextvalue)        = data.individual(i).termination.radialdistancebins(j).surfacearea;
            data.population.termination.radialdistancebins(j).volume.values(nextvalue)             = data.individual(i).termination.radialdistancebins(j).volume;
            data.population.termination.radialdistancebins(j).numbersegments.values(nextvalue)     = data.individual(i).termination.radialdistancebins(j).numbersegments;
            data.population.termination.radialdistancebins(j).numberterminations.values(nextvalue) = data.individual(i).termination.radialdistancebins(j).numberterminations;
            data.population.termination.radialdistancebins(j).diameter.values(nextvalue)           = data.individual(i).termination.radialdistancebins(j).diameter;
            data.population.termination.radialdistancebins(j).taperrate.values                     = [ [data.population.termination.radialdistancebins(j).taperrate.values] [data.individual(i).termination.radialdistancebins(j).taperrate.values] ];
			%data.population.termination.radialdistancebins(j).taperratevolume.values               = [ [data.population.termination.radialdistancebins(j).taperratevolume.values] [data.individual(i).termination.radialdistancebins(j).taperratevolume.values] ];
			%data.population.termination.radialdistancebins(j).taperratesurfacearea.values          = [ [data.population.termination.radialdistancebins(j).taperratesurfacearea.values] [data.individual(i).termination.radialdistancebins(j).taperratesurfacearea.values] ];
            data.population.termination.radialdistancebins(j).taperratelength.values               = [ [data.population.termination.radialdistancebins(j).taperratelength.values] [data.individual(i).termination.radialdistancebins(j).taperratelength.values] ];

            clear nextvalue;
        
        end
        
    end
end

for i = 1:length(data.population.termination.radialdistancebins)
    
    analysis.termination.radialdistance.radialdistance(i)              = (data.distancebinwidth * i) - (data.distancebinwidth / 2);
    
    if isfield(data.population.termination.radialdistancebins(i).length,'values') == 1
        
    
        analysis.termination.radialdistance.length(i).values           = data.population.termination.radialdistancebins(i).length.values;
        analysis.termination.radialdistance.length(i).mean             = mean([analysis.termination.radialdistance.length(i).values]);
        analysis.termination.radialdistance.length(i).std              = std([analysis.termination.radialdistance.length(i).values]);
        analysis.termination.radialdistance.length(i).max              = max([analysis.termination.radialdistance.length(i).values]);
        analysis.termination.radialdistance.length(i).min              = min([analysis.termination.radialdistance.length(i).values]);
        analysis.termination.radialdistance.length(i).skew             = skewness([analysis.termination.radialdistance.length(i).values],0);
        analysis.termination.radialdistance.length(i).kurt             = kurtosis([analysis.termination.radialdistance.length(i).values],0);
        analysis.termination.radialdistance.length(i).total            = sum([analysis.termination.radialdistance.length(i).values]);

        analysis.termination.radialdistance.surfacearea(i).values           = data.population.termination.radialdistancebins(i).surfacearea.values;
        analysis.termination.radialdistance.surfacearea(i).mean             = mean([analysis.termination.radialdistance.surfacearea(i).values]);
        analysis.termination.radialdistance.surfacearea(i).std              = std([analysis.termination.radialdistance.surfacearea(i).values]);
        analysis.termination.radialdistance.surfacearea(i).max              = max([analysis.termination.radialdistance.surfacearea(i).values]);
        analysis.termination.radialdistance.surfacearea(i).min              = min([analysis.termination.radialdistance.surfacearea(i).values]);
        analysis.termination.radialdistance.surfacearea(i).skew             = skewness([analysis.termination.radialdistance.surfacearea(i).values],0);
        analysis.termination.radialdistance.surfacearea(i).kurt             = kurtosis([analysis.termination.radialdistance.surfacearea(i).values],0);
        analysis.termination.radialdistance.surfacearea(i).total            = sum([analysis.termination.radialdistance.surfacearea(i).values]);

        analysis.termination.radialdistance.volume(i).values           = data.population.termination.radialdistancebins(i).volume.values;
        analysis.termination.radialdistance.volume(i).mean             = mean([analysis.termination.radialdistance.volume(i).values]);
        analysis.termination.radialdistance.volume(i).std              = std([analysis.termination.radialdistance.volume(i).values]);
        analysis.termination.radialdistance.volume(i).max              = max([analysis.termination.radialdistance.volume(i).values]);
        analysis.termination.radialdistance.volume(i).min              = min([analysis.termination.radialdistance.volume(i).values]);
        analysis.termination.radialdistance.volume(i).skew             = skewness([analysis.termination.radialdistance.volume(i).values],0);
        analysis.termination.radialdistance.volume(i).kurt             = kurtosis([analysis.termination.radialdistance.volume(i).values],0);
        analysis.termination.radialdistance.volume(i).total            = sum([analysis.termination.radialdistance.volume(i).values]);

        analysis.termination.radialdistance.numbersegments(i).values           = data.population.termination.radialdistancebins(i).numbersegments.values;
        analysis.termination.radialdistance.numbersegments(i).mean             = mean([analysis.termination.radialdistance.numbersegments(i).values]);
        analysis.termination.radialdistance.numbersegments(i).std              = std([analysis.termination.radialdistance.numbersegments(i).values]);
        analysis.termination.radialdistance.numbersegments(i).max              = max([analysis.termination.radialdistance.numbersegments(i).values]);
        analysis.termination.radialdistance.numbersegments(i).min              = min([analysis.termination.radialdistance.numbersegments(i).values]);
        analysis.termination.radialdistance.numbersegments(i).skew             = skewness([analysis.termination.radialdistance.numbersegments(i).values],0);
        analysis.termination.radialdistance.numbersegments(i).kurt             = kurtosis([analysis.termination.radialdistance.numbersegments(i).values],0);
        analysis.termination.radialdistance.numbersegments(i).total            = sum([analysis.termination.radialdistance.numbersegments(i).values]);
        
        analysis.termination.radialdistance.numberterminations(i).values           = data.population.termination.radialdistancebins(i).numberterminations.values;
        analysis.termination.radialdistance.numberterminations(i).mean             = mean([analysis.termination.radialdistance.numberterminations(i).values]);
        analysis.termination.radialdistance.numberterminations(i).std              = std([analysis.termination.radialdistance.numberterminations(i).values]);
        analysis.termination.radialdistance.numberterminations(i).max              = max([analysis.termination.radialdistance.numberterminations(i).values]);
        analysis.termination.radialdistance.numberterminations(i).min              = min([analysis.termination.radialdistance.numberterminations(i).values]);
        analysis.termination.radialdistance.numberterminations(i).skew             = skewness([analysis.termination.radialdistance.numberterminations(i).values],0);
        analysis.termination.radialdistance.numberterminations(i).kurt             = kurtosis([analysis.termination.radialdistance.numberterminations(i).values],0);
        analysis.termination.radialdistance.numberterminations(i).total            = sum([analysis.termination.radialdistance.numberterminations(i).values]);

        analysis.termination.radialdistance.diameter(i).values           = data.population.termination.radialdistancebins(i).diameter.values;
        analysis.termination.radialdistance.diameter(i).mean             = mean([analysis.termination.radialdistance.diameter(i).values]);
        analysis.termination.radialdistance.diameter(i).std              = std([analysis.termination.radialdistance.diameter(i).values]);
        analysis.termination.radialdistance.diameter(i).max              = max([analysis.termination.radialdistance.diameter(i).values]);
        analysis.termination.radialdistance.diameter(i).min              = min([analysis.termination.radialdistance.diameter(i).values]);
        analysis.termination.radialdistance.diameter(i).skew             = skewness([analysis.termination.radialdistance.diameter(i).values],0);
        analysis.termination.radialdistance.diameter(i).kurt             = kurtosis([analysis.termination.radialdistance.diameter(i).values],0);

        analysis.termination.radialdistance.taperrate(i).values           = data.population.termination.radialdistancebins(i).taperrate.values;
        analysis.termination.radialdistance.taperrate(i).mean             = sum([data.population.termination.radialdistancebins(i).taperrate.values].*[data.population.termination.radialdistancebins(i).taperratelength.values])/sum([data.population.termination.radialdistancebins(i).taperratelength.values]);
        analysis.termination.radialdistance.taperrate(i).std              = std([analysis.termination.radialdistance.taperrate(i).values]);
        analysis.termination.radialdistance.taperrate(i).max              = max([analysis.termination.radialdistance.taperrate(i).values]);
        analysis.termination.radialdistance.taperrate(i).min              = min([analysis.termination.radialdistance.taperrate(i).values]);
        analysis.termination.radialdistance.taperrate(i).skew             = skewness([analysis.termination.radialdistance.taperrate(i).values],0);
        analysis.termination.radialdistance.taperrate(i).kurt             = kurtosis([analysis.termination.radialdistance.taperrate(i).values],0);
		
% 		analysis.termination.radialdistance.taperratevolume(i).values           = data.population.termination.radialdistancebins(i).taperratevolume.values;
%         analysis.termination.radialdistance.taperratevolume(i).mean             = sum([data.population.termination.radialdistancebins(i).taperratevolume.values].*[data.population.termination.radialdistancebins(i).taperratelength.values])/sum([data.population.termination.radialdistancebins(i).taperratelength.values]);
%         analysis.termination.radialdistance.taperratevolume(i).std              = std([analysis.termination.radialdistance.taperratevolume(i).values]);
%         analysis.termination.radialdistance.taperratevolume(i).max              = max([analysis.termination.radialdistance.taperratevolume(i).values]);
%         analysis.termination.radialdistance.taperratevolume(i).min              = min([analysis.termination.radialdistance.taperratevolume(i).values]);
%         analysis.termination.radialdistance.taperratevolume(i).skew             = skewness([analysis.termination.radialdistance.taperratevolume(i).values],0);
%         analysis.termination.radialdistance.taperratevolume(i).kurt             = kurtosis([analysis.termination.radialdistance.taperratevolume(i).values],0);
% 		
% 		analysis.termination.radialdistance.taperratesurfacearea(i).values           = data.population.termination.radialdistancebins(i).taperratesurfacearea.values;
%         analysis.termination.radialdistance.taperratesurfacearea(i).mean             = sum([data.population.termination.radialdistancebins(i).taperratesurfacearea.values].*[data.population.termination.radialdistancebins(i).taperratelength.values])/sum([data.population.termination.radialdistancebins(i).taperratelength.values]);
%         analysis.termination.radialdistance.taperratesurfacearea(i).std              = std([analysis.termination.radialdistance.taperratesurfacearea(i).values]);
%         analysis.termination.radialdistance.taperratesurfacearea(i).max              = max([analysis.termination.radialdistance.taperratesurfacearea(i).values]);
%         analysis.termination.radialdistance.taperratesurfacearea(i).min              = min([analysis.termination.radialdistance.taperratesurfacearea(i).values]);
%         analysis.termination.radialdistance.taperratesurfacearea(i).skew             = skewness([analysis.termination.radialdistance.taperratesurfacearea(i).values],0);
%         analysis.termination.radialdistance.taperratesurfacearea(i).kurt             = kurtosis([analysis.termination.radialdistance.taperratesurfacearea(i).values],0);

    else
        analysis.termination.radialdistance.numbersegments(i).total     = 0;
		analysis.termination.radialdistance.numbersegments(i).mean      = NaN;
		analysis.termination.radialdistance.numbersegments(i).std       = NaN;
        analysis.termination.radialdistance.numberterminations(i).total = 0;
		analysis.termination.radialdistance.numberterminations(i).mean  = NaN;
		analysis.termination.radialdistance.numberterminations(i).std   = NaN;
        analysis.termination.radialdistance.length(i).total             = 0;
		analysis.termination.radialdistance.length(i).mean              = NaN;
		analysis.termination.radialdistance.length(i).std               = NaN;
        analysis.termination.radialdistance.surfacearea(i).total        = 0;
		analysis.termination.radialdistance.surfacearea(i).mean         = NaN;
		analysis.termination.radialdistance.surfacearea(i).std          = NaN;
        analysis.termination.radialdistance.volume(i).total             = 0;
		analysis.termination.radialdistance.volume(i).mean              = NaN;
		analysis.termination.radialdistance.volume(i).std               = NaN;
		analysis.termination.radialdistance.diameter(i).mean            = NaN;
		analysis.termination.radialdistance.diameter(i).std             = NaN;
		analysis.termination.radialdistance.taperrate(i).mean           = NaN;
		analysis.termination.radialdistance.taperrate(i).std            = NaN;
% 		analysis.termination.radialdistance.taperratevolume(i).mean     = NaN;
% 		analysis.termination.radialdistance.taperratevolume(i).std      = NaN;
% 		analysis.termination.radialdistance.taperratesurfacearea(i).mean = NaN;
% 		analysis.termination.radialdistance.taperratesurfacearea(i).std  = NaN;
    end

    analysis.termination.radialdistance.terminationprobability.length(i)      = analysis.termination.radialdistance.numberterminations(i).total / analysis.termination.radialdistance.length(i).total;
    analysis.termination.radialdistance.terminationprobability.surfacearea(i) = analysis.termination.radialdistance.numberterminations(i).total / analysis.termination.radialdistance.surfacearea(i).total;
    analysis.termination.radialdistance.terminationprobability.volume(i)      = analysis.termination.radialdistance.numberterminations(i).total / analysis.termination.radialdistance.volume(i).total;
    
    
end
    
analysis.termination.radialdistance = orderfields(analysis.termination.radialdistance);




warning('on', 'MATLAB:divideByZero');