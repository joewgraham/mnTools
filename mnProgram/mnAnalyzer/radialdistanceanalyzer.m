function [data,analysis]   = radialdistanceanalyzer(data,analysis)

disp('   Radial distance analysis started.');

warning('off', 'MATLAB:divideByZero');

mnoptions;

piecetypes{1} = 'soma';
piecetypes{2} = 'axon';
piecetypes{3} = 'dendrite';
piecetypes{4} = 'apical';

for piecetype = 2:4
    
    if isfield(data.population,piecetypes{piecetype})
        
        currentpiecetype = piecetypes{piecetype};
        clear typeanalysis;
        clear popdata;
        eval(['typeanalysis = analysis.' currentpiecetype ';']);
        eval(['popdata = data.population.' currentpiecetype ';']);
        
        clear maxradialdistancebin;
        clear distancebinwidth;
        eval(['distancebinwidth = option.' currentpiecetype '.distancebinwidth;']);
        maxradialdistancebin = ceil(popdata.maxradialdistance / distancebinwidth);
        for i = 1:maxradialdistancebin
            popdata.radialdistancebins(i).rallratio.values            = [];
            popdata.radialdistancebins(i).rallratio1.values           = [];
            popdata.radialdistancebins(i).rallratio2.values           = [];
            popdata.radialdistancebins(i).rallratio3.values           = [];
            popdata.radialdistancebins(i).daughterratio.values        = [];
            popdata.radialdistancebins(i).parentdaughterratio.values  = [];
            popdata.radialdistancebins(i).parentdaughter2ratio.values = [];
            popdata.radialdistancebins(i).taperrate.values            = [];
            popdata.radialdistancebins(i).taperratelength.values      = [];

            popdata.radialdistancebins(i).length.values                    = [];
            popdata.radialdistancebins(i).surfacearea.values               = [];
            popdata.radialdistancebins(i).volume.values                    = [];
            popdata.radialdistancebins(i).numbersegments.values            = [];
            popdata.radialdistancebins(i).numberbifurcations.values        = [];
            popdata.radialdistancebins(i).numberterminations.values        = [];
            popdata.radialdistancebins(i).numberbifurcatingbranches.values = [];
            popdata.radialdistancebins(i).numberterminatingbranches.values = [];
            popdata.radialdistancebins(i).diameter.values                  = [];
        end
        
        for i = 1:length(data.individual)
            
            clear inddata;
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            
            for j = 1:length(inddata.radialdistancebins)
                
                if isfield(inddata.radialdistancebins(j).piece,'id')
                    
                    inddata.radialdistancebins(j).length                      = sum([inddata.radialdistancebins(j).piece.length]);
                    inddata.radialdistancebins(j).surfacearea                 = sum([inddata.radialdistancebins(j).piece.surfacearea]);
                    inddata.radialdistancebins(j).volume                      = sum([inddata.radialdistancebins(j).piece.volume]);
                    inddata.radialdistancebins(j).numbersegments              = length(unique([inddata.radialdistancebins(j).piece.cable]));
                    inddata.radialdistancebins(j).numberbifurcations          = 0;
                    inddata.radialdistancebins(j).numberterminations          = 0;
                    inddata.radialdistancebins(j).numberbifurcatingbranches   = 0;
                    inddata.radialdistancebins(j).numberterminatingbranches   = 0;
                    inddata.radialdistancebins(j).rallratio.values            = [inddata.radialdistancebins(j).piece.rallratio];
                    inddata.radialdistancebins(j).rallratio1.values           = [inddata.radialdistancebins(j).piece.rallratio1];
                    inddata.radialdistancebins(j).rallratio2.values           = [inddata.radialdistancebins(j).piece.rallratio2];
                    inddata.radialdistancebins(j).rallratio3.values           = [inddata.radialdistancebins(j).piece.rallratio3];
                    inddata.radialdistancebins(j).daughterratio.values        = [inddata.radialdistancebins(j).piece.daughterratio];
                    inddata.radialdistancebins(j).parentdaughterratio.values  = [inddata.radialdistancebins(j).piece.parentdaughterratio];
                    inddata.radialdistancebins(j).parentdaughter2ratio.values = [inddata.radialdistancebins(j).piece.parentdaughter2ratio];
                    inddata.radialdistancebins(j).diameter                    = ((4*inddata.radialdistancebins(j).volume)/(pi()*inddata.radialdistancebins(j).length))^0.5;
                    inddata.radialdistancebins(j).taperrate.values            = [inddata.radialdistancebins(j).piece.taperrate];
                    inddata.radialdistancebins(j).taperratelength.values      = [inddata.radialdistancebins(j).piece.length];
                    
                    
                    for k = 1:length(inddata.radialdistancebins(j).piece)
                        if strcmp(inddata.radialdistancebins(j).piece(k).distaltype,'bifurcation')==1
                            inddata.radialdistancebins(j).numberbifurcations = 1 + inddata.radialdistancebins(j).numberbifurcations;
                        end
                        if strcmp(inddata.radialdistancebins(j).piece(k).distaltype,'termination')==1
                            inddata.radialdistancebins(j).numberterminations = 1 + inddata.radialdistancebins(j).numberterminations;
                        end
                        if strcmp(inddata.radialdistancebins(j).piece(k).distaltype,'m-furcation')==1
                            inddata.radialdistancebins(j).numberbifurcations = length(inddata.radialdistancebins(j).piece(k).daughters) - 1 + inddata.radialdistancebins(j).numberbifurcations;
                        end
                        
                        if strcmp(inddata.radialdistancebins(j).piece(k).proximaltype,'primary    ') ==1 || strcmp(inddata.radialdistancebins(j).piece(k).proximaltype,'daughter   ') ==1 || strcmp(inddata.radialdistancebins(j).piece(k).proximaltype,'daughter1  ') ==1 || strcmp(inddata.radialdistancebins(j).piece(k).proximaltype,'daughter2  ') ==1
                            if strcmp(inddata.radialdistancebins(j).piece(k).branchtype,'b') == 1
                                inddata.radialdistancebins(j).numberbifurcatingbranches = 1 + inddata.radialdistancebins(j).numberbifurcatingbranches;
                            elseif strcmp(inddata.radialdistancebins(j).piece(k).branchtype,'t') == 1
                                inddata.radialdistancebins(j).numberterminatingbranches = 1 + inddata.radialdistancebins(j).numberterminatingbranches;
                            else disp('       Error in radial distance analyzer: piece branch type not identified.');
                            end
                        end
                    end
                    
                    if isfield(popdata,'radialdistancebins') == 0; nextvalue = 1;
                    elseif j > length(popdata.radialdistancebins); nextvalue = 1;
                    elseif isfield(popdata.radialdistancebins(j),'length') == 0; nextvalue = 1;
                    elseif isfield(popdata.radialdistancebins(j).length,'values') == 0; nextvalue = 1;
                    else nextvalue = 1 + length(popdata.radialdistancebins(j).length.values);
                    end
                    popdata.radialdistancebins(j).length.values(nextvalue)             = inddata.radialdistancebins(j).length;
                    popdata.radialdistancebins(j).surfacearea.values(nextvalue)        = inddata.radialdistancebins(j).surfacearea;
                    popdata.radialdistancebins(j).volume.values(nextvalue)             = inddata.radialdistancebins(j).volume;
                    popdata.radialdistancebins(j).numbersegments.values(nextvalue)     = inddata.radialdistancebins(j).numbersegments;
                    popdata.radialdistancebins(j).numberbifurcations.values(nextvalue) = inddata.radialdistancebins(j).numberbifurcations;
                    popdata.radialdistancebins(j).numberterminations.values(nextvalue) = inddata.radialdistancebins(j).numberterminations;
                    popdata.radialdistancebins(j).numberbifurcatingbranches.values(nextvalue) = inddata.radialdistancebins(j).numberbifurcatingbranches;
                    popdata.radialdistancebins(j).numberterminatingbranches.values(nextvalue) = inddata.radialdistancebins(j).numberterminatingbranches;
                    popdata.radialdistancebins(j).rallratio.values                     = [ [popdata.radialdistancebins(j).rallratio.values] [inddata.radialdistancebins(j).rallratio.values] ];
                    popdata.radialdistancebins(j).rallratio1.values                    = [ [popdata.radialdistancebins(j).rallratio1.values] [inddata.radialdistancebins(j).rallratio1.values] ];
                    popdata.radialdistancebins(j).rallratio2.values                    = [ [popdata.radialdistancebins(j).rallratio2.values] [inddata.radialdistancebins(j).rallratio2.values] ];
                    popdata.radialdistancebins(j).rallratio3.values                    = [ [popdata.radialdistancebins(j).rallratio3.values] [inddata.radialdistancebins(j).rallratio3.values] ];
                    popdata.radialdistancebins(j).daughterratio.values                 = [ [popdata.radialdistancebins(j).daughterratio.values] [inddata.radialdistancebins(j).daughterratio.values] ];
                    popdata.radialdistancebins(j).parentdaughterratio.values           = [ [popdata.radialdistancebins(j).parentdaughterratio.values] [inddata.radialdistancebins(j).parentdaughterratio.values] ];
                    popdata.radialdistancebins(j).parentdaughter2ratio.values          = [ [popdata.radialdistancebins(j).parentdaughter2ratio.values] [inddata.radialdistancebins(j).parentdaughter2ratio.values] ];
                    popdata.radialdistancebins(j).diameter.values(nextvalue)           = inddata.radialdistancebins(j).diameter;
                    popdata.radialdistancebins(j).taperrate.values                     = [ [popdata.radialdistancebins(j).taperrate.values] [inddata.radialdistancebins(j).taperrate.values] ];
                    popdata.radialdistancebins(j).taperratelength.values               = [ [popdata.radialdistancebins(j).taperratelength.values] [inddata.radialdistancebins(j).taperratelength.values] ];
                    
                    clear nextvalue;
                    
                end
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        for m = 1:length(popdata.radialdistancebins)
            
            typeanalysis.radialdistance.radialdistance(m)              = (distancebinwidth * m) - (distancebinwidth / 2);
            typeanalysis.radialdistance.length(m).values           = popdata.radialdistancebins(m).length.values;
            typeanalysis.radialdistance.length(m).mean             = mean([typeanalysis.radialdistance.length(m).values]);
            typeanalysis.radialdistance.length(m).std              = std([typeanalysis.radialdistance.length(m).values]);
            typeanalysis.radialdistance.length(m).max              = max([typeanalysis.radialdistance.length(m).values]);
            typeanalysis.radialdistance.length(m).min              = min([typeanalysis.radialdistance.length(m).values]);
            typeanalysis.radialdistance.length(m).skew             = skewness([typeanalysis.radialdistance.length(m).values],0);
            typeanalysis.radialdistance.length(m).kurt             = kurtosis([typeanalysis.radialdistance.length(m).values],0);
            typeanalysis.radialdistance.length(m).total            = sum([typeanalysis.radialdistance.length(m).values]);
            
            typeanalysis.radialdistance.surfacearea(m).values           = popdata.radialdistancebins(m).surfacearea.values;
            typeanalysis.radialdistance.surfacearea(m).mean             = mean([typeanalysis.radialdistance.surfacearea(m).values]);
            typeanalysis.radialdistance.surfacearea(m).std              = std([typeanalysis.radialdistance.surfacearea(m).values]);
            typeanalysis.radialdistance.surfacearea(m).max              = max([typeanalysis.radialdistance.surfacearea(m).values]);
            typeanalysis.radialdistance.surfacearea(m).min              = min([typeanalysis.radialdistance.surfacearea(m).values]);
            typeanalysis.radialdistance.surfacearea(m).skew             = skewness([typeanalysis.radialdistance.surfacearea(m).values],0);
            typeanalysis.radialdistance.surfacearea(m).kurt             = kurtosis([typeanalysis.radialdistance.surfacearea(m).values],0);
            typeanalysis.radialdistance.surfacearea(m).total            = sum([typeanalysis.radialdistance.surfacearea(m).values]);
            
            typeanalysis.radialdistance.volume(m).values           = popdata.radialdistancebins(m).volume.values;
            typeanalysis.radialdistance.volume(m).mean             = mean([typeanalysis.radialdistance.volume(m).values]);
            typeanalysis.radialdistance.volume(m).std              = std([typeanalysis.radialdistance.volume(m).values]);
            typeanalysis.radialdistance.volume(m).max              = max([typeanalysis.radialdistance.volume(m).values]);
            typeanalysis.radialdistance.volume(m).min              = min([typeanalysis.radialdistance.volume(m).values]);
            typeanalysis.radialdistance.volume(m).skew             = skewness([typeanalysis.radialdistance.volume(m).values],0);
            typeanalysis.radialdistance.volume(m).kurt             = kurtosis([typeanalysis.radialdistance.volume(m).values],0);
            typeanalysis.radialdistance.volume(m).total            = sum([typeanalysis.radialdistance.volume(m).values]);
            
            typeanalysis.radialdistance.numbersegments(m).values           = popdata.radialdistancebins(m).numbersegments.values;
            typeanalysis.radialdistance.numbersegments(m).mean             = mean([typeanalysis.radialdistance.numbersegments(m).values]);
            typeanalysis.radialdistance.numbersegments(m).std              = std([typeanalysis.radialdistance.numbersegments(m).values]);
            typeanalysis.radialdistance.numbersegments(m).max              = max([typeanalysis.radialdistance.numbersegments(m).values]);
            typeanalysis.radialdistance.numbersegments(m).min              = min([typeanalysis.radialdistance.numbersegments(m).values]);
            typeanalysis.radialdistance.numbersegments(m).skew             = skewness([typeanalysis.radialdistance.numbersegments(m).values],0);
            typeanalysis.radialdistance.numbersegments(m).kurt             = kurtosis([typeanalysis.radialdistance.numbersegments(m).values],0);
            typeanalysis.radialdistance.numbersegments(m).total            = sum([typeanalysis.radialdistance.numbersegments(m).values]);
            
            typeanalysis.radialdistance.numberbifurcations(m).values           = popdata.radialdistancebins(m).numberbifurcations.values;
            typeanalysis.radialdistance.numberbifurcations(m).mean             = mean([typeanalysis.radialdistance.numberbifurcations(m).values]);
            typeanalysis.radialdistance.numberbifurcations(m).std              = std([typeanalysis.radialdistance.numberbifurcations(m).values]);
            typeanalysis.radialdistance.numberbifurcations(m).max              = max([typeanalysis.radialdistance.numberbifurcations(m).values]);
            typeanalysis.radialdistance.numberbifurcations(m).min              = min([typeanalysis.radialdistance.numberbifurcations(m).values]);
            typeanalysis.radialdistance.numberbifurcations(m).skew             = skewness([typeanalysis.radialdistance.numberbifurcations(m).values],0);
            typeanalysis.radialdistance.numberbifurcations(m).kurt             = kurtosis([typeanalysis.radialdistance.numberbifurcations(m).values],0);
            typeanalysis.radialdistance.numberbifurcations(m).total            = sum([typeanalysis.radialdistance.numberbifurcations(m).values]);
            
            typeanalysis.radialdistance.numberterminations(m).values           = popdata.radialdistancebins(m).numberterminations.values;
            typeanalysis.radialdistance.numberterminations(m).mean             = mean([typeanalysis.radialdistance.numberterminations(m).values]);
            typeanalysis.radialdistance.numberterminations(m).std              = std([typeanalysis.radialdistance.numberterminations(m).values]);
            typeanalysis.radialdistance.numberterminations(m).max              = max([typeanalysis.radialdistance.numberterminations(m).values]);
            typeanalysis.radialdistance.numberterminations(m).min              = min([typeanalysis.radialdistance.numberterminations(m).values]);
            typeanalysis.radialdistance.numberterminations(m).skew             = skewness([typeanalysis.radialdistance.numberterminations(m).values],0);
            typeanalysis.radialdistance.numberterminations(m).kurt             = kurtosis([typeanalysis.radialdistance.numberterminations(m).values],0);
            typeanalysis.radialdistance.numberterminations(m).total            = sum([typeanalysis.radialdistance.numberterminations(m).values]);
            
            typeanalysis.radialdistance.numberbifurcatingbranches(m).values           = popdata.radialdistancebins(m).numberbifurcatingbranches.values;
            typeanalysis.radialdistance.numberbifurcatingbranches(m).mean             = mean([typeanalysis.radialdistance.numberbifurcatingbranches(m).values]);
            typeanalysis.radialdistance.numberbifurcatingbranches(m).std              = std([typeanalysis.radialdistance.numberbifurcatingbranches(m).values]);
            typeanalysis.radialdistance.numberbifurcatingbranches(m).max              = max([typeanalysis.radialdistance.numberbifurcatingbranches(m).values]);
            typeanalysis.radialdistance.numberbifurcatingbranches(m).min              = min([typeanalysis.radialdistance.numberbifurcatingbranches(m).values]);
            typeanalysis.radialdistance.numberbifurcatingbranches(m).skew             = skewness([typeanalysis.radialdistance.numberbifurcatingbranches(m).values],0);
            typeanalysis.radialdistance.numberbifurcatingbranches(m).kurt             = kurtosis([typeanalysis.radialdistance.numberbifurcatingbranches(m).values],0);
            typeanalysis.radialdistance.numberbifurcatingbranches(m).total            = sum([typeanalysis.radialdistance.numberbifurcatingbranches(m).values]);
            
            typeanalysis.radialdistance.numberterminatingbranches(m).values           = popdata.radialdistancebins(m).numberterminatingbranches.values;
            typeanalysis.radialdistance.numberterminatingbranches(m).mean             = mean([typeanalysis.radialdistance.numberterminatingbranches(m).values]);
            typeanalysis.radialdistance.numberterminatingbranches(m).std              = std([typeanalysis.radialdistance.numberterminatingbranches(m).values]);
            typeanalysis.radialdistance.numberterminatingbranches(m).max              = max([typeanalysis.radialdistance.numberterminatingbranches(m).values]);
            typeanalysis.radialdistance.numberterminatingbranches(m).min              = min([typeanalysis.radialdistance.numberterminatingbranches(m).values]);
            typeanalysis.radialdistance.numberterminatingbranches(m).skew             = skewness([typeanalysis.radialdistance.numberterminatingbranches(m).values],0);
            typeanalysis.radialdistance.numberterminatingbranches(m).kurt             = kurtosis([typeanalysis.radialdistance.numberterminatingbranches(m).values],0);
            typeanalysis.radialdistance.numberterminatingbranches(m).total            = sum([typeanalysis.radialdistance.numberterminatingbranches(m).values]);
            
            typeanalysis.radialdistance.rallratio(m).values           = popdata.radialdistancebins(m).rallratio.values;
            typeanalysis.radialdistance.rallratio(m).mean             = mean([typeanalysis.radialdistance.rallratio(m).values]);
            typeanalysis.radialdistance.rallratio(m).std              = std([typeanalysis.radialdistance.rallratio(m).values]);
            typeanalysis.radialdistance.rallratio(m).max              = max([typeanalysis.radialdistance.rallratio(m).values]);
            typeanalysis.radialdistance.rallratio(m).min              = min([typeanalysis.radialdistance.rallratio(m).values]);
            typeanalysis.radialdistance.rallratio(m).skew             = skewness([typeanalysis.radialdistance.rallratio(m).values],0);
            typeanalysis.radialdistance.rallratio(m).kurt             = kurtosis([typeanalysis.radialdistance.rallratio(m).values],0);
            
            typeanalysis.radialdistance.rallratio1(m).values           = popdata.radialdistancebins(m).rallratio1.values;
            typeanalysis.radialdistance.rallratio1(m).mean             = mean([typeanalysis.radialdistance.rallratio1(m).values]);
            typeanalysis.radialdistance.rallratio1(m).std              = std([typeanalysis.radialdistance.rallratio1(m).values]);
            typeanalysis.radialdistance.rallratio1(m).max              = max([typeanalysis.radialdistance.rallratio1(m).values]);
            typeanalysis.radialdistance.rallratio1(m).min              = min([typeanalysis.radialdistance.rallratio1(m).values]);
            typeanalysis.radialdistance.rallratio1(m).skew             = skewness([typeanalysis.radialdistance.rallratio1(m).values],0);
            typeanalysis.radialdistance.rallratio1(m).kurt             = kurtosis([typeanalysis.radialdistance.rallratio1(m).values],0);
            
            typeanalysis.radialdistance.rallratio2(m).values           = popdata.radialdistancebins(m).rallratio2.values;
            typeanalysis.radialdistance.rallratio2(m).mean             = mean([typeanalysis.radialdistance.rallratio2(m).values]);
            typeanalysis.radialdistance.rallratio2(m).std              = std([typeanalysis.radialdistance.rallratio2(m).values]);
            typeanalysis.radialdistance.rallratio2(m).max              = max([typeanalysis.radialdistance.rallratio2(m).values]);
            typeanalysis.radialdistance.rallratio2(m).min              = min([typeanalysis.radialdistance.rallratio2(m).values]);
            typeanalysis.radialdistance.rallratio2(m).skew             = skewness([typeanalysis.radialdistance.rallratio2(m).values],0);
            typeanalysis.radialdistance.rallratio2(m).kurt             = kurtosis([typeanalysis.radialdistance.rallratio2(m).values],0);
            
            typeanalysis.radialdistance.rallratio3(m).values           = popdata.radialdistancebins(m).rallratio3.values;
            typeanalysis.radialdistance.rallratio3(m).mean             = mean([typeanalysis.radialdistance.rallratio3(m).values]);
            typeanalysis.radialdistance.rallratio3(m).std              = std([typeanalysis.radialdistance.rallratio3(m).values]);
            typeanalysis.radialdistance.rallratio3(m).max              = max([typeanalysis.radialdistance.rallratio3(m).values]);
            typeanalysis.radialdistance.rallratio3(m).min              = min([typeanalysis.radialdistance.rallratio3(m).values]);
            typeanalysis.radialdistance.rallratio3(m).skew             = skewness([typeanalysis.radialdistance.rallratio3(m).values],0);
            typeanalysis.radialdistance.rallratio3(m).kurt             = kurtosis([typeanalysis.radialdistance.rallratio3(m).values],0);
            
            typeanalysis.radialdistance.daughterratio(m).values           = popdata.radialdistancebins(m).daughterratio.values;
            typeanalysis.radialdistance.daughterratio(m).mean             = mean([typeanalysis.radialdistance.daughterratio(m).values]);
            typeanalysis.radialdistance.daughterratio(m).std              = std([typeanalysis.radialdistance.daughterratio(m).values]);
            typeanalysis.radialdistance.daughterratio(m).max              = max([typeanalysis.radialdistance.daughterratio(m).values]);
            typeanalysis.radialdistance.daughterratio(m).min              = min([typeanalysis.radialdistance.daughterratio(m).values]);
            typeanalysis.radialdistance.daughterratio(m).skew             = skewness([typeanalysis.radialdistance.daughterratio(m).values],0);
            typeanalysis.radialdistance.daughterratio(m).kurt             = kurtosis([typeanalysis.radialdistance.daughterratio(m).values],0);
            
            typeanalysis.radialdistance.parentdaughterratio(m).values           = popdata.radialdistancebins(m).parentdaughterratio.values;
            typeanalysis.radialdistance.parentdaughterratio(m).mean             = mean([typeanalysis.radialdistance.parentdaughterratio(m).values]);
            typeanalysis.radialdistance.parentdaughterratio(m).std              = std([typeanalysis.radialdistance.parentdaughterratio(m).values]);
            typeanalysis.radialdistance.parentdaughterratio(m).max              = max([typeanalysis.radialdistance.parentdaughterratio(m).values]);
            typeanalysis.radialdistance.parentdaughterratio(m).min              = min([typeanalysis.radialdistance.parentdaughterratio(m).values]);
            typeanalysis.radialdistance.parentdaughterratio(m).skew             = skewness([typeanalysis.radialdistance.parentdaughterratio(m).values],0);
            typeanalysis.radialdistance.parentdaughterratio(m).kurt             = kurtosis([typeanalysis.radialdistance.parentdaughterratio(m).values],0);
            
            typeanalysis.radialdistance.parentdaughter2ratio(m).values           = popdata.radialdistancebins(m).parentdaughter2ratio.values;
            typeanalysis.radialdistance.parentdaughter2ratio(m).mean             = mean([typeanalysis.radialdistance.parentdaughter2ratio(m).values]);
            typeanalysis.radialdistance.parentdaughter2ratio(m).std              = std([typeanalysis.radialdistance.parentdaughter2ratio(m).values]);
            typeanalysis.radialdistance.parentdaughter2ratio(m).max              = max([typeanalysis.radialdistance.parentdaughter2ratio(m).values]);
            typeanalysis.radialdistance.parentdaughter2ratio(m).min              = min([typeanalysis.radialdistance.parentdaughter2ratio(m).values]);
            typeanalysis.radialdistance.parentdaughter2ratio(m).skew             = skewness([typeanalysis.radialdistance.parentdaughter2ratio(m).values],0);
            typeanalysis.radialdistance.parentdaughter2ratio(m).kurt             = kurtosis([typeanalysis.radialdistance.parentdaughter2ratio(m).values],0);
            
            typeanalysis.radialdistance.diameter(m).values           = popdata.radialdistancebins(m).diameter.values;
            typeanalysis.radialdistance.diameter(m).mean             = mean([typeanalysis.radialdistance.diameter(m).values]);
            typeanalysis.radialdistance.diameter(m).std              = std([typeanalysis.radialdistance.diameter(m).values]);
            typeanalysis.radialdistance.diameter(m).max              = max([typeanalysis.radialdistance.diameter(m).values]);
            typeanalysis.radialdistance.diameter(m).min              = min([typeanalysis.radialdistance.diameter(m).values]);
            typeanalysis.radialdistance.diameter(m).skew             = skewness([typeanalysis.radialdistance.diameter(m).values],0);
            typeanalysis.radialdistance.diameter(m).kurt             = kurtosis([typeanalysis.radialdistance.diameter(m).values],0);
            
            typeanalysis.radialdistance.taperrate(m).values           = popdata.radialdistancebins(m).taperrate.values;
            typeanalysis.radialdistance.taperrate(m).mean             = sum([popdata.radialdistancebins(m).taperrate.values].*[popdata.radialdistancebins(m).taperratelength.values])/sum([popdata.radialdistancebins(m).taperratelength.values]);
            %typeanalysis.radialdistance.taperrate(m).mean             = mean([popdata.radialdistancebins(m).taperrate.values].*[popdata.radialdistancebins(m).taperratelength.values])/sum([popdata.radialdistancebins(m).taperratelength.values]);
            typeanalysis.radialdistance.taperrate(m).std              = std([typeanalysis.radialdistance.taperrate(m).values]);
            typeanalysis.radialdistance.taperrate(m).max              = max([typeanalysis.radialdistance.taperrate(m).values]);
            typeanalysis.radialdistance.taperrate(m).min              = min([typeanalysis.radialdistance.taperrate(m).values]);
            typeanalysis.radialdistance.taperrate(m).skew             = skewness([typeanalysis.radialdistance.taperrate(m).values],0);
            typeanalysis.radialdistance.taperrate(m).kurt             = kurtosis([typeanalysis.radialdistance.taperrate(m).values],0);
            
            typeanalysis.radialdistance.bifurcationprobability.length(m) = typeanalysis.radialdistance.numberbifurcations(m).total / typeanalysis.radialdistance.length(m).total;
            typeanalysis.radialdistance.terminationprobability.length(m) = typeanalysis.radialdistance.numberterminations(m).total / typeanalysis.radialdistance.length(m).total;
            
            typeanalysis.radialdistance.bifurcationprobability.surfacearea(m) = typeanalysis.radialdistance.numberbifurcations(m).total / typeanalysis.radialdistance.surfacearea(m).total;
            typeanalysis.radialdistance.terminationprobability.surfacearea(m) = typeanalysis.radialdistance.numberterminations(m).total / typeanalysis.radialdistance.surfacearea(m).total;
            
            typeanalysis.radialdistance.bifurcationprobability.volume(m) = typeanalysis.radialdistance.numberbifurcations(m).total / typeanalysis.radialdistance.volume(m).total;
            typeanalysis.radialdistance.terminationprobability.volume(m) = typeanalysis.radialdistance.numberterminations(m).total / typeanalysis.radialdistance.volume(m).total;
            
        end
        
        typeanalysis.radialdistance = orderfields(typeanalysis.radialdistance);
        
        
        
        
        
        
        % Begin bifurcation radial distance analysis
        
        clear maxradialdistancebin;
        maxradialdistancebin = ceil(popdata.bifurcation.maxradialdistance / distancebinwidth);
        for n = 1:maxradialdistancebin
            popdata.bifurcation.radialdistancebins(n).rallratio.values            = [];
            popdata.bifurcation.radialdistancebins(n).rallratio1.values           = [];
            popdata.bifurcation.radialdistancebins(n).rallratio2.values           = [];
            popdata.bifurcation.radialdistancebins(n).rallratio3.values           = [];
            popdata.bifurcation.radialdistancebins(n).daughterratio.values        = [];
            popdata.bifurcation.radialdistancebins(n).parentdaughterratio.values  = [];
            popdata.bifurcation.radialdistancebins(n).parentdaughter2ratio.values = [];
            popdata.bifurcation.radialdistancebins(n).taperrate.values            = [];
            popdata.bifurcation.radialdistancebins(n).taperratelength.values      = [];

            popdata.bifurcation.radialdistancebins(n).length.values                    = [];
            popdata.bifurcation.radialdistancebins(n).surfacearea.values               = [];
            popdata.bifurcation.radialdistancebins(n).volume.values                    = [];
            popdata.bifurcation.radialdistancebins(n).numbersegments.values            = [];
            popdata.bifurcation.radialdistancebins(n).numberbifurcations.values        = [];
            popdata.bifurcation.radialdistancebins(n).numberterminations.values        = [];
            popdata.bifurcation.radialdistancebins(n).numberbifurcatingbranches.values = [];
            popdata.bifurcation.radialdistancebins(n).numberterminatingbranches.values = [];
            popdata.bifurcation.radialdistancebins(n).diameter.values                  = [];

        end
        
        
        for i = 1:length(data.individual)
            
            clear inddata;
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            
            if isfield(inddata.bifurcation,'radialdistancebins')
                
                for j = 1:length(inddata.bifurcation.radialdistancebins)
                    
                    if isfield(inddata.bifurcation.radialdistancebins(j).piece,'id')
                        
                        inddata.bifurcation.radialdistancebins(j).length                      = sum([inddata.bifurcation.radialdistancebins(j).piece.length]);
                        inddata.bifurcation.radialdistancebins(j).surfacearea                 = sum([inddata.bifurcation.radialdistancebins(j).piece.surfacearea]);
                        inddata.bifurcation.radialdistancebins(j).volume                      = sum([inddata.bifurcation.radialdistancebins(j).piece.volume]);
                        inddata.bifurcation.radialdistancebins(j).numbersegments              = length(unique([inddata.bifurcation.radialdistancebins(j).piece.cable]));
                        inddata.bifurcation.radialdistancebins(j).numberbifurcations          = 0;
                        inddata.bifurcation.radialdistancebins(j).rallratio.values            = [inddata.bifurcation.radialdistancebins(j).piece.rallratio];
                        inddata.bifurcation.radialdistancebins(j).rallratio1.values           = [inddata.bifurcation.radialdistancebins(j).piece.rallratio1];
                        inddata.bifurcation.radialdistancebins(j).rallratio2.values           = [inddata.bifurcation.radialdistancebins(j).piece.rallratio2];
                        inddata.bifurcation.radialdistancebins(j).rallratio3.values           = [inddata.bifurcation.radialdistancebins(j).piece.rallratio3];
                        inddata.bifurcation.radialdistancebins(j).daughterratio.values        = [inddata.bifurcation.radialdistancebins(j).piece.daughterratio];
                        inddata.bifurcation.radialdistancebins(j).parentdaughterratio.values  = [inddata.bifurcation.radialdistancebins(j).piece.parentdaughterratio];
                        inddata.bifurcation.radialdistancebins(j).parentdaughter2ratio.values = [inddata.bifurcation.radialdistancebins(j).piece.parentdaughter2ratio];
                        inddata.bifurcation.radialdistancebins(j).diameter                    = ((4*inddata.bifurcation.radialdistancebins(j).volume)/(pi()*inddata.bifurcation.radialdistancebins(j).length))^0.5;
                        %
                        if isnan(inddata.bifurcation.radialdistancebins(j).diameter)
                            disp('NaN in bif radialdistance diameter.');
                            keyboard;
                        end
                        %
                        inddata.bifurcation.radialdistancebins(j).taperrate.values            = [inddata.bifurcation.radialdistancebins(j).piece.taperrate];
                        inddata.bifurcation.radialdistancebins(j).taperratelength.values      = [inddata.bifurcation.radialdistancebins(j).piece.length];
                        
                        for k = 1:length(inddata.bifurcation.radialdistancebins(j).piece)
                            if strcmp(inddata.bifurcation.radialdistancebins(j).piece(k).distaltype,'bifurcation')==1
                                inddata.bifurcation.radialdistancebins(j).numberbifurcations = 1 + inddata.bifurcation.radialdistancebins(j).numberbifurcations;
                            end
                            if strcmp(inddata.bifurcation.radialdistancebins(j).piece(k).distaltype,'m-furcation')==1
                                inddata.bifurcation.radialdistancebins(j).numberbifurcations = length(inddata.bifurcation.radialdistancebins(j).piece(k).daughters) - 1 + inddata.bifurcation.radialdistancebins(j).numberbifurcations;
                            end
                        end
                        
                        if isfield(popdata,'radialdistancebins') == 0; nextvalue = 1;
                        elseif j > length(popdata.bifurcation.radialdistancebins); nextvalue = 1;
                        elseif isfield(popdata.bifurcation.radialdistancebins(j),'length') == 0; nextvalue = 1;
                        elseif isfield(popdata.bifurcation.radialdistancebins(j).length,'values') == 0; nextvalue = 1;
                        else nextvalue = 1 + length(popdata.bifurcation.radialdistancebins(j).length.values);
                        end
                        popdata.bifurcation.radialdistancebins(j).length.values(nextvalue)             = inddata.bifurcation.radialdistancebins(j).length;
                        popdata.bifurcation.radialdistancebins(j).surfacearea.values(nextvalue)        = inddata.bifurcation.radialdistancebins(j).surfacearea;
                        popdata.bifurcation.radialdistancebins(j).volume.values(nextvalue)             = inddata.bifurcation.radialdistancebins(j).volume;
                        popdata.bifurcation.radialdistancebins(j).numbersegments.values(nextvalue)     = inddata.bifurcation.radialdistancebins(j).numbersegments;
                        popdata.bifurcation.radialdistancebins(j).numberbifurcations.values(nextvalue) = inddata.bifurcation.radialdistancebins(j).numberbifurcations;
                        popdata.bifurcation.radialdistancebins(j).rallratio.values                     = [ [popdata.bifurcation.radialdistancebins(j).rallratio.values] [inddata.bifurcation.radialdistancebins(j).rallratio.values] ];
                        popdata.bifurcation.radialdistancebins(j).rallratio1.values                    = [ [popdata.bifurcation.radialdistancebins(j).rallratio1.values] [inddata.bifurcation.radialdistancebins(j).rallratio1.values] ];
                        popdata.bifurcation.radialdistancebins(j).rallratio2.values                    = [ [popdata.bifurcation.radialdistancebins(j).rallratio2.values] [inddata.bifurcation.radialdistancebins(j).rallratio2.values] ];
                        popdata.bifurcation.radialdistancebins(j).rallratio3.values                    = [ [popdata.bifurcation.radialdistancebins(j).rallratio3.values] [inddata.bifurcation.radialdistancebins(j).rallratio3.values] ];
                        popdata.bifurcation.radialdistancebins(j).daughterratio.values                 = [ [popdata.bifurcation.radialdistancebins(j).daughterratio.values] [inddata.bifurcation.radialdistancebins(j).daughterratio.values] ];
                        popdata.bifurcation.radialdistancebins(j).parentdaughterratio.values           = [ [popdata.bifurcation.radialdistancebins(j).parentdaughterratio.values] [inddata.bifurcation.radialdistancebins(j).parentdaughterratio.values] ];
                        popdata.bifurcation.radialdistancebins(j).parentdaughter2ratio.values          = [ [popdata.bifurcation.radialdistancebins(j).parentdaughter2ratio.values] [inddata.bifurcation.radialdistancebins(j).parentdaughter2ratio.values] ];
                        popdata.bifurcation.radialdistancebins(j).diameter.values(nextvalue)           = inddata.bifurcation.radialdistancebins(j).diameter;
                        popdata.bifurcation.radialdistancebins(j).taperrate.values                     = [ [popdata.bifurcation.radialdistancebins(j).taperrate.values] [inddata.bifurcation.radialdistancebins(j).taperrate.values] ];
                        popdata.bifurcation.radialdistancebins(j).taperratelength.values               = [ [popdata.bifurcation.radialdistancebins(j).taperratelength.values] [inddata.bifurcation.radialdistancebins(j).taperratelength.values] ];
                        
                        clear nextvalue;
                        
                    end
                end
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        for m = 1:length(popdata.bifurcation.radialdistancebins)
            
            typeanalysis.bifurcation.radialdistance.radialdistance(m)              = (distancebinwidth * m) - (distancebinwidth / 2);
            
            typeanalysis.bifurcation.radialdistance.length(m).values           = popdata.bifurcation.radialdistancebins(m).length.values;
            typeanalysis.bifurcation.radialdistance.length(m).mean             = mean([typeanalysis.bifurcation.radialdistance.length(m).values]);
            typeanalysis.bifurcation.radialdistance.length(m).std              = std([typeanalysis.bifurcation.radialdistance.length(m).values]);
            typeanalysis.bifurcation.radialdistance.length(m).max              = max([typeanalysis.bifurcation.radialdistance.length(m).values]);
            typeanalysis.bifurcation.radialdistance.length(m).min              = min([typeanalysis.bifurcation.radialdistance.length(m).values]);
            typeanalysis.bifurcation.radialdistance.length(m).skew             = skewness([typeanalysis.bifurcation.radialdistance.length(m).values],0);
            typeanalysis.bifurcation.radialdistance.length(m).kurt             = kurtosis([typeanalysis.bifurcation.radialdistance.length(m).values],0);
            typeanalysis.bifurcation.radialdistance.length(m).total            = sum([typeanalysis.bifurcation.radialdistance.length(m).values]);
            
            typeanalysis.bifurcation.radialdistance.surfacearea(m).values           = popdata.bifurcation.radialdistancebins(m).surfacearea.values;
            typeanalysis.bifurcation.radialdistance.surfacearea(m).mean             = mean([typeanalysis.bifurcation.radialdistance.surfacearea(m).values]);
            typeanalysis.bifurcation.radialdistance.surfacearea(m).std              = std([typeanalysis.bifurcation.radialdistance.surfacearea(m).values]);
            typeanalysis.bifurcation.radialdistance.surfacearea(m).max              = max([typeanalysis.bifurcation.radialdistance.surfacearea(m).values]);
            typeanalysis.bifurcation.radialdistance.surfacearea(m).min              = min([typeanalysis.bifurcation.radialdistance.surfacearea(m).values]);
            typeanalysis.bifurcation.radialdistance.surfacearea(m).skew             = skewness([typeanalysis.bifurcation.radialdistance.surfacearea(m).values],0);
            typeanalysis.bifurcation.radialdistance.surfacearea(m).kurt             = kurtosis([typeanalysis.bifurcation.radialdistance.surfacearea(m).values],0);
            typeanalysis.bifurcation.radialdistance.surfacearea(m).total            = sum([typeanalysis.bifurcation.radialdistance.surfacearea(m).values]);
            
            typeanalysis.bifurcation.radialdistance.volume(m).values           = popdata.bifurcation.radialdistancebins(m).volume.values;
            typeanalysis.bifurcation.radialdistance.volume(m).mean             = mean([typeanalysis.bifurcation.radialdistance.volume(m).values]);
            typeanalysis.bifurcation.radialdistance.volume(m).std              = std([typeanalysis.bifurcation.radialdistance.volume(m).values]);
            typeanalysis.bifurcation.radialdistance.volume(m).max              = max([typeanalysis.bifurcation.radialdistance.volume(m).values]);
            typeanalysis.bifurcation.radialdistance.volume(m).min              = min([typeanalysis.bifurcation.radialdistance.volume(m).values]);
            typeanalysis.bifurcation.radialdistance.volume(m).skew             = skewness([typeanalysis.bifurcation.radialdistance.volume(m).values],0);
            typeanalysis.bifurcation.radialdistance.volume(m).kurt             = kurtosis([typeanalysis.bifurcation.radialdistance.volume(m).values],0);
            typeanalysis.bifurcation.radialdistance.volume(m).total            = sum([typeanalysis.bifurcation.radialdistance.volume(m).values]);
            
            typeanalysis.bifurcation.radialdistance.numbersegments(m).values           = popdata.bifurcation.radialdistancebins(m).numbersegments.values;
            typeanalysis.bifurcation.radialdistance.numbersegments(m).mean             = mean([typeanalysis.bifurcation.radialdistance.numbersegments(m).values]);
            typeanalysis.bifurcation.radialdistance.numbersegments(m).std              = std([typeanalysis.bifurcation.radialdistance.numbersegments(m).values]);
            typeanalysis.bifurcation.radialdistance.numbersegments(m).max              = max([typeanalysis.bifurcation.radialdistance.numbersegments(m).values]);
            typeanalysis.bifurcation.radialdistance.numbersegments(m).min              = min([typeanalysis.bifurcation.radialdistance.numbersegments(m).values]);
            typeanalysis.bifurcation.radialdistance.numbersegments(m).skew             = skewness([typeanalysis.bifurcation.radialdistance.numbersegments(m).values],0);
            typeanalysis.bifurcation.radialdistance.numbersegments(m).kurt             = kurtosis([typeanalysis.bifurcation.radialdistance.numbersegments(m).values],0);
            typeanalysis.bifurcation.radialdistance.numbersegments(m).total            = sum([typeanalysis.bifurcation.radialdistance.numbersegments(m).values]);
            
            typeanalysis.bifurcation.radialdistance.numberbifurcations(m).values           = popdata.bifurcation.radialdistancebins(m).numberbifurcations.values;
            typeanalysis.bifurcation.radialdistance.numberbifurcations(m).mean             = mean([typeanalysis.bifurcation.radialdistance.numberbifurcations(m).values]);
            typeanalysis.bifurcation.radialdistance.numberbifurcations(m).std              = std([typeanalysis.bifurcation.radialdistance.numberbifurcations(m).values]);
            typeanalysis.bifurcation.radialdistance.numberbifurcations(m).max              = max([typeanalysis.bifurcation.radialdistance.numberbifurcations(m).values]);
            typeanalysis.bifurcation.radialdistance.numberbifurcations(m).min              = min([typeanalysis.bifurcation.radialdistance.numberbifurcations(m).values]);
            typeanalysis.bifurcation.radialdistance.numberbifurcations(m).skew             = skewness([typeanalysis.bifurcation.radialdistance.numberbifurcations(m).values],0);
            typeanalysis.bifurcation.radialdistance.numberbifurcations(m).kurt             = kurtosis([typeanalysis.bifurcation.radialdistance.numberbifurcations(m).values],0);
            typeanalysis.bifurcation.radialdistance.numberbifurcations(m).total            = sum([typeanalysis.bifurcation.radialdistance.numberbifurcations(m).values]);
            
            typeanalysis.bifurcation.radialdistance.rallratio(m).values           = popdata.bifurcation.radialdistancebins(m).rallratio.values;
            typeanalysis.bifurcation.radialdistance.rallratio(m).mean             = mean([typeanalysis.bifurcation.radialdistance.rallratio(m).values]);
            typeanalysis.bifurcation.radialdistance.rallratio(m).std              = std([typeanalysis.bifurcation.radialdistance.rallratio(m).values]);
            typeanalysis.bifurcation.radialdistance.rallratio(m).max              = max([typeanalysis.bifurcation.radialdistance.rallratio(m).values]);
            typeanalysis.bifurcation.radialdistance.rallratio(m).min              = min([typeanalysis.bifurcation.radialdistance.rallratio(m).values]);
            typeanalysis.bifurcation.radialdistance.rallratio(m).skew             = skewness([typeanalysis.bifurcation.radialdistance.rallratio(m).values],0);
            typeanalysis.bifurcation.radialdistance.rallratio(m).kurt             = kurtosis([typeanalysis.bifurcation.radialdistance.rallratio(m).values],0);
            
            typeanalysis.bifurcation.radialdistance.rallratio1(m).values           = popdata.bifurcation.radialdistancebins(m).rallratio1.values;
            typeanalysis.bifurcation.radialdistance.rallratio1(m).mean             = mean([typeanalysis.bifurcation.radialdistance.rallratio1(m).values]);
            typeanalysis.bifurcation.radialdistance.rallratio1(m).std              = std([typeanalysis.bifurcation.radialdistance.rallratio1(m).values]);
            typeanalysis.bifurcation.radialdistance.rallratio1(m).max              = max([typeanalysis.bifurcation.radialdistance.rallratio1(m).values]);
            typeanalysis.bifurcation.radialdistance.rallratio1(m).min              = min([typeanalysis.bifurcation.radialdistance.rallratio1(m).values]);
            typeanalysis.bifurcation.radialdistance.rallratio1(m).skew             = skewness([typeanalysis.bifurcation.radialdistance.rallratio1(m).values],0);
            typeanalysis.bifurcation.radialdistance.rallratio1(m).kurt             = kurtosis([typeanalysis.bifurcation.radialdistance.rallratio1(m).values],0);
            
            typeanalysis.bifurcation.radialdistance.rallratio2(m).values           = popdata.bifurcation.radialdistancebins(m).rallratio2.values;
            typeanalysis.bifurcation.radialdistance.rallratio2(m).mean             = mean([typeanalysis.bifurcation.radialdistance.rallratio2(m).values]);
            typeanalysis.bifurcation.radialdistance.rallratio2(m).std              = std([typeanalysis.bifurcation.radialdistance.rallratio2(m).values]);
            typeanalysis.bifurcation.radialdistance.rallratio2(m).max              = max([typeanalysis.bifurcation.radialdistance.rallratio2(m).values]);
            typeanalysis.bifurcation.radialdistance.rallratio2(m).min              = min([typeanalysis.bifurcation.radialdistance.rallratio2(m).values]);
            typeanalysis.bifurcation.radialdistance.rallratio2(m).skew             = skewness([typeanalysis.bifurcation.radialdistance.rallratio2(m).values],0);
            typeanalysis.bifurcation.radialdistance.rallratio2(m).kurt             = kurtosis([typeanalysis.bifurcation.radialdistance.rallratio2(m).values],0);
            
            typeanalysis.bifurcation.radialdistance.rallratio3(m).values           = popdata.bifurcation.radialdistancebins(m).rallratio3.values;
            typeanalysis.bifurcation.radialdistance.rallratio3(m).mean             = mean([typeanalysis.bifurcation.radialdistance.rallratio3(m).values]);
            typeanalysis.bifurcation.radialdistance.rallratio3(m).std              = std([typeanalysis.bifurcation.radialdistance.rallratio3(m).values]);
            typeanalysis.bifurcation.radialdistance.rallratio3(m).max              = max([typeanalysis.bifurcation.radialdistance.rallratio3(m).values]);
            typeanalysis.bifurcation.radialdistance.rallratio3(m).min              = min([typeanalysis.bifurcation.radialdistance.rallratio3(m).values]);
            typeanalysis.bifurcation.radialdistance.rallratio3(m).skew             = skewness([typeanalysis.bifurcation.radialdistance.rallratio3(m).values],0);
            typeanalysis.bifurcation.radialdistance.rallratio3(m).kurt             = kurtosis([typeanalysis.bifurcation.radialdistance.rallratio3(m).values],0);
            
            typeanalysis.bifurcation.radialdistance.daughterratio(m).values           = popdata.bifurcation.radialdistancebins(m).daughterratio.values;
            typeanalysis.bifurcation.radialdistance.daughterratio(m).mean             = mean([typeanalysis.bifurcation.radialdistance.daughterratio(m).values]);
            typeanalysis.bifurcation.radialdistance.daughterratio(m).std              = std([typeanalysis.bifurcation.radialdistance.daughterratio(m).values]);
            typeanalysis.bifurcation.radialdistance.daughterratio(m).max              = max([typeanalysis.bifurcation.radialdistance.daughterratio(m).values]);
            typeanalysis.bifurcation.radialdistance.daughterratio(m).min              = min([typeanalysis.bifurcation.radialdistance.daughterratio(m).values]);
            typeanalysis.bifurcation.radialdistance.daughterratio(m).skew             = skewness([typeanalysis.bifurcation.radialdistance.daughterratio(m).values],0);
            typeanalysis.bifurcation.radialdistance.daughterratio(m).kurt             = kurtosis([typeanalysis.bifurcation.radialdistance.daughterratio(m).values],0);
            
            typeanalysis.bifurcation.radialdistance.parentdaughterratio(m).values           = popdata.bifurcation.radialdistancebins(m).parentdaughterratio.values;
            typeanalysis.bifurcation.radialdistance.parentdaughterratio(m).mean             = mean([typeanalysis.bifurcation.radialdistance.parentdaughterratio(m).values]);
            typeanalysis.bifurcation.radialdistance.parentdaughterratio(m).std              = std([typeanalysis.bifurcation.radialdistance.parentdaughterratio(m).values]);
            typeanalysis.bifurcation.radialdistance.parentdaughterratio(m).max              = max([typeanalysis.bifurcation.radialdistance.parentdaughterratio(m).values]);
            typeanalysis.bifurcation.radialdistance.parentdaughterratio(m).min              = min([typeanalysis.bifurcation.radialdistance.parentdaughterratio(m).values]);
            typeanalysis.bifurcation.radialdistance.parentdaughterratio(m).skew             = skewness([typeanalysis.bifurcation.radialdistance.parentdaughterratio(m).values],0);
            typeanalysis.bifurcation.radialdistance.parentdaughterratio(m).kurt             = kurtosis([typeanalysis.bifurcation.radialdistance.parentdaughterratio(m).values],0);
            
            typeanalysis.bifurcation.radialdistance.parentdaughter2ratio(m).values           = popdata.bifurcation.radialdistancebins(m).parentdaughter2ratio.values;
            typeanalysis.bifurcation.radialdistance.parentdaughter2ratio(m).mean             = mean([typeanalysis.bifurcation.radialdistance.parentdaughter2ratio(m).values]);
            typeanalysis.bifurcation.radialdistance.parentdaughter2ratio(m).std              = std([typeanalysis.bifurcation.radialdistance.parentdaughter2ratio(m).values]);
            typeanalysis.bifurcation.radialdistance.parentdaughter2ratio(m).max              = max([typeanalysis.bifurcation.radialdistance.parentdaughter2ratio(m).values]);
            typeanalysis.bifurcation.radialdistance.parentdaughter2ratio(m).min              = min([typeanalysis.bifurcation.radialdistance.parentdaughter2ratio(m).values]);
            typeanalysis.bifurcation.radialdistance.parentdaughter2ratio(m).skew             = skewness([typeanalysis.bifurcation.radialdistance.parentdaughter2ratio(m).values],0);
            typeanalysis.bifurcation.radialdistance.parentdaughter2ratio(m).kurt             = kurtosis([typeanalysis.bifurcation.radialdistance.parentdaughter2ratio(m).values],0);
            
            typeanalysis.bifurcation.radialdistance.diameter(m).values           = popdata.bifurcation.radialdistancebins(m).diameter.values;
            typeanalysis.bifurcation.radialdistance.diameter(m).mean             = mean([typeanalysis.bifurcation.radialdistance.diameter(m).values]);
            typeanalysis.bifurcation.radialdistance.diameter(m).std              = std([typeanalysis.bifurcation.radialdistance.diameter(m).values]);
            typeanalysis.bifurcation.radialdistance.diameter(m).max              = max([typeanalysis.bifurcation.radialdistance.diameter(m).values]);
            typeanalysis.bifurcation.radialdistance.diameter(m).min              = min([typeanalysis.bifurcation.radialdistance.diameter(m).values]);
            typeanalysis.bifurcation.radialdistance.diameter(m).skew             = skewness([typeanalysis.bifurcation.radialdistance.diameter(m).values],0);
            typeanalysis.bifurcation.radialdistance.diameter(m).kurt             = kurtosis([typeanalysis.bifurcation.radialdistance.diameter(m).values],0);
            
            typeanalysis.bifurcation.radialdistance.taperrate(m).values           = popdata.bifurcation.radialdistancebins(m).taperrate.values;
            typeanalysis.bifurcation.radialdistance.taperrate(m).mean             = sum([popdata.bifurcation.radialdistancebins(m).taperrate.values].*[popdata.bifurcation.radialdistancebins(m).taperratelength.values])/sum([popdata.bifurcation.radialdistancebins(m).taperratelength.values]);
            %typeanalysis.bifurcation.radialdistance.taperrate(m).mean             = mean([popdata.bifurcation.radialdistancebins(m).taperrate.values].*[popdata.bifurcation.radialdistancebins(m).taperratelength.values])/sum([popdata.bifurcation.radialdistancebins(m).taperratelength.values]);
            typeanalysis.bifurcation.radialdistance.taperrate(m).std              = std([typeanalysis.bifurcation.radialdistance.taperrate(m).values]);
            typeanalysis.bifurcation.radialdistance.taperrate(m).max              = max([typeanalysis.bifurcation.radialdistance.taperrate(m).values]);
            typeanalysis.bifurcation.radialdistance.taperrate(m).min              = min([typeanalysis.bifurcation.radialdistance.taperrate(m).values]);
            typeanalysis.bifurcation.radialdistance.taperrate(m).skew             = skewness([typeanalysis.bifurcation.radialdistance.taperrate(m).values],0);
            typeanalysis.bifurcation.radialdistance.taperrate(m).kurt             = kurtosis([typeanalysis.bifurcation.radialdistance.taperrate(m).values],0);
            
            typeanalysis.bifurcation.radialdistance.bifurcationprobability.length(m)      = typeanalysis.bifurcation.radialdistance.numberbifurcations(m).total / typeanalysis.bifurcation.radialdistance.length(m).total;
            typeanalysis.bifurcation.radialdistance.bifurcationprobability.surfacearea(m) = typeanalysis.bifurcation.radialdistance.numberbifurcations(m).total / typeanalysis.bifurcation.radialdistance.surfacearea(m).total;
            typeanalysis.bifurcation.radialdistance.bifurcationprobability.volume(m)      = typeanalysis.bifurcation.radialdistance.numberbifurcations(m).total / typeanalysis.bifurcation.radialdistance.volume(m).total;
            
        end
        
        typeanalysis.bifurcation.radialdistance = orderfields(typeanalysis.bifurcation.radialdistance);
        
        
        
        
        
        
        
        
        
        % Begin termination radial distance analysis
        
        clear maxradialdistancebin;
        maxradialdistancebin = ceil(popdata.termination.maxradialdistance / distancebinwidth);
        for i = 1:maxradialdistancebin
            popdata.termination.radialdistancebins(i).taperrate.values            = [];
            popdata.termination.radialdistancebins(i).taperratelength.values      = [];
        end
        
        
        for i = 1:length(data.individual)
            
            clear inddata;
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            
            for j = 1:length(inddata.termination.radialdistancebins)
                
                if isfield(inddata.termination.radialdistancebins(j).piece,'id') == 1
                    
                    inddata.termination.radialdistancebins(j).length                      = sum([inddata.termination.radialdistancebins(j).piece.length]);
                    inddata.termination.radialdistancebins(j).surfacearea                 = sum([inddata.termination.radialdistancebins(j).piece.surfacearea]);
                    inddata.termination.radialdistancebins(j).volume                      = sum([inddata.termination.radialdistancebins(j).piece.volume]);
                    inddata.termination.radialdistancebins(j).numbersegments              = length(unique([inddata.termination.radialdistancebins(j).piece.cable]));
                    inddata.termination.radialdistancebins(j).numberterminations          = 0;
                    inddata.termination.radialdistancebins(j).diameter                    = ((4*inddata.termination.radialdistancebins(j).volume)/(pi()*inddata.termination.radialdistancebins(j).length))^0.5;
                    %
                    if isnan(inddata.termination.radialdistancebins(j).diameter)
                        disp('NaN in term radialdistance diameter.');
                        keyboard;
                    end
                    %
                    inddata.termination.radialdistancebins(j).taperrate.values            = [inddata.termination.radialdistancebins(j).piece.taperrate];
                    inddata.termination.radialdistancebins(j).taperratelength.values      = [inddata.termination.radialdistancebins(j).piece.length];
                    
                    for k = 1:length(inddata.termination.radialdistancebins(j).piece)
                        if strcmp(inddata.termination.radialdistancebins(j).piece(k).distaltype,'termination')==1
                            inddata.termination.radialdistancebins(j).numberterminations = 1 + inddata.termination.radialdistancebins(j).numberterminations;
                        end
                    end
                    
                    if isfield(popdata,'radialdistancebins') == 0; nextvalue = 1;
                    elseif j > length(popdata.termination.radialdistancebins); nextvalue = 1;
                    elseif isfield(popdata.termination.radialdistancebins(j),'length') == 0; nextvalue = 1;
                    elseif isfield(popdata.termination.radialdistancebins(j).length,'values') == 0; nextvalue = 1;
                    else nextvalue = 1 + length(popdata.termination.radialdistancebins(j).length.values);
                    end
                    popdata.termination.radialdistancebins(j).length.values(nextvalue)             = inddata.termination.radialdistancebins(j).length;
                    popdata.termination.radialdistancebins(j).surfacearea.values(nextvalue)        = inddata.termination.radialdistancebins(j).surfacearea;
                    popdata.termination.radialdistancebins(j).volume.values(nextvalue)             = inddata.termination.radialdistancebins(j).volume;
                    popdata.termination.radialdistancebins(j).numbersegments.values(nextvalue)     = inddata.termination.radialdistancebins(j).numbersegments;
                    popdata.termination.radialdistancebins(j).numberterminations.values(nextvalue) = inddata.termination.radialdistancebins(j).numberterminations;
                    popdata.termination.radialdistancebins(j).diameter.values(nextvalue)           = inddata.termination.radialdistancebins(j).diameter;
                    popdata.termination.radialdistancebins(j).taperrate.values                     = [ [popdata.termination.radialdistancebins(j).taperrate.values] [inddata.termination.radialdistancebins(j).taperrate.values] ];
                    popdata.termination.radialdistancebins(j).taperratelength.values               = [ [popdata.termination.radialdistancebins(j).taperratelength.values] [inddata.termination.radialdistancebins(j).taperratelength.values] ];
                    
                    clear nextvalue;
                    
                end
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        for m = 1:length(popdata.termination.radialdistancebins)
            
            typeanalysis.termination.radialdistance.radialdistance(m)              = (distancebinwidth * m) - (distancebinwidth / 2);
            
            if isfield(popdata.termination.radialdistancebins(m).length,'values') == 1
                
                typeanalysis.termination.radialdistance.length(m).values           = popdata.termination.radialdistancebins(m).length.values;
                typeanalysis.termination.radialdistance.length(m).mean             = mean([typeanalysis.termination.radialdistance.length(m).values]);
                typeanalysis.termination.radialdistance.length(m).std              = std([typeanalysis.termination.radialdistance.length(m).values]);
                typeanalysis.termination.radialdistance.length(m).max              = max([typeanalysis.termination.radialdistance.length(m).values]);
                typeanalysis.termination.radialdistance.length(m).min              = min([typeanalysis.termination.radialdistance.length(m).values]);
                typeanalysis.termination.radialdistance.length(m).skew             = skewness([typeanalysis.termination.radialdistance.length(m).values],0);
                typeanalysis.termination.radialdistance.length(m).kurt             = kurtosis([typeanalysis.termination.radialdistance.length(m).values],0);
                typeanalysis.termination.radialdistance.length(m).total            = sum([typeanalysis.termination.radialdistance.length(m).values]);
                
                typeanalysis.termination.radialdistance.surfacearea(m).values           = popdata.termination.radialdistancebins(m).surfacearea.values;
                typeanalysis.termination.radialdistance.surfacearea(m).mean             = mean([typeanalysis.termination.radialdistance.surfacearea(m).values]);
                typeanalysis.termination.radialdistance.surfacearea(m).std              = std([typeanalysis.termination.radialdistance.surfacearea(m).values]);
                typeanalysis.termination.radialdistance.surfacearea(m).max              = max([typeanalysis.termination.radialdistance.surfacearea(m).values]);
                typeanalysis.termination.radialdistance.surfacearea(m).min              = min([typeanalysis.termination.radialdistance.surfacearea(m).values]);
                typeanalysis.termination.radialdistance.surfacearea(m).skew             = skewness([typeanalysis.termination.radialdistance.surfacearea(m).values],0);
                typeanalysis.termination.radialdistance.surfacearea(m).kurt             = kurtosis([typeanalysis.termination.radialdistance.surfacearea(m).values],0);
                typeanalysis.termination.radialdistance.surfacearea(m).total            = sum([typeanalysis.termination.radialdistance.surfacearea(m).values]);
                
                typeanalysis.termination.radialdistance.volume(m).values           = popdata.termination.radialdistancebins(m).volume.values;
                typeanalysis.termination.radialdistance.volume(m).mean             = mean([typeanalysis.termination.radialdistance.volume(m).values]);
                typeanalysis.termination.radialdistance.volume(m).std              = std([typeanalysis.termination.radialdistance.volume(m).values]);
                typeanalysis.termination.radialdistance.volume(m).max              = max([typeanalysis.termination.radialdistance.volume(m).values]);
                typeanalysis.termination.radialdistance.volume(m).min              = min([typeanalysis.termination.radialdistance.volume(m).values]);
                typeanalysis.termination.radialdistance.volume(m).skew             = skewness([typeanalysis.termination.radialdistance.volume(m).values],0);
                typeanalysis.termination.radialdistance.volume(m).kurt             = kurtosis([typeanalysis.termination.radialdistance.volume(m).values],0);
                typeanalysis.termination.radialdistance.volume(m).total            = sum([typeanalysis.termination.radialdistance.volume(m).values]);
                
                typeanalysis.termination.radialdistance.numbersegments(m).values           = popdata.termination.radialdistancebins(m).numbersegments.values;
                typeanalysis.termination.radialdistance.numbersegments(m).mean             = mean([typeanalysis.termination.radialdistance.numbersegments(m).values]);
                typeanalysis.termination.radialdistance.numbersegments(m).std              = std([typeanalysis.termination.radialdistance.numbersegments(m).values]);
                typeanalysis.termination.radialdistance.numbersegments(m).max              = max([typeanalysis.termination.radialdistance.numbersegments(m).values]);
                typeanalysis.termination.radialdistance.numbersegments(m).min              = min([typeanalysis.termination.radialdistance.numbersegments(m).values]);
                typeanalysis.termination.radialdistance.numbersegments(m).skew             = skewness([typeanalysis.termination.radialdistance.numbersegments(m).values],0);
                typeanalysis.termination.radialdistance.numbersegments(m).kurt             = kurtosis([typeanalysis.termination.radialdistance.numbersegments(m).values],0);
                typeanalysis.termination.radialdistance.numbersegments(m).total            = sum([typeanalysis.termination.radialdistance.numbersegments(m).values]);
                
                typeanalysis.termination.radialdistance.numberterminations(m).values           = popdata.termination.radialdistancebins(m).numberterminations.values;
                typeanalysis.termination.radialdistance.numberterminations(m).mean             = mean([typeanalysis.termination.radialdistance.numberterminations(m).values]);
                typeanalysis.termination.radialdistance.numberterminations(m).std              = std([typeanalysis.termination.radialdistance.numberterminations(m).values]);
                typeanalysis.termination.radialdistance.numberterminations(m).max              = max([typeanalysis.termination.radialdistance.numberterminations(m).values]);
                typeanalysis.termination.radialdistance.numberterminations(m).min              = min([typeanalysis.termination.radialdistance.numberterminations(m).values]);
                typeanalysis.termination.radialdistance.numberterminations(m).skew             = skewness([typeanalysis.termination.radialdistance.numberterminations(m).values],0);
                typeanalysis.termination.radialdistance.numberterminations(m).kurt             = kurtosis([typeanalysis.termination.radialdistance.numberterminations(m).values],0);
                typeanalysis.termination.radialdistance.numberterminations(m).total            = sum([typeanalysis.termination.radialdistance.numberterminations(m).values]);
                
                typeanalysis.termination.radialdistance.diameter(m).values           = popdata.termination.radialdistancebins(m).diameter.values;
                typeanalysis.termination.radialdistance.diameter(m).mean             = mean([typeanalysis.termination.radialdistance.diameter(m).values]);
                typeanalysis.termination.radialdistance.diameter(m).std              = std([typeanalysis.termination.radialdistance.diameter(m).values]);
                typeanalysis.termination.radialdistance.diameter(m).max              = max([typeanalysis.termination.radialdistance.diameter(m).values]);
                typeanalysis.termination.radialdistance.diameter(m).min              = min([typeanalysis.termination.radialdistance.diameter(m).values]);
                typeanalysis.termination.radialdistance.diameter(m).skew             = skewness([typeanalysis.termination.radialdistance.diameter(m).values],0);
                typeanalysis.termination.radialdistance.diameter(m).kurt             = kurtosis([typeanalysis.termination.radialdistance.diameter(m).values],0);
                
                typeanalysis.termination.radialdistance.taperrate(m).values           = popdata.termination.radialdistancebins(m).taperrate.values;
                typeanalysis.termination.radialdistance.taperrate(m).mean             = sum([popdata.termination.radialdistancebins(m).taperrate.values].*[popdata.termination.radialdistancebins(m).taperratelength.values])/sum([popdata.termination.radialdistancebins(m).taperratelength.values]);
                %typeanalysis.termination.radialdistance.taperrate(m).mean             = mean([popdata.termination.radialdistancebins(m).taperrate.values].*[popdata.termination.radialdistancebins(m).taperratelength.values])/sum([popdata.termination.radialdistancebins(m).taperratelength.values]);
                typeanalysis.termination.radialdistance.taperrate(m).std              = std([typeanalysis.termination.radialdistance.taperrate(m).values]);
                typeanalysis.termination.radialdistance.taperrate(m).max              = max([typeanalysis.termination.radialdistance.taperrate(m).values]);
                typeanalysis.termination.radialdistance.taperrate(m).min              = min([typeanalysis.termination.radialdistance.taperrate(m).values]);
                typeanalysis.termination.radialdistance.taperrate(m).skew             = skewness([typeanalysis.termination.radialdistance.taperrate(m).values],0);
                typeanalysis.termination.radialdistance.taperrate(m).kurt             = kurtosis([typeanalysis.termination.radialdistance.taperrate(m).values],0);
                
            else
                typeanalysis.termination.radialdistance.numbersegments(m).total     = 0;
                typeanalysis.termination.radialdistance.numbersegments(m).mean      = NaN;
                typeanalysis.termination.radialdistance.numbersegments(m).std       = NaN;
                typeanalysis.termination.radialdistance.numberterminations(m).total = 0;
                typeanalysis.termination.radialdistance.numberterminations(m).mean  = NaN;
                typeanalysis.termination.radialdistance.numberterminations(m).std   = NaN;
                typeanalysis.termination.radialdistance.length(m).total             = 0;
                typeanalysis.termination.radialdistance.length(m).mean              = NaN;
                typeanalysis.termination.radialdistance.length(m).std               = NaN;
                typeanalysis.termination.radialdistance.surfacearea(m).total        = 0;
                typeanalysis.termination.radialdistance.surfacearea(m).mean         = NaN;
                typeanalysis.termination.radialdistance.surfacearea(m).std          = NaN;
                typeanalysis.termination.radialdistance.volume(m).total             = 0;
                typeanalysis.termination.radialdistance.volume(m).mean              = NaN;
                typeanalysis.termination.radialdistance.volume(m).std               = NaN;
                typeanalysis.termination.radialdistance.diameter(m).mean            = NaN;
                typeanalysis.termination.radialdistance.diameter(m).std             = NaN;
                typeanalysis.termination.radialdistance.taperrate(m).mean           = NaN;
                typeanalysis.termination.radialdistance.taperrate(m).std            = NaN;
            end
            
            
            typeanalysis.termination.radialdistance.terminationprobability.length(m)      = typeanalysis.termination.radialdistance.numberterminations(m).total / typeanalysis.termination.radialdistance.length(m).total;
            typeanalysis.termination.radialdistance.terminationprobability.surfacearea(m) = typeanalysis.termination.radialdistance.numberterminations(m).total / typeanalysis.termination.radialdistance.surfacearea(m).total;
            typeanalysis.termination.radialdistance.terminationprobability.volume(m)      = typeanalysis.termination.radialdistance.numberterminations(m).total / typeanalysis.termination.radialdistance.volume(m).total;
            
        end
        
        typeanalysis.termination.radialdistance = orderfields(typeanalysis.termination.radialdistance);
        eval(['analysis.' currentpiecetype ' = typeanalysis;']);
        eval(['data.population.' currentpiecetype ' = popdata;']);
        
    end
end



warning('on', 'MATLAB:divideByZero');