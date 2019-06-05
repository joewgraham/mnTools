function [data,analysis]   = branchlengthanalyzer(data,analysis)

disp('   Branch length analysis started.');

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
        
        clear maxbranchlength;
        clear branchlengthbinwidth;
        eval(['branchlengthbinwidth = option.' currentpiecetype '.branchlengthbinwidth;']);
        maxbranchlengthbin = ceil(popdata.maxbranchlength / branchlengthbinwidth);
        for i = 1:maxbranchlengthbin
            popdata.branchlengthbins(i).rallratio.values            = [];
            popdata.branchlengthbins(i).rallratio1.values           = [];
            popdata.branchlengthbins(i).rallratio2.values           = [];
            popdata.branchlengthbins(i).rallratio3.values           = [];
            popdata.branchlengthbins(i).daughterratio.values        = [];
            popdata.branchlengthbins(i).parentdaughterratio.values  = [];
            popdata.branchlengthbins(i).parentdaughter2ratio.values = [];
            popdata.branchlengthbins(i).taperrate.values            = [];
            popdata.branchlengthbins(i).taperratelength.values      = [];
        end
        
        
        for i = 1:length(data.individual)
            
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            
            for j = 1:length(inddata.branchlengthbins)
                
                inddata.branchlengthbins(j).length                      = sum([inddata.branchlengthbins(j).piece.length]);
                inddata.branchlengthbins(j).surfacearea                 = sum([inddata.branchlengthbins(j).piece.surfacearea]);
                inddata.branchlengthbins(j).volume                      = sum([inddata.branchlengthbins(j).piece.volume]);
                inddata.branchlengthbins(j).numbersegments              = length(unique([inddata.branchlengthbins(j).piece.cable]));
                inddata.branchlengthbins(j).numberbifurcations          = 0;
                inddata.branchlengthbins(j).numberterminations          = 0;
                inddata.branchlengthbins(j).numberbifurcatingbranches   = 0;
                inddata.branchlengthbins(j).numberterminatingbranches   = 0;
                inddata.branchlengthbins(j).rallratio.values            = [inddata.branchlengthbins(j).piece.rallratio];
                inddata.branchlengthbins(j).rallratio1.values           = [inddata.branchlengthbins(j).piece.rallratio1];
                inddata.branchlengthbins(j).rallratio2.values           = [inddata.branchlengthbins(j).piece.rallratio2];
                inddata.branchlengthbins(j).rallratio3.values           = [inddata.branchlengthbins(j).piece.rallratio3];
                inddata.branchlengthbins(j).daughterratio.values        = [inddata.branchlengthbins(j).piece.daughterratio];
                inddata.branchlengthbins(j).parentdaughterratio.values  = [inddata.branchlengthbins(j).piece.parentdaughterratio];
                inddata.branchlengthbins(j).parentdaughter2ratio.values = [inddata.branchlengthbins(j).piece.parentdaughter2ratio];
                inddata.branchlengthbins(j).diameter                    = ((4*inddata.branchlengthbins(j).volume)/(pi()*inddata.branchlengthbins(j).length))^0.5;
                inddata.branchlengthbins(j).taperrate.values            = [inddata.branchlengthbins(j).piece.taperrate];
                inddata.branchlengthbins(j).taperratelength.values      = [inddata.branchlengthbins(j).piece.length];
                
                
                for k = 1:length(inddata.branchlengthbins(j).piece)
                    if strcmp(inddata.branchlengthbins(j).piece(k).distaltype,'bifurcation')==1
                        inddata.branchlengthbins(j).numberbifurcations = 1 + inddata.branchlengthbins(j).numberbifurcations;
                    end
                    if strcmp(inddata.branchlengthbins(j).piece(k).distaltype,'m-furcation')==1
                        inddata.branchlengthbins(j).numberbifurcations = length(inddata.branchlengthbins(j).piece(k).daughters) - 1 + inddata.branchlengthbins(j).numberbifurcations;
                    end
                    if strcmp(inddata.branchlengthbins(j).piece(k).distaltype,'termination')==1
                        inddata.branchlengthbins(j).numberterminations = 1 + inddata.branchlengthbins(j).numberterminations;
                    end
                    if strcmp(inddata.branchlengthbins(j).piece(k).proximaltype,'primary    ') ==1 || strcmp(inddata.branchlengthbins(j).piece(k).proximaltype,'daughter   ') ==1 || strcmp(inddata.branchlengthbins(j).piece(k).proximaltype,'daughter1  ') ==1 || strcmp(inddata.branchlengthbins(j).piece(k).proximaltype,'daughter2  ') ==1
                        if strcmp(inddata.branchlengthbins(j).piece(k).branchtype,'b') == 1
                            inddata.branchlengthbins(j).numberbifurcatingbranches = 1 + inddata.branchlengthbins(j).numberbifurcatingbranches;
                        elseif strcmp(inddata.branchlengthbins(j).piece(k).branchtype,'t') == 1
                            inddata.branchlengthbins(j).numberterminatingbranches = 1 + inddata.branchlengthbins(j).numberterminatingbranches;
                        else disp('       Error in branch length analyzer: piece branch type not identified.');
                        end
                    end
                end
                
                if isfield(popdata,'branchlengthbins') == 0; nextvalue = 1;
                elseif j > length(popdata.branchlengthbins); nextvalue = 1;
                elseif isfield(popdata.branchlengthbins(j),'length') == 0; nextvalue = 1;
                elseif isfield(popdata.branchlengthbins(j).length,'values') == 0; nextvalue = 1;
                else nextvalue = 1 + length(popdata.branchlengthbins(j).length.values);
                end
                popdata.branchlengthbins(j).length.values(nextvalue)             = inddata.branchlengthbins(j).length;
                popdata.branchlengthbins(j).surfacearea.values(nextvalue)        = inddata.branchlengthbins(j).surfacearea;
                popdata.branchlengthbins(j).volume.values(nextvalue)             = inddata.branchlengthbins(j).volume;
                popdata.branchlengthbins(j).numbersegments.values(nextvalue)     = inddata.branchlengthbins(j).numbersegments;
                popdata.branchlengthbins(j).numberbifurcations.values(nextvalue) = inddata.branchlengthbins(j).numberbifurcations;
                popdata.branchlengthbins(j).numberterminations.values(nextvalue) = inddata.branchlengthbins(j).numberterminations;
                popdata.branchlengthbins(j).numberbifurcatingbranches.values(nextvalue) = inddata.branchlengthbins(j).numberbifurcatingbranches;
                popdata.branchlengthbins(j).numberterminatingbranches.values(nextvalue) = inddata.branchlengthbins(j).numberterminatingbranches;
                popdata.branchlengthbins(j).rallratio.values                     = [ [popdata.branchlengthbins(j).rallratio.values] [inddata.branchlengthbins(j).rallratio.values] ];
                popdata.branchlengthbins(j).rallratio1.values                    = [ [popdata.branchlengthbins(j).rallratio1.values] [inddata.branchlengthbins(j).rallratio1.values] ];
                popdata.branchlengthbins(j).rallratio2.values                    = [ [popdata.branchlengthbins(j).rallratio2.values] [inddata.branchlengthbins(j).rallratio2.values] ];
                popdata.branchlengthbins(j).rallratio3.values                    = [ [popdata.branchlengthbins(j).rallratio3.values] [inddata.branchlengthbins(j).rallratio3.values] ];
                popdata.branchlengthbins(j).daughterratio.values                 = [ [popdata.branchlengthbins(j).daughterratio.values] [inddata.branchlengthbins(j).daughterratio.values] ];
                popdata.branchlengthbins(j).parentdaughterratio.values           = [ [popdata.branchlengthbins(j).parentdaughterratio.values] [inddata.branchlengthbins(j).parentdaughterratio.values] ];
                popdata.branchlengthbins(j).parentdaughter2ratio.values          = [ [popdata.branchlengthbins(j).parentdaughter2ratio.values] [inddata.branchlengthbins(j).parentdaughter2ratio.values] ];
                popdata.branchlengthbins(j).diameter.values(nextvalue)           = inddata.branchlengthbins(j).diameter;
                popdata.branchlengthbins(j).taperrate.values                     = [ [popdata.branchlengthbins(j).taperrate.values] [inddata.branchlengthbins(j).taperrate.values] ];
                popdata.branchlengthbins(j).taperratelength.values               = [ [popdata.branchlengthbins(j).taperratelength.values] [inddata.branchlengthbins(j).taperratelength.values] ];
                
                clear nextvalue;
                
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        for m = 1:length(popdata.branchlengthbins)
            
            typeanalysis.branchlength.branchlength(m)              = (branchlengthbinwidth * m) - (branchlengthbinwidth / 2);
            
            typeanalysis.branchlength.length(m).values           = popdata.branchlengthbins(m).length.values;
            typeanalysis.branchlength.length(m).mean             = mean([typeanalysis.branchlength.length(m).values]);
            typeanalysis.branchlength.length(m).std              = std([typeanalysis.branchlength.length(m).values]);
            typeanalysis.branchlength.length(m).max              = max([typeanalysis.branchlength.length(m).values]);
            typeanalysis.branchlength.length(m).min              = min([typeanalysis.branchlength.length(m).values]);
            typeanalysis.branchlength.length(m).skew             = skewness([typeanalysis.branchlength.length(m).values],0);
            typeanalysis.branchlength.length(m).kurt             = kurtosis([typeanalysis.branchlength.length(m).values],0);
            typeanalysis.branchlength.length(m).total            = sum([typeanalysis.branchlength.length(m).values]);
            
            typeanalysis.branchlength.surfacearea(m).values           = popdata.branchlengthbins(m).surfacearea.values;
            typeanalysis.branchlength.surfacearea(m).mean             = mean([typeanalysis.branchlength.surfacearea(m).values]);
            typeanalysis.branchlength.surfacearea(m).std              = std([typeanalysis.branchlength.surfacearea(m).values]);
            typeanalysis.branchlength.surfacearea(m).max              = max([typeanalysis.branchlength.surfacearea(m).values]);
            typeanalysis.branchlength.surfacearea(m).min              = min([typeanalysis.branchlength.surfacearea(m).values]);
            typeanalysis.branchlength.surfacearea(m).skew             = skewness([typeanalysis.branchlength.surfacearea(m).values],0);
            typeanalysis.branchlength.surfacearea(m).kurt             = kurtosis([typeanalysis.branchlength.surfacearea(m).values],0);
            typeanalysis.branchlength.surfacearea(m).total            = sum([typeanalysis.branchlength.surfacearea(m).values]);
            
            typeanalysis.branchlength.volume(m).values           = popdata.branchlengthbins(m).volume.values;
            typeanalysis.branchlength.volume(m).mean             = mean([typeanalysis.branchlength.volume(m).values]);
            typeanalysis.branchlength.volume(m).std              = std([typeanalysis.branchlength.volume(m).values]);
            typeanalysis.branchlength.volume(m).max              = max([typeanalysis.branchlength.volume(m).values]);
            typeanalysis.branchlength.volume(m).min              = min([typeanalysis.branchlength.volume(m).values]);
            typeanalysis.branchlength.volume(m).skew             = skewness([typeanalysis.branchlength.volume(m).values],0);
            typeanalysis.branchlength.volume(m).kurt             = kurtosis([typeanalysis.branchlength.volume(m).values],0);
            typeanalysis.branchlength.volume(m).total            = sum([typeanalysis.branchlength.volume(m).values]);
            
            typeanalysis.branchlength.numbersegments(m).values           = popdata.branchlengthbins(m).numbersegments.values;
            typeanalysis.branchlength.numbersegments(m).mean             = mean([typeanalysis.branchlength.numbersegments(m).values]);
            typeanalysis.branchlength.numbersegments(m).std              = std([typeanalysis.branchlength.numbersegments(m).values]);
            typeanalysis.branchlength.numbersegments(m).max              = max([typeanalysis.branchlength.numbersegments(m).values]);
            typeanalysis.branchlength.numbersegments(m).min              = min([typeanalysis.branchlength.numbersegments(m).values]);
            typeanalysis.branchlength.numbersegments(m).skew             = skewness([typeanalysis.branchlength.numbersegments(m).values],0);
            typeanalysis.branchlength.numbersegments(m).kurt             = kurtosis([typeanalysis.branchlength.numbersegments(m).values],0);
            typeanalysis.branchlength.numbersegments(m).total            = sum([typeanalysis.branchlength.numbersegments(m).values]);
            
            typeanalysis.branchlength.numberbifurcations(m).values           = popdata.branchlengthbins(m).numberbifurcations.values;
            typeanalysis.branchlength.numberbifurcations(m).mean             = mean([typeanalysis.branchlength.numberbifurcations(m).values]);
            typeanalysis.branchlength.numberbifurcations(m).std              = std([typeanalysis.branchlength.numberbifurcations(m).values]);
            typeanalysis.branchlength.numberbifurcations(m).max              = max([typeanalysis.branchlength.numberbifurcations(m).values]);
            typeanalysis.branchlength.numberbifurcations(m).min              = min([typeanalysis.branchlength.numberbifurcations(m).values]);
            typeanalysis.branchlength.numberbifurcations(m).skew             = skewness([typeanalysis.branchlength.numberbifurcations(m).values],0);
            typeanalysis.branchlength.numberbifurcations(m).kurt             = kurtosis([typeanalysis.branchlength.numberbifurcations(m).values],0);
            typeanalysis.branchlength.numberbifurcations(m).total            = sum([typeanalysis.branchlength.numberbifurcations(m).values]);
            
            typeanalysis.branchlength.numberterminations(m).values           = popdata.branchlengthbins(m).numberterminations.values;
            typeanalysis.branchlength.numberterminations(m).mean             = mean([typeanalysis.branchlength.numberterminations(m).values]);
            typeanalysis.branchlength.numberterminations(m).std              = std([typeanalysis.branchlength.numberterminations(m).values]);
            typeanalysis.branchlength.numberterminations(m).max              = max([typeanalysis.branchlength.numberterminations(m).values]);
            typeanalysis.branchlength.numberterminations(m).min              = min([typeanalysis.branchlength.numberterminations(m).values]);
            typeanalysis.branchlength.numberterminations(m).skew             = skewness([typeanalysis.branchlength.numberterminations(m).values],0);
            typeanalysis.branchlength.numberterminations(m).kurt             = kurtosis([typeanalysis.branchlength.numberterminations(m).values],0);
            typeanalysis.branchlength.numberterminations(m).total            = sum([typeanalysis.branchlength.numberterminations(m).values]);
            
            typeanalysis.branchlength.numberbifurcatingbranches(m).values           = popdata.branchlengthbins(m).numberbifurcatingbranches.values;
            typeanalysis.branchlength.numberbifurcatingbranches(m).mean             = mean([typeanalysis.branchlength.numberbifurcatingbranches(m).values]);
            typeanalysis.branchlength.numberbifurcatingbranches(m).std              = std([typeanalysis.branchlength.numberbifurcatingbranches(m).values]);
            typeanalysis.branchlength.numberbifurcatingbranches(m).max              = max([typeanalysis.branchlength.numberbifurcatingbranches(m).values]);
            typeanalysis.branchlength.numberbifurcatingbranches(m).min              = min([typeanalysis.branchlength.numberbifurcatingbranches(m).values]);
            typeanalysis.branchlength.numberbifurcatingbranches(m).skew             = skewness([typeanalysis.branchlength.numberbifurcatingbranches(m).values],0);
            typeanalysis.branchlength.numberbifurcatingbranches(m).kurt             = kurtosis([typeanalysis.branchlength.numberbifurcatingbranches(m).values],0);
            typeanalysis.branchlength.numberbifurcatingbranches(m).total            = sum([typeanalysis.branchlength.numberbifurcatingbranches(m).values]);
            
            typeanalysis.branchlength.numberterminatingbranches(m).values           = popdata.branchlengthbins(m).numberterminatingbranches.values;
            typeanalysis.branchlength.numberterminatingbranches(m).mean             = mean([typeanalysis.branchlength.numberterminatingbranches(m).values]);
            typeanalysis.branchlength.numberterminatingbranches(m).std              = std([typeanalysis.branchlength.numberterminatingbranches(m).values]);
            typeanalysis.branchlength.numberterminatingbranches(m).max              = max([typeanalysis.branchlength.numberterminatingbranches(m).values]);
            typeanalysis.branchlength.numberterminatingbranches(m).min              = min([typeanalysis.branchlength.numberterminatingbranches(m).values]);
            typeanalysis.branchlength.numberterminatingbranches(m).skew             = skewness([typeanalysis.branchlength.numberterminatingbranches(m).values],0);
            typeanalysis.branchlength.numberterminatingbranches(m).kurt             = kurtosis([typeanalysis.branchlength.numberterminatingbranches(m).values],0);
            typeanalysis.branchlength.numberterminatingbranches(m).total            = sum([typeanalysis.branchlength.numberterminatingbranches(m).values]);
            
            typeanalysis.branchlength.rallratio(m).values           = popdata.branchlengthbins(m).rallratio.values;
            typeanalysis.branchlength.rallratio(m).mean             = mean([typeanalysis.branchlength.rallratio(m).values]);
            typeanalysis.branchlength.rallratio(m).std              = std([typeanalysis.branchlength.rallratio(m).values]);
            typeanalysis.branchlength.rallratio(m).max              = max([typeanalysis.branchlength.rallratio(m).values]);
            typeanalysis.branchlength.rallratio(m).min              = min([typeanalysis.branchlength.rallratio(m).values]);
            typeanalysis.branchlength.rallratio(m).skew             = skewness([typeanalysis.branchlength.rallratio(m).values],0);
            typeanalysis.branchlength.rallratio(m).kurt             = kurtosis([typeanalysis.branchlength.rallratio(m).values],0);
            
            typeanalysis.branchlength.rallratio1(m).values           = popdata.branchlengthbins(m).rallratio1.values;
            typeanalysis.branchlength.rallratio1(m).mean             = mean([typeanalysis.branchlength.rallratio1(m).values]);
            typeanalysis.branchlength.rallratio1(m).std              = std([typeanalysis.branchlength.rallratio1(m).values]);
            typeanalysis.branchlength.rallratio1(m).max              = max([typeanalysis.branchlength.rallratio1(m).values]);
            typeanalysis.branchlength.rallratio1(m).min              = min([typeanalysis.branchlength.rallratio1(m).values]);
            typeanalysis.branchlength.rallratio1(m).skew             = skewness([typeanalysis.branchlength.rallratio1(m).values],0);
            typeanalysis.branchlength.rallratio1(m).kurt             = kurtosis([typeanalysis.branchlength.rallratio1(m).values],0);
            
            typeanalysis.branchlength.rallratio2(m).values           = popdata.branchlengthbins(m).rallratio2.values;
            typeanalysis.branchlength.rallratio2(m).mean             = mean([typeanalysis.branchlength.rallratio2(m).values]);
            typeanalysis.branchlength.rallratio2(m).std              = std([typeanalysis.branchlength.rallratio2(m).values]);
            typeanalysis.branchlength.rallratio2(m).max              = max([typeanalysis.branchlength.rallratio2(m).values]);
            typeanalysis.branchlength.rallratio2(m).min              = min([typeanalysis.branchlength.rallratio2(m).values]);
            typeanalysis.branchlength.rallratio2(m).skew             = skewness([typeanalysis.branchlength.rallratio2(m).values],0);
            typeanalysis.branchlength.rallratio2(m).kurt             = kurtosis([typeanalysis.branchlength.rallratio2(m).values],0);
            
            typeanalysis.branchlength.rallratio3(m).values           = popdata.branchlengthbins(m).rallratio3.values;
            typeanalysis.branchlength.rallratio3(m).mean             = mean([typeanalysis.branchlength.rallratio3(m).values]);
            typeanalysis.branchlength.rallratio3(m).std              = std([typeanalysis.branchlength.rallratio3(m).values]);
            typeanalysis.branchlength.rallratio3(m).max              = max([typeanalysis.branchlength.rallratio3(m).values]);
            typeanalysis.branchlength.rallratio3(m).min              = min([typeanalysis.branchlength.rallratio3(m).values]);
            typeanalysis.branchlength.rallratio3(m).skew             = skewness([typeanalysis.branchlength.rallratio3(m).values],0);
            typeanalysis.branchlength.rallratio3(m).kurt             = kurtosis([typeanalysis.branchlength.rallratio3(m).values],0);
            
            typeanalysis.branchlength.daughterratio(m).values           = popdata.branchlengthbins(m).daughterratio.values;
            typeanalysis.branchlength.daughterratio(m).mean             = mean([typeanalysis.branchlength.daughterratio(m).values]);
            typeanalysis.branchlength.daughterratio(m).std              = std([typeanalysis.branchlength.daughterratio(m).values]);
            typeanalysis.branchlength.daughterratio(m).max              = max([typeanalysis.branchlength.daughterratio(m).values]);
            typeanalysis.branchlength.daughterratio(m).min              = min([typeanalysis.branchlength.daughterratio(m).values]);
            typeanalysis.branchlength.daughterratio(m).skew             = skewness([typeanalysis.branchlength.daughterratio(m).values],0);
            typeanalysis.branchlength.daughterratio(m).kurt             = kurtosis([typeanalysis.branchlength.daughterratio(m).values],0);
            
            typeanalysis.branchlength.parentdaughterratio(m).values           = popdata.branchlengthbins(m).parentdaughterratio.values;
            typeanalysis.branchlength.parentdaughterratio(m).mean             = mean([typeanalysis.branchlength.parentdaughterratio(m).values]);
            typeanalysis.branchlength.parentdaughterratio(m).std              = std([typeanalysis.branchlength.parentdaughterratio(m).values]);
            typeanalysis.branchlength.parentdaughterratio(m).max              = max([typeanalysis.branchlength.parentdaughterratio(m).values]);
            typeanalysis.branchlength.parentdaughterratio(m).min              = min([typeanalysis.branchlength.parentdaughterratio(m).values]);
            typeanalysis.branchlength.parentdaughterratio(m).skew             = skewness([typeanalysis.branchlength.parentdaughterratio(m).values],0);
            typeanalysis.branchlength.parentdaughterratio(m).kurt             = kurtosis([typeanalysis.branchlength.parentdaughterratio(m).values],0);
            
            typeanalysis.branchlength.parentdaughter2ratio(m).values           = popdata.branchlengthbins(m).parentdaughter2ratio.values;
            typeanalysis.branchlength.parentdaughter2ratio(m).mean             = mean([typeanalysis.branchlength.parentdaughter2ratio(m).values]);
            typeanalysis.branchlength.parentdaughter2ratio(m).std              = std([typeanalysis.branchlength.parentdaughter2ratio(m).values]);
            typeanalysis.branchlength.parentdaughter2ratio(m).max              = max([typeanalysis.branchlength.parentdaughter2ratio(m).values]);
            typeanalysis.branchlength.parentdaughter2ratio(m).min              = min([typeanalysis.branchlength.parentdaughter2ratio(m).values]);
            typeanalysis.branchlength.parentdaughter2ratio(m).skew             = skewness([typeanalysis.branchlength.parentdaughter2ratio(m).values],0);
            typeanalysis.branchlength.parentdaughter2ratio(m).kurt             = kurtosis([typeanalysis.branchlength.parentdaughter2ratio(m).values],0);
            
            typeanalysis.branchlength.diameter(m).values           = popdata.branchlengthbins(m).diameter.values;
            typeanalysis.branchlength.diameter(m).mean             = mean([typeanalysis.branchlength.diameter(m).values]);
            typeanalysis.branchlength.diameter(m).std              = std([typeanalysis.branchlength.diameter(m).values]);
            typeanalysis.branchlength.diameter(m).max              = max([typeanalysis.branchlength.diameter(m).values]);
            typeanalysis.branchlength.diameter(m).min              = min([typeanalysis.branchlength.diameter(m).values]);
            typeanalysis.branchlength.diameter(m).skew             = skewness([typeanalysis.branchlength.diameter(m).values],0);
            typeanalysis.branchlength.diameter(m).kurt             = kurtosis([typeanalysis.branchlength.diameter(m).values],0);
            
            typeanalysis.branchlength.taperrate(m).values           = popdata.branchlengthbins(m).taperrate.values;
            typeanalysis.branchlength.taperrate(m).mean             = sum([popdata.branchlengthbins(m).taperrate.values].*[popdata.branchlengthbins(m).taperratelength.values])/sum([popdata.branchlengthbins(m).taperratelength.values]);
            %typeanalysis.branchlength.taperrate(m).mean             = mean([popdata.branchlengthbins(m).taperrate.values].*[popdata.branchlengthbins(m).taperratelength.values])/sum([popdata.branchlengthbins(m).taperratelength.values]);
            typeanalysis.branchlength.taperrate(m).std              = std([typeanalysis.branchlength.taperrate(m).values]);
            typeanalysis.branchlength.taperrate(m).max              = max([typeanalysis.branchlength.taperrate(m).values]);
            typeanalysis.branchlength.taperrate(m).min              = min([typeanalysis.branchlength.taperrate(m).values]);
            typeanalysis.branchlength.taperrate(m).skew             = skewness([typeanalysis.branchlength.taperrate(m).values],0);
            typeanalysis.branchlength.taperrate(m).kurt             = kurtosis([typeanalysis.branchlength.taperrate(m).values],0);
            
            typeanalysis.branchlength.bifurcationprobability.length(m) = typeanalysis.branchlength.numberbifurcations(m).total / typeanalysis.branchlength.length(m).total;
            typeanalysis.branchlength.terminationprobability.length(m) = typeanalysis.branchlength.numberterminations(m).total / typeanalysis.branchlength.length(m).total;
            
            typeanalysis.branchlength.bifurcationprobability.surfacearea(m) = typeanalysis.branchlength.numberbifurcations(m).total / typeanalysis.branchlength.surfacearea(m).total;
            typeanalysis.branchlength.terminationprobability.surfacearea(m) = typeanalysis.branchlength.numberterminations(m).total / typeanalysis.branchlength.surfacearea(m).total;
            
            typeanalysis.branchlength.bifurcationprobability.volume(m) = typeanalysis.branchlength.numberbifurcations(m).total / typeanalysis.branchlength.volume(m).total;
            typeanalysis.branchlength.terminationprobability.volume(m) = typeanalysis.branchlength.numberterminations(m).total / typeanalysis.branchlength.volume(m).total;
            
        end
        
        typeanalysis.branchlength = orderfields(typeanalysis.branchlength);
        
        
        
        
        
        
        
        % Begin bifurcation branch length analysis
        
        clear maxbranchlengthbin;
        maxbranchlengthbin = ceil(popdata.bifurcation.maxbranchlength / branchlengthbinwidth);
        for n = 1:maxbranchlengthbin
            popdata.bifurcation.branchlengthbins(n).rallratio.values            = [];
            popdata.bifurcation.branchlengthbins(n).rallratio1.values           = [];
            popdata.bifurcation.branchlengthbins(n).rallratio2.values           = [];
            popdata.bifurcation.branchlengthbins(n).rallratio3.values           = [];
            popdata.bifurcation.branchlengthbins(n).daughterratio.values        = [];
            popdata.bifurcation.branchlengthbins(n).parentdaughterratio.values  = [];
            popdata.bifurcation.branchlengthbins(n).parentdaughter2ratio.values = [];
            popdata.bifurcation.branchlengthbins(n).taperrate.values            = [];
            popdata.bifurcation.branchlengthbins(n).taperratelength.values      = [];
        end
        
        
        for i = 1:length(data.individual)
            
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            
            if isfield(inddata.bifurcation,'branchlengthbins')
                
                for j = 1:length(inddata.bifurcation.branchlengthbins)
                    
                    inddata.bifurcation.branchlengthbins(j).length                      = sum([inddata.bifurcation.branchlengthbins(j).piece.length]);
                    inddata.bifurcation.branchlengthbins(j).surfacearea                 = sum([inddata.bifurcation.branchlengthbins(j).piece.surfacearea]);
                    inddata.bifurcation.branchlengthbins(j).volume                      = sum([inddata.bifurcation.branchlengthbins(j).piece.volume]);
                    inddata.bifurcation.branchlengthbins(j).numbersegments              = length(unique([inddata.bifurcation.branchlengthbins(j).piece.cable]));
                    inddata.bifurcation.branchlengthbins(j).numberbifurcations          = 0;
                    inddata.bifurcation.branchlengthbins(j).rallratio.values            = [inddata.bifurcation.branchlengthbins(j).piece.rallratio];
                    inddata.bifurcation.branchlengthbins(j).rallratio1.values           = [inddata.bifurcation.branchlengthbins(j).piece.rallratio1];
                    inddata.bifurcation.branchlengthbins(j).rallratio2.values           = [inddata.bifurcation.branchlengthbins(j).piece.rallratio2];
                    inddata.bifurcation.branchlengthbins(j).rallratio3.values           = [inddata.bifurcation.branchlengthbins(j).piece.rallratio3];
                    inddata.bifurcation.branchlengthbins(j).daughterratio.values        = [inddata.bifurcation.branchlengthbins(j).piece.daughterratio];
                    inddata.bifurcation.branchlengthbins(j).parentdaughterratio.values  = [inddata.bifurcation.branchlengthbins(j).piece.parentdaughterratio];
                    inddata.bifurcation.branchlengthbins(j).parentdaughter2ratio.values = [inddata.bifurcation.branchlengthbins(j).piece.parentdaughter2ratio];
                    inddata.bifurcation.branchlengthbins(j).diameter                    = ((4*inddata.bifurcation.branchlengthbins(j).volume)/(pi()*inddata.bifurcation.branchlengthbins(j).length))^0.5;
                    inddata.bifurcation.branchlengthbins(j).taperrate.values            = [inddata.bifurcation.branchlengthbins(j).piece.taperrate];
                    inddata.bifurcation.branchlengthbins(j).taperratelength.values      = [inddata.bifurcation.branchlengthbins(j).piece.length];
                    
                    for k = 1:length(inddata.bifurcation.branchlengthbins(j).piece)
                        if strcmp(inddata.bifurcation.branchlengthbins(j).piece(k).distaltype,'bifurcation')==1
                            inddata.bifurcation.branchlengthbins(j).numberbifurcations = 1 + inddata.bifurcation.branchlengthbins(j).numberbifurcations;
                        end
                        if strcmp(inddata.bifurcation.branchlengthbins(j).piece(k).distaltype,'m-furcation')==1
                            inddata.bifurcation.branchlengthbins(j).numberbifurcations = length(inddata.bifurcation.branchlengthbins(j).piece(k).daughters) - 1 + inddata.bifurcation.branchlengthbins(j).numberbifurcations;
                        end
                    end
                    
                    if isfield(popdata,'branchlengthbins') == 0; nextvalue = 1;
                    elseif j > length(popdata.bifurcation.branchlengthbins); nextvalue = 1;
                    elseif isfield(popdata.bifurcation.branchlengthbins(j),'length') == 0; nextvalue = 1;
                    elseif isfield(popdata.bifurcation.branchlengthbins(j).length,'values') == 0; nextvalue = 1;
                    else nextvalue = 1 + length(popdata.bifurcation.branchlengthbins(j).length.values);
                    end
                    popdata.bifurcation.branchlengthbins(j).length.values(nextvalue)             = inddata.bifurcation.branchlengthbins(j).length;
                    popdata.bifurcation.branchlengthbins(j).surfacearea.values(nextvalue)        = inddata.bifurcation.branchlengthbins(j).surfacearea;
                    popdata.bifurcation.branchlengthbins(j).volume.values(nextvalue)             = inddata.bifurcation.branchlengthbins(j).volume;
                    popdata.bifurcation.branchlengthbins(j).numbersegments.values(nextvalue)     = inddata.bifurcation.branchlengthbins(j).numbersegments;
                    popdata.bifurcation.branchlengthbins(j).numberbifurcations.values(nextvalue) = inddata.bifurcation.branchlengthbins(j).numberbifurcations;
                    popdata.bifurcation.branchlengthbins(j).rallratio.values                     = [ [popdata.bifurcation.branchlengthbins(j).rallratio.values] [inddata.bifurcation.branchlengthbins(j).rallratio.values] ];
                    popdata.bifurcation.branchlengthbins(j).rallratio1.values                    = [ [popdata.bifurcation.branchlengthbins(j).rallratio1.values] [inddata.bifurcation.branchlengthbins(j).rallratio1.values] ];
                    popdata.bifurcation.branchlengthbins(j).rallratio2.values                    = [ [popdata.bifurcation.branchlengthbins(j).rallratio2.values] [inddata.bifurcation.branchlengthbins(j).rallratio2.values] ];
                    popdata.bifurcation.branchlengthbins(j).rallratio3.values                    = [ [popdata.bifurcation.branchlengthbins(j).rallratio3.values] [inddata.bifurcation.branchlengthbins(j).rallratio3.values] ];
                    popdata.bifurcation.branchlengthbins(j).daughterratio.values                 = [ [popdata.bifurcation.branchlengthbins(j).daughterratio.values] [inddata.bifurcation.branchlengthbins(j).daughterratio.values] ];
                    popdata.bifurcation.branchlengthbins(j).parentdaughterratio.values           = [ [popdata.bifurcation.branchlengthbins(j).parentdaughterratio.values] [inddata.bifurcation.branchlengthbins(j).parentdaughterratio.values] ];
                    popdata.bifurcation.branchlengthbins(j).parentdaughter2ratio.values          = [ [popdata.bifurcation.branchlengthbins(j).parentdaughter2ratio.values] [inddata.bifurcation.branchlengthbins(j).parentdaughter2ratio.values] ];
                    popdata.bifurcation.branchlengthbins(j).diameter.values(nextvalue)           = inddata.bifurcation.branchlengthbins(j).diameter;
                    popdata.bifurcation.branchlengthbins(j).taperrate.values                     = [ [popdata.bifurcation.branchlengthbins(j).taperrate.values] [inddata.bifurcation.branchlengthbins(j).taperrate.values] ];
                    popdata.bifurcation.branchlengthbins(j).taperratelength.values               = [ [popdata.bifurcation.branchlengthbins(j).taperratelength.values] [inddata.bifurcation.branchlengthbins(j).taperratelength.values] ];
                    
                    clear nextvalue;
                end
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        for m = 1:length(popdata.bifurcation.branchlengthbins)
            
            typeanalysis.bifurcation.branchlength.branchlength(m)              = (branchlengthbinwidth * m) - (branchlengthbinwidth / 2);
            
            typeanalysis.bifurcation.branchlength.length(m).values           = popdata.bifurcation.branchlengthbins(m).length.values;
            typeanalysis.bifurcation.branchlength.length(m).mean             = mean([typeanalysis.bifurcation.branchlength.length(m).values]);
            typeanalysis.bifurcation.branchlength.length(m).std              = std([typeanalysis.bifurcation.branchlength.length(m).values]);
            typeanalysis.bifurcation.branchlength.length(m).max              = max([typeanalysis.bifurcation.branchlength.length(m).values]);
            typeanalysis.bifurcation.branchlength.length(m).min              = min([typeanalysis.bifurcation.branchlength.length(m).values]);
            typeanalysis.bifurcation.branchlength.length(m).skew             = skewness([typeanalysis.bifurcation.branchlength.length(m).values],0);
            typeanalysis.bifurcation.branchlength.length(m).kurt             = kurtosis([typeanalysis.bifurcation.branchlength.length(m).values],0);
            typeanalysis.bifurcation.branchlength.length(m).total            = sum([typeanalysis.bifurcation.branchlength.length(m).values]);
            
            typeanalysis.bifurcation.branchlength.surfacearea(m).values           = popdata.bifurcation.branchlengthbins(m).surfacearea.values;
            typeanalysis.bifurcation.branchlength.surfacearea(m).mean             = mean([typeanalysis.bifurcation.branchlength.surfacearea(m).values]);
            typeanalysis.bifurcation.branchlength.surfacearea(m).std              = std([typeanalysis.bifurcation.branchlength.surfacearea(m).values]);
            typeanalysis.bifurcation.branchlength.surfacearea(m).max              = max([typeanalysis.bifurcation.branchlength.surfacearea(m).values]);
            typeanalysis.bifurcation.branchlength.surfacearea(m).min              = min([typeanalysis.bifurcation.branchlength.surfacearea(m).values]);
            typeanalysis.bifurcation.branchlength.surfacearea(m).skew             = skewness([typeanalysis.bifurcation.branchlength.surfacearea(m).values],0);
            typeanalysis.bifurcation.branchlength.surfacearea(m).kurt             = kurtosis([typeanalysis.bifurcation.branchlength.surfacearea(m).values],0);
            typeanalysis.bifurcation.branchlength.surfacearea(m).total            = sum([typeanalysis.bifurcation.branchlength.surfacearea(m).values]);
            
            typeanalysis.bifurcation.branchlength.volume(m).values           = popdata.bifurcation.branchlengthbins(m).volume.values;
            typeanalysis.bifurcation.branchlength.volume(m).mean             = mean([typeanalysis.bifurcation.branchlength.volume(m).values]);
            typeanalysis.bifurcation.branchlength.volume(m).std              = std([typeanalysis.bifurcation.branchlength.volume(m).values]);
            typeanalysis.bifurcation.branchlength.volume(m).max              = max([typeanalysis.bifurcation.branchlength.volume(m).values]);
            typeanalysis.bifurcation.branchlength.volume(m).min              = min([typeanalysis.bifurcation.branchlength.volume(m).values]);
            typeanalysis.bifurcation.branchlength.volume(m).skew             = skewness([typeanalysis.bifurcation.branchlength.volume(m).values],0);
            typeanalysis.bifurcation.branchlength.volume(m).kurt             = kurtosis([typeanalysis.bifurcation.branchlength.volume(m).values],0);
            typeanalysis.bifurcation.branchlength.volume(m).total            = sum([typeanalysis.bifurcation.branchlength.volume(m).values]);
            
            typeanalysis.bifurcation.branchlength.numbersegments(m).values           = popdata.bifurcation.branchlengthbins(m).numbersegments.values;
            typeanalysis.bifurcation.branchlength.numbersegments(m).mean             = mean([typeanalysis.bifurcation.branchlength.numbersegments(m).values]);
            typeanalysis.bifurcation.branchlength.numbersegments(m).std              = std([typeanalysis.bifurcation.branchlength.numbersegments(m).values]);
            typeanalysis.bifurcation.branchlength.numbersegments(m).max              = max([typeanalysis.bifurcation.branchlength.numbersegments(m).values]);
            typeanalysis.bifurcation.branchlength.numbersegments(m).min              = min([typeanalysis.bifurcation.branchlength.numbersegments(m).values]);
            typeanalysis.bifurcation.branchlength.numbersegments(m).skew             = skewness([typeanalysis.bifurcation.branchlength.numbersegments(m).values],0);
            typeanalysis.bifurcation.branchlength.numbersegments(m).kurt             = kurtosis([typeanalysis.bifurcation.branchlength.numbersegments(m).values],0);
            typeanalysis.bifurcation.branchlength.numbersegments(m).total            = sum([typeanalysis.bifurcation.branchlength.numbersegments(m).values]);
            
            typeanalysis.bifurcation.branchlength.numberbifurcations(m).values           = popdata.bifurcation.branchlengthbins(m).numberbifurcations.values;
            typeanalysis.bifurcation.branchlength.numberbifurcations(m).mean             = mean([typeanalysis.bifurcation.branchlength.numberbifurcations(m).values]);
            typeanalysis.bifurcation.branchlength.numberbifurcations(m).std              = std([typeanalysis.bifurcation.branchlength.numberbifurcations(m).values]);
            typeanalysis.bifurcation.branchlength.numberbifurcations(m).max              = max([typeanalysis.bifurcation.branchlength.numberbifurcations(m).values]);
            typeanalysis.bifurcation.branchlength.numberbifurcations(m).min              = min([typeanalysis.bifurcation.branchlength.numberbifurcations(m).values]);
            typeanalysis.bifurcation.branchlength.numberbifurcations(m).skew             = skewness([typeanalysis.bifurcation.branchlength.numberbifurcations(m).values],0);
            typeanalysis.bifurcation.branchlength.numberbifurcations(m).kurt             = kurtosis([typeanalysis.bifurcation.branchlength.numberbifurcations(m).values],0);
            typeanalysis.bifurcation.branchlength.numberbifurcations(m).total            = sum([typeanalysis.bifurcation.branchlength.numberbifurcations(m).values]);
            
            typeanalysis.bifurcation.branchlength.rallratio(m).values           = popdata.bifurcation.branchlengthbins(m).rallratio.values;
            typeanalysis.bifurcation.branchlength.rallratio(m).mean             = mean([typeanalysis.bifurcation.branchlength.rallratio(m).values]);
            typeanalysis.bifurcation.branchlength.rallratio(m).std              = std([typeanalysis.bifurcation.branchlength.rallratio(m).values]);
            typeanalysis.bifurcation.branchlength.rallratio(m).max              = max([typeanalysis.bifurcation.branchlength.rallratio(m).values]);
            typeanalysis.bifurcation.branchlength.rallratio(m).min              = min([typeanalysis.bifurcation.branchlength.rallratio(m).values]);
            typeanalysis.bifurcation.branchlength.rallratio(m).skew             = skewness([typeanalysis.bifurcation.branchlength.rallratio(m).values],0);
            typeanalysis.bifurcation.branchlength.rallratio(m).kurt             = kurtosis([typeanalysis.bifurcation.branchlength.rallratio(m).values],0);
            
            typeanalysis.bifurcation.branchlength.rallratio1(m).values           = popdata.bifurcation.branchlengthbins(m).rallratio1.values;
            typeanalysis.bifurcation.branchlength.rallratio1(m).mean             = mean([typeanalysis.bifurcation.branchlength.rallratio1(m).values]);
            typeanalysis.bifurcation.branchlength.rallratio1(m).std              = std([typeanalysis.bifurcation.branchlength.rallratio1(m).values]);
            typeanalysis.bifurcation.branchlength.rallratio1(m).max              = max([typeanalysis.bifurcation.branchlength.rallratio1(m).values]);
            typeanalysis.bifurcation.branchlength.rallratio1(m).min              = min([typeanalysis.bifurcation.branchlength.rallratio1(m).values]);
            typeanalysis.bifurcation.branchlength.rallratio1(m).skew             = skewness([typeanalysis.bifurcation.branchlength.rallratio1(m).values],0);
            typeanalysis.bifurcation.branchlength.rallratio1(m).kurt             = kurtosis([typeanalysis.bifurcation.branchlength.rallratio1(m).values],0);
            
            typeanalysis.bifurcation.branchlength.rallratio2(m).values           = popdata.bifurcation.branchlengthbins(m).rallratio2.values;
            typeanalysis.bifurcation.branchlength.rallratio2(m).mean             = mean([typeanalysis.bifurcation.branchlength.rallratio2(m).values]);
            typeanalysis.bifurcation.branchlength.rallratio2(m).std              = std([typeanalysis.bifurcation.branchlength.rallratio2(m).values]);
            typeanalysis.bifurcation.branchlength.rallratio2(m).max              = max([typeanalysis.bifurcation.branchlength.rallratio2(m).values]);
            typeanalysis.bifurcation.branchlength.rallratio2(m).min              = min([typeanalysis.bifurcation.branchlength.rallratio2(m).values]);
            typeanalysis.bifurcation.branchlength.rallratio2(m).skew             = skewness([typeanalysis.bifurcation.branchlength.rallratio2(m).values],0);
            typeanalysis.bifurcation.branchlength.rallratio2(m).kurt             = kurtosis([typeanalysis.bifurcation.branchlength.rallratio2(m).values],0);
            
            typeanalysis.bifurcation.branchlength.rallratio3(m).values           = popdata.bifurcation.branchlengthbins(m).rallratio3.values;
            typeanalysis.bifurcation.branchlength.rallratio3(m).mean             = mean([typeanalysis.bifurcation.branchlength.rallratio3(m).values]);
            typeanalysis.bifurcation.branchlength.rallratio3(m).std              = std([typeanalysis.bifurcation.branchlength.rallratio3(m).values]);
            typeanalysis.bifurcation.branchlength.rallratio3(m).max              = max([typeanalysis.bifurcation.branchlength.rallratio3(m).values]);
            typeanalysis.bifurcation.branchlength.rallratio3(m).min              = min([typeanalysis.bifurcation.branchlength.rallratio3(m).values]);
            typeanalysis.bifurcation.branchlength.rallratio3(m).skew             = skewness([typeanalysis.bifurcation.branchlength.rallratio3(m).values],0);
            typeanalysis.bifurcation.branchlength.rallratio3(m).kurt             = kurtosis([typeanalysis.bifurcation.branchlength.rallratio3(m).values],0);
            
            typeanalysis.bifurcation.branchlength.daughterratio(m).values           = popdata.bifurcation.branchlengthbins(m).daughterratio.values;
            typeanalysis.bifurcation.branchlength.daughterratio(m).mean             = mean([typeanalysis.bifurcation.branchlength.daughterratio(m).values]);
            typeanalysis.bifurcation.branchlength.daughterratio(m).std              = std([typeanalysis.bifurcation.branchlength.daughterratio(m).values]);
            typeanalysis.bifurcation.branchlength.daughterratio(m).max              = max([typeanalysis.bifurcation.branchlength.daughterratio(m).values]);
            typeanalysis.bifurcation.branchlength.daughterratio(m).min              = min([typeanalysis.bifurcation.branchlength.daughterratio(m).values]);
            typeanalysis.bifurcation.branchlength.daughterratio(m).skew             = skewness([typeanalysis.bifurcation.branchlength.daughterratio(m).values],0);
            typeanalysis.bifurcation.branchlength.daughterratio(m).kurt             = kurtosis([typeanalysis.bifurcation.branchlength.daughterratio(m).values],0);
            
            typeanalysis.bifurcation.branchlength.parentdaughterratio(m).values           = popdata.bifurcation.branchlengthbins(m).parentdaughterratio.values;
            typeanalysis.bifurcation.branchlength.parentdaughterratio(m).mean             = mean([typeanalysis.bifurcation.branchlength.parentdaughterratio(m).values]);
            typeanalysis.bifurcation.branchlength.parentdaughterratio(m).std              = std([typeanalysis.bifurcation.branchlength.parentdaughterratio(m).values]);
            typeanalysis.bifurcation.branchlength.parentdaughterratio(m).max              = max([typeanalysis.bifurcation.branchlength.parentdaughterratio(m).values]);
            typeanalysis.bifurcation.branchlength.parentdaughterratio(m).min              = min([typeanalysis.bifurcation.branchlength.parentdaughterratio(m).values]);
            typeanalysis.bifurcation.branchlength.parentdaughterratio(m).skew             = skewness([typeanalysis.bifurcation.branchlength.parentdaughterratio(m).values],0);
            typeanalysis.bifurcation.branchlength.parentdaughterratio(m).kurt             = kurtosis([typeanalysis.bifurcation.branchlength.parentdaughterratio(m).values],0);
            
            typeanalysis.bifurcation.branchlength.parentdaughter2ratio(m).values           = popdata.bifurcation.branchlengthbins(m).parentdaughter2ratio.values;
            typeanalysis.bifurcation.branchlength.parentdaughter2ratio(m).mean             = mean([typeanalysis.bifurcation.branchlength.parentdaughter2ratio(m).values]);
            typeanalysis.bifurcation.branchlength.parentdaughter2ratio(m).std              = std([typeanalysis.bifurcation.branchlength.parentdaughter2ratio(m).values]);
            typeanalysis.bifurcation.branchlength.parentdaughter2ratio(m).max              = max([typeanalysis.bifurcation.branchlength.parentdaughter2ratio(m).values]);
            typeanalysis.bifurcation.branchlength.parentdaughter2ratio(m).min              = min([typeanalysis.bifurcation.branchlength.parentdaughter2ratio(m).values]);
            typeanalysis.bifurcation.branchlength.parentdaughter2ratio(m).skew             = skewness([typeanalysis.bifurcation.branchlength.parentdaughter2ratio(m).values],0);
            typeanalysis.bifurcation.branchlength.parentdaughter2ratio(m).kurt             = kurtosis([typeanalysis.bifurcation.branchlength.parentdaughter2ratio(m).values],0);
            
            typeanalysis.bifurcation.branchlength.diameter(m).values           = popdata.bifurcation.branchlengthbins(m).diameter.values;
            typeanalysis.bifurcation.branchlength.diameter(m).mean             = mean([typeanalysis.bifurcation.branchlength.diameter(m).values]);
            typeanalysis.bifurcation.branchlength.diameter(m).std              = std([typeanalysis.bifurcation.branchlength.diameter(m).values]);
            typeanalysis.bifurcation.branchlength.diameter(m).max              = max([typeanalysis.bifurcation.branchlength.diameter(m).values]);
            typeanalysis.bifurcation.branchlength.diameter(m).min              = min([typeanalysis.bifurcation.branchlength.diameter(m).values]);
            typeanalysis.bifurcation.branchlength.diameter(m).skew             = skewness([typeanalysis.bifurcation.branchlength.diameter(m).values],0);
            typeanalysis.bifurcation.branchlength.diameter(m).kurt             = kurtosis([typeanalysis.bifurcation.branchlength.diameter(m).values],0);
            
            typeanalysis.bifurcation.branchlength.taperrate(m).values           = popdata.bifurcation.branchlengthbins(m).taperrate.values;
            typeanalysis.bifurcation.branchlength.taperrate(m).mean             = sum([popdata.bifurcation.branchlengthbins(m).taperrate.values].*[popdata.bifurcation.branchlengthbins(m).taperratelength.values])/sum([popdata.bifurcation.branchlengthbins(m).taperratelength.values]);
            %typeanalysis.bifurcation.branchlength.taperrate(m).mean             = mean([popdata.bifurcation.branchlengthbins(m).taperrate.values].*[popdata.bifurcation.branchlengthbins(m).taperratelength.values])/sum([popdata.bifurcation.branchlengthbins(m).taperratelength.values]);
            typeanalysis.bifurcation.branchlength.taperrate(m).std              = std([typeanalysis.bifurcation.branchlength.taperrate(m).values]);
            typeanalysis.bifurcation.branchlength.taperrate(m).max              = max([typeanalysis.bifurcation.branchlength.taperrate(m).values]);
            typeanalysis.bifurcation.branchlength.taperrate(m).min              = min([typeanalysis.bifurcation.branchlength.taperrate(m).values]);
            typeanalysis.bifurcation.branchlength.taperrate(m).skew             = skewness([typeanalysis.bifurcation.branchlength.taperrate(m).values],0);
            typeanalysis.bifurcation.branchlength.taperrate(m).kurt             = kurtosis([typeanalysis.bifurcation.branchlength.taperrate(m).values],0);
            
            typeanalysis.bifurcation.branchlength.bifurcationprobability.length(m)      = typeanalysis.bifurcation.branchlength.numberbifurcations(m).total / typeanalysis.bifurcation.branchlength.length(m).total;
            typeanalysis.bifurcation.branchlength.bifurcationprobability.surfacearea(m) = typeanalysis.bifurcation.branchlength.numberbifurcations(m).total / typeanalysis.bifurcation.branchlength.surfacearea(m).total;
            typeanalysis.bifurcation.branchlength.bifurcationprobability.volume(m)      = typeanalysis.bifurcation.branchlength.numberbifurcations(m).total / typeanalysis.bifurcation.branchlength.volume(m).total;
            
        end
        
        typeanalysis.bifurcation.branchlength = orderfields(typeanalysis.bifurcation.branchlength);
        
        
        
        
        
        
        
        
        
        % Begin termination branch length analysis
        
        clear maxbranchlengthbin;
        maxbranchlengthbin = ceil(popdata.termination.maxbranchlength / branchlengthbinwidth);
        for i = 1:maxbranchlengthbin
            popdata.termination.branchlengthbins(i).taperrate.values            = [];
            popdata.termination.branchlengthbins(i).taperratelength.values      = [];
        end
        
        
        for i = 1:length(data.individual)
            
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            
            for j = 1:length(inddata.termination.branchlengthbins)
                
                if isfield(inddata.termination.branchlengthbins(j).piece,'id') == 1
                    
                    inddata.termination.branchlengthbins(j).length                      = sum([inddata.termination.branchlengthbins(j).piece.length]);
                    inddata.termination.branchlengthbins(j).surfacearea                 = sum([inddata.termination.branchlengthbins(j).piece.surfacearea]);
                    inddata.termination.branchlengthbins(j).volume                      = sum([inddata.termination.branchlengthbins(j).piece.volume]);
                    inddata.termination.branchlengthbins(j).numbersegments              = length(unique([inddata.termination.branchlengthbins(j).piece.cable]));
                    inddata.termination.branchlengthbins(j).numberterminations          = 0;
                    inddata.termination.branchlengthbins(j).diameter                    = ((4*inddata.termination.branchlengthbins(j).volume)/(pi()*inddata.termination.branchlengthbins(j).length))^0.5;
                    inddata.termination.branchlengthbins(j).taperrate.values            = [inddata.termination.branchlengthbins(j).piece.taperrate];
                    inddata.termination.branchlengthbins(j).taperratelength.values      = [inddata.termination.branchlengthbins(j).piece.length];
                    
                    for k = 1:length(inddata.termination.branchlengthbins(j).piece)
                        if strcmp(inddata.termination.branchlengthbins(j).piece(k).distaltype,'termination')==1
                            inddata.termination.branchlengthbins(j).numberterminations = 1 + inddata.termination.branchlengthbins(j).numberterminations;
                        end
                    end
                    
                    if isfield(popdata,'branchlengthbins') == 0; nextvalue = 1;
                    elseif j > length(popdata.termination.branchlengthbins); nextvalue = 1;
                    elseif isfield(popdata.termination.branchlengthbins(j),'length') == 0; nextvalue = 1;
                    elseif isfield(popdata.termination.branchlengthbins(j).length,'values') == 0; nextvalue = 1;
                    else nextvalue = 1 + length(popdata.termination.branchlengthbins(j).length.values);
                    end
                    popdata.termination.branchlengthbins(j).length.values(nextvalue)             = inddata.termination.branchlengthbins(j).length;
                    popdata.termination.branchlengthbins(j).surfacearea.values(nextvalue)        = inddata.termination.branchlengthbins(j).surfacearea;
                    popdata.termination.branchlengthbins(j).volume.values(nextvalue)             = inddata.termination.branchlengthbins(j).volume;
                    popdata.termination.branchlengthbins(j).numbersegments.values(nextvalue)     = inddata.termination.branchlengthbins(j).numbersegments;
                    popdata.termination.branchlengthbins(j).numberterminations.values(nextvalue) = inddata.termination.branchlengthbins(j).numberterminations;
                    popdata.termination.branchlengthbins(j).diameter.values(nextvalue)           = inddata.termination.branchlengthbins(j).diameter;
                    popdata.termination.branchlengthbins(j).taperrate.values                     = [ [popdata.termination.branchlengthbins(j).taperrate.values] [inddata.termination.branchlengthbins(j).taperrate.values] ];
                    popdata.termination.branchlengthbins(j).taperratelength.values               = [ [popdata.termination.branchlengthbins(j).taperratelength.values] [inddata.termination.branchlengthbins(j).taperratelength.values] ];
                    
                    clear nextvalue;
                    
                end
                
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        for m = 1:length(popdata.termination.branchlengthbins)
            
            typeanalysis.termination.branchlength.branchlength(m)              = (branchlengthbinwidth * m) - (branchlengthbinwidth / 2);
            
            if isfield(popdata.termination.branchlengthbins(m).length,'values') == 1
                
                typeanalysis.termination.branchlength.length(m).values           = popdata.termination.branchlengthbins(m).length.values;
                typeanalysis.termination.branchlength.length(m).mean             = mean([typeanalysis.termination.branchlength.length(m).values]);
                typeanalysis.termination.branchlength.length(m).std              = std([typeanalysis.termination.branchlength.length(m).values]);
                typeanalysis.termination.branchlength.length(m).max              = max([typeanalysis.termination.branchlength.length(m).values]);
                typeanalysis.termination.branchlength.length(m).min              = min([typeanalysis.termination.branchlength.length(m).values]);
                typeanalysis.termination.branchlength.length(m).skew             = skewness([typeanalysis.termination.branchlength.length(m).values],0);
                typeanalysis.termination.branchlength.length(m).kurt             = kurtosis([typeanalysis.termination.branchlength.length(m).values],0);
                typeanalysis.termination.branchlength.length(m).total            = sum([typeanalysis.termination.branchlength.length(m).values]);
                
                typeanalysis.termination.branchlength.surfacearea(m).values           = popdata.termination.branchlengthbins(m).surfacearea.values;
                typeanalysis.termination.branchlength.surfacearea(m).mean             = mean([typeanalysis.termination.branchlength.surfacearea(m).values]);
                typeanalysis.termination.branchlength.surfacearea(m).std              = std([typeanalysis.termination.branchlength.surfacearea(m).values]);
                typeanalysis.termination.branchlength.surfacearea(m).max              = max([typeanalysis.termination.branchlength.surfacearea(m).values]);
                typeanalysis.termination.branchlength.surfacearea(m).min              = min([typeanalysis.termination.branchlength.surfacearea(m).values]);
                typeanalysis.termination.branchlength.surfacearea(m).skew             = skewness([typeanalysis.termination.branchlength.surfacearea(m).values],0);
                typeanalysis.termination.branchlength.surfacearea(m).kurt             = kurtosis([typeanalysis.termination.branchlength.surfacearea(m).values],0);
                typeanalysis.termination.branchlength.surfacearea(m).total            = sum([typeanalysis.termination.branchlength.surfacearea(m).values]);
                
                typeanalysis.termination.branchlength.volume(m).values           = popdata.termination.branchlengthbins(m).volume.values;
                typeanalysis.termination.branchlength.volume(m).mean             = mean([typeanalysis.termination.branchlength.volume(m).values]);
                typeanalysis.termination.branchlength.volume(m).std              = std([typeanalysis.termination.branchlength.volume(m).values]);
                typeanalysis.termination.branchlength.volume(m).max              = max([typeanalysis.termination.branchlength.volume(m).values]);
                typeanalysis.termination.branchlength.volume(m).min              = min([typeanalysis.termination.branchlength.volume(m).values]);
                typeanalysis.termination.branchlength.volume(m).skew             = skewness([typeanalysis.termination.branchlength.volume(m).values],0);
                typeanalysis.termination.branchlength.volume(m).kurt             = kurtosis([typeanalysis.termination.branchlength.volume(m).values],0);
                typeanalysis.termination.branchlength.volume(m).total            = sum([typeanalysis.termination.branchlength.volume(m).values]);
                
                typeanalysis.termination.branchlength.numbersegments(m).values           = popdata.termination.branchlengthbins(m).numbersegments.values;
                typeanalysis.termination.branchlength.numbersegments(m).mean             = mean([typeanalysis.termination.branchlength.numbersegments(m).values]);
                typeanalysis.termination.branchlength.numbersegments(m).std              = std([typeanalysis.termination.branchlength.numbersegments(m).values]);
                typeanalysis.termination.branchlength.numbersegments(m).max              = max([typeanalysis.termination.branchlength.numbersegments(m).values]);
                typeanalysis.termination.branchlength.numbersegments(m).min              = min([typeanalysis.termination.branchlength.numbersegments(m).values]);
                typeanalysis.termination.branchlength.numbersegments(m).skew             = skewness([typeanalysis.termination.branchlength.numbersegments(m).values],0);
                typeanalysis.termination.branchlength.numbersegments(m).kurt             = kurtosis([typeanalysis.termination.branchlength.numbersegments(m).values],0);
                typeanalysis.termination.branchlength.numbersegments(m).total            = sum([typeanalysis.termination.branchlength.numbersegments(m).values]);
                
                typeanalysis.termination.branchlength.numberterminations(m).values           = popdata.termination.branchlengthbins(m).numberterminations.values;
                typeanalysis.termination.branchlength.numberterminations(m).mean             = mean([typeanalysis.termination.branchlength.numberterminations(m).values]);
                typeanalysis.termination.branchlength.numberterminations(m).std              = std([typeanalysis.termination.branchlength.numberterminations(m).values]);
                typeanalysis.termination.branchlength.numberterminations(m).max              = max([typeanalysis.termination.branchlength.numberterminations(m).values]);
                typeanalysis.termination.branchlength.numberterminations(m).min              = min([typeanalysis.termination.branchlength.numberterminations(m).values]);
                typeanalysis.termination.branchlength.numberterminations(m).skew             = skewness([typeanalysis.termination.branchlength.numberterminations(m).values],0);
                typeanalysis.termination.branchlength.numberterminations(m).kurt             = kurtosis([typeanalysis.termination.branchlength.numberterminations(m).values],0);
                typeanalysis.termination.branchlength.numberterminations(m).total            = sum([typeanalysis.termination.branchlength.numberterminations(m).values]);
                
                typeanalysis.termination.branchlength.diameter(m).values           = popdata.termination.branchlengthbins(m).diameter.values;
                typeanalysis.termination.branchlength.diameter(m).mean             = mean([typeanalysis.termination.branchlength.diameter(m).values]);
                typeanalysis.termination.branchlength.diameter(m).std              = std([typeanalysis.termination.branchlength.diameter(m).values]);
                typeanalysis.termination.branchlength.diameter(m).max              = max([typeanalysis.termination.branchlength.diameter(m).values]);
                typeanalysis.termination.branchlength.diameter(m).min              = min([typeanalysis.termination.branchlength.diameter(m).values]);
                typeanalysis.termination.branchlength.diameter(m).skew             = skewness([typeanalysis.termination.branchlength.diameter(m).values],0);
                typeanalysis.termination.branchlength.diameter(m).kurt             = kurtosis([typeanalysis.termination.branchlength.diameter(m).values],0);
                
                typeanalysis.termination.branchlength.taperrate(m).values           = popdata.termination.branchlengthbins(m).taperrate.values;
                typeanalysis.termination.branchlength.taperrate(m).mean             = sum([popdata.termination.branchlengthbins(m).taperrate.values].*[popdata.termination.branchlengthbins(m).taperratelength.values])/sum([popdata.termination.branchlengthbins(m).taperratelength.values]);
                %typeanalysis.termination.branchlength.taperrate(m).mean             = mean([popdata.termination.branchlengthbins(m).taperrate.values].*[popdata.termination.branchlengthbins(m).taperratelength.values])/sum([popdata.termination.branchlengthbins(m).taperratelength.values]);
                typeanalysis.termination.branchlength.taperrate(m).std              = std([typeanalysis.termination.branchlength.taperrate(m).values]);
                typeanalysis.termination.branchlength.taperrate(m).max              = max([typeanalysis.termination.branchlength.taperrate(m).values]);
                typeanalysis.termination.branchlength.taperrate(m).min              = min([typeanalysis.termination.branchlength.taperrate(m).values]);
                typeanalysis.termination.branchlength.taperrate(m).skew             = skewness([typeanalysis.termination.branchlength.taperrate(m).values],0);
                typeanalysis.termination.branchlength.taperrate(m).kurt             = kurtosis([typeanalysis.termination.branchlength.taperrate(m).values],0);
                
            else
                typeanalysis.termination.branchlength.numbersegments(m).total     = 0;
                typeanalysis.termination.branchlength.numbersegments(m).mean      = NaN;
                typeanalysis.termination.branchlength.numbersegments(m).std       = NaN;
                typeanalysis.termination.branchlength.numberterminations(m).total = 0;
                typeanalysis.termination.branchlength.numberterminations(m).mean  = NaN;
                typeanalysis.termination.branchlength.numberterminations(m).std   = NaN;
                typeanalysis.termination.branchlength.length(m).total             = 0;
                typeanalysis.termination.branchlength.length(m).mean              = NaN;
                typeanalysis.termination.branchlength.length(m).std               = NaN;
                typeanalysis.termination.branchlength.surfacearea(m).total        = 0;
                typeanalysis.termination.branchlength.surfacearea(m).mean         = NaN;
                typeanalysis.termination.branchlength.surfacearea(m).std          = NaN;
                typeanalysis.termination.branchlength.volume(m).total             = 0;
                typeanalysis.termination.branchlength.volume(m).mean              = NaN;
                typeanalysis.termination.branchlength.volume(m).std               = NaN;
                typeanalysis.termination.branchlength.diameter(m).mean            = NaN;
                typeanalysis.termination.branchlength.diameter(m).std             = NaN;
                typeanalysis.termination.branchlength.taperrate(m).mean           = NaN;
                typeanalysis.termination.branchlength.taperrate(m).std            = NaN;
            end
            
            
            typeanalysis.termination.branchlength.terminationprobability.length(m)      = typeanalysis.termination.branchlength.numberterminations(m).total / typeanalysis.termination.branchlength.length(m).total;
            typeanalysis.termination.branchlength.terminationprobability.surfacearea(m) = typeanalysis.termination.branchlength.numberterminations(m).total / typeanalysis.termination.branchlength.surfacearea(m).total;
            typeanalysis.termination.branchlength.terminationprobability.volume(m)      = typeanalysis.termination.branchlength.numberterminations(m).total / typeanalysis.termination.branchlength.volume(m).total;
            
        end
        
        typeanalysis.termination.branchlength = orderfields(typeanalysis.termination.branchlength);
        
        
        eval(['analysis.' currentpiecetype ' = typeanalysis;']);
        eval(['data.population.' currentpiecetype ' = popdata;']);
        
    end
end

warning('on', 'MATLAB:divideByZero');