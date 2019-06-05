function [data,analysis]   = pathlengthanalyzer(data,analysis)

disp('   Path length analysis started.');

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
        
        clear maxpathlengthbin;
        clear distancebinwidth;
        eval(['distancebinwidth = option.' currentpiecetype '.distancebinwidth;']);
        maxpathlengthbin = ceil(popdata.maxpathlength / distancebinwidth);
        for i = 1:maxpathlengthbin
            popdata.pathlengthbins(i).rallratio.values            = [];
            popdata.pathlengthbins(i).rallratio1.values           = [];
            popdata.pathlengthbins(i).rallratio2.values           = [];
            popdata.pathlengthbins(i).rallratio3.values           = [];
            popdata.pathlengthbins(i).daughterratio.values        = [];
            popdata.pathlengthbins(i).parentdaughterratio.values  = [];
            popdata.pathlengthbins(i).parentdaughter2ratio.values = [];
            popdata.pathlengthbins(i).taperrate.values            = [];
            popdata.pathlengthbins(i).taperratelength.values      = [];
        end
        
        for i = 1:length(data.individual)
            
            clear inddata;
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            
            for j = 1:length(inddata.pathlengthbins)
                
                inddata.pathlengthbins(j).length                      = sum([inddata.pathlengthbins(j).piece.length]);
                inddata.pathlengthbins(j).surfacearea                 = sum([inddata.pathlengthbins(j).piece.surfacearea]);
                inddata.pathlengthbins(j).volume                      = sum([inddata.pathlengthbins(j).piece.volume]);
                inddata.pathlengthbins(j).numbersegments              = length(unique([inddata.pathlengthbins(j).piece.cable]));
                inddata.pathlengthbins(j).numberbifurcations          = 0;
                inddata.pathlengthbins(j).numberterminations          = 0;
                inddata.pathlengthbins(j).numberbifurcatingbranches   = 0;
                inddata.pathlengthbins(j).numberterminatingbranches   = 0;
                inddata.pathlengthbins(j).rallratio.values            = [inddata.pathlengthbins(j).piece.rallratio];
                inddata.pathlengthbins(j).rallratio1.values           = [inddata.pathlengthbins(j).piece.rallratio1];
                inddata.pathlengthbins(j).rallratio2.values           = [inddata.pathlengthbins(j).piece.rallratio2];
                inddata.pathlengthbins(j).rallratio3.values           = [inddata.pathlengthbins(j).piece.rallratio3];
                inddata.pathlengthbins(j).daughterratio.values        = [inddata.pathlengthbins(j).piece.daughterratio];
                inddata.pathlengthbins(j).parentdaughterratio.values  = [inddata.pathlengthbins(j).piece.parentdaughterratio];
                inddata.pathlengthbins(j).parentdaughter2ratio.values = [inddata.pathlengthbins(j).piece.parentdaughter2ratio];
                inddata.pathlengthbins(j).diameter                    = ((4*inddata.pathlengthbins(j).volume)/(pi()*inddata.pathlengthbins(j).length))^0.5;
                inddata.pathlengthbins(j).taperrate.values            = [inddata.pathlengthbins(j).piece.taperrate];
                inddata.pathlengthbins(j).taperratelength.values      = [inddata.pathlengthbins(j).piece.length];
                
                
                for k = 1:length(inddata.pathlengthbins(j).piece)
                    if strcmp(inddata.pathlengthbins(j).piece(k).distaltype,'bifurcation')==1
                        inddata.pathlengthbins(j).numberbifurcations = 1 + inddata.pathlengthbins(j).numberbifurcations;
                    end
                    if strcmp(inddata.pathlengthbins(j).piece(k).distaltype,'termination')==1
                        inddata.pathlengthbins(j).numberterminations = 1 + inddata.pathlengthbins(j).numberterminations;
                    end
                    if strcmp(inddata.pathlengthbins(j).piece(k).distaltype,'m-furcation')==1
                        inddata.pathlengthbins(j).numberbifurcations = length(inddata.pathlengthbins(j).piece(k).daughters) - 1 + inddata.pathlengthbins(j).numberbifurcations;
                    end
                    
                    if strcmp(inddata.pathlengthbins(j).piece(k).proximaltype,'primary    ') ==1 || strcmp(inddata.pathlengthbins(j).piece(k).proximaltype,'daughter   ') ==1 || strcmp(inddata.pathlengthbins(j).piece(k).proximaltype,'daughter1  ') ==1 || strcmp(inddata.pathlengthbins(j).piece(k).proximaltype,'daughter2  ') ==1
                        if strcmp(inddata.pathlengthbins(j).piece(k).branchtype,'b') == 1
                            inddata.pathlengthbins(j).numberbifurcatingbranches = 1 + inddata.pathlengthbins(j).numberbifurcatingbranches;
                        elseif strcmp(inddata.pathlengthbins(j).piece(k).branchtype,'t') == 1
                            inddata.pathlengthbins(j).numberterminatingbranches = 1 + inddata.pathlengthbins(j).numberterminatingbranches;
                        else disp('       Error in path length analyzer: piece branch type not identified.');
                        end
                    end
                end
                
                if isfield(popdata,'pathlengthbins') == 0; nextvalue = 1;
                elseif j > length(popdata.pathlengthbins); nextvalue = 1;
                elseif isfield(popdata.pathlengthbins(j),'length') == 0; nextvalue = 1;
                elseif isfield(popdata.pathlengthbins(j).length,'values') == 0; nextvalue = 1;
                else nextvalue = 1 + length(popdata.pathlengthbins(j).length.values);
                end
                popdata.pathlengthbins(j).length.values(nextvalue)             = inddata.pathlengthbins(j).length;
                popdata.pathlengthbins(j).surfacearea.values(nextvalue)        = inddata.pathlengthbins(j).surfacearea;
                popdata.pathlengthbins(j).volume.values(nextvalue)             = inddata.pathlengthbins(j).volume;
                popdata.pathlengthbins(j).numbersegments.values(nextvalue)     = inddata.pathlengthbins(j).numbersegments;
                popdata.pathlengthbins(j).numberbifurcations.values(nextvalue) = inddata.pathlengthbins(j).numberbifurcations;
                popdata.pathlengthbins(j).numberterminations.values(nextvalue) = inddata.pathlengthbins(j).numberterminations;
                popdata.pathlengthbins(j).numberbifurcatingbranches.values(nextvalue) = inddata.pathlengthbins(j).numberbifurcatingbranches;
                popdata.pathlengthbins(j).numberterminatingbranches.values(nextvalue) = inddata.pathlengthbins(j).numberterminatingbranches;
                popdata.pathlengthbins(j).rallratio.values                     = [ [popdata.pathlengthbins(j).rallratio.values] [inddata.pathlengthbins(j).rallratio.values] ];
                popdata.pathlengthbins(j).rallratio1.values                    = [ [popdata.pathlengthbins(j).rallratio1.values] [inddata.pathlengthbins(j).rallratio1.values] ];
                popdata.pathlengthbins(j).rallratio2.values                    = [ [popdata.pathlengthbins(j).rallratio2.values] [inddata.pathlengthbins(j).rallratio2.values] ];
                popdata.pathlengthbins(j).rallratio3.values                    = [ [popdata.pathlengthbins(j).rallratio3.values] [inddata.pathlengthbins(j).rallratio3.values] ];
                popdata.pathlengthbins(j).daughterratio.values                 = [ [popdata.pathlengthbins(j).daughterratio.values] [inddata.pathlengthbins(j).daughterratio.values] ];
                popdata.pathlengthbins(j).parentdaughterratio.values           = [ [popdata.pathlengthbins(j).parentdaughterratio.values] [inddata.pathlengthbins(j).parentdaughterratio.values] ];
                popdata.pathlengthbins(j).parentdaughter2ratio.values          = [ [popdata.pathlengthbins(j).parentdaughter2ratio.values] [inddata.pathlengthbins(j).parentdaughter2ratio.values] ];
                popdata.pathlengthbins(j).diameter.values(nextvalue)           = inddata.pathlengthbins(j).diameter;
                popdata.pathlengthbins(j).taperrate.values                     = [ [popdata.pathlengthbins(j).taperrate.values] [inddata.pathlengthbins(j).taperrate.values] ];
                popdata.pathlengthbins(j).taperratelength.values               = [ [popdata.pathlengthbins(j).taperratelength.values] [inddata.pathlengthbins(j).taperratelength.values] ];
                
                clear nextvalue;
                
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        for m = 1:length(popdata.pathlengthbins)
            
            typeanalysis.pathlength.pathlength(m)              = (distancebinwidth * m) - (distancebinwidth / 2);
            
            typeanalysis.pathlength.length(m).values           = popdata.pathlengthbins(m).length.values;
            typeanalysis.pathlength.length(m).mean             = mean([typeanalysis.pathlength.length(m).values]);
            typeanalysis.pathlength.length(m).std              = std([typeanalysis.pathlength.length(m).values]);
            typeanalysis.pathlength.length(m).max              = max([typeanalysis.pathlength.length(m).values]);
            typeanalysis.pathlength.length(m).min              = min([typeanalysis.pathlength.length(m).values]);
            typeanalysis.pathlength.length(m).skew             = skewness([typeanalysis.pathlength.length(m).values],0);
            typeanalysis.pathlength.length(m).kurt             = kurtosis([typeanalysis.pathlength.length(m).values],0);
            typeanalysis.pathlength.length(m).total            = sum([typeanalysis.pathlength.length(m).values]);
            
            typeanalysis.pathlength.surfacearea(m).values           = popdata.pathlengthbins(m).surfacearea.values;
            typeanalysis.pathlength.surfacearea(m).mean             = mean([typeanalysis.pathlength.surfacearea(m).values]);
            typeanalysis.pathlength.surfacearea(m).std              = std([typeanalysis.pathlength.surfacearea(m).values]);
            typeanalysis.pathlength.surfacearea(m).max              = max([typeanalysis.pathlength.surfacearea(m).values]);
            typeanalysis.pathlength.surfacearea(m).min              = min([typeanalysis.pathlength.surfacearea(m).values]);
            typeanalysis.pathlength.surfacearea(m).skew             = skewness([typeanalysis.pathlength.surfacearea(m).values],0);
            typeanalysis.pathlength.surfacearea(m).kurt             = kurtosis([typeanalysis.pathlength.surfacearea(m).values],0);
            typeanalysis.pathlength.surfacearea(m).total            = sum([typeanalysis.pathlength.surfacearea(m).values]);
            
            typeanalysis.pathlength.volume(m).values           = popdata.pathlengthbins(m).volume.values;
            typeanalysis.pathlength.volume(m).mean             = mean([typeanalysis.pathlength.volume(m).values]);
            typeanalysis.pathlength.volume(m).std              = std([typeanalysis.pathlength.volume(m).values]);
            typeanalysis.pathlength.volume(m).max              = max([typeanalysis.pathlength.volume(m).values]);
            typeanalysis.pathlength.volume(m).min              = min([typeanalysis.pathlength.volume(m).values]);
            typeanalysis.pathlength.volume(m).skew             = skewness([typeanalysis.pathlength.volume(m).values],0);
            typeanalysis.pathlength.volume(m).kurt             = kurtosis([typeanalysis.pathlength.volume(m).values],0);
            typeanalysis.pathlength.volume(m).total            = sum([typeanalysis.pathlength.volume(m).values]);
            
            typeanalysis.pathlength.numbersegments(m).values           = popdata.pathlengthbins(m).numbersegments.values;
            typeanalysis.pathlength.numbersegments(m).mean             = mean([typeanalysis.pathlength.numbersegments(m).values]);
            typeanalysis.pathlength.numbersegments(m).std              = std([typeanalysis.pathlength.numbersegments(m).values]);
            typeanalysis.pathlength.numbersegments(m).max              = max([typeanalysis.pathlength.numbersegments(m).values]);
            typeanalysis.pathlength.numbersegments(m).min              = min([typeanalysis.pathlength.numbersegments(m).values]);
            typeanalysis.pathlength.numbersegments(m).skew             = skewness([typeanalysis.pathlength.numbersegments(m).values],0);
            typeanalysis.pathlength.numbersegments(m).kurt             = kurtosis([typeanalysis.pathlength.numbersegments(m).values],0);
            typeanalysis.pathlength.numbersegments(m).total            = sum([typeanalysis.pathlength.numbersegments(m).values]);
            
            typeanalysis.pathlength.numberbifurcations(m).values           = popdata.pathlengthbins(m).numberbifurcations.values;
            typeanalysis.pathlength.numberbifurcations(m).mean             = mean([typeanalysis.pathlength.numberbifurcations(m).values]);
            typeanalysis.pathlength.numberbifurcations(m).std              = std([typeanalysis.pathlength.numberbifurcations(m).values]);
            typeanalysis.pathlength.numberbifurcations(m).max              = max([typeanalysis.pathlength.numberbifurcations(m).values]);
            typeanalysis.pathlength.numberbifurcations(m).min              = min([typeanalysis.pathlength.numberbifurcations(m).values]);
            typeanalysis.pathlength.numberbifurcations(m).skew             = skewness([typeanalysis.pathlength.numberbifurcations(m).values],0);
            typeanalysis.pathlength.numberbifurcations(m).kurt             = kurtosis([typeanalysis.pathlength.numberbifurcations(m).values],0);
            typeanalysis.pathlength.numberbifurcations(m).total            = sum([typeanalysis.pathlength.numberbifurcations(m).values]);
            
            typeanalysis.pathlength.numberterminations(m).values           = popdata.pathlengthbins(m).numberterminations.values;
            typeanalysis.pathlength.numberterminations(m).mean             = mean([typeanalysis.pathlength.numberterminations(m).values]);
            typeanalysis.pathlength.numberterminations(m).std              = std([typeanalysis.pathlength.numberterminations(m).values]);
            typeanalysis.pathlength.numberterminations(m).max              = max([typeanalysis.pathlength.numberterminations(m).values]);
            typeanalysis.pathlength.numberterminations(m).min              = min([typeanalysis.pathlength.numberterminations(m).values]);
            typeanalysis.pathlength.numberterminations(m).skew             = skewness([typeanalysis.pathlength.numberterminations(m).values],0);
            typeanalysis.pathlength.numberterminations(m).kurt             = kurtosis([typeanalysis.pathlength.numberterminations(m).values],0);
            typeanalysis.pathlength.numberterminations(m).total            = sum([typeanalysis.pathlength.numberterminations(m).values]);
            
            typeanalysis.pathlength.numberbifurcatingbranches(m).values           = popdata.pathlengthbins(m).numberbifurcatingbranches.values;
            typeanalysis.pathlength.numberbifurcatingbranches(m).mean             = mean([typeanalysis.pathlength.numberbifurcatingbranches(m).values]);
            typeanalysis.pathlength.numberbifurcatingbranches(m).std              = std([typeanalysis.pathlength.numberbifurcatingbranches(m).values]);
            typeanalysis.pathlength.numberbifurcatingbranches(m).max              = max([typeanalysis.pathlength.numberbifurcatingbranches(m).values]);
            typeanalysis.pathlength.numberbifurcatingbranches(m).min              = min([typeanalysis.pathlength.numberbifurcatingbranches(m).values]);
            typeanalysis.pathlength.numberbifurcatingbranches(m).skew             = skewness([typeanalysis.pathlength.numberbifurcatingbranches(m).values],0);
            typeanalysis.pathlength.numberbifurcatingbranches(m).kurt             = kurtosis([typeanalysis.pathlength.numberbifurcatingbranches(m).values],0);
            typeanalysis.pathlength.numberbifurcatingbranches(m).total            = sum([typeanalysis.pathlength.numberbifurcatingbranches(m).values]);
            
            typeanalysis.pathlength.numberterminatingbranches(m).values           = popdata.pathlengthbins(m).numberterminatingbranches.values;
            typeanalysis.pathlength.numberterminatingbranches(m).mean             = mean([typeanalysis.pathlength.numberterminatingbranches(m).values]);
            typeanalysis.pathlength.numberterminatingbranches(m).std              = std([typeanalysis.pathlength.numberterminatingbranches(m).values]);
            typeanalysis.pathlength.numberterminatingbranches(m).max              = max([typeanalysis.pathlength.numberterminatingbranches(m).values]);
            typeanalysis.pathlength.numberterminatingbranches(m).min              = min([typeanalysis.pathlength.numberterminatingbranches(m).values]);
            typeanalysis.pathlength.numberterminatingbranches(m).skew             = skewness([typeanalysis.pathlength.numberterminatingbranches(m).values],0);
            typeanalysis.pathlength.numberterminatingbranches(m).kurt             = kurtosis([typeanalysis.pathlength.numberterminatingbranches(m).values],0);
            typeanalysis.pathlength.numberterminatingbranches(m).total            = sum([typeanalysis.pathlength.numberterminatingbranches(m).values]);
            
            typeanalysis.pathlength.rallratio(m).values           = popdata.pathlengthbins(m).rallratio.values;
            typeanalysis.pathlength.rallratio(m).mean             = mean([typeanalysis.pathlength.rallratio(m).values]);
            typeanalysis.pathlength.rallratio(m).std              = std([typeanalysis.pathlength.rallratio(m).values]);
            typeanalysis.pathlength.rallratio(m).max              = max([typeanalysis.pathlength.rallratio(m).values]);
            typeanalysis.pathlength.rallratio(m).min              = min([typeanalysis.pathlength.rallratio(m).values]);
            typeanalysis.pathlength.rallratio(m).skew             = skewness([typeanalysis.pathlength.rallratio(m).values],0);
            typeanalysis.pathlength.rallratio(m).kurt             = kurtosis([typeanalysis.pathlength.rallratio(m).values],0);
            
            typeanalysis.pathlength.rallratio1(m).values           = popdata.pathlengthbins(m).rallratio1.values;
            typeanalysis.pathlength.rallratio1(m).mean             = mean([typeanalysis.pathlength.rallratio1(m).values]);
            typeanalysis.pathlength.rallratio1(m).std              = std([typeanalysis.pathlength.rallratio1(m).values]);
            typeanalysis.pathlength.rallratio1(m).max              = max([typeanalysis.pathlength.rallratio1(m).values]);
            typeanalysis.pathlength.rallratio1(m).min              = min([typeanalysis.pathlength.rallratio1(m).values]);
            typeanalysis.pathlength.rallratio1(m).skew             = skewness([typeanalysis.pathlength.rallratio1(m).values],0);
            typeanalysis.pathlength.rallratio1(m).kurt             = kurtosis([typeanalysis.pathlength.rallratio1(m).values],0);
            
            typeanalysis.pathlength.rallratio2(m).values           = popdata.pathlengthbins(m).rallratio2.values;
            typeanalysis.pathlength.rallratio2(m).mean             = mean([typeanalysis.pathlength.rallratio2(m).values]);
            typeanalysis.pathlength.rallratio2(m).std              = std([typeanalysis.pathlength.rallratio2(m).values]);
            typeanalysis.pathlength.rallratio2(m).max              = max([typeanalysis.pathlength.rallratio2(m).values]);
            typeanalysis.pathlength.rallratio2(m).min              = min([typeanalysis.pathlength.rallratio2(m).values]);
            typeanalysis.pathlength.rallratio2(m).skew             = skewness([typeanalysis.pathlength.rallratio2(m).values],0);
            typeanalysis.pathlength.rallratio2(m).kurt             = kurtosis([typeanalysis.pathlength.rallratio2(m).values],0);
            
            typeanalysis.pathlength.rallratio3(m).values           = popdata.pathlengthbins(m).rallratio3.values;
            typeanalysis.pathlength.rallratio3(m).mean             = mean([typeanalysis.pathlength.rallratio3(m).values]);
            typeanalysis.pathlength.rallratio3(m).std              = std([typeanalysis.pathlength.rallratio3(m).values]);
            typeanalysis.pathlength.rallratio3(m).max              = max([typeanalysis.pathlength.rallratio3(m).values]);
            typeanalysis.pathlength.rallratio3(m).min              = min([typeanalysis.pathlength.rallratio3(m).values]);
            typeanalysis.pathlength.rallratio3(m).skew             = skewness([typeanalysis.pathlength.rallratio3(m).values],0);
            typeanalysis.pathlength.rallratio3(m).kurt             = kurtosis([typeanalysis.pathlength.rallratio3(m).values],0);
            
            typeanalysis.pathlength.daughterratio(m).values           = popdata.pathlengthbins(m).daughterratio.values;
            typeanalysis.pathlength.daughterratio(m).mean             = mean([typeanalysis.pathlength.daughterratio(m).values]);
            typeanalysis.pathlength.daughterratio(m).std              = std([typeanalysis.pathlength.daughterratio(m).values]);
            typeanalysis.pathlength.daughterratio(m).max              = max([typeanalysis.pathlength.daughterratio(m).values]);
            typeanalysis.pathlength.daughterratio(m).min              = min([typeanalysis.pathlength.daughterratio(m).values]);
            typeanalysis.pathlength.daughterratio(m).skew             = skewness([typeanalysis.pathlength.daughterratio(m).values],0);
            typeanalysis.pathlength.daughterratio(m).kurt             = kurtosis([typeanalysis.pathlength.daughterratio(m).values],0);
            
            typeanalysis.pathlength.parentdaughterratio(m).values           = popdata.pathlengthbins(m).parentdaughterratio.values;
            typeanalysis.pathlength.parentdaughterratio(m).mean             = mean([typeanalysis.pathlength.parentdaughterratio(m).values]);
            typeanalysis.pathlength.parentdaughterratio(m).std              = std([typeanalysis.pathlength.parentdaughterratio(m).values]);
            typeanalysis.pathlength.parentdaughterratio(m).max              = max([typeanalysis.pathlength.parentdaughterratio(m).values]);
            typeanalysis.pathlength.parentdaughterratio(m).min              = min([typeanalysis.pathlength.parentdaughterratio(m).values]);
            typeanalysis.pathlength.parentdaughterratio(m).skew             = skewness([typeanalysis.pathlength.parentdaughterratio(m).values],0);
            typeanalysis.pathlength.parentdaughterratio(m).kurt             = kurtosis([typeanalysis.pathlength.parentdaughterratio(m).values],0);
            
            typeanalysis.pathlength.parentdaughter2ratio(m).values           = popdata.pathlengthbins(m).parentdaughter2ratio.values;
            typeanalysis.pathlength.parentdaughter2ratio(m).mean             = mean([typeanalysis.pathlength.parentdaughter2ratio(m).values]);
            typeanalysis.pathlength.parentdaughter2ratio(m).std              = std([typeanalysis.pathlength.parentdaughter2ratio(m).values]);
            typeanalysis.pathlength.parentdaughter2ratio(m).max              = max([typeanalysis.pathlength.parentdaughter2ratio(m).values]);
            typeanalysis.pathlength.parentdaughter2ratio(m).min              = min([typeanalysis.pathlength.parentdaughter2ratio(m).values]);
            typeanalysis.pathlength.parentdaughter2ratio(m).skew             = skewness([typeanalysis.pathlength.parentdaughter2ratio(m).values],0);
            typeanalysis.pathlength.parentdaughter2ratio(m).kurt             = kurtosis([typeanalysis.pathlength.parentdaughter2ratio(m).values],0);
            
            typeanalysis.pathlength.diameter(m).values           = popdata.pathlengthbins(m).diameter.values;
            typeanalysis.pathlength.diameter(m).mean             = mean([typeanalysis.pathlength.diameter(m).values]);
            typeanalysis.pathlength.diameter(m).std              = std([typeanalysis.pathlength.diameter(m).values]);
            typeanalysis.pathlength.diameter(m).max              = max([typeanalysis.pathlength.diameter(m).values]);
            typeanalysis.pathlength.diameter(m).min              = min([typeanalysis.pathlength.diameter(m).values]);
            typeanalysis.pathlength.diameter(m).skew             = skewness([typeanalysis.pathlength.diameter(m).values],0);
            typeanalysis.pathlength.diameter(m).kurt             = kurtosis([typeanalysis.pathlength.diameter(m).values],0);
            
            typeanalysis.pathlength.taperrate(m).values           = popdata.pathlengthbins(m).taperrate.values;
            typeanalysis.pathlength.taperrate(m).mean             = sum([popdata.pathlengthbins(m).taperrate.values].*[popdata.pathlengthbins(m).taperratelength.values])/sum([popdata.pathlengthbins(m).taperratelength.values]);
            %typeanalysis.pathlength.taperrate(m).mean             = mean([popdata.pathlengthbins(m).taperrate.values].*[popdata.pathlengthbins(m).taperratelength.values])/sum([popdata.pathlengthbins(m).taperratelength.values]);
            typeanalysis.pathlength.taperrate(m).std              = std([typeanalysis.pathlength.taperrate(m).values]);
            typeanalysis.pathlength.taperrate(m).max              = max([typeanalysis.pathlength.taperrate(m).values]);
            typeanalysis.pathlength.taperrate(m).min              = min([typeanalysis.pathlength.taperrate(m).values]);
            typeanalysis.pathlength.taperrate(m).skew             = skewness([typeanalysis.pathlength.taperrate(m).values],0);
            typeanalysis.pathlength.taperrate(m).kurt             = kurtosis([typeanalysis.pathlength.taperrate(m).values],0);
            
            typeanalysis.pathlength.bifurcationprobability.length(m) = typeanalysis.pathlength.numberbifurcations(m).total / typeanalysis.pathlength.length(m).total;
            typeanalysis.pathlength.terminationprobability.length(m) = typeanalysis.pathlength.numberterminations(m).total / typeanalysis.pathlength.length(m).total;
            
            typeanalysis.pathlength.bifurcationprobability.surfacearea(m) = typeanalysis.pathlength.numberbifurcations(m).total / typeanalysis.pathlength.surfacearea(m).total;
            typeanalysis.pathlength.terminationprobability.surfacearea(m) = typeanalysis.pathlength.numberterminations(m).total / typeanalysis.pathlength.surfacearea(m).total;
            
            typeanalysis.pathlength.bifurcationprobability.volume(m) = typeanalysis.pathlength.numberbifurcations(m).total / typeanalysis.pathlength.volume(m).total;
            typeanalysis.pathlength.terminationprobability.volume(m) = typeanalysis.pathlength.numberterminations(m).total / typeanalysis.pathlength.volume(m).total;
            
        end
        
        typeanalysis.pathlength = orderfields(typeanalysis.pathlength);
        
        
        
        
        
        
        % Begin bifurcation path length analysis
        
        clear maxpathlengthbin;
        maxpathlengthbin = ceil(popdata.bifurcation.maxpathlength / distancebinwidth);
        for n = 1:maxpathlengthbin
            popdata.bifurcation.pathlengthbins(n).rallratio.values            = [];
            popdata.bifurcation.pathlengthbins(n).rallratio1.values           = [];
            popdata.bifurcation.pathlengthbins(n).rallratio2.values           = [];
            popdata.bifurcation.pathlengthbins(n).rallratio3.values           = [];
            popdata.bifurcation.pathlengthbins(n).daughterratio.values        = [];
            popdata.bifurcation.pathlengthbins(n).parentdaughterratio.values  = [];
            popdata.bifurcation.pathlengthbins(n).parentdaughter2ratio.values = [];
            popdata.bifurcation.pathlengthbins(n).taperrate.values            = [];
            popdata.bifurcation.pathlengthbins(n).taperratelength.values      = [];
        end
        
        
        for i = 1:length(data.individual)
            
            clear inddata;
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            
            if isfield(inddata.bifurcation,'pathlengthbins')
                
                for j = 1:length(inddata.bifurcation.pathlengthbins)
                    
                    inddata.bifurcation.pathlengthbins(j).length                      = sum([inddata.bifurcation.pathlengthbins(j).piece.length]);
                    inddata.bifurcation.pathlengthbins(j).surfacearea                 = sum([inddata.bifurcation.pathlengthbins(j).piece.surfacearea]);
                    inddata.bifurcation.pathlengthbins(j).volume                      = sum([inddata.bifurcation.pathlengthbins(j).piece.volume]);
                    inddata.bifurcation.pathlengthbins(j).numbersegments              = length(unique([inddata.bifurcation.pathlengthbins(j).piece.cable]));
                    inddata.bifurcation.pathlengthbins(j).numberbifurcations          = 0;
                    inddata.bifurcation.pathlengthbins(j).rallratio.values            = [inddata.bifurcation.pathlengthbins(j).piece.rallratio];
                    inddata.bifurcation.pathlengthbins(j).rallratio1.values           = [inddata.bifurcation.pathlengthbins(j).piece.rallratio1];
                    inddata.bifurcation.pathlengthbins(j).rallratio2.values           = [inddata.bifurcation.pathlengthbins(j).piece.rallratio2];
                    inddata.bifurcation.pathlengthbins(j).rallratio3.values           = [inddata.bifurcation.pathlengthbins(j).piece.rallratio3];
                    inddata.bifurcation.pathlengthbins(j).daughterratio.values        = [inddata.bifurcation.pathlengthbins(j).piece.daughterratio];
                    inddata.bifurcation.pathlengthbins(j).parentdaughterratio.values  = [inddata.bifurcation.pathlengthbins(j).piece.parentdaughterratio];
                    inddata.bifurcation.pathlengthbins(j).parentdaughter2ratio.values = [inddata.bifurcation.pathlengthbins(j).piece.parentdaughter2ratio];
                    inddata.bifurcation.pathlengthbins(j).diameter                    = ((4*inddata.bifurcation.pathlengthbins(j).volume)/(pi()*inddata.bifurcation.pathlengthbins(j).length))^0.5;
                    %
                    if isnan(inddata.bifurcation.pathlengthbins(j).diameter)
                        disp('NaN in bif pathlength diameter.');
                        keyboard;
                    end
                    %
                    inddata.bifurcation.pathlengthbins(j).taperrate.values            = [inddata.bifurcation.pathlengthbins(j).piece.taperrate];
                    inddata.bifurcation.pathlengthbins(j).taperratelength.values      = [inddata.bifurcation.pathlengthbins(j).piece.length];
                    
                    for k = 1:length(inddata.bifurcation.pathlengthbins(j).piece)
                        if strcmp(inddata.bifurcation.pathlengthbins(j).piece(k).distaltype,'bifurcation')==1
                            inddata.bifurcation.pathlengthbins(j).numberbifurcations = 1 + inddata.bifurcation.pathlengthbins(j).numberbifurcations;
                        end
                        if strcmp(inddata.bifurcation.pathlengthbins(j).piece(k).distaltype,'m-furcation')==1
                            inddata.bifurcation.pathlengthbins(j).numberbifurcations = length(inddata.bifurcation.pathlengthbins(j).piece(k).daughters) - 1 + inddata.bifurcation.pathlengthbins(j).numberbifurcations;
                        end
                    end
                    
                    if isfield(popdata,'pathlengthbins') == 0; nextvalue = 1;
                    elseif j > length(popdata.bifurcation.pathlengthbins); nextvalue = 1;
                    elseif isfield(popdata.bifurcation.pathlengthbins(j),'length') == 0; nextvalue = 1;
                    elseif isfield(popdata.bifurcation.pathlengthbins(j).length,'values') == 0; nextvalue = 1;
                    else nextvalue = 1 + length(popdata.bifurcation.pathlengthbins(j).length.values);
                    end
                    popdata.bifurcation.pathlengthbins(j).length.values(nextvalue)             = inddata.bifurcation.pathlengthbins(j).length;
                    popdata.bifurcation.pathlengthbins(j).surfacearea.values(nextvalue)        = inddata.bifurcation.pathlengthbins(j).surfacearea;
                    popdata.bifurcation.pathlengthbins(j).volume.values(nextvalue)             = inddata.bifurcation.pathlengthbins(j).volume;
                    popdata.bifurcation.pathlengthbins(j).numbersegments.values(nextvalue)     = inddata.bifurcation.pathlengthbins(j).numbersegments;
                    popdata.bifurcation.pathlengthbins(j).numberbifurcations.values(nextvalue) = inddata.bifurcation.pathlengthbins(j).numberbifurcations;
                    popdata.bifurcation.pathlengthbins(j).rallratio.values                     = [ [popdata.bifurcation.pathlengthbins(j).rallratio.values] [inddata.bifurcation.pathlengthbins(j).rallratio.values] ];
                    popdata.bifurcation.pathlengthbins(j).rallratio1.values                    = [ [popdata.bifurcation.pathlengthbins(j).rallratio1.values] [inddata.bifurcation.pathlengthbins(j).rallratio1.values] ];
                    popdata.bifurcation.pathlengthbins(j).rallratio2.values                    = [ [popdata.bifurcation.pathlengthbins(j).rallratio2.values] [inddata.bifurcation.pathlengthbins(j).rallratio2.values] ];
                    popdata.bifurcation.pathlengthbins(j).rallratio3.values                    = [ [popdata.bifurcation.pathlengthbins(j).rallratio3.values] [inddata.bifurcation.pathlengthbins(j).rallratio3.values] ];
                    popdata.bifurcation.pathlengthbins(j).daughterratio.values                 = [ [popdata.bifurcation.pathlengthbins(j).daughterratio.values] [inddata.bifurcation.pathlengthbins(j).daughterratio.values] ];
                    popdata.bifurcation.pathlengthbins(j).parentdaughterratio.values           = [ [popdata.bifurcation.pathlengthbins(j).parentdaughterratio.values] [inddata.bifurcation.pathlengthbins(j).parentdaughterratio.values] ];
                    popdata.bifurcation.pathlengthbins(j).parentdaughter2ratio.values          = [ [popdata.bifurcation.pathlengthbins(j).parentdaughter2ratio.values] [inddata.bifurcation.pathlengthbins(j).parentdaughter2ratio.values] ];
                    popdata.bifurcation.pathlengthbins(j).diameter.values(nextvalue)           = inddata.bifurcation.pathlengthbins(j).diameter;
                    popdata.bifurcation.pathlengthbins(j).taperrate.values                     = [ [popdata.bifurcation.pathlengthbins(j).taperrate.values] [inddata.bifurcation.pathlengthbins(j).taperrate.values] ];
                    popdata.bifurcation.pathlengthbins(j).taperratelength.values               = [ [popdata.bifurcation.pathlengthbins(j).taperratelength.values] [inddata.bifurcation.pathlengthbins(j).taperratelength.values] ];
                    
                    clear nextvalue;
                    
                end
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        for m = 1:length(popdata.bifurcation.pathlengthbins)
            
            typeanalysis.bifurcation.pathlength.pathlength(m)              = (distancebinwidth * m) - (distancebinwidth / 2);
            
            typeanalysis.bifurcation.pathlength.length(m).values           = popdata.bifurcation.pathlengthbins(m).length.values;
            typeanalysis.bifurcation.pathlength.length(m).mean             = mean([typeanalysis.bifurcation.pathlength.length(m).values]);
            typeanalysis.bifurcation.pathlength.length(m).std              = std([typeanalysis.bifurcation.pathlength.length(m).values]);
            typeanalysis.bifurcation.pathlength.length(m).max              = max([typeanalysis.bifurcation.pathlength.length(m).values]);
            typeanalysis.bifurcation.pathlength.length(m).min              = min([typeanalysis.bifurcation.pathlength.length(m).values]);
            typeanalysis.bifurcation.pathlength.length(m).skew             = skewness([typeanalysis.bifurcation.pathlength.length(m).values],0);
            typeanalysis.bifurcation.pathlength.length(m).kurt             = kurtosis([typeanalysis.bifurcation.pathlength.length(m).values],0);
            typeanalysis.bifurcation.pathlength.length(m).total            = sum([typeanalysis.bifurcation.pathlength.length(m).values]);
            
            typeanalysis.bifurcation.pathlength.surfacearea(m).values           = popdata.bifurcation.pathlengthbins(m).surfacearea.values;
            typeanalysis.bifurcation.pathlength.surfacearea(m).mean             = mean([typeanalysis.bifurcation.pathlength.surfacearea(m).values]);
            typeanalysis.bifurcation.pathlength.surfacearea(m).std              = std([typeanalysis.bifurcation.pathlength.surfacearea(m).values]);
            typeanalysis.bifurcation.pathlength.surfacearea(m).max              = max([typeanalysis.bifurcation.pathlength.surfacearea(m).values]);
            typeanalysis.bifurcation.pathlength.surfacearea(m).min              = min([typeanalysis.bifurcation.pathlength.surfacearea(m).values]);
            typeanalysis.bifurcation.pathlength.surfacearea(m).skew             = skewness([typeanalysis.bifurcation.pathlength.surfacearea(m).values],0);
            typeanalysis.bifurcation.pathlength.surfacearea(m).kurt             = kurtosis([typeanalysis.bifurcation.pathlength.surfacearea(m).values],0);
            typeanalysis.bifurcation.pathlength.surfacearea(m).total            = sum([typeanalysis.bifurcation.pathlength.surfacearea(m).values]);
            
            typeanalysis.bifurcation.pathlength.volume(m).values           = popdata.bifurcation.pathlengthbins(m).volume.values;
            typeanalysis.bifurcation.pathlength.volume(m).mean             = mean([typeanalysis.bifurcation.pathlength.volume(m).values]);
            typeanalysis.bifurcation.pathlength.volume(m).std              = std([typeanalysis.bifurcation.pathlength.volume(m).values]);
            typeanalysis.bifurcation.pathlength.volume(m).max              = max([typeanalysis.bifurcation.pathlength.volume(m).values]);
            typeanalysis.bifurcation.pathlength.volume(m).min              = min([typeanalysis.bifurcation.pathlength.volume(m).values]);
            typeanalysis.bifurcation.pathlength.volume(m).skew             = skewness([typeanalysis.bifurcation.pathlength.volume(m).values],0);
            typeanalysis.bifurcation.pathlength.volume(m).kurt             = kurtosis([typeanalysis.bifurcation.pathlength.volume(m).values],0);
            typeanalysis.bifurcation.pathlength.volume(m).total            = sum([typeanalysis.bifurcation.pathlength.volume(m).values]);
            
            typeanalysis.bifurcation.pathlength.numbersegments(m).values           = popdata.bifurcation.pathlengthbins(m).numbersegments.values;
            typeanalysis.bifurcation.pathlength.numbersegments(m).mean             = mean([typeanalysis.bifurcation.pathlength.numbersegments(m).values]);
            typeanalysis.bifurcation.pathlength.numbersegments(m).std              = std([typeanalysis.bifurcation.pathlength.numbersegments(m).values]);
            typeanalysis.bifurcation.pathlength.numbersegments(m).max              = max([typeanalysis.bifurcation.pathlength.numbersegments(m).values]);
            typeanalysis.bifurcation.pathlength.numbersegments(m).min              = min([typeanalysis.bifurcation.pathlength.numbersegments(m).values]);
            typeanalysis.bifurcation.pathlength.numbersegments(m).skew             = skewness([typeanalysis.bifurcation.pathlength.numbersegments(m).values],0);
            typeanalysis.bifurcation.pathlength.numbersegments(m).kurt             = kurtosis([typeanalysis.bifurcation.pathlength.numbersegments(m).values],0);
            typeanalysis.bifurcation.pathlength.numbersegments(m).total            = sum([typeanalysis.bifurcation.pathlength.numbersegments(m).values]);
            
            typeanalysis.bifurcation.pathlength.numberbifurcations(m).values           = popdata.bifurcation.pathlengthbins(m).numberbifurcations.values;
            typeanalysis.bifurcation.pathlength.numberbifurcations(m).mean             = mean([typeanalysis.bifurcation.pathlength.numberbifurcations(m).values]);
            typeanalysis.bifurcation.pathlength.numberbifurcations(m).std              = std([typeanalysis.bifurcation.pathlength.numberbifurcations(m).values]);
            typeanalysis.bifurcation.pathlength.numberbifurcations(m).max              = max([typeanalysis.bifurcation.pathlength.numberbifurcations(m).values]);
            typeanalysis.bifurcation.pathlength.numberbifurcations(m).min              = min([typeanalysis.bifurcation.pathlength.numberbifurcations(m).values]);
            typeanalysis.bifurcation.pathlength.numberbifurcations(m).skew             = skewness([typeanalysis.bifurcation.pathlength.numberbifurcations(m).values],0);
            typeanalysis.bifurcation.pathlength.numberbifurcations(m).kurt             = kurtosis([typeanalysis.bifurcation.pathlength.numberbifurcations(m).values],0);
            typeanalysis.bifurcation.pathlength.numberbifurcations(m).total            = sum([typeanalysis.bifurcation.pathlength.numberbifurcations(m).values]);
            
            typeanalysis.bifurcation.pathlength.rallratio(m).values           = popdata.bifurcation.pathlengthbins(m).rallratio.values;
            typeanalysis.bifurcation.pathlength.rallratio(m).mean             = mean([typeanalysis.bifurcation.pathlength.rallratio(m).values]);
            typeanalysis.bifurcation.pathlength.rallratio(m).std              = std([typeanalysis.bifurcation.pathlength.rallratio(m).values]);
            typeanalysis.bifurcation.pathlength.rallratio(m).max              = max([typeanalysis.bifurcation.pathlength.rallratio(m).values]);
            typeanalysis.bifurcation.pathlength.rallratio(m).min              = min([typeanalysis.bifurcation.pathlength.rallratio(m).values]);
            typeanalysis.bifurcation.pathlength.rallratio(m).skew             = skewness([typeanalysis.bifurcation.pathlength.rallratio(m).values],0);
            typeanalysis.bifurcation.pathlength.rallratio(m).kurt             = kurtosis([typeanalysis.bifurcation.pathlength.rallratio(m).values],0);
            
            typeanalysis.bifurcation.pathlength.rallratio1(m).values           = popdata.bifurcation.pathlengthbins(m).rallratio1.values;
            typeanalysis.bifurcation.pathlength.rallratio1(m).mean             = mean([typeanalysis.bifurcation.pathlength.rallratio1(m).values]);
            typeanalysis.bifurcation.pathlength.rallratio1(m).std              = std([typeanalysis.bifurcation.pathlength.rallratio1(m).values]);
            typeanalysis.bifurcation.pathlength.rallratio1(m).max              = max([typeanalysis.bifurcation.pathlength.rallratio1(m).values]);
            typeanalysis.bifurcation.pathlength.rallratio1(m).min              = min([typeanalysis.bifurcation.pathlength.rallratio1(m).values]);
            typeanalysis.bifurcation.pathlength.rallratio1(m).skew             = skewness([typeanalysis.bifurcation.pathlength.rallratio1(m).values],0);
            typeanalysis.bifurcation.pathlength.rallratio1(m).kurt             = kurtosis([typeanalysis.bifurcation.pathlength.rallratio1(m).values],0);
            
            typeanalysis.bifurcation.pathlength.rallratio2(m).values           = popdata.bifurcation.pathlengthbins(m).rallratio2.values;
            typeanalysis.bifurcation.pathlength.rallratio2(m).mean             = mean([typeanalysis.bifurcation.pathlength.rallratio2(m).values]);
            typeanalysis.bifurcation.pathlength.rallratio2(m).std              = std([typeanalysis.bifurcation.pathlength.rallratio2(m).values]);
            typeanalysis.bifurcation.pathlength.rallratio2(m).max              = max([typeanalysis.bifurcation.pathlength.rallratio2(m).values]);
            typeanalysis.bifurcation.pathlength.rallratio2(m).min              = min([typeanalysis.bifurcation.pathlength.rallratio2(m).values]);
            typeanalysis.bifurcation.pathlength.rallratio2(m).skew             = skewness([typeanalysis.bifurcation.pathlength.rallratio2(m).values],0);
            typeanalysis.bifurcation.pathlength.rallratio2(m).kurt             = kurtosis([typeanalysis.bifurcation.pathlength.rallratio2(m).values],0);
            
            typeanalysis.bifurcation.pathlength.rallratio3(m).values           = popdata.bifurcation.pathlengthbins(m).rallratio3.values;
            typeanalysis.bifurcation.pathlength.rallratio3(m).mean             = mean([typeanalysis.bifurcation.pathlength.rallratio3(m).values]);
            typeanalysis.bifurcation.pathlength.rallratio3(m).std              = std([typeanalysis.bifurcation.pathlength.rallratio3(m).values]);
            typeanalysis.bifurcation.pathlength.rallratio3(m).max              = max([typeanalysis.bifurcation.pathlength.rallratio3(m).values]);
            typeanalysis.bifurcation.pathlength.rallratio3(m).min              = min([typeanalysis.bifurcation.pathlength.rallratio3(m).values]);
            typeanalysis.bifurcation.pathlength.rallratio3(m).skew             = skewness([typeanalysis.bifurcation.pathlength.rallratio3(m).values],0);
            typeanalysis.bifurcation.pathlength.rallratio3(m).kurt             = kurtosis([typeanalysis.bifurcation.pathlength.rallratio3(m).values],0);
            
            typeanalysis.bifurcation.pathlength.daughterratio(m).values           = popdata.bifurcation.pathlengthbins(m).daughterratio.values;
            typeanalysis.bifurcation.pathlength.daughterratio(m).mean             = mean([typeanalysis.bifurcation.pathlength.daughterratio(m).values]);
            typeanalysis.bifurcation.pathlength.daughterratio(m).std              = std([typeanalysis.bifurcation.pathlength.daughterratio(m).values]);
            typeanalysis.bifurcation.pathlength.daughterratio(m).max              = max([typeanalysis.bifurcation.pathlength.daughterratio(m).values]);
            typeanalysis.bifurcation.pathlength.daughterratio(m).min              = min([typeanalysis.bifurcation.pathlength.daughterratio(m).values]);
            typeanalysis.bifurcation.pathlength.daughterratio(m).skew             = skewness([typeanalysis.bifurcation.pathlength.daughterratio(m).values],0);
            typeanalysis.bifurcation.pathlength.daughterratio(m).kurt             = kurtosis([typeanalysis.bifurcation.pathlength.daughterratio(m).values],0);
            
            typeanalysis.bifurcation.pathlength.parentdaughterratio(m).values           = popdata.bifurcation.pathlengthbins(m).parentdaughterratio.values;
            typeanalysis.bifurcation.pathlength.parentdaughterratio(m).mean             = mean([typeanalysis.bifurcation.pathlength.parentdaughterratio(m).values]);
            typeanalysis.bifurcation.pathlength.parentdaughterratio(m).std              = std([typeanalysis.bifurcation.pathlength.parentdaughterratio(m).values]);
            typeanalysis.bifurcation.pathlength.parentdaughterratio(m).max              = max([typeanalysis.bifurcation.pathlength.parentdaughterratio(m).values]);
            typeanalysis.bifurcation.pathlength.parentdaughterratio(m).min              = min([typeanalysis.bifurcation.pathlength.parentdaughterratio(m).values]);
            typeanalysis.bifurcation.pathlength.parentdaughterratio(m).skew             = skewness([typeanalysis.bifurcation.pathlength.parentdaughterratio(m).values],0);
            typeanalysis.bifurcation.pathlength.parentdaughterratio(m).kurt             = kurtosis([typeanalysis.bifurcation.pathlength.parentdaughterratio(m).values],0);
            
            typeanalysis.bifurcation.pathlength.parentdaughter2ratio(m).values           = popdata.bifurcation.pathlengthbins(m).parentdaughter2ratio.values;
            typeanalysis.bifurcation.pathlength.parentdaughter2ratio(m).mean             = mean([typeanalysis.bifurcation.pathlength.parentdaughter2ratio(m).values]);
            typeanalysis.bifurcation.pathlength.parentdaughter2ratio(m).std              = std([typeanalysis.bifurcation.pathlength.parentdaughter2ratio(m).values]);
            typeanalysis.bifurcation.pathlength.parentdaughter2ratio(m).max              = max([typeanalysis.bifurcation.pathlength.parentdaughter2ratio(m).values]);
            typeanalysis.bifurcation.pathlength.parentdaughter2ratio(m).min              = min([typeanalysis.bifurcation.pathlength.parentdaughter2ratio(m).values]);
            typeanalysis.bifurcation.pathlength.parentdaughter2ratio(m).skew             = skewness([typeanalysis.bifurcation.pathlength.parentdaughter2ratio(m).values],0);
            typeanalysis.bifurcation.pathlength.parentdaughter2ratio(m).kurt             = kurtosis([typeanalysis.bifurcation.pathlength.parentdaughter2ratio(m).values],0);
            
            typeanalysis.bifurcation.pathlength.diameter(m).values           = popdata.bifurcation.pathlengthbins(m).diameter.values;
            typeanalysis.bifurcation.pathlength.diameter(m).mean             = mean([typeanalysis.bifurcation.pathlength.diameter(m).values]);
            typeanalysis.bifurcation.pathlength.diameter(m).std              = std([typeanalysis.bifurcation.pathlength.diameter(m).values]);
            typeanalysis.bifurcation.pathlength.diameter(m).max              = max([typeanalysis.bifurcation.pathlength.diameter(m).values]);
            typeanalysis.bifurcation.pathlength.diameter(m).min              = min([typeanalysis.bifurcation.pathlength.diameter(m).values]);
            typeanalysis.bifurcation.pathlength.diameter(m).skew             = skewness([typeanalysis.bifurcation.pathlength.diameter(m).values],0);
            typeanalysis.bifurcation.pathlength.diameter(m).kurt             = kurtosis([typeanalysis.bifurcation.pathlength.diameter(m).values],0);
            
            typeanalysis.bifurcation.pathlength.taperrate(m).values           = popdata.bifurcation.pathlengthbins(m).taperrate.values;
            typeanalysis.bifurcation.pathlength.taperrate(m).mean             = sum([popdata.bifurcation.pathlengthbins(m).taperrate.values].*[popdata.bifurcation.pathlengthbins(m).taperratelength.values])/sum([popdata.bifurcation.pathlengthbins(m).taperratelength.values]);
            %typeanalysis.bifurcation.pathlength.taperrate(m).mean             = mean([popdata.bifurcation.pathlengthbins(m).taperrate.values].*[popdata.bifurcation.pathlengthbins(m).taperratelength.values])/sum([popdata.bifurcation.pathlengthbins(m).taperratelength.values]);
            typeanalysis.bifurcation.pathlength.taperrate(m).std              = std([typeanalysis.bifurcation.pathlength.taperrate(m).values]);
            typeanalysis.bifurcation.pathlength.taperrate(m).max              = max([typeanalysis.bifurcation.pathlength.taperrate(m).values]);
            typeanalysis.bifurcation.pathlength.taperrate(m).min              = min([typeanalysis.bifurcation.pathlength.taperrate(m).values]);
            typeanalysis.bifurcation.pathlength.taperrate(m).skew             = skewness([typeanalysis.bifurcation.pathlength.taperrate(m).values],0);
            typeanalysis.bifurcation.pathlength.taperrate(m).kurt             = kurtosis([typeanalysis.bifurcation.pathlength.taperrate(m).values],0);
            
            typeanalysis.bifurcation.pathlength.bifurcationprobability.length(m)      = typeanalysis.bifurcation.pathlength.numberbifurcations(m).total / typeanalysis.bifurcation.pathlength.length(m).total;
            typeanalysis.bifurcation.pathlength.bifurcationprobability.surfacearea(m) = typeanalysis.bifurcation.pathlength.numberbifurcations(m).total / typeanalysis.bifurcation.pathlength.surfacearea(m).total;
            typeanalysis.bifurcation.pathlength.bifurcationprobability.volume(m)      = typeanalysis.bifurcation.pathlength.numberbifurcations(m).total / typeanalysis.bifurcation.pathlength.volume(m).total;
            
        end
        
        typeanalysis.bifurcation.pathlength = orderfields(typeanalysis.bifurcation.pathlength);
        
        
        
        
        
        
        
        
        
        % Begin termination path length analysis
        
        clear maxpathlengthbin;
        maxpathlengthbin = ceil(popdata.termination.maxpathlength / distancebinwidth);
        for i = 1:maxpathlengthbin
            popdata.termination.pathlengthbins(i).taperrate.values            = [];
            popdata.termination.pathlengthbins(i).taperratelength.values      = [];
        end
        
        
        for i = 1:length(data.individual)
            
            clear inddata;
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            
            for j = 1:length(inddata.termination.pathlengthbins)
                
                if isfield(inddata.termination.pathlengthbins(j).piece,'id') == 1
                    
                    inddata.termination.pathlengthbins(j).length                      = sum([inddata.termination.pathlengthbins(j).piece.length]);
                    inddata.termination.pathlengthbins(j).surfacearea                 = sum([inddata.termination.pathlengthbins(j).piece.surfacearea]);
                    inddata.termination.pathlengthbins(j).volume                      = sum([inddata.termination.pathlengthbins(j).piece.volume]);
                    inddata.termination.pathlengthbins(j).numbersegments              = length(unique([inddata.termination.pathlengthbins(j).piece.cable]));
                    inddata.termination.pathlengthbins(j).numberterminations          = 0;
                    inddata.termination.pathlengthbins(j).diameter                    = ((4*inddata.termination.pathlengthbins(j).volume)/(pi()*inddata.termination.pathlengthbins(j).length))^0.5;
                    %
                    if isnan(inddata.termination.pathlengthbins(j).diameter)
                        disp('NaN in term pathlength diameter.');
                        keyboard;
                    end
                    %
                    inddata.termination.pathlengthbins(j).taperrate.values            = [inddata.termination.pathlengthbins(j).piece.taperrate];
                    inddata.termination.pathlengthbins(j).taperratelength.values      = [inddata.termination.pathlengthbins(j).piece.length];
                    
                    for k = 1:length(inddata.termination.pathlengthbins(j).piece)
                        if strcmp(inddata.termination.pathlengthbins(j).piece(k).distaltype,'termination')==1
                            inddata.termination.pathlengthbins(j).numberterminations = 1 + inddata.termination.pathlengthbins(j).numberterminations;
                        end
                    end
                    
                    if isfield(popdata,'pathlengthbins') == 0; nextvalue = 1;
                    elseif j > length(popdata.termination.pathlengthbins); nextvalue = 1;
                    elseif isfield(popdata.termination.pathlengthbins(j),'length') == 0; nextvalue = 1;
                    elseif isfield(popdata.termination.pathlengthbins(j).length,'values') == 0; nextvalue = 1;
                    else nextvalue = 1 + length(popdata.termination.pathlengthbins(j).length.values);
                    end
                    popdata.termination.pathlengthbins(j).length.values(nextvalue)             = inddata.termination.pathlengthbins(j).length;
                    popdata.termination.pathlengthbins(j).surfacearea.values(nextvalue)        = inddata.termination.pathlengthbins(j).surfacearea;
                    popdata.termination.pathlengthbins(j).volume.values(nextvalue)             = inddata.termination.pathlengthbins(j).volume;
                    popdata.termination.pathlengthbins(j).numbersegments.values(nextvalue)     = inddata.termination.pathlengthbins(j).numbersegments;
                    popdata.termination.pathlengthbins(j).numberterminations.values(nextvalue) = inddata.termination.pathlengthbins(j).numberterminations;
                    popdata.termination.pathlengthbins(j).diameter.values(nextvalue)           = inddata.termination.pathlengthbins(j).diameter;
                    popdata.termination.pathlengthbins(j).taperrate.values                     = [ [popdata.termination.pathlengthbins(j).taperrate.values] [inddata.termination.pathlengthbins(j).taperrate.values] ];
                    popdata.termination.pathlengthbins(j).taperratelength.values               = [ [popdata.termination.pathlengthbins(j).taperratelength.values] [inddata.termination.pathlengthbins(j).taperratelength.values] ];
                    
                    clear nextvalue;
                    
                end
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        for m = 1:length(popdata.termination.pathlengthbins)
            
            typeanalysis.termination.pathlength.pathlength(m)              = (distancebinwidth * m) - (distancebinwidth / 2);
            
            if isfield(popdata.termination.pathlengthbins(m).length,'values') == 1
                
                typeanalysis.termination.pathlength.length(m).values           = popdata.termination.pathlengthbins(m).length.values;
                typeanalysis.termination.pathlength.length(m).mean             = mean([typeanalysis.termination.pathlength.length(m).values]);
                typeanalysis.termination.pathlength.length(m).std              = std([typeanalysis.termination.pathlength.length(m).values]);
                typeanalysis.termination.pathlength.length(m).max              = max([typeanalysis.termination.pathlength.length(m).values]);
                typeanalysis.termination.pathlength.length(m).min              = min([typeanalysis.termination.pathlength.length(m).values]);
                typeanalysis.termination.pathlength.length(m).skew             = skewness([typeanalysis.termination.pathlength.length(m).values],0);
                typeanalysis.termination.pathlength.length(m).kurt             = kurtosis([typeanalysis.termination.pathlength.length(m).values],0);
                typeanalysis.termination.pathlength.length(m).total            = sum([typeanalysis.termination.pathlength.length(m).values]);
                
                typeanalysis.termination.pathlength.surfacearea(m).values           = popdata.termination.pathlengthbins(m).surfacearea.values;
                typeanalysis.termination.pathlength.surfacearea(m).mean             = mean([typeanalysis.termination.pathlength.surfacearea(m).values]);
                typeanalysis.termination.pathlength.surfacearea(m).std              = std([typeanalysis.termination.pathlength.surfacearea(m).values]);
                typeanalysis.termination.pathlength.surfacearea(m).max              = max([typeanalysis.termination.pathlength.surfacearea(m).values]);
                typeanalysis.termination.pathlength.surfacearea(m).min              = min([typeanalysis.termination.pathlength.surfacearea(m).values]);
                typeanalysis.termination.pathlength.surfacearea(m).skew             = skewness([typeanalysis.termination.pathlength.surfacearea(m).values],0);
                typeanalysis.termination.pathlength.surfacearea(m).kurt             = kurtosis([typeanalysis.termination.pathlength.surfacearea(m).values],0);
                typeanalysis.termination.pathlength.surfacearea(m).total            = sum([typeanalysis.termination.pathlength.surfacearea(m).values]);
                
                typeanalysis.termination.pathlength.volume(m).values           = popdata.termination.pathlengthbins(m).volume.values;
                typeanalysis.termination.pathlength.volume(m).mean             = mean([typeanalysis.termination.pathlength.volume(m).values]);
                typeanalysis.termination.pathlength.volume(m).std              = std([typeanalysis.termination.pathlength.volume(m).values]);
                typeanalysis.termination.pathlength.volume(m).max              = max([typeanalysis.termination.pathlength.volume(m).values]);
                typeanalysis.termination.pathlength.volume(m).min              = min([typeanalysis.termination.pathlength.volume(m).values]);
                typeanalysis.termination.pathlength.volume(m).skew             = skewness([typeanalysis.termination.pathlength.volume(m).values],0);
                typeanalysis.termination.pathlength.volume(m).kurt             = kurtosis([typeanalysis.termination.pathlength.volume(m).values],0);
                typeanalysis.termination.pathlength.volume(m).total            = sum([typeanalysis.termination.pathlength.volume(m).values]);
                
                typeanalysis.termination.pathlength.numbersegments(m).values           = popdata.termination.pathlengthbins(m).numbersegments.values;
                typeanalysis.termination.pathlength.numbersegments(m).mean             = mean([typeanalysis.termination.pathlength.numbersegments(m).values]);
                typeanalysis.termination.pathlength.numbersegments(m).std              = std([typeanalysis.termination.pathlength.numbersegments(m).values]);
                typeanalysis.termination.pathlength.numbersegments(m).max              = max([typeanalysis.termination.pathlength.numbersegments(m).values]);
                typeanalysis.termination.pathlength.numbersegments(m).min              = min([typeanalysis.termination.pathlength.numbersegments(m).values]);
                typeanalysis.termination.pathlength.numbersegments(m).skew             = skewness([typeanalysis.termination.pathlength.numbersegments(m).values],0);
                typeanalysis.termination.pathlength.numbersegments(m).kurt             = kurtosis([typeanalysis.termination.pathlength.numbersegments(m).values],0);
                typeanalysis.termination.pathlength.numbersegments(m).total            = sum([typeanalysis.termination.pathlength.numbersegments(m).values]);
                
                typeanalysis.termination.pathlength.numberterminations(m).values           = popdata.termination.pathlengthbins(m).numberterminations.values;
                typeanalysis.termination.pathlength.numberterminations(m).mean             = mean([typeanalysis.termination.pathlength.numberterminations(m).values]);
                typeanalysis.termination.pathlength.numberterminations(m).std              = std([typeanalysis.termination.pathlength.numberterminations(m).values]);
                typeanalysis.termination.pathlength.numberterminations(m).max              = max([typeanalysis.termination.pathlength.numberterminations(m).values]);
                typeanalysis.termination.pathlength.numberterminations(m).min              = min([typeanalysis.termination.pathlength.numberterminations(m).values]);
                typeanalysis.termination.pathlength.numberterminations(m).skew             = skewness([typeanalysis.termination.pathlength.numberterminations(m).values],0);
                typeanalysis.termination.pathlength.numberterminations(m).kurt             = kurtosis([typeanalysis.termination.pathlength.numberterminations(m).values],0);
                typeanalysis.termination.pathlength.numberterminations(m).total            = sum([typeanalysis.termination.pathlength.numberterminations(m).values]);
                
                typeanalysis.termination.pathlength.diameter(m).values           = popdata.termination.pathlengthbins(m).diameter.values;
                typeanalysis.termination.pathlength.diameter(m).mean             = mean([typeanalysis.termination.pathlength.diameter(m).values]);
                typeanalysis.termination.pathlength.diameter(m).std              = std([typeanalysis.termination.pathlength.diameter(m).values]);
                typeanalysis.termination.pathlength.diameter(m).max              = max([typeanalysis.termination.pathlength.diameter(m).values]);
                typeanalysis.termination.pathlength.diameter(m).min              = min([typeanalysis.termination.pathlength.diameter(m).values]);
                typeanalysis.termination.pathlength.diameter(m).skew             = skewness([typeanalysis.termination.pathlength.diameter(m).values],0);
                typeanalysis.termination.pathlength.diameter(m).kurt             = kurtosis([typeanalysis.termination.pathlength.diameter(m).values],0);
                
                typeanalysis.termination.pathlength.taperrate(m).values           = popdata.termination.pathlengthbins(m).taperrate.values;
                typeanalysis.termination.pathlength.taperrate(m).mean             = sum([popdata.termination.pathlengthbins(m).taperrate.values].*[popdata.termination.pathlengthbins(m).taperratelength.values])/sum([popdata.termination.pathlengthbins(m).taperratelength.values]);
                %typeanalysis.termination.pathlength.taperrate(m).mean             = mean([popdata.termination.pathlengthbins(m).taperrate.values].*[popdata.termination.pathlengthbins(m).taperratelength.values])/sum([popdata.termination.pathlengthbins(m).taperratelength.values]);
                typeanalysis.termination.pathlength.taperrate(m).std              = std([typeanalysis.termination.pathlength.taperrate(m).values]);
                typeanalysis.termination.pathlength.taperrate(m).max              = max([typeanalysis.termination.pathlength.taperrate(m).values]);
                typeanalysis.termination.pathlength.taperrate(m).min              = min([typeanalysis.termination.pathlength.taperrate(m).values]);
                typeanalysis.termination.pathlength.taperrate(m).skew             = skewness([typeanalysis.termination.pathlength.taperrate(m).values],0);
                typeanalysis.termination.pathlength.taperrate(m).kurt             = kurtosis([typeanalysis.termination.pathlength.taperrate(m).values],0);
                
            else
                typeanalysis.termination.pathlength.numbersegments(m).total     = 0;
                typeanalysis.termination.pathlength.numbersegments(m).mean      = NaN;
                typeanalysis.termination.pathlength.numbersegments(m).std       = NaN;
                typeanalysis.termination.pathlength.numberterminations(m).total = 0;
                typeanalysis.termination.pathlength.numberterminations(m).mean  = NaN;
                typeanalysis.termination.pathlength.numberterminations(m).std   = NaN;
                typeanalysis.termination.pathlength.length(m).total             = 0;
                typeanalysis.termination.pathlength.length(m).mean              = NaN;
                typeanalysis.termination.pathlength.length(m).std               = NaN;
                typeanalysis.termination.pathlength.surfacearea(m).total        = 0;
                typeanalysis.termination.pathlength.surfacearea(m).mean         = NaN;
                typeanalysis.termination.pathlength.surfacearea(m).std          = NaN;
                typeanalysis.termination.pathlength.volume(m).total             = 0;
                typeanalysis.termination.pathlength.volume(m).mean              = NaN;
                typeanalysis.termination.pathlength.volume(m).std               = NaN;
                typeanalysis.termination.pathlength.diameter(m).mean            = NaN;
                typeanalysis.termination.pathlength.diameter(m).std             = NaN;
                typeanalysis.termination.pathlength.taperrate(m).mean           = NaN;
                typeanalysis.termination.pathlength.taperrate(m).std            = NaN;
            end
            
            
            typeanalysis.termination.pathlength.terminationprobability.length(m)      = typeanalysis.termination.pathlength.numberterminations(m).total / typeanalysis.termination.pathlength.length(m).total;
            typeanalysis.termination.pathlength.terminationprobability.surfacearea(m) = typeanalysis.termination.pathlength.numberterminations(m).total / typeanalysis.termination.pathlength.surfacearea(m).total;
            typeanalysis.termination.pathlength.terminationprobability.volume(m)      = typeanalysis.termination.pathlength.numberterminations(m).total / typeanalysis.termination.pathlength.volume(m).total;
            
        end
        
        typeanalysis.termination.pathlength = orderfields(typeanalysis.termination.pathlength);
        
        eval(['analysis.' currentpiecetype ' = typeanalysis;']);
        eval(['data.population.' currentpiecetype ' = popdata;']);
        
    end
end



warning('on', 'MATLAB:divideByZero');