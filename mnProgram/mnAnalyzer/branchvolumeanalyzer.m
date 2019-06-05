function [data,analysis]   = branchvolumeanalyzer(data,analysis)

disp('   Branch volume analysis started.');

warning('off', 'MATLAB:divideByZero');

for i = 1:length(data.individual)
    branchvolumebinlengths(i) = length(data.individual(i).branchvolumebins);
end

maxbranchvolumebin = max(branchvolumebinlengths);

for i = 1:maxbranchvolumebin
    data.population.branchvolumebins(i).rallratio.values            = [];
    data.population.branchvolumebins(i).rallratio1.values           = [];
    data.population.branchvolumebins(i).rallratio2.values           = [];
	data.population.branchvolumebins(i).rallratio3.values           = [];
    data.population.branchvolumebins(i).daughterratio.values        = [];
    data.population.branchvolumebins(i).parentdaughterratio.values  = [];
    data.population.branchvolumebins(i).parentdaughter2ratio.values = [];
    data.population.branchvolumebins(i).taperrate.values            = [];
	%data.population.branchvolumebins(i).taperratevolume.values      = [];
	%data.population.branchvolumebins(i).taperratesurfacearea.values = [];
    data.population.branchvolumebins(i).taperratelength.values      = [];
end
    

for i = 1:length(data.individual)
    
    for j = 1:length(data.individual(i).branchvolumebins)
        
        data.individual(i).branchvolumebins(j).length                      = sum([data.individual(i).branchvolumebins(j).piece.length]);
        data.individual(i).branchvolumebins(j).surfacearea                 = sum([data.individual(i).branchvolumebins(j).piece.surfacearea]);
        data.individual(i).branchvolumebins(j).volume                      = sum([data.individual(i).branchvolumebins(j).piece.volume]);
        data.individual(i).branchvolumebins(j).numbersegments              = length(unique([data.individual(i).branchvolumebins(j).piece.cable]));
        data.individual(i).branchvolumebins(j).numberbifurcations          = 0;
        data.individual(i).branchvolumebins(j).numberterminations          = 0;
        data.individual(i).branchvolumebins(j).numberbifurcatingbranches   = 0;
        data.individual(i).branchvolumebins(j).numberterminatingbranches   = 0;
        data.individual(i).branchvolumebins(j).rallratio.values            = [data.individual(i).branchvolumebins(j).piece.rallratio];
        data.individual(i).branchvolumebins(j).rallratio1.values           = [data.individual(i).branchvolumebins(j).piece.rallratio1];
        data.individual(i).branchvolumebins(j).rallratio2.values           = [data.individual(i).branchvolumebins(j).piece.rallratio2];
		data.individual(i).branchvolumebins(j).rallratio3.values           = [data.individual(i).branchvolumebins(j).piece.rallratio3];
        data.individual(i).branchvolumebins(j).daughterratio.values        = [data.individual(i).branchvolumebins(j).piece.daughterratio];
        data.individual(i).branchvolumebins(j).parentdaughterratio.values  = [data.individual(i).branchvolumebins(j).piece.parentdaughterratio];
        data.individual(i).branchvolumebins(j).parentdaughter2ratio.values = [data.individual(i).branchvolumebins(j).piece.parentdaughter2ratio];
        data.individual(i).branchvolumebins(j).diameter                    = ((4*data.individual(i).branchvolumebins(j).volume)/(pi()*data.individual(i).branchvolumebins(j).length))^0.5;            
        data.individual(i).branchvolumebins(j).taperrate.values            = [data.individual(i).branchvolumebins(j).piece.taperrate];
		%data.individual(i).branchvolumebins(j).taperratevolume.values      = [data.individual(i).branchvolumebins(j).piece.taperratevolume];
		%data.individual(i).branchvolumebins(j).taperratesurfacearea.values = [data.individual(i).branchvolumebins(j).piece.taperratesurfacearea];
        data.individual(i).branchvolumebins(j).taperratelength.values      = [data.individual(i).branchvolumebins(j).piece.length];
        
        
        for k = 1:length(data.individual(i).branchvolumebins(j).piece)           
            if strcmp(data.individual(i).branchvolumebins(j).piece(k).distaltype,'bifurcation')==1
                data.individual(i).branchvolumebins(j).numberbifurcations = 1 + data.individual(i).branchvolumebins(j).numberbifurcations;
            end
            if strcmp(data.individual(i).branchvolumebins(j).piece(k).distaltype,'termination')==1
                data.individual(i).branchvolumebins(j).numberterminations = 1 + data.individual(i).branchvolumebins(j).numberterminations;
            end
            if strcmp(data.individual(i).branchvolumebins(j).piece(k).proximaltype,'primary    ') ==1 || strcmp(data.individual(i).branchvolumebins(j).piece(k).proximaltype,'daughter1  ') ==1 || strcmp(data.individual(i).branchvolumebins(j).piece(k).proximaltype,'daughter2  ') ==1
                if strcmp(data.individual(i).branchvolumebins(j).piece(k).branchtype,'b') == 1
                    data.individual(i).branchvolumebins(j).numberbifurcatingbranches = 1 + data.individual(i).branchvolumebins(j).numberbifurcatingbranches;
                elseif strcmp(data.individual(i).branchvolumebins(j).piece(k).branchtype,'t') == 1
                    data.individual(i).branchvolumebins(j).numberterminatingbranches = 1 + data.individual(i).branchvolumebins(j).numberterminatingbranches;
                else disp('       Error in branch length analyzer: piece branch type not identified.');
                end
            end
        end
        
        if isfield(data.population,'branchvolumebins') == 0; nextvalue = 1;
        elseif j > length(data.population.branchvolumebins); nextvalue = 1;
        elseif isfield(data.population.branchvolumebins(j),'length') == 0; nextvalue = 1;
        elseif isfield(data.population.branchvolumebins(j).length,'values') == 0; nextvalue = 1;
        else nextvalue = 1 + length(data.population.branchvolumebins(j).length.values);
        end
        data.population.branchvolumebins(j).length.values(nextvalue)             = data.individual(i).branchvolumebins(j).length;
        data.population.branchvolumebins(j).surfacearea.values(nextvalue)        = data.individual(i).branchvolumebins(j).surfacearea;
        data.population.branchvolumebins(j).volume.values(nextvalue)             = data.individual(i).branchvolumebins(j).volume;
        data.population.branchvolumebins(j).numbersegments.values(nextvalue)     = data.individual(i).branchvolumebins(j).numbersegments;
        data.population.branchvolumebins(j).numberbifurcations.values(nextvalue) = data.individual(i).branchvolumebins(j).numberbifurcations;
        data.population.branchvolumebins(j).numberterminations.values(nextvalue) = data.individual(i).branchvolumebins(j).numberterminations;
        data.population.branchvolumebins(j).numberbifurcatingbranches.values(nextvalue) = data.individual(i).branchvolumebins(j).numberbifurcatingbranches;
        data.population.branchvolumebins(j).numberterminatingbranches.values(nextvalue) = data.individual(i).branchvolumebins(j).numberterminatingbranches;
        data.population.branchvolumebins(j).rallratio.values                     = [ [data.population.branchvolumebins(j).rallratio.values] [data.individual(i).branchvolumebins(j).rallratio.values] ];
        data.population.branchvolumebins(j).rallratio1.values                    = [ [data.population.branchvolumebins(j).rallratio1.values] [data.individual(i).branchvolumebins(j).rallratio1.values] ];
        data.population.branchvolumebins(j).rallratio2.values                    = [ [data.population.branchvolumebins(j).rallratio2.values] [data.individual(i).branchvolumebins(j).rallratio2.values] ];
		data.population.branchvolumebins(j).rallratio3.values                    = [ [data.population.branchvolumebins(j).rallratio3.values] [data.individual(i).branchvolumebins(j).rallratio3.values] ];
        data.population.branchvolumebins(j).daughterratio.values                 = [ [data.population.branchvolumebins(j).daughterratio.values] [data.individual(i).branchvolumebins(j).daughterratio.values] ];
        data.population.branchvolumebins(j).parentdaughterratio.values           = [ [data.population.branchvolumebins(j).parentdaughterratio.values] [data.individual(i).branchvolumebins(j).parentdaughterratio.values] ];
        data.population.branchvolumebins(j).parentdaughter2ratio.values          = [ [data.population.branchvolumebins(j).parentdaughter2ratio.values] [data.individual(i).branchvolumebins(j).parentdaughter2ratio.values] ];
        data.population.branchvolumebins(j).diameter.values(nextvalue)           = data.individual(i).branchvolumebins(j).diameter;
        data.population.branchvolumebins(j).taperrate.values                     = [ [data.population.branchvolumebins(j).taperrate.values] [data.individual(i).branchvolumebins(j).taperrate.values] ];
		%data.population.branchvolumebins(j).taperratevolume.values               = [ [data.population.branchvolumebins(j).taperratevolume.values] [data.individual(i).branchvolumebins(j).taperratevolume.values] ];
		%data.population.branchvolumebins(j).taperratesurfacearea.values          = [ [data.population.branchvolumebins(j).taperratesurfacearea.values] [data.individual(i).branchvolumebins(j).taperratesurfacearea.values] ];
        data.population.branchvolumebins(j).taperratelength.values               = [ [data.population.branchvolumebins(j).taperratelength.values] [data.individual(i).branchvolumebins(j).taperratelength.values] ];
        
        clear nextvalue;
        
    end
end

for i = 1:length(data.population.branchvolumebins)
    
    analysis.branchvolume.branchvolume(i)              = (data.branchvolumebinwidth * i) - (data.branchvolumebinwidth / 2);
    
    analysis.branchvolume.length(i).values           = data.population.branchvolumebins(i).length.values;
    analysis.branchvolume.length(i).mean             = mean([analysis.branchvolume.length(i).values]);
    analysis.branchvolume.length(i).std              = std([analysis.branchvolume.length(i).values]);
    analysis.branchvolume.length(i).max              = max([analysis.branchvolume.length(i).values]);
    analysis.branchvolume.length(i).min              = min([analysis.branchvolume.length(i).values]);
    analysis.branchvolume.length(i).skew             = skewness([analysis.branchvolume.length(i).values],0);
    analysis.branchvolume.length(i).kurt             = kurtosis([analysis.branchvolume.length(i).values],0);
    analysis.branchvolume.length(i).total            = sum([analysis.branchvolume.length(i).values]);
    
    analysis.branchvolume.surfacearea(i).values           = data.population.branchvolumebins(i).surfacearea.values;
    analysis.branchvolume.surfacearea(i).mean             = mean([analysis.branchvolume.surfacearea(i).values]);
    analysis.branchvolume.surfacearea(i).std              = std([analysis.branchvolume.surfacearea(i).values]);
    analysis.branchvolume.surfacearea(i).max              = max([analysis.branchvolume.surfacearea(i).values]);
    analysis.branchvolume.surfacearea(i).min              = min([analysis.branchvolume.surfacearea(i).values]);
    analysis.branchvolume.surfacearea(i).skew             = skewness([analysis.branchvolume.surfacearea(i).values],0);
    analysis.branchvolume.surfacearea(i).kurt             = kurtosis([analysis.branchvolume.surfacearea(i).values],0);
    analysis.branchvolume.surfacearea(i).total            = sum([analysis.branchvolume.surfacearea(i).values]);
    
    analysis.branchvolume.volume(i).values           = data.population.branchvolumebins(i).volume.values;
    analysis.branchvolume.volume(i).mean             = mean([analysis.branchvolume.volume(i).values]);
    analysis.branchvolume.volume(i).std              = std([analysis.branchvolume.volume(i).values]);
    analysis.branchvolume.volume(i).max              = max([analysis.branchvolume.volume(i).values]);
    analysis.branchvolume.volume(i).min              = min([analysis.branchvolume.volume(i).values]);
    analysis.branchvolume.volume(i).skew             = skewness([analysis.branchvolume.volume(i).values],0);
    analysis.branchvolume.volume(i).kurt             = kurtosis([analysis.branchvolume.volume(i).values],0);
    analysis.branchvolume.volume(i).total            = sum([analysis.branchvolume.volume(i).values]);
    
    analysis.branchvolume.numbersegments(i).values           = data.population.branchvolumebins(i).numbersegments.values;
    analysis.branchvolume.numbersegments(i).mean             = mean([analysis.branchvolume.numbersegments(i).values]);
    analysis.branchvolume.numbersegments(i).std              = std([analysis.branchvolume.numbersegments(i).values]);
    analysis.branchvolume.numbersegments(i).max              = max([analysis.branchvolume.numbersegments(i).values]);
    analysis.branchvolume.numbersegments(i).min              = min([analysis.branchvolume.numbersegments(i).values]);
    analysis.branchvolume.numbersegments(i).skew             = skewness([analysis.branchvolume.numbersegments(i).values],0);
    analysis.branchvolume.numbersegments(i).kurt             = kurtosis([analysis.branchvolume.numbersegments(i).values],0);
    analysis.branchvolume.numbersegments(i).total            = sum([analysis.branchvolume.numbersegments(i).values]);
    
    analysis.branchvolume.numberbifurcations(i).values           = data.population.branchvolumebins(i).numberbifurcations.values;
    analysis.branchvolume.numberbifurcations(i).mean             = mean([analysis.branchvolume.numberbifurcations(i).values]);
    analysis.branchvolume.numberbifurcations(i).std              = std([analysis.branchvolume.numberbifurcations(i).values]);
    analysis.branchvolume.numberbifurcations(i).max              = max([analysis.branchvolume.numberbifurcations(i).values]);
    analysis.branchvolume.numberbifurcations(i).min              = min([analysis.branchvolume.numberbifurcations(i).values]);
    analysis.branchvolume.numberbifurcations(i).skew             = skewness([analysis.branchvolume.numberbifurcations(i).values],0);
    analysis.branchvolume.numberbifurcations(i).kurt             = kurtosis([analysis.branchvolume.numberbifurcations(i).values],0);
    analysis.branchvolume.numberbifurcations(i).total            = sum([analysis.branchvolume.numberbifurcations(i).values]);
    
    analysis.branchvolume.numberterminations(i).values           = data.population.branchvolumebins(i).numberterminations.values;
    analysis.branchvolume.numberterminations(i).mean             = mean([analysis.branchvolume.numberterminations(i).values]);
    analysis.branchvolume.numberterminations(i).std              = std([analysis.branchvolume.numberterminations(i).values]);
    analysis.branchvolume.numberterminations(i).max              = max([analysis.branchvolume.numberterminations(i).values]);
    analysis.branchvolume.numberterminations(i).min              = min([analysis.branchvolume.numberterminations(i).values]);
    analysis.branchvolume.numberterminations(i).skew             = skewness([analysis.branchvolume.numberterminations(i).values],0);
    analysis.branchvolume.numberterminations(i).kurt             = kurtosis([analysis.branchvolume.numberterminations(i).values],0);
    analysis.branchvolume.numberterminations(i).total            = sum([analysis.branchvolume.numberterminations(i).values]);
    
    analysis.branchvolume.numberbifurcatingbranches(i).values           = data.population.branchvolumebins(i).numberbifurcatingbranches.values;
    analysis.branchvolume.numberbifurcatingbranches(i).mean             = mean([analysis.branchvolume.numberbifurcatingbranches(i).values]);
    analysis.branchvolume.numberbifurcatingbranches(i).std              = std([analysis.branchvolume.numberbifurcatingbranches(i).values]);
    analysis.branchvolume.numberbifurcatingbranches(i).max              = max([analysis.branchvolume.numberbifurcatingbranches(i).values]);
    analysis.branchvolume.numberbifurcatingbranches(i).min              = min([analysis.branchvolume.numberbifurcatingbranches(i).values]);
    analysis.branchvolume.numberbifurcatingbranches(i).skew             = skewness([analysis.branchvolume.numberbifurcatingbranches(i).values],0);
    analysis.branchvolume.numberbifurcatingbranches(i).kurt             = kurtosis([analysis.branchvolume.numberbifurcatingbranches(i).values],0);
    analysis.branchvolume.numberbifurcatingbranches(i).total            = sum([analysis.branchvolume.numberbifurcatingbranches(i).values]);
    
    analysis.branchvolume.numberterminatingbranches(i).values           = data.population.branchvolumebins(i).numberterminatingbranches.values;
    analysis.branchvolume.numberterminatingbranches(i).mean             = mean([analysis.branchvolume.numberterminatingbranches(i).values]);
    analysis.branchvolume.numberterminatingbranches(i).std              = std([analysis.branchvolume.numberterminatingbranches(i).values]);
    analysis.branchvolume.numberterminatingbranches(i).max              = max([analysis.branchvolume.numberterminatingbranches(i).values]);
    analysis.branchvolume.numberterminatingbranches(i).min              = min([analysis.branchvolume.numberterminatingbranches(i).values]);
    analysis.branchvolume.numberterminatingbranches(i).skew             = skewness([analysis.branchvolume.numberterminatingbranches(i).values],0);
    analysis.branchvolume.numberterminatingbranches(i).kurt             = kurtosis([analysis.branchvolume.numberterminatingbranches(i).values],0);
    analysis.branchvolume.numberterminatingbranches(i).total            = sum([analysis.branchvolume.numberterminatingbranches(i).values]);
    
    analysis.branchvolume.rallratio(i).values           = data.population.branchvolumebins(i).rallratio.values;
    analysis.branchvolume.rallratio(i).mean             = mean([analysis.branchvolume.rallratio(i).values]);
    analysis.branchvolume.rallratio(i).std              = std([analysis.branchvolume.rallratio(i).values]);
    analysis.branchvolume.rallratio(i).max              = max([analysis.branchvolume.rallratio(i).values]);
    analysis.branchvolume.rallratio(i).min              = min([analysis.branchvolume.rallratio(i).values]);
    analysis.branchvolume.rallratio(i).skew             = skewness([analysis.branchvolume.rallratio(i).values],0);
    analysis.branchvolume.rallratio(i).kurt             = kurtosis([analysis.branchvolume.rallratio(i).values],0);
    
    analysis.branchvolume.rallratio1(i).values           = data.population.branchvolumebins(i).rallratio1.values;
    analysis.branchvolume.rallratio1(i).mean             = mean([analysis.branchvolume.rallratio1(i).values]);
    analysis.branchvolume.rallratio1(i).std              = std([analysis.branchvolume.rallratio1(i).values]);
    analysis.branchvolume.rallratio1(i).max              = max([analysis.branchvolume.rallratio1(i).values]);
    analysis.branchvolume.rallratio1(i).min              = min([analysis.branchvolume.rallratio1(i).values]);
    analysis.branchvolume.rallratio1(i).skew             = skewness([analysis.branchvolume.rallratio1(i).values],0);
    analysis.branchvolume.rallratio1(i).kurt             = kurtosis([analysis.branchvolume.rallratio1(i).values],0);
    
    analysis.branchvolume.rallratio2(i).values           = data.population.branchvolumebins(i).rallratio2.values;
    analysis.branchvolume.rallratio2(i).mean             = mean([analysis.branchvolume.rallratio2(i).values]);
    analysis.branchvolume.rallratio2(i).std              = std([analysis.branchvolume.rallratio2(i).values]);
    analysis.branchvolume.rallratio2(i).max              = max([analysis.branchvolume.rallratio2(i).values]);
    analysis.branchvolume.rallratio2(i).min              = min([analysis.branchvolume.rallratio2(i).values]);
    analysis.branchvolume.rallratio2(i).skew             = skewness([analysis.branchvolume.rallratio2(i).values],0);
    analysis.branchvolume.rallratio2(i).kurt             = kurtosis([analysis.branchvolume.rallratio2(i).values],0);
	
	analysis.branchvolume.rallratio3(i).values           = data.population.branchvolumebins(i).rallratio3.values;
    analysis.branchvolume.rallratio3(i).mean             = mean([analysis.branchvolume.rallratio3(i).values]);
    analysis.branchvolume.rallratio3(i).std              = std([analysis.branchvolume.rallratio3(i).values]);
    analysis.branchvolume.rallratio3(i).max              = max([analysis.branchvolume.rallratio3(i).values]);
    analysis.branchvolume.rallratio3(i).min              = min([analysis.branchvolume.rallratio3(i).values]);
    analysis.branchvolume.rallratio3(i).skew             = skewness([analysis.branchvolume.rallratio3(i).values],0);
    analysis.branchvolume.rallratio3(i).kurt             = kurtosis([analysis.branchvolume.rallratio3(i).values],0);
    
    analysis.branchvolume.daughterratio(i).values           = data.population.branchvolumebins(i).daughterratio.values;
    analysis.branchvolume.daughterratio(i).mean             = mean([analysis.branchvolume.daughterratio(i).values]);
    analysis.branchvolume.daughterratio(i).std              = std([analysis.branchvolume.daughterratio(i).values]);
    analysis.branchvolume.daughterratio(i).max              = max([analysis.branchvolume.daughterratio(i).values]);
    analysis.branchvolume.daughterratio(i).min              = min([analysis.branchvolume.daughterratio(i).values]);
    analysis.branchvolume.daughterratio(i).skew             = skewness([analysis.branchvolume.daughterratio(i).values],0);
    analysis.branchvolume.daughterratio(i).kurt             = kurtosis([analysis.branchvolume.daughterratio(i).values],0);
    
    analysis.branchvolume.parentdaughterratio(i).values           = data.population.branchvolumebins(i).parentdaughterratio.values;
    analysis.branchvolume.parentdaughterratio(i).mean             = mean([analysis.branchvolume.parentdaughterratio(i).values]);
    analysis.branchvolume.parentdaughterratio(i).std              = std([analysis.branchvolume.parentdaughterratio(i).values]);
    analysis.branchvolume.parentdaughterratio(i).max              = max([analysis.branchvolume.parentdaughterratio(i).values]);
    analysis.branchvolume.parentdaughterratio(i).min              = min([analysis.branchvolume.parentdaughterratio(i).values]);
    analysis.branchvolume.parentdaughterratio(i).skew             = skewness([analysis.branchvolume.parentdaughterratio(i).values],0);
    analysis.branchvolume.parentdaughterratio(i).kurt             = kurtosis([analysis.branchvolume.parentdaughterratio(i).values],0);
    
    analysis.branchvolume.parentdaughter2ratio(i).values           = data.population.branchvolumebins(i).parentdaughter2ratio.values;
    analysis.branchvolume.parentdaughter2ratio(i).mean             = mean([analysis.branchvolume.parentdaughter2ratio(i).values]);
    analysis.branchvolume.parentdaughter2ratio(i).std              = std([analysis.branchvolume.parentdaughter2ratio(i).values]);
    analysis.branchvolume.parentdaughter2ratio(i).max              = max([analysis.branchvolume.parentdaughter2ratio(i).values]);
    analysis.branchvolume.parentdaughter2ratio(i).min              = min([analysis.branchvolume.parentdaughter2ratio(i).values]);
    analysis.branchvolume.parentdaughter2ratio(i).skew             = skewness([analysis.branchvolume.parentdaughter2ratio(i).values],0);
    analysis.branchvolume.parentdaughter2ratio(i).kurt             = kurtosis([analysis.branchvolume.parentdaughter2ratio(i).values],0);
    
    analysis.branchvolume.diameter(i).values           = data.population.branchvolumebins(i).diameter.values;
    analysis.branchvolume.diameter(i).mean             = mean([analysis.branchvolume.diameter(i).values]);
    analysis.branchvolume.diameter(i).std              = std([analysis.branchvolume.diameter(i).values]);
    analysis.branchvolume.diameter(i).max              = max([analysis.branchvolume.diameter(i).values]);
    analysis.branchvolume.diameter(i).min              = min([analysis.branchvolume.diameter(i).values]);
    analysis.branchvolume.diameter(i).skew             = skewness([analysis.branchvolume.diameter(i).values],0);
    analysis.branchvolume.diameter(i).kurt             = kurtosis([analysis.branchvolume.diameter(i).values],0);
    
    analysis.branchvolume.taperrate(i).values           = data.population.branchvolumebins(i).taperrate.values;
    analysis.branchvolume.taperrate(i).mean             = sum([data.population.branchvolumebins(i).taperrate.values].*[data.population.branchvolumebins(i).taperratelength.values])/sum([data.population.branchvolumebins(i).taperratelength.values]);
	%analysis.branchvolume.taperrate(i).mean             = mean([data.population.branchvolumebins(i).taperrate.values].*[data.population.branchvolumebins(i).taperratelength.values])/sum([data.population.branchvolumebins(i).taperratelength.values]);
    analysis.branchvolume.taperrate(i).std              = std([analysis.branchvolume.taperrate(i).values]);
    analysis.branchvolume.taperrate(i).max              = max([analysis.branchvolume.taperrate(i).values]);
    analysis.branchvolume.taperrate(i).min              = min([analysis.branchvolume.taperrate(i).values]);
    analysis.branchvolume.taperrate(i).skew             = skewness([analysis.branchvolume.taperrate(i).values],0);
    analysis.branchvolume.taperrate(i).kurt             = kurtosis([analysis.branchvolume.taperrate(i).values],0);
	
% 	analysis.branchvolume.taperratevolume(i).values           = data.population.branchvolumebins(i).taperratevolume.values;
%     analysis.branchvolume.taperratevolume(i).mean             = sum([data.population.branchvolumebins(i).taperratevolume.values].*[data.population.branchvolumebins(i).taperratelength.values])/sum([data.population.branchvolumebins(i).taperratelength.values]);
% 	%analysis.branchvolume.taperratevolume(i).mean             = mean([data.population.branchvolumebins(i).taperratevolume.values].*[data.population.branchvolumebins(i).taperratelength.values])/sum([data.population.branchvolumebins(i).taperratelength.values]);
%     analysis.branchvolume.taperratevolume(i).std              = std([analysis.branchvolume.taperratevolume(i).values]);
%     analysis.branchvolume.taperratevolume(i).max              = max([analysis.branchvolume.taperratevolume(i).values]);
%     analysis.branchvolume.taperratevolume(i).min              = min([analysis.branchvolume.taperratevolume(i).values]);
%     analysis.branchvolume.taperratevolume(i).skew             = skewness([analysis.branchvolume.taperratevolume(i).values],0);
%     analysis.branchvolume.taperratevolume(i).kurt             = kurtosis([analysis.branchvolume.taperratevolume(i).values],0);
% 	
% 	analysis.branchvolume.taperratesurfacearea(i).values           = data.population.branchvolumebins(i).taperratesurfacearea.values;
%     analysis.branchvolume.taperratesurfacearea(i).mean             = sum([data.population.branchvolumebins(i).taperratesurfacearea.values].*[data.population.branchvolumebins(i).taperratelength.values])/sum([data.population.branchvolumebins(i).taperratelength.values]);
% 	%analysis.branchvolume.taperratesurfacearea(i).mean             = mean([data.population.branchvolumebins(i).taperratesurfacearea.values].*[data.population.branchvolumebins(i).taperratelength.values])/sum([data.population.branchvolumebins(i).taperratelength.values]);
%     analysis.branchvolume.taperratesurfacearea(i).std              = std([analysis.branchvolume.taperratesurfacearea(i).values]);
%     analysis.branchvolume.taperratesurfacearea(i).max              = max([analysis.branchvolume.taperratesurfacearea(i).values]);
%     analysis.branchvolume.taperratesurfacearea(i).min              = min([analysis.branchvolume.taperratesurfacearea(i).values]);
%     analysis.branchvolume.taperratesurfacearea(i).skew             = skewness([analysis.branchvolume.taperratesurfacearea(i).values],0);
%     analysis.branchvolume.taperratesurfacearea(i).kurt             = kurtosis([analysis.branchvolume.taperratesurfacearea(i).values],0);
    
    analysis.branchvolume.bifurcationprobability.length(i) = analysis.branchvolume.numberbifurcations(i).total / analysis.branchvolume.length(i).total;
    analysis.branchvolume.terminationprobability.length(i) = analysis.branchvolume.numberterminations(i).total / analysis.branchvolume.length(i).total;
    
    analysis.branchvolume.bifurcationprobability.surfacearea(i) = analysis.branchvolume.numberbifurcations(i).total / analysis.branchvolume.surfacearea(i).total;
    analysis.branchvolume.terminationprobability.surfacearea(i) = analysis.branchvolume.numberterminations(i).total / analysis.branchvolume.surfacearea(i).total;
    
    analysis.branchvolume.bifurcationprobability.volume(i) = analysis.branchvolume.numberbifurcations(i).total / analysis.branchvolume.volume(i).total;
    analysis.branchvolume.terminationprobability.volume(i) = analysis.branchvolume.numberterminations(i).total / analysis.branchvolume.volume(i).total;
    
end
    
analysis.branchvolume = orderfields(analysis.branchvolume);







% Begin bifurcation branch length analysis

clear branchvolumebinlengths maxbranchvolumebin;

for i = 1:length(data.individual)
    branchvolumebinlengths(i) = length(data.individual(i).bifurcation.branchvolumebins);
end

maxbranchvolumebin = max(branchvolumebinlengths);

for i = 1:maxbranchvolumebin
    data.population.bifurcation.branchvolumebins(i).rallratio.values            = [];
    data.population.bifurcation.branchvolumebins(i).rallratio1.values           = [];
    data.population.bifurcation.branchvolumebins(i).rallratio2.values           = [];
	data.population.bifurcation.branchvolumebins(i).rallratio3.values           = [];
    data.population.bifurcation.branchvolumebins(i).daughterratio.values        = [];
    data.population.bifurcation.branchvolumebins(i).parentdaughterratio.values  = [];
    data.population.bifurcation.branchvolumebins(i).parentdaughter2ratio.values = [];
    data.population.bifurcation.branchvolumebins(i).taperrate.values            = [];
	%data.population.bifurcation.branchvolumebins(i).taperratevolume.values      = [];
	%data.population.bifurcation.branchvolumebins(i).taperratesurfacearea.values = [];
    data.population.bifurcation.branchvolumebins(i).taperratelength.values      = [];
end
    

for i = 1:length(data.individual)
    
    for j = 1:length(data.individual(i).bifurcation.branchvolumebins)
        
        data.individual(i).bifurcation.branchvolumebins(j).length                      = sum([data.individual(i).bifurcation.branchvolumebins(j).piece.length]);
        data.individual(i).bifurcation.branchvolumebins(j).surfacearea                 = sum([data.individual(i).bifurcation.branchvolumebins(j).piece.surfacearea]);
        data.individual(i).bifurcation.branchvolumebins(j).volume                      = sum([data.individual(i).bifurcation.branchvolumebins(j).piece.volume]);
        data.individual(i).bifurcation.branchvolumebins(j).numbersegments              = length(unique([data.individual(i).bifurcation.branchvolumebins(j).piece.cable]));
        data.individual(i).bifurcation.branchvolumebins(j).numberbifurcations          = 0;
        data.individual(i).bifurcation.branchvolumebins(j).rallratio.values            = [data.individual(i).bifurcation.branchvolumebins(j).piece.rallratio];
        data.individual(i).bifurcation.branchvolumebins(j).rallratio1.values           = [data.individual(i).bifurcation.branchvolumebins(j).piece.rallratio1];
        data.individual(i).bifurcation.branchvolumebins(j).rallratio2.values           = [data.individual(i).bifurcation.branchvolumebins(j).piece.rallratio2];
		data.individual(i).bifurcation.branchvolumebins(j).rallratio3.values           = [data.individual(i).bifurcation.branchvolumebins(j).piece.rallratio3];
        data.individual(i).bifurcation.branchvolumebins(j).daughterratio.values        = [data.individual(i).bifurcation.branchvolumebins(j).piece.daughterratio];
        data.individual(i).bifurcation.branchvolumebins(j).parentdaughterratio.values  = [data.individual(i).bifurcation.branchvolumebins(j).piece.parentdaughterratio];
        data.individual(i).bifurcation.branchvolumebins(j).parentdaughter2ratio.values = [data.individual(i).bifurcation.branchvolumebins(j).piece.parentdaughter2ratio];
        data.individual(i).bifurcation.branchvolumebins(j).diameter                    = ((4*data.individual(i).bifurcation.branchvolumebins(j).volume)/(pi()*data.individual(i).bifurcation.branchvolumebins(j).length))^0.5;            
        data.individual(i).bifurcation.branchvolumebins(j).taperrate.values            = [data.individual(i).bifurcation.branchvolumebins(j).piece.taperrate];
		%data.individual(i).bifurcation.branchvolumebins(j).taperratevolume.values      = [data.individual(i).bifurcation.branchvolumebins(j).piece.taperratevolume];
		%data.individual(i).bifurcation.branchvolumebins(j).taperratesurfacearea.values = [data.individual(i).bifurcation.branchvolumebins(j).piece.taperratesurfacearea];
        data.individual(i).bifurcation.branchvolumebins(j).taperratelength.values      = [data.individual(i).bifurcation.branchvolumebins(j).piece.length];
  
        for k = 1:length(data.individual(i).bifurcation.branchvolumebins(j).piece)           
            if strcmp(data.individual(i).bifurcation.branchvolumebins(j).piece(k).distaltype,'bifurcation')==1
                data.individual(i).bifurcation.branchvolumebins(j).numberbifurcations = 1 + data.individual(i).bifurcation.branchvolumebins(j).numberbifurcations;
            end
        end
        
        if isfield(data.population,'branchvolumebins') == 0; nextvalue = 1;
        elseif j > length(data.population.bifurcation.branchvolumebins); nextvalue = 1;
        elseif isfield(data.population.bifurcation.branchvolumebins(j),'length') == 0; nextvalue = 1;
        elseif isfield(data.population.bifurcation.branchvolumebins(j).length,'values') == 0; nextvalue = 1;
        else nextvalue = 1 + length(data.population.bifurcation.branchvolumebins(j).length.values);
        end
        data.population.bifurcation.branchvolumebins(j).length.values(nextvalue)             = data.individual(i).bifurcation.branchvolumebins(j).length;
        data.population.bifurcation.branchvolumebins(j).surfacearea.values(nextvalue)        = data.individual(i).bifurcation.branchvolumebins(j).surfacearea;
        data.population.bifurcation.branchvolumebins(j).volume.values(nextvalue)             = data.individual(i).bifurcation.branchvolumebins(j).volume;
        data.population.bifurcation.branchvolumebins(j).numbersegments.values(nextvalue)     = data.individual(i).bifurcation.branchvolumebins(j).numbersegments;
        data.population.bifurcation.branchvolumebins(j).numberbifurcations.values(nextvalue) = data.individual(i).bifurcation.branchvolumebins(j).numberbifurcations;
        data.population.bifurcation.branchvolumebins(j).rallratio.values                     = [ [data.population.bifurcation.branchvolumebins(j).rallratio.values] [data.individual(i).bifurcation.branchvolumebins(j).rallratio.values] ];
        data.population.bifurcation.branchvolumebins(j).rallratio1.values                    = [ [data.population.bifurcation.branchvolumebins(j).rallratio1.values] [data.individual(i).bifurcation.branchvolumebins(j).rallratio1.values] ];
        data.population.bifurcation.branchvolumebins(j).rallratio2.values                    = [ [data.population.bifurcation.branchvolumebins(j).rallratio2.values] [data.individual(i).bifurcation.branchvolumebins(j).rallratio2.values] ];
		data.population.bifurcation.branchvolumebins(j).rallratio3.values                    = [ [data.population.bifurcation.branchvolumebins(j).rallratio3.values] [data.individual(i).bifurcation.branchvolumebins(j).rallratio3.values] ];
        data.population.bifurcation.branchvolumebins(j).daughterratio.values                 = [ [data.population.bifurcation.branchvolumebins(j).daughterratio.values] [data.individual(i).bifurcation.branchvolumebins(j).daughterratio.values] ];
        data.population.bifurcation.branchvolumebins(j).parentdaughterratio.values           = [ [data.population.bifurcation.branchvolumebins(j).parentdaughterratio.values] [data.individual(i).bifurcation.branchvolumebins(j).parentdaughterratio.values] ];
        data.population.bifurcation.branchvolumebins(j).parentdaughter2ratio.values          = [ [data.population.bifurcation.branchvolumebins(j).parentdaughter2ratio.values] [data.individual(i).bifurcation.branchvolumebins(j).parentdaughter2ratio.values] ];
        data.population.bifurcation.branchvolumebins(j).diameter.values(nextvalue)           = data.individual(i).bifurcation.branchvolumebins(j).diameter;
        data.population.bifurcation.branchvolumebins(j).taperrate.values                     = [ [data.population.bifurcation.branchvolumebins(j).taperrate.values] [data.individual(i).bifurcation.branchvolumebins(j).taperrate.values] ];
		%data.population.bifurcation.branchvolumebins(j).taperratevolume.values               = [ [data.population.bifurcation.branchvolumebins(j).taperratevolume.values] [data.individual(i).bifurcation.branchvolumebins(j).taperratevolume.values] ];
		%data.population.bifurcation.branchvolumebins(j).taperratesurfacearea.values          = [ [data.population.bifurcation.branchvolumebins(j).taperratesurfacearea.values] [data.individual(i).bifurcation.branchvolumebins(j).taperratesurfacearea.values] ];
        data.population.bifurcation.branchvolumebins(j).taperratelength.values               = [ [data.population.bifurcation.branchvolumebins(j).taperratelength.values] [data.individual(i).bifurcation.branchvolumebins(j).taperratelength.values] ];
        
        clear nextvalue;
        
    end
end

for i = 1:length(data.population.bifurcation.branchvolumebins)
    
    analysis.bifurcation.branchvolume.branchvolume(i)              = (data.branchvolumebinwidth * i) - (data.branchvolumebinwidth / 2);
    
    analysis.bifurcation.branchvolume.length(i).values           = data.population.bifurcation.branchvolumebins(i).length.values;
    analysis.bifurcation.branchvolume.length(i).mean             = mean([analysis.bifurcation.branchvolume.length(i).values]);
    analysis.bifurcation.branchvolume.length(i).std              = std([analysis.bifurcation.branchvolume.length(i).values]);
    analysis.bifurcation.branchvolume.length(i).max              = max([analysis.bifurcation.branchvolume.length(i).values]);
    analysis.bifurcation.branchvolume.length(i).min              = min([analysis.bifurcation.branchvolume.length(i).values]);
    analysis.bifurcation.branchvolume.length(i).skew             = skewness([analysis.bifurcation.branchvolume.length(i).values],0);
    analysis.bifurcation.branchvolume.length(i).kurt             = kurtosis([analysis.bifurcation.branchvolume.length(i).values],0);
    analysis.bifurcation.branchvolume.length(i).total            = sum([analysis.bifurcation.branchvolume.length(i).values]);
    
    analysis.bifurcation.branchvolume.surfacearea(i).values           = data.population.bifurcation.branchvolumebins(i).surfacearea.values;
    analysis.bifurcation.branchvolume.surfacearea(i).mean             = mean([analysis.bifurcation.branchvolume.surfacearea(i).values]);
    analysis.bifurcation.branchvolume.surfacearea(i).std              = std([analysis.bifurcation.branchvolume.surfacearea(i).values]);
    analysis.bifurcation.branchvolume.surfacearea(i).max              = max([analysis.bifurcation.branchvolume.surfacearea(i).values]);
    analysis.bifurcation.branchvolume.surfacearea(i).min              = min([analysis.bifurcation.branchvolume.surfacearea(i).values]);
    analysis.bifurcation.branchvolume.surfacearea(i).skew             = skewness([analysis.bifurcation.branchvolume.surfacearea(i).values],0);
    analysis.bifurcation.branchvolume.surfacearea(i).kurt             = kurtosis([analysis.bifurcation.branchvolume.surfacearea(i).values],0);
    analysis.bifurcation.branchvolume.surfacearea(i).total            = sum([analysis.bifurcation.branchvolume.surfacearea(i).values]);
    
    analysis.bifurcation.branchvolume.volume(i).values           = data.population.bifurcation.branchvolumebins(i).volume.values;
    analysis.bifurcation.branchvolume.volume(i).mean             = mean([analysis.bifurcation.branchvolume.volume(i).values]);
    analysis.bifurcation.branchvolume.volume(i).std              = std([analysis.bifurcation.branchvolume.volume(i).values]);
    analysis.bifurcation.branchvolume.volume(i).max              = max([analysis.bifurcation.branchvolume.volume(i).values]);
    analysis.bifurcation.branchvolume.volume(i).min              = min([analysis.bifurcation.branchvolume.volume(i).values]);
    analysis.bifurcation.branchvolume.volume(i).skew             = skewness([analysis.bifurcation.branchvolume.volume(i).values],0);
    analysis.bifurcation.branchvolume.volume(i).kurt             = kurtosis([analysis.bifurcation.branchvolume.volume(i).values],0);
    analysis.bifurcation.branchvolume.volume(i).total            = sum([analysis.bifurcation.branchvolume.volume(i).values]);
    
    analysis.bifurcation.branchvolume.numbersegments(i).values           = data.population.bifurcation.branchvolumebins(i).numbersegments.values;
    analysis.bifurcation.branchvolume.numbersegments(i).mean             = mean([analysis.bifurcation.branchvolume.numbersegments(i).values]);
    analysis.bifurcation.branchvolume.numbersegments(i).std              = std([analysis.bifurcation.branchvolume.numbersegments(i).values]);
    analysis.bifurcation.branchvolume.numbersegments(i).max              = max([analysis.bifurcation.branchvolume.numbersegments(i).values]);
    analysis.bifurcation.branchvolume.numbersegments(i).min              = min([analysis.bifurcation.branchvolume.numbersegments(i).values]);
    analysis.bifurcation.branchvolume.numbersegments(i).skew             = skewness([analysis.bifurcation.branchvolume.numbersegments(i).values],0);
    analysis.bifurcation.branchvolume.numbersegments(i).kurt             = kurtosis([analysis.bifurcation.branchvolume.numbersegments(i).values],0);
    analysis.bifurcation.branchvolume.numbersegments(i).total            = sum([analysis.bifurcation.branchvolume.numbersegments(i).values]);
    
    analysis.bifurcation.branchvolume.numberbifurcations(i).values           = data.population.bifurcation.branchvolumebins(i).numberbifurcations.values;
    analysis.bifurcation.branchvolume.numberbifurcations(i).mean             = mean([analysis.bifurcation.branchvolume.numberbifurcations(i).values]);
    analysis.bifurcation.branchvolume.numberbifurcations(i).std              = std([analysis.bifurcation.branchvolume.numberbifurcations(i).values]);
    analysis.bifurcation.branchvolume.numberbifurcations(i).max              = max([analysis.bifurcation.branchvolume.numberbifurcations(i).values]);
    analysis.bifurcation.branchvolume.numberbifurcations(i).min              = min([analysis.bifurcation.branchvolume.numberbifurcations(i).values]);
    analysis.bifurcation.branchvolume.numberbifurcations(i).skew             = skewness([analysis.bifurcation.branchvolume.numberbifurcations(i).values],0);
    analysis.bifurcation.branchvolume.numberbifurcations(i).kurt             = kurtosis([analysis.bifurcation.branchvolume.numberbifurcations(i).values],0);
    analysis.bifurcation.branchvolume.numberbifurcations(i).total            = sum([analysis.bifurcation.branchvolume.numberbifurcations(i).values]);
    
    analysis.bifurcation.branchvolume.rallratio(i).values           = data.population.bifurcation.branchvolumebins(i).rallratio.values;
    analysis.bifurcation.branchvolume.rallratio(i).mean             = mean([analysis.bifurcation.branchvolume.rallratio(i).values]);
    analysis.bifurcation.branchvolume.rallratio(i).std              = std([analysis.bifurcation.branchvolume.rallratio(i).values]);
    analysis.bifurcation.branchvolume.rallratio(i).max              = max([analysis.bifurcation.branchvolume.rallratio(i).values]);
    analysis.bifurcation.branchvolume.rallratio(i).min              = min([analysis.bifurcation.branchvolume.rallratio(i).values]);
    analysis.bifurcation.branchvolume.rallratio(i).skew             = skewness([analysis.bifurcation.branchvolume.rallratio(i).values],0);
    analysis.bifurcation.branchvolume.rallratio(i).kurt             = kurtosis([analysis.bifurcation.branchvolume.rallratio(i).values],0);
    
    analysis.bifurcation.branchvolume.rallratio1(i).values           = data.population.bifurcation.branchvolumebins(i).rallratio1.values;
    analysis.bifurcation.branchvolume.rallratio1(i).mean             = mean([analysis.bifurcation.branchvolume.rallratio1(i).values]);
    analysis.bifurcation.branchvolume.rallratio1(i).std              = std([analysis.bifurcation.branchvolume.rallratio1(i).values]);
    analysis.bifurcation.branchvolume.rallratio1(i).max              = max([analysis.bifurcation.branchvolume.rallratio1(i).values]);
    analysis.bifurcation.branchvolume.rallratio1(i).min              = min([analysis.bifurcation.branchvolume.rallratio1(i).values]);
    analysis.bifurcation.branchvolume.rallratio1(i).skew             = skewness([analysis.bifurcation.branchvolume.rallratio1(i).values],0);
    analysis.bifurcation.branchvolume.rallratio1(i).kurt             = kurtosis([analysis.bifurcation.branchvolume.rallratio1(i).values],0);
    
    analysis.bifurcation.branchvolume.rallratio2(i).values           = data.population.bifurcation.branchvolumebins(i).rallratio2.values;
    analysis.bifurcation.branchvolume.rallratio2(i).mean             = mean([analysis.bifurcation.branchvolume.rallratio2(i).values]);
    analysis.bifurcation.branchvolume.rallratio2(i).std              = std([analysis.bifurcation.branchvolume.rallratio2(i).values]);
    analysis.bifurcation.branchvolume.rallratio2(i).max              = max([analysis.bifurcation.branchvolume.rallratio2(i).values]);
    analysis.bifurcation.branchvolume.rallratio2(i).min              = min([analysis.bifurcation.branchvolume.rallratio2(i).values]);
    analysis.bifurcation.branchvolume.rallratio2(i).skew             = skewness([analysis.bifurcation.branchvolume.rallratio2(i).values],0);
    analysis.bifurcation.branchvolume.rallratio2(i).kurt             = kurtosis([analysis.bifurcation.branchvolume.rallratio2(i).values],0);
	
	analysis.bifurcation.branchvolume.rallratio3(i).values           = data.population.bifurcation.branchvolumebins(i).rallratio3.values;
    analysis.bifurcation.branchvolume.rallratio3(i).mean             = mean([analysis.bifurcation.branchvolume.rallratio3(i).values]);
    analysis.bifurcation.branchvolume.rallratio3(i).std              = std([analysis.bifurcation.branchvolume.rallratio3(i).values]);
    analysis.bifurcation.branchvolume.rallratio3(i).max              = max([analysis.bifurcation.branchvolume.rallratio3(i).values]);
    analysis.bifurcation.branchvolume.rallratio3(i).min              = min([analysis.bifurcation.branchvolume.rallratio3(i).values]);
    analysis.bifurcation.branchvolume.rallratio3(i).skew             = skewness([analysis.bifurcation.branchvolume.rallratio3(i).values],0);
    analysis.bifurcation.branchvolume.rallratio3(i).kurt             = kurtosis([analysis.bifurcation.branchvolume.rallratio3(i).values],0);
    
    analysis.bifurcation.branchvolume.daughterratio(i).values           = data.population.bifurcation.branchvolumebins(i).daughterratio.values;
    analysis.bifurcation.branchvolume.daughterratio(i).mean             = mean([analysis.bifurcation.branchvolume.daughterratio(i).values]);
    analysis.bifurcation.branchvolume.daughterratio(i).std              = std([analysis.bifurcation.branchvolume.daughterratio(i).values]);
    analysis.bifurcation.branchvolume.daughterratio(i).max              = max([analysis.bifurcation.branchvolume.daughterratio(i).values]);
    analysis.bifurcation.branchvolume.daughterratio(i).min              = min([analysis.bifurcation.branchvolume.daughterratio(i).values]);
    analysis.bifurcation.branchvolume.daughterratio(i).skew             = skewness([analysis.bifurcation.branchvolume.daughterratio(i).values],0);
    analysis.bifurcation.branchvolume.daughterratio(i).kurt             = kurtosis([analysis.bifurcation.branchvolume.daughterratio(i).values],0);
    
    analysis.bifurcation.branchvolume.parentdaughterratio(i).values           = data.population.bifurcation.branchvolumebins(i).parentdaughterratio.values;
    analysis.bifurcation.branchvolume.parentdaughterratio(i).mean             = mean([analysis.bifurcation.branchvolume.parentdaughterratio(i).values]);
    analysis.bifurcation.branchvolume.parentdaughterratio(i).std              = std([analysis.bifurcation.branchvolume.parentdaughterratio(i).values]);
    analysis.bifurcation.branchvolume.parentdaughterratio(i).max              = max([analysis.bifurcation.branchvolume.parentdaughterratio(i).values]);
    analysis.bifurcation.branchvolume.parentdaughterratio(i).min              = min([analysis.bifurcation.branchvolume.parentdaughterratio(i).values]);
    analysis.bifurcation.branchvolume.parentdaughterratio(i).skew             = skewness([analysis.bifurcation.branchvolume.parentdaughterratio(i).values],0);
    analysis.bifurcation.branchvolume.parentdaughterratio(i).kurt             = kurtosis([analysis.bifurcation.branchvolume.parentdaughterratio(i).values],0);
    
    analysis.bifurcation.branchvolume.parentdaughter2ratio(i).values           = data.population.bifurcation.branchvolumebins(i).parentdaughter2ratio.values;
    analysis.bifurcation.branchvolume.parentdaughter2ratio(i).mean             = mean([analysis.bifurcation.branchvolume.parentdaughter2ratio(i).values]);
    analysis.bifurcation.branchvolume.parentdaughter2ratio(i).std              = std([analysis.bifurcation.branchvolume.parentdaughter2ratio(i).values]);
    analysis.bifurcation.branchvolume.parentdaughter2ratio(i).max              = max([analysis.bifurcation.branchvolume.parentdaughter2ratio(i).values]);
    analysis.bifurcation.branchvolume.parentdaughter2ratio(i).min              = min([analysis.bifurcation.branchvolume.parentdaughter2ratio(i).values]);
    analysis.bifurcation.branchvolume.parentdaughter2ratio(i).skew             = skewness([analysis.bifurcation.branchvolume.parentdaughter2ratio(i).values],0);
    analysis.bifurcation.branchvolume.parentdaughter2ratio(i).kurt             = kurtosis([analysis.bifurcation.branchvolume.parentdaughter2ratio(i).values],0);
    
    analysis.bifurcation.branchvolume.diameter(i).values           = data.population.bifurcation.branchvolumebins(i).diameter.values;
    analysis.bifurcation.branchvolume.diameter(i).mean             = mean([analysis.bifurcation.branchvolume.diameter(i).values]);
    analysis.bifurcation.branchvolume.diameter(i).std              = std([analysis.bifurcation.branchvolume.diameter(i).values]);
    analysis.bifurcation.branchvolume.diameter(i).max              = max([analysis.bifurcation.branchvolume.diameter(i).values]);
    analysis.bifurcation.branchvolume.diameter(i).min              = min([analysis.bifurcation.branchvolume.diameter(i).values]);
    analysis.bifurcation.branchvolume.diameter(i).skew             = skewness([analysis.bifurcation.branchvolume.diameter(i).values],0);
    analysis.bifurcation.branchvolume.diameter(i).kurt             = kurtosis([analysis.bifurcation.branchvolume.diameter(i).values],0);
    
    analysis.bifurcation.branchvolume.taperrate(i).values           = data.population.bifurcation.branchvolumebins(i).taperrate.values;
    analysis.bifurcation.branchvolume.taperrate(i).mean             = sum([data.population.bifurcation.branchvolumebins(i).taperrate.values].*[data.population.bifurcation.branchvolumebins(i).taperratelength.values])/sum([data.population.bifurcation.branchvolumebins(i).taperratelength.values]);
	%analysis.bifurcation.branchvolume.taperrate(i).mean             = mean([data.population.bifurcation.branchvolumebins(i).taperrate.values].*[data.population.bifurcation.branchvolumebins(i).taperratelength.values])/sum([data.population.bifurcation.branchvolumebins(i).taperratelength.values]);
    analysis.bifurcation.branchvolume.taperrate(i).std              = std([analysis.bifurcation.branchvolume.taperrate(i).values]);
    analysis.bifurcation.branchvolume.taperrate(i).max              = max([analysis.bifurcation.branchvolume.taperrate(i).values]);
    analysis.bifurcation.branchvolume.taperrate(i).min              = min([analysis.bifurcation.branchvolume.taperrate(i).values]);
    analysis.bifurcation.branchvolume.taperrate(i).skew             = skewness([analysis.bifurcation.branchvolume.taperrate(i).values],0);
    analysis.bifurcation.branchvolume.taperrate(i).kurt             = kurtosis([analysis.bifurcation.branchvolume.taperrate(i).values],0);
	
% 	analysis.bifurcation.branchvolume.taperratevolume(i).values           = data.population.bifurcation.branchvolumebins(i).taperratevolume.values;
%     analysis.bifurcation.branchvolume.taperratevolume(i).mean             = sum([data.population.bifurcation.branchvolumebins(i).taperratevolume.values].*[data.population.bifurcation.branchvolumebins(i).taperratelength.values])/sum([data.population.bifurcation.branchvolumebins(i).taperratelength.values]);
% 	%analysis.bifurcation.branchvolume.taperratevolume(i).mean             = mean([data.population.bifurcation.branchvolumebins(i).taperratevolume.values].*[data.population.bifurcation.branchvolumebins(i).taperratelength.values])/sum([data.population.bifurcation.branchvolumebins(i).taperratelength.values]);
%     analysis.bifurcation.branchvolume.taperratevolume(i).std              = std([analysis.bifurcation.branchvolume.taperratevolume(i).values]);
%     analysis.bifurcation.branchvolume.taperratevolume(i).max              = max([analysis.bifurcation.branchvolume.taperratevolume(i).values]);
%     analysis.bifurcation.branchvolume.taperratevolume(i).min              = min([analysis.bifurcation.branchvolume.taperratevolume(i).values]);
%     analysis.bifurcation.branchvolume.taperratevolume(i).skew             = skewness([analysis.bifurcation.branchvolume.taperratevolume(i).values],0);
%     analysis.bifurcation.branchvolume.taperratevolume(i).kurt             = kurtosis([analysis.bifurcation.branchvolume.taperratevolume(i).values],0);
% 	
% 	analysis.bifurcation.branchvolume.taperratesurfacearea(i).values           = data.population.bifurcation.branchvolumebins(i).taperratesurfacearea.values;
%     analysis.bifurcation.branchvolume.taperratesurfacearea(i).mean             = sum([data.population.bifurcation.branchvolumebins(i).taperratesurfacearea.values].*[data.population.bifurcation.branchvolumebins(i).taperratelength.values])/sum([data.population.bifurcation.branchvolumebins(i).taperratelength.values]);
% 	%analysis.bifurcation.branchvolume.taperratesurfacearea(i).mean             = mean([data.population.bifurcation.branchvolumebins(i).taperratesurfacearea.values].*[data.population.bifurcation.branchvolumebins(i).taperratelength.values])/sum([data.population.bifurcation.branchvolumebins(i).taperratelength.values]);
%     analysis.bifurcation.branchvolume.taperratesurfacearea(i).std              = std([analysis.bifurcation.branchvolume.taperratesurfacearea(i).values]);
%     analysis.bifurcation.branchvolume.taperratesurfacearea(i).max              = max([analysis.bifurcation.branchvolume.taperratesurfacearea(i).values]);
%     analysis.bifurcation.branchvolume.taperratesurfacearea(i).min              = min([analysis.bifurcation.branchvolume.taperratesurfacearea(i).values]);
%     analysis.bifurcation.branchvolume.taperratesurfacearea(i).skew             = skewness([analysis.bifurcation.branchvolume.taperratesurfacearea(i).values],0);
%     analysis.bifurcation.branchvolume.taperratesurfacearea(i).kurt             = kurtosis([analysis.bifurcation.branchvolume.taperratesurfacearea(i).values],0);
    
    analysis.bifurcation.branchvolume.bifurcationprobability.length(i)      = analysis.bifurcation.branchvolume.numberbifurcations(i).total / analysis.bifurcation.branchvolume.length(i).total;
    analysis.bifurcation.branchvolume.bifurcationprobability.surfacearea(i) = analysis.bifurcation.branchvolume.numberbifurcations(i).total / analysis.bifurcation.branchvolume.surfacearea(i).total;
    analysis.bifurcation.branchvolume.bifurcationprobability.volume(i)      = analysis.bifurcation.branchvolume.numberbifurcations(i).total / analysis.bifurcation.branchvolume.volume(i).total;
    
end
    
analysis.bifurcation.branchvolume = orderfields(analysis.bifurcation.branchvolume);









% Begin termination branch length analysis

clear branchvolumebinlengths maxbranchvolumebin;

for i = 1:length(data.individual)
    branchvolumebinlengths(i) = length(data.individual(i).termination.branchvolumebins);
end

maxbranchvolumebin = max(branchvolumebinlengths);

for i = 1:maxbranchvolumebin
    data.population.termination.branchvolumebins(i).taperrate.values            = [];
	%data.population.termination.branchvolumebins(i).taperratevolume.values      = [];
	%data.population.termination.branchvolumebins(i).taperratesurfacearea.values = [];
    data.population.termination.branchvolumebins(i).taperratelength.values      = [];
end
    

for i = 1:length(data.individual)
    
    for j = 1:length(data.individual(i).termination.branchvolumebins)
        
        if isfield(data.individual(i).termination.branchvolumebins(j).piece,'id') == 1
        
            data.individual(i).termination.branchvolumebins(j).length                      = sum([data.individual(i).termination.branchvolumebins(j).piece.length]);
            data.individual(i).termination.branchvolumebins(j).surfacearea                 = sum([data.individual(i).termination.branchvolumebins(j).piece.surfacearea]);
            data.individual(i).termination.branchvolumebins(j).volume                      = sum([data.individual(i).termination.branchvolumebins(j).piece.volume]);
            data.individual(i).termination.branchvolumebins(j).numbersegments              = length(unique([data.individual(i).termination.branchvolumebins(j).piece.cable]));
            data.individual(i).termination.branchvolumebins(j).numberterminations          = 0;
            data.individual(i).termination.branchvolumebins(j).diameter                    = ((4*data.individual(i).termination.branchvolumebins(j).volume)/(pi()*data.individual(i).termination.branchvolumebins(j).length))^0.5;            
            data.individual(i).termination.branchvolumebins(j).taperrate.values            = [data.individual(i).termination.branchvolumebins(j).piece.taperrate];
			%data.individual(i).termination.branchvolumebins(j).taperratevolume.values      = [data.individual(i).termination.branchvolumebins(j).piece.taperratevolume];
			%data.individual(i).termination.branchvolumebins(j).taperratesurfacearea.values = [data.individual(i).termination.branchvolumebins(j).piece.taperratesurfacearea];
            data.individual(i).termination.branchvolumebins(j).taperratelength.values      = [data.individual(i).termination.branchvolumebins(j).piece.length];

            for k = 1:length(data.individual(i).termination.branchvolumebins(j).piece)
                if strcmp(data.individual(i).termination.branchvolumebins(j).piece(k).distaltype,'termination')==1
                    data.individual(i).termination.branchvolumebins(j).numberterminations = 1 + data.individual(i).termination.branchvolumebins(j).numberterminations;
                end
            end

            if isfield(data.population,'branchvolumebins') == 0; nextvalue = 1;
            elseif j > length(data.population.termination.branchvolumebins); nextvalue = 1;
            elseif isfield(data.population.termination.branchvolumebins(j),'length') == 0; nextvalue = 1;
            elseif isfield(data.population.termination.branchvolumebins(j).length,'values') == 0; nextvalue = 1;
            else nextvalue = 1 + length(data.population.termination.branchvolumebins(j).length.values);
            end
            data.population.termination.branchvolumebins(j).length.values(nextvalue)             = data.individual(i).termination.branchvolumebins(j).length;
            data.population.termination.branchvolumebins(j).surfacearea.values(nextvalue)        = data.individual(i).termination.branchvolumebins(j).surfacearea;
            data.population.termination.branchvolumebins(j).volume.values(nextvalue)             = data.individual(i).termination.branchvolumebins(j).volume;
            data.population.termination.branchvolumebins(j).numbersegments.values(nextvalue)     = data.individual(i).termination.branchvolumebins(j).numbersegments;
            data.population.termination.branchvolumebins(j).numberterminations.values(nextvalue) = data.individual(i).termination.branchvolumebins(j).numberterminations;
            data.population.termination.branchvolumebins(j).diameter.values(nextvalue)           = data.individual(i).termination.branchvolumebins(j).diameter;
            data.population.termination.branchvolumebins(j).taperrate.values                     = [ [data.population.termination.branchvolumebins(j).taperrate.values] [data.individual(i).termination.branchvolumebins(j).taperrate.values] ];
			%data.population.termination.branchvolumebins(j).taperratevolume.values               = [ [data.population.termination.branchvolumebins(j).taperratevolume.values] [data.individual(i).termination.branchvolumebins(j).taperratevolume.values] ];
			%data.population.termination.branchvolumebins(j).taperratesurfacearea.values          = [ [data.population.termination.branchvolumebins(j).taperratesurfacearea.values] [data.individual(i).termination.branchvolumebins(j).taperratesurfacearea.values] ];
            data.population.termination.branchvolumebins(j).taperratelength.values               = [ [data.population.termination.branchvolumebins(j).taperratelength.values] [data.individual(i).termination.branchvolumebins(j).taperratelength.values] ];

            clear nextvalue;
        
        end
        
    end
end

for i = 1:length(data.population.termination.branchvolumebins)
    
    analysis.termination.branchvolume.branchvolume(i)              = (data.branchvolumebinwidth * i) - (data.branchvolumebinwidth / 2);
    
    if isfield(data.population.termination.branchvolumebins(i).length,'values') == 1
    
        analysis.termination.branchvolume.length(i).values           = data.population.termination.branchvolumebins(i).length.values;
        analysis.termination.branchvolume.length(i).mean             = mean([analysis.termination.branchvolume.length(i).values]);
        analysis.termination.branchvolume.length(i).std              = std([analysis.termination.branchvolume.length(i).values]);
        analysis.termination.branchvolume.length(i).max              = max([analysis.termination.branchvolume.length(i).values]);
        analysis.termination.branchvolume.length(i).min              = min([analysis.termination.branchvolume.length(i).values]);
        analysis.termination.branchvolume.length(i).skew             = skewness([analysis.termination.branchvolume.length(i).values],0);
        analysis.termination.branchvolume.length(i).kurt             = kurtosis([analysis.termination.branchvolume.length(i).values],0);
        analysis.termination.branchvolume.length(i).total            = sum([analysis.termination.branchvolume.length(i).values]);

        analysis.termination.branchvolume.surfacearea(i).values           = data.population.termination.branchvolumebins(i).surfacearea.values;
        analysis.termination.branchvolume.surfacearea(i).mean             = mean([analysis.termination.branchvolume.surfacearea(i).values]);
        analysis.termination.branchvolume.surfacearea(i).std              = std([analysis.termination.branchvolume.surfacearea(i).values]);
        analysis.termination.branchvolume.surfacearea(i).max              = max([analysis.termination.branchvolume.surfacearea(i).values]);
        analysis.termination.branchvolume.surfacearea(i).min              = min([analysis.termination.branchvolume.surfacearea(i).values]);
        analysis.termination.branchvolume.surfacearea(i).skew             = skewness([analysis.termination.branchvolume.surfacearea(i).values],0);
        analysis.termination.branchvolume.surfacearea(i).kurt             = kurtosis([analysis.termination.branchvolume.surfacearea(i).values],0);
        analysis.termination.branchvolume.surfacearea(i).total            = sum([analysis.termination.branchvolume.surfacearea(i).values]);

        analysis.termination.branchvolume.volume(i).values           = data.population.termination.branchvolumebins(i).volume.values;
        analysis.termination.branchvolume.volume(i).mean             = mean([analysis.termination.branchvolume.volume(i).values]);
        analysis.termination.branchvolume.volume(i).std              = std([analysis.termination.branchvolume.volume(i).values]);
        analysis.termination.branchvolume.volume(i).max              = max([analysis.termination.branchvolume.volume(i).values]);
        analysis.termination.branchvolume.volume(i).min              = min([analysis.termination.branchvolume.volume(i).values]);
        analysis.termination.branchvolume.volume(i).skew             = skewness([analysis.termination.branchvolume.volume(i).values],0);
        analysis.termination.branchvolume.volume(i).kurt             = kurtosis([analysis.termination.branchvolume.volume(i).values],0);
        analysis.termination.branchvolume.volume(i).total            = sum([analysis.termination.branchvolume.volume(i).values]);

        analysis.termination.branchvolume.numbersegments(i).values           = data.population.termination.branchvolumebins(i).numbersegments.values;
        analysis.termination.branchvolume.numbersegments(i).mean             = mean([analysis.termination.branchvolume.numbersegments(i).values]);
        analysis.termination.branchvolume.numbersegments(i).std              = std([analysis.termination.branchvolume.numbersegments(i).values]);
        analysis.termination.branchvolume.numbersegments(i).max              = max([analysis.termination.branchvolume.numbersegments(i).values]);
        analysis.termination.branchvolume.numbersegments(i).min              = min([analysis.termination.branchvolume.numbersegments(i).values]);
        analysis.termination.branchvolume.numbersegments(i).skew             = skewness([analysis.termination.branchvolume.numbersegments(i).values],0);
        analysis.termination.branchvolume.numbersegments(i).kurt             = kurtosis([analysis.termination.branchvolume.numbersegments(i).values],0);
        analysis.termination.branchvolume.numbersegments(i).total            = sum([analysis.termination.branchvolume.numbersegments(i).values]);
        
        analysis.termination.branchvolume.numberterminations(i).values           = data.population.termination.branchvolumebins(i).numberterminations.values;
        analysis.termination.branchvolume.numberterminations(i).mean             = mean([analysis.termination.branchvolume.numberterminations(i).values]);
        analysis.termination.branchvolume.numberterminations(i).std              = std([analysis.termination.branchvolume.numberterminations(i).values]);
        analysis.termination.branchvolume.numberterminations(i).max              = max([analysis.termination.branchvolume.numberterminations(i).values]);
        analysis.termination.branchvolume.numberterminations(i).min              = min([analysis.termination.branchvolume.numberterminations(i).values]);
        analysis.termination.branchvolume.numberterminations(i).skew             = skewness([analysis.termination.branchvolume.numberterminations(i).values],0);
        analysis.termination.branchvolume.numberterminations(i).kurt             = kurtosis([analysis.termination.branchvolume.numberterminations(i).values],0);
        analysis.termination.branchvolume.numberterminations(i).total            = sum([analysis.termination.branchvolume.numberterminations(i).values]);

        analysis.termination.branchvolume.diameter(i).values           = data.population.termination.branchvolumebins(i).diameter.values;
        analysis.termination.branchvolume.diameter(i).mean             = mean([analysis.termination.branchvolume.diameter(i).values]);
        analysis.termination.branchvolume.diameter(i).std              = std([analysis.termination.branchvolume.diameter(i).values]);
        analysis.termination.branchvolume.diameter(i).max              = max([analysis.termination.branchvolume.diameter(i).values]);
        analysis.termination.branchvolume.diameter(i).min              = min([analysis.termination.branchvolume.diameter(i).values]);
        analysis.termination.branchvolume.diameter(i).skew             = skewness([analysis.termination.branchvolume.diameter(i).values],0);
        analysis.termination.branchvolume.diameter(i).kurt             = kurtosis([analysis.termination.branchvolume.diameter(i).values],0);

        analysis.termination.branchvolume.taperrate(i).values           = data.population.termination.branchvolumebins(i).taperrate.values;
        analysis.termination.branchvolume.taperrate(i).mean             = sum([data.population.termination.branchvolumebins(i).taperrate.values].*[data.population.termination.branchvolumebins(i).taperratelength.values])/sum([data.population.termination.branchvolumebins(i).taperratelength.values]);
		%analysis.termination.branchvolume.taperrate(i).mean             = mean([data.population.termination.branchvolumebins(i).taperrate.values].*[data.population.termination.branchvolumebins(i).taperratelength.values])/sum([data.population.termination.branchvolumebins(i).taperratelength.values]);
        analysis.termination.branchvolume.taperrate(i).std              = std([analysis.termination.branchvolume.taperrate(i).values]);
        analysis.termination.branchvolume.taperrate(i).max              = max([analysis.termination.branchvolume.taperrate(i).values]);
        analysis.termination.branchvolume.taperrate(i).min              = min([analysis.termination.branchvolume.taperrate(i).values]);
        analysis.termination.branchvolume.taperrate(i).skew             = skewness([analysis.termination.branchvolume.taperrate(i).values],0);
        analysis.termination.branchvolume.taperrate(i).kurt             = kurtosis([analysis.termination.branchvolume.taperrate(i).values],0);
		
% 		analysis.termination.branchvolume.taperratevolume(i).values           = data.population.termination.branchvolumebins(i).taperratevolume.values;
%         analysis.termination.branchvolume.taperratevolume(i).mean             = sum([data.population.termination.branchvolumebins(i).taperratevolume.values].*[data.population.termination.branchvolumebins(i).taperratelength.values])/sum([data.population.termination.branchvolumebins(i).taperratelength.values]);
% 		%analysis.termination.branchvolume.taperratevolume(i).mean             = mean([data.population.termination.branchvolumebins(i).taperratevolume.values].*[data.population.termination.branchvolumebins(i).taperratelength.values])/sum([data.population.termination.branchvolumebins(i).taperratelength.values]);
%         analysis.termination.branchvolume.taperratevolume(i).std              = std([analysis.termination.branchvolume.taperratevolume(i).values]);
%         analysis.termination.branchvolume.taperratevolume(i).max              = max([analysis.termination.branchvolume.taperratevolume(i).values]);
%         analysis.termination.branchvolume.taperratevolume(i).min              = min([analysis.termination.branchvolume.taperratevolume(i).values]);
%         analysis.termination.branchvolume.taperratevolume(i).skew             = skewness([analysis.termination.branchvolume.taperratevolume(i).values],0);
%         analysis.termination.branchvolume.taperratevolume(i).kurt             = kurtosis([analysis.termination.branchvolume.taperratevolume(i).values],0);
% 		
% 		analysis.termination.branchvolume.taperratesurfacearea(i).values           = data.population.termination.branchvolumebins(i).taperratesurfacearea.values;
%         analysis.termination.branchvolume.taperratesurfacearea(i).mean             = sum([data.population.termination.branchvolumebins(i).taperratesurfacearea.values].*[data.population.termination.branchvolumebins(i).taperratelength.values])/sum([data.population.termination.branchvolumebins(i).taperratelength.values]);
% 		%analysis.termination.branchvolume.taperratesurfacearea(i).mean             = mean([data.population.termination.branchvolumebins(i).taperratesurfacearea.values].*[data.population.termination.branchvolumebins(i).taperratelength.values])/sum([data.population.termination.branchvolumebins(i).taperratelength.values]);
%         analysis.termination.branchvolume.taperratesurfacearea(i).std              = std([analysis.termination.branchvolume.taperratesurfacearea(i).values]);
%         analysis.termination.branchvolume.taperratesurfacearea(i).max              = max([analysis.termination.branchvolume.taperratesurfacearea(i).values]);
%         analysis.termination.branchvolume.taperratesurfacearea(i).min              = min([analysis.termination.branchvolume.taperratesurfacearea(i).values]);
%         analysis.termination.branchvolume.taperratesurfacearea(i).skew             = skewness([analysis.termination.branchvolume.taperratesurfacearea(i).values],0);
%         analysis.termination.branchvolume.taperratesurfacearea(i).kurt             = kurtosis([analysis.termination.branchvolume.taperratesurfacearea(i).values],0);

    else
        analysis.termination.branchvolume.numbersegments(i).total     = 0;
		analysis.termination.branchvolume.numbersegments(i).mean      = NaN;
		analysis.termination.branchvolume.numbersegments(i).std       = NaN;
        analysis.termination.branchvolume.numberterminations(i).total = 0;
		analysis.termination.branchvolume.numberterminations(i).mean  = NaN;
		analysis.termination.branchvolume.numberterminations(i).std   = NaN;
        analysis.termination.branchvolume.length(i).total             = 0;
		analysis.termination.branchvolume.length(i).mean              = NaN;
		analysis.termination.branchvolume.length(i).std               = NaN;
        analysis.termination.branchvolume.surfacearea(i).total        = 0;
		analysis.termination.branchvolume.surfacearea(i).mean         = NaN;
		analysis.termination.branchvolume.surfacearea(i).std          = NaN;
        analysis.termination.branchvolume.volume(i).total             = 0;
		analysis.termination.branchvolume.volume(i).mean              = NaN;
		analysis.termination.branchvolume.volume(i).std               = NaN;
		analysis.termination.branchvolume.diameter(i).mean            = NaN;
		analysis.termination.branchvolume.diameter(i).std             = NaN;
		analysis.termination.branchvolume.taperrate(i).mean           = NaN;
		analysis.termination.branchvolume.taperrate(i).std            = NaN;
% 		analysis.termination.branchvolume.taperratevolume(i).mean      = NaN;
% 		analysis.termination.branchvolume.taperratevolume(i).std       = NaN;
% 		analysis.termination.branchvolume.taperratesurfacearea(i).mean = NaN;
% 		analysis.termination.branchvolume.taperratesurfacearea(i).std  = NaN;
    end        
        
        
    analysis.termination.branchvolume.terminationprobability.length(i)      = analysis.termination.branchvolume.numberterminations(i).total / analysis.termination.branchvolume.length(i).total;
    analysis.termination.branchvolume.terminationprobability.surfacearea(i) = analysis.termination.branchvolume.numberterminations(i).total / analysis.termination.branchvolume.surfacearea(i).total;
    analysis.termination.branchvolume.terminationprobability.volume(i)      = analysis.termination.branchvolume.numberterminations(i).total / analysis.termination.branchvolume.volume(i).total;
    
end
    
analysis.termination.branchvolume = orderfields(analysis.termination.branchvolume);




warning('on', 'MATLAB:divideByZero');