function [data,analysis]   = diameteranalyzer(data,analysis)

disp('   Diameter analysis started.');

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
        
        
        for i = 1:length(popdata.diameterbins)
            popdata.diameterbins(i).rallratio.values            = [];
            popdata.diameterbins(i).rallratio1.values           = [];
            popdata.diameterbins(i).rallratio2.values           = [];
            popdata.diameterbins(i).rallratio3.values           = [];
            popdata.diameterbins(i).daughterratio.values        = [];
            popdata.diameterbins(i).parentdaughterratio.values  = [];
            popdata.diameterbins(i).parentdaughter2ratio.values = [];
            popdata.diameterbins(i).meandiameter.values         = [];
            popdata.diameterbins(i).taperrate.values            = [];
            popdata.diameterbins(i).piecelength.values          = [];
        end
        
        
        for i = 1:length(data.individual)
            
            clear inddata;
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            
            for j = 1:length(inddata.diameterbins)
                
                inddata.diameterbins(j).length                      = 0;
                inddata.diameterbins(j).surfacearea                 = 0;
                inddata.diameterbins(j).volume                      = 0;
                inddata.diameterbins(j).numbersegments              = 0;
                inddata.diameterbins(j).numberbifurcations          = 0;
                inddata.diameterbins(j).numberterminations          = 0;
                inddata.diameterbins(j).numberbifurcatingbranches   = 0;
                inddata.diameterbins(j).numberterminatingbranches   = 0;
                inddata.diameterbins(j).rallratio.values            = [];
                inddata.diameterbins(j).rallratio1.values           = [];
                inddata.diameterbins(j).rallratio2.values           = [];
                inddata.diameterbins(j).rallratio3.values           = [];
                inddata.diameterbins(j).daughterratio.values        = [];
                inddata.diameterbins(j).parentdaughterratio.values  = [];
                inddata.diameterbins(j).parentdaughter2ratio.values = [];
                inddata.diameterbins(j).meandiameter.values         = [];
                inddata.diameterbins(j).taperrate.values            = [];
                inddata.diameterbins(j).piecelength.values          = [];
                
                
                if isfield(inddata.diameterbins(j).piece,'id') == 1
                    
                    inddata.diameterbins(j).length                      = sum([inddata.diameterbins(j).piece.length]);
                    inddata.diameterbins(j).surfacearea                 = sum([inddata.diameterbins(j).piece.surfacearea]);
                    inddata.diameterbins(j).volume                      = sum([inddata.diameterbins(j).piece.volume]);
                    inddata.diameterbins(j).numbersegments              = length(unique([inddata.diameterbins(j).piece.cable]));
                    inddata.diameterbins(j).numberbifurcations          = 0;
                    inddata.diameterbins(j).numberterminations          = 0;
                    inddata.diameterbins(j).numberbifurcatingbranches   = 0;
                    inddata.diameterbins(j).numberterminatingbranches   = 0;
                    inddata.diameterbins(j).rallratio.values            = [inddata.diameterbins(j).piece.rallratio];
                    inddata.diameterbins(j).rallratio1.values           = [inddata.diameterbins(j).piece.rallratio1];
                    inddata.diameterbins(j).rallratio2.values           = [inddata.diameterbins(j).piece.rallratio2];
                    inddata.diameterbins(j).rallratio3.values           = [inddata.diameterbins(j).piece.rallratio3];
                    inddata.diameterbins(j).daughterratio.values        = [inddata.diameterbins(j).piece.daughterratio];
                    inddata.diameterbins(j).parentdaughterratio.values  = [inddata.diameterbins(j).piece.parentdaughterratio];
                    inddata.diameterbins(j).parentdaughter2ratio.values = [inddata.diameterbins(j).piece.parentdaughter2ratio];
                    inddata.diameterbins(j).meandiameter.values         = ([inddata.diameterbins(j).piece.proximaldiameter]+[inddata.diameterbins(j).piece.distaldiameter])/2;
                    inddata.diameterbins(j).taperrate.values            = [inddata.diameterbins(j).piece.taperrate];
                    inddata.diameterbins(j).piecelength.values          = [inddata.diameterbins(j).piece.length];
                    
                    for k = 1:length(inddata.diameterbins(j).piece)
                        if strcmp(inddata.diameterbins(j).piece(k).distaltype,'bifurcation')==1
                            inddata.diameterbins(j).numberbifurcations = 1 + inddata.diameterbins(j).numberbifurcations;
                        end
                        if strcmp(inddata.diameterbins(j).piece(k).distaltype,'m-furcation')==1
                            inddata.diameterbins(j).numberbifurcations = length(inddata.diameterbins(j).piece(k).daughters) - 1 + inddata.diameterbins(j).numberbifurcations;
                        end
                        if strcmp(inddata.diameterbins(j).piece(k).distaltype,'termination')==1
                            inddata.diameterbins(j).numberterminations = 1 + inddata.diameterbins(j).numberterminations;
                        end
                        if strcmp(inddata.diameterbins(j).piece(k).proximaltype,'primary    ') ==1 || strcmp(inddata.diameterbins(j).piece(k).proximaltype,'daughter   ') ==1 || strcmp(inddata.diameterbins(j).piece(k).proximaltype,'daughter1  ') ==1 || strcmp(inddata.diameterbins(j).piece(k).proximaltype,'daughter2  ') ==1
                            if strcmp(inddata.diameterbins(j).piece(k).branchtype,'b') == 1
                                inddata.diameterbins(j).numberbifurcatingbranches = 1 + inddata.diameterbins(j).numberbifurcatingbranches;
                            elseif strcmp(inddata.diameterbins(j).piece(k).branchtype,'t') == 1
                                inddata.diameterbins(j).numberterminatingbranches = 1 + inddata.diameterbins(j).numberterminatingbranches;
                            else disp('       Error in diameter analyzer: piece branch type not identified.');
                            end
                        end
                    end
                end
                
                
                if isfield(popdata,'diameterbins') == 0; nextvalue = 1;
                elseif j > length(popdata.diameterbins); nextvalue = 1;
                elseif isfield(popdata.diameterbins(j),'length') == 0; nextvalue = 1;
                elseif isfield(popdata.diameterbins(j).length,'values') == 0; nextvalue = 1;
                else nextvalue = 1 + length(popdata.diameterbins(j).length.values);
                end
                popdata.diameterbins(j).length.values(nextvalue)                    = inddata.diameterbins(j).length;
                popdata.diameterbins(j).surfacearea.values(nextvalue)               = inddata.diameterbins(j).surfacearea;
                popdata.diameterbins(j).volume.values(nextvalue)                    = inddata.diameterbins(j).volume;
                popdata.diameterbins(j).numbersegments.values(nextvalue)            = inddata.diameterbins(j).numbersegments;
                popdata.diameterbins(j).numberbifurcations.values(nextvalue)        = inddata.diameterbins(j).numberbifurcations;
                popdata.diameterbins(j).numberterminations.values(nextvalue)        = inddata.diameterbins(j).numberterminations;
                popdata.diameterbins(j).numberbifurcatingbranches.values(nextvalue) = inddata.diameterbins(j).numberbifurcatingbranches;
                popdata.diameterbins(j).numberterminatingbranches.values(nextvalue) = inddata.diameterbins(j).numberterminatingbranches;
                popdata.diameterbins(j).rallratio.values                            = [ [popdata.diameterbins(j).rallratio.values] [inddata.diameterbins(j).rallratio.values] ];
                popdata.diameterbins(j).rallratio1.values                           = [ [popdata.diameterbins(j).rallratio1.values] [inddata.diameterbins(j).rallratio1.values] ];
                popdata.diameterbins(j).rallratio2.values                           = [ [popdata.diameterbins(j).rallratio2.values] [inddata.diameterbins(j).rallratio2.values] ];
                popdata.diameterbins(j).rallratio3.values                           = [ [popdata.diameterbins(j).rallratio3.values] [inddata.diameterbins(j).rallratio3.values] ];
                popdata.diameterbins(j).daughterratio.values                        = [ [popdata.diameterbins(j).daughterratio.values] [inddata.diameterbins(j).daughterratio.values] ];
                popdata.diameterbins(j).parentdaughterratio.values                  = [ [popdata.diameterbins(j).parentdaughterratio.values] [inddata.diameterbins(j).parentdaughterratio.values] ];
                popdata.diameterbins(j).parentdaughter2ratio.values                 = [ [popdata.diameterbins(j).parentdaughter2ratio.values] [inddata.diameterbins(j).parentdaughter2ratio.values] ];
                popdata.diameterbins(j).meandiameter.values                         = [ [popdata.diameterbins(j).meandiameter.values] [inddata.diameterbins(j).meandiameter.values] ];
                popdata.diameterbins(j).taperrate.values                            = [ [popdata.diameterbins(j).taperrate.values] [inddata.diameterbins(j).taperrate.values] ];
                popdata.diameterbins(j).piecelength.values                          = [ [popdata.diameterbins(j).piecelength.values] [inddata.diameterbins(j).piecelength.values] ];
                
                clear nextvalue;
                
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        
        for i = 1:length(popdata.diameterbins)
            
            typeanalysis.diameter.diameter(i) = popdata.diameterbinmiddles(i);
            
            if isfield(popdata.diameterbins(i).length,'values') == 1
                
                typeanalysis.diameter.length(i).values           = popdata.diameterbins(i).length.values;
                typeanalysis.diameter.length(i).mean             = mean([typeanalysis.diameter.length(i).values]);
                typeanalysis.diameter.length(i).std              = std([typeanalysis.diameter.length(i).values]);
                typeanalysis.diameter.length(i).max              = max([typeanalysis.diameter.length(i).values]);
                typeanalysis.diameter.length(i).min              = min([typeanalysis.diameter.length(i).values]);
                typeanalysis.diameter.length(i).skew             = skewness([typeanalysis.diameter.length(i).values],0);
                typeanalysis.diameter.length(i).kurt             = kurtosis([typeanalysis.diameter.length(i).values],0);
                typeanalysis.diameter.length(i).total            = sum([typeanalysis.diameter.length(i).values]);
                
                typeanalysis.diameter.surfacearea(i).values           = popdata.diameterbins(i).surfacearea.values;
                typeanalysis.diameter.surfacearea(i).mean             = mean([typeanalysis.diameter.surfacearea(i).values]);
                typeanalysis.diameter.surfacearea(i).std              = std([typeanalysis.diameter.surfacearea(i).values]);
                typeanalysis.diameter.surfacearea(i).max              = max([typeanalysis.diameter.surfacearea(i).values]);
                typeanalysis.diameter.surfacearea(i).min              = min([typeanalysis.diameter.surfacearea(i).values]);
                typeanalysis.diameter.surfacearea(i).skew             = skewness([typeanalysis.diameter.surfacearea(i).values],0);
                typeanalysis.diameter.surfacearea(i).kurt             = kurtosis([typeanalysis.diameter.surfacearea(i).values],0);
                typeanalysis.diameter.surfacearea(i).total            = sum([typeanalysis.diameter.surfacearea(i).values]);
                
                typeanalysis.diameter.volume(i).values           = popdata.diameterbins(i).volume.values;
                typeanalysis.diameter.volume(i).mean             = mean([typeanalysis.diameter.volume(i).values]);
                typeanalysis.diameter.volume(i).std              = std([typeanalysis.diameter.volume(i).values]);
                typeanalysis.diameter.volume(i).max              = max([typeanalysis.diameter.volume(i).values]);
                typeanalysis.diameter.volume(i).min              = min([typeanalysis.diameter.volume(i).values]);
                typeanalysis.diameter.volume(i).skew             = skewness([typeanalysis.diameter.volume(i).values],0);
                typeanalysis.diameter.volume(i).kurt             = kurtosis([typeanalysis.diameter.volume(i).values],0);
                typeanalysis.diameter.volume(i).total            = sum([typeanalysis.diameter.volume(i).values]);
                
                typeanalysis.diameter.numbersegments(i).values           = popdata.diameterbins(i).numbersegments.values;
                typeanalysis.diameter.numbersegments(i).mean             = mean([typeanalysis.diameter.numbersegments(i).values]);
                typeanalysis.diameter.numbersegments(i).std              = std([typeanalysis.diameter.numbersegments(i).values]);
                typeanalysis.diameter.numbersegments(i).max              = max([typeanalysis.diameter.numbersegments(i).values]);
                typeanalysis.diameter.numbersegments(i).min              = min([typeanalysis.diameter.numbersegments(i).values]);
                typeanalysis.diameter.numbersegments(i).skew             = skewness([typeanalysis.diameter.numbersegments(i).values],0);
                typeanalysis.diameter.numbersegments(i).kurt             = kurtosis([typeanalysis.diameter.numbersegments(i).values],0);
                typeanalysis.diameter.numbersegments(i).total            = sum([typeanalysis.diameter.numbersegments(i).values]);
                
                typeanalysis.diameter.numberbifurcations(i).values           = popdata.diameterbins(i).numberbifurcations.values;
                typeanalysis.diameter.numberbifurcations(i).mean             = mean([typeanalysis.diameter.numberbifurcations(i).values]);
                typeanalysis.diameter.numberbifurcations(i).std              = std([typeanalysis.diameter.numberbifurcations(i).values]);
                typeanalysis.diameter.numberbifurcations(i).max              = max([typeanalysis.diameter.numberbifurcations(i).values]);
                typeanalysis.diameter.numberbifurcations(i).min              = min([typeanalysis.diameter.numberbifurcations(i).values]);
                typeanalysis.diameter.numberbifurcations(i).skew             = skewness([typeanalysis.diameter.numberbifurcations(i).values],0);
                typeanalysis.diameter.numberbifurcations(i).kurt             = kurtosis([typeanalysis.diameter.numberbifurcations(i).values],0);
                typeanalysis.diameter.numberbifurcations(i).total            = sum([typeanalysis.diameter.numberbifurcations(i).values]);
                
                typeanalysis.diameter.numberterminations(i).values           = popdata.diameterbins(i).numberterminations.values;
                typeanalysis.diameter.numberterminations(i).mean             = mean([typeanalysis.diameter.numberterminations(i).values]);
                typeanalysis.diameter.numberterminations(i).std              = std([typeanalysis.diameter.numberterminations(i).values]);
                typeanalysis.diameter.numberterminations(i).max              = max([typeanalysis.diameter.numberterminations(i).values]);
                typeanalysis.diameter.numberterminations(i).min              = min([typeanalysis.diameter.numberterminations(i).values]);
                typeanalysis.diameter.numberterminations(i).skew             = skewness([typeanalysis.diameter.numberterminations(i).values],0);
                typeanalysis.diameter.numberterminations(i).kurt             = kurtosis([typeanalysis.diameter.numberterminations(i).values],0);
                typeanalysis.diameter.numberterminations(i).total            = sum([typeanalysis.diameter.numberterminations(i).values]);
                
                typeanalysis.diameter.numberbifurcatingbranches(i).values           = popdata.diameterbins(i).numberbifurcatingbranches.values;
                typeanalysis.diameter.numberbifurcatingbranches(i).mean             = mean([typeanalysis.diameter.numberbifurcatingbranches(i).values]);
                typeanalysis.diameter.numberbifurcatingbranches(i).std              = std([typeanalysis.diameter.numberbifurcatingbranches(i).values]);
                typeanalysis.diameter.numberbifurcatingbranches(i).max              = max([typeanalysis.diameter.numberbifurcatingbranches(i).values]);
                typeanalysis.diameter.numberbifurcatingbranches(i).min              = min([typeanalysis.diameter.numberbifurcatingbranches(i).values]);
                typeanalysis.diameter.numberbifurcatingbranches(i).skew             = skewness([typeanalysis.diameter.numberbifurcatingbranches(i).values],0);
                typeanalysis.diameter.numberbifurcatingbranches(i).kurt             = kurtosis([typeanalysis.diameter.numberbifurcatingbranches(i).values],0);
                typeanalysis.diameter.numberbifurcatingbranches(i).total            = sum([typeanalysis.diameter.numberbifurcatingbranches(i).values]);
                
                typeanalysis.diameter.numberterminatingbranches(i).values           = popdata.diameterbins(i).numberterminatingbranches.values;
                typeanalysis.diameter.numberterminatingbranches(i).mean             = mean([typeanalysis.diameter.numberterminatingbranches(i).values]);
                typeanalysis.diameter.numberterminatingbranches(i).std              = std([typeanalysis.diameter.numberterminatingbranches(i).values]);
                typeanalysis.diameter.numberterminatingbranches(i).max              = max([typeanalysis.diameter.numberterminatingbranches(i).values]);
                typeanalysis.diameter.numberterminatingbranches(i).min              = min([typeanalysis.diameter.numberterminatingbranches(i).values]);
                typeanalysis.diameter.numberterminatingbranches(i).skew             = skewness([typeanalysis.diameter.numberterminatingbranches(i).values],0);
                typeanalysis.diameter.numberterminatingbranches(i).kurt             = kurtosis([typeanalysis.diameter.numberterminatingbranches(i).values],0);
                typeanalysis.diameter.numberterminatingbranches(i).total            = sum([typeanalysis.diameter.numberterminatingbranches(i).values]);
                
                typeanalysis.diameter.rallratio(i).values           = popdata.diameterbins(i).rallratio.values;
                typeanalysis.diameter.rallratio(i).mean             = mean([typeanalysis.diameter.rallratio(i).values]);
                typeanalysis.diameter.rallratio(i).std              = std([typeanalysis.diameter.rallratio(i).values]);
                typeanalysis.diameter.rallratio(i).max              = max([typeanalysis.diameter.rallratio(i).values]);
                typeanalysis.diameter.rallratio(i).min              = min([typeanalysis.diameter.rallratio(i).values]);
                typeanalysis.diameter.rallratio(i).skew             = skewness([typeanalysis.diameter.rallratio(i).values],0);
                typeanalysis.diameter.rallratio(i).kurt             = kurtosis([typeanalysis.diameter.rallratio(i).values],0);
                
                typeanalysis.diameter.rallratio1(i).values           = popdata.diameterbins(i).rallratio1.values;
                typeanalysis.diameter.rallratio1(i).mean             = mean([typeanalysis.diameter.rallratio1(i).values]);
                typeanalysis.diameter.rallratio1(i).std              = std([typeanalysis.diameter.rallratio1(i).values]);
                typeanalysis.diameter.rallratio1(i).max              = max([typeanalysis.diameter.rallratio1(i).values]);
                typeanalysis.diameter.rallratio1(i).min              = min([typeanalysis.diameter.rallratio1(i).values]);
                typeanalysis.diameter.rallratio1(i).skew             = skewness([typeanalysis.diameter.rallratio1(i).values],0);
                typeanalysis.diameter.rallratio1(i).kurt             = kurtosis([typeanalysis.diameter.rallratio1(i).values],0);
                
                typeanalysis.diameter.rallratio2(i).values           = popdata.diameterbins(i).rallratio2.values;
                typeanalysis.diameter.rallratio2(i).mean             = mean([typeanalysis.diameter.rallratio2(i).values]);
                typeanalysis.diameter.rallratio2(i).std              = std([typeanalysis.diameter.rallratio2(i).values]);
                typeanalysis.diameter.rallratio2(i).max              = max([typeanalysis.diameter.rallratio2(i).values]);
                typeanalysis.diameter.rallratio2(i).min              = min([typeanalysis.diameter.rallratio2(i).values]);
                typeanalysis.diameter.rallratio2(i).skew             = skewness([typeanalysis.diameter.rallratio2(i).values],0);
                typeanalysis.diameter.rallratio2(i).kurt             = kurtosis([typeanalysis.diameter.rallratio2(i).values],0);
                
                typeanalysis.diameter.rallratio3(i).values           = popdata.diameterbins(i).rallratio3.values;
                typeanalysis.diameter.rallratio3(i).mean             = mean([typeanalysis.diameter.rallratio3(i).values]);
                typeanalysis.diameter.rallratio3(i).std              = std([typeanalysis.diameter.rallratio3(i).values]);
                typeanalysis.diameter.rallratio3(i).max              = max([typeanalysis.diameter.rallratio3(i).values]);
                typeanalysis.diameter.rallratio3(i).min              = min([typeanalysis.diameter.rallratio3(i).values]);
                typeanalysis.diameter.rallratio3(i).skew             = skewness([typeanalysis.diameter.rallratio3(i).values],0);
                typeanalysis.diameter.rallratio3(i).kurt             = kurtosis([typeanalysis.diameter.rallratio3(i).values],0);
                
                typeanalysis.diameter.daughterratio(i).values           = popdata.diameterbins(i).daughterratio.values;
                typeanalysis.diameter.daughterratio(i).mean             = mean([typeanalysis.diameter.daughterratio(i).values]);
                typeanalysis.diameter.daughterratio(i).std              = std([typeanalysis.diameter.daughterratio(i).values]);
                typeanalysis.diameter.daughterratio(i).max              = max([typeanalysis.diameter.daughterratio(i).values]);
                typeanalysis.diameter.daughterratio(i).min              = min([typeanalysis.diameter.daughterratio(i).values]);
                typeanalysis.diameter.daughterratio(i).skew             = skewness([typeanalysis.diameter.daughterratio(i).values],0);
                typeanalysis.diameter.daughterratio(i).kurt             = kurtosis([typeanalysis.diameter.daughterratio(i).values],0);
                
                typeanalysis.diameter.parentdaughterratio(i).values           = popdata.diameterbins(i).parentdaughterratio.values;
                typeanalysis.diameter.parentdaughterratio(i).mean             = mean([typeanalysis.diameter.parentdaughterratio(i).values]);
                typeanalysis.diameter.parentdaughterratio(i).std              = std([typeanalysis.diameter.parentdaughterratio(i).values]);
                typeanalysis.diameter.parentdaughterratio(i).max              = max([typeanalysis.diameter.parentdaughterratio(i).values]);
                typeanalysis.diameter.parentdaughterratio(i).min              = min([typeanalysis.diameter.parentdaughterratio(i).values]);
                typeanalysis.diameter.parentdaughterratio(i).skew             = skewness([typeanalysis.diameter.parentdaughterratio(i).values],0);
                typeanalysis.diameter.parentdaughterratio(i).kurt             = kurtosis([typeanalysis.diameter.parentdaughterratio(i).values],0);
                
                typeanalysis.diameter.parentdaughter2ratio(i).values           = popdata.diameterbins(i).parentdaughter2ratio.values;
                typeanalysis.diameter.parentdaughter2ratio(i).mean             = mean([typeanalysis.diameter.parentdaughter2ratio(i).values]);
                typeanalysis.diameter.parentdaughter2ratio(i).std              = std([typeanalysis.diameter.parentdaughter2ratio(i).values]);
                typeanalysis.diameter.parentdaughter2ratio(i).max              = max([typeanalysis.diameter.parentdaughter2ratio(i).values]);
                typeanalysis.diameter.parentdaughter2ratio(i).min              = min([typeanalysis.diameter.parentdaughter2ratio(i).values]);
                typeanalysis.diameter.parentdaughter2ratio(i).skew             = skewness([typeanalysis.diameter.parentdaughter2ratio(i).values],0);
                typeanalysis.diameter.parentdaughter2ratio(i).kurt             = kurtosis([typeanalysis.diameter.parentdaughter2ratio(i).values],0);
                
                typeanalysis.diameter.meandiameter(i).values           = popdata.diameterbins(i).meandiameter.values;
                typeanalysis.diameter.meandiameter(i).mean             = sum([popdata.diameterbins(i).meandiameter.values].*[popdata.diameterbins(i).piecelength.values])/sum([popdata.diameterbins(i).piecelength.values]);
                typeanalysis.diameter.meandiameter(i).std              = std([typeanalysis.diameter.meandiameter(i).values]);
                typeanalysis.diameter.meandiameter(i).max              = max([typeanalysis.diameter.meandiameter(i).values]);
                typeanalysis.diameter.meandiameter(i).min              = min([typeanalysis.diameter.meandiameter(i).values]);
                typeanalysis.diameter.meandiameter(i).skew             = skewness([typeanalysis.diameter.meandiameter(i).values],0);
                typeanalysis.diameter.meandiameter(i).kurt             = kurtosis([typeanalysis.diameter.meandiameter(i).values],0);
                
                typeanalysis.diameter.taperrate(i).values           = popdata.diameterbins(i).taperrate.values;
                typeanalysis.diameter.taperrate(i).mean             = sum([popdata.diameterbins(i).taperrate.values].*[popdata.diameterbins(i).piecelength.values])/sum([popdata.diameterbins(i).piecelength.values]);
                typeanalysis.diameter.taperrate(i).std              = std([typeanalysis.diameter.taperrate(i).values]);
                typeanalysis.diameter.taperrate(i).max              = max([typeanalysis.diameter.taperrate(i).values]);
                typeanalysis.diameter.taperrate(i).min              = min([typeanalysis.diameter.taperrate(i).values]);
                typeanalysis.diameter.taperrate(i).skew             = skewness([typeanalysis.diameter.taperrate(i).values],0);
                typeanalysis.diameter.taperrate(i).kurt             = kurtosis([typeanalysis.diameter.taperrate(i).values],0);
                
                typeanalysis.diameter.taperratenonzero(i).values           = popdata.diameterbins(i).taperrate.values(popdata.diameterbins(i).taperrate.values~=0);
                typeanalysis.diameter.taperratenonzero(i).mean             = sum([popdata.diameterbins(i).taperrate.values(popdata.diameterbins(i).taperrate.values~=0)].*[popdata.diameterbins(i).piecelength.values(popdata.diameterbins(i).taperrate.values~=0)])/sum([popdata.diameterbins(i).piecelength.values(popdata.diameterbins(i).taperrate.values~=0)]);
                typeanalysis.diameter.taperratenonzero(i).std              = std([typeanalysis.diameter.taperratenonzero(i).values]);
                typeanalysis.diameter.taperratenonzero(i).max              = max([typeanalysis.diameter.taperratenonzero(i).values]);
                typeanalysis.diameter.taperratenonzero(i).min              = min([typeanalysis.diameter.taperratenonzero(i).values]);
                typeanalysis.diameter.taperratenonzero(i).skew             = skewness([typeanalysis.diameter.taperratenonzero(i).values],0);
                typeanalysis.diameter.taperratenonzero(i).kurt             = kurtosis([typeanalysis.diameter.taperratenonzero(i).values],0);
                
                typeanalysis.diameter.bifurcationprobability.length(i) = typeanalysis.diameter.numberbifurcations(i).total / typeanalysis.diameter.length(i).total;
                typeanalysis.diameter.terminationprobability.length(i) = typeanalysis.diameter.numberterminations(i).total / typeanalysis.diameter.length(i).total;
                
                typeanalysis.diameter.bifurcationprobability.surfacearea(i) = typeanalysis.diameter.numberbifurcations(i).total / typeanalysis.diameter.surfacearea(i).total;
                typeanalysis.diameter.terminationprobability.surfacearea(i) = typeanalysis.diameter.numberterminations(i).total / typeanalysis.diameter.surfacearea(i).total;
                
                typeanalysis.diameter.bifurcationprobability.volume(i) = typeanalysis.diameter.numberbifurcations(i).total / typeanalysis.diameter.volume(i).total;
                typeanalysis.diameter.terminationprobability.volume(i) = typeanalysis.diameter.numberterminations(i).total / typeanalysis.diameter.volume(i).total;
                
            end
        end
        
        typeanalysis.diameter = orderfields(typeanalysis.diameter);
        
        
        
        
        
        
        
        % Begin bifurcation diameter analysis
        
        
        for i = 1:length(popdata.bifurcation.diameterbins)
            popdata.bifurcation.diameterbins(i).rallratio.values            = [];
            popdata.bifurcation.diameterbins(i).rallratio1.values           = [];
            popdata.bifurcation.diameterbins(i).rallratio2.values           = [];
            popdata.bifurcation.diameterbins(i).rallratio3.values           = [];
            popdata.bifurcation.diameterbins(i).daughterratio.values        = [];
            popdata.bifurcation.diameterbins(i).parentdaughterratio.values  = [];
            popdata.bifurcation.diameterbins(i).parentdaughter2ratio.values = [];
            popdata.bifurcation.diameterbins(i).meandiameter.values         = [];
            popdata.bifurcation.diameterbins(i).taperrate.values            = [];
            popdata.bifurcation.diameterbins(i).piecelength.values          = [];
        end
        
        
        for i = 1:length(data.individual)
            
            clear inddata;
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            
            for j = 1:length(inddata.bifurcation.diameterbins)
                
                inddata.bifurcation.diameterbins(j).length                      = 0;
                inddata.bifurcation.diameterbins(j).surfacearea                 = 0;
                inddata.bifurcation.diameterbins(j).volume                      = 0;
                inddata.bifurcation.diameterbins(j).numbersegments              = 0;
                inddata.bifurcation.diameterbins(j).numberbifurcations          = 0;
                inddata.bifurcation.diameterbins(j).rallratio.values            = [];
                inddata.bifurcation.diameterbins(j).rallratio1.values           = [];
                inddata.bifurcation.diameterbins(j).rallratio2.values           = [];
                inddata.bifurcation.diameterbins(j).rallratio3.values           = [];
                inddata.bifurcation.diameterbins(j).daughterratio.values        = [];
                inddata.bifurcation.diameterbins(j).parentdaughterratio.values  = [];
                inddata.bifurcation.diameterbins(j).parentdaughter2ratio.values = [];
                inddata.bifurcation.diameterbins(j).meandiameter.values         = [];
                inddata.bifurcation.diameterbins(j).taperrate.values            = [];
                inddata.bifurcation.diameterbins(j).piecelength.values          = [];
                
                if isfield(inddata.bifurcation.diameterbins(j),'piece')
                    
                    if isfield(inddata.bifurcation.diameterbins(j).piece,'id') == 1
                        
                        inddata.bifurcation.diameterbins(j).length                      = sum([inddata.bifurcation.diameterbins(j).piece.length]);
                        inddata.bifurcation.diameterbins(j).surfacearea                 = sum([inddata.bifurcation.diameterbins(j).piece.surfacearea]);
                        inddata.bifurcation.diameterbins(j).volume                      = sum([inddata.bifurcation.diameterbins(j).piece.volume]);
                        inddata.bifurcation.diameterbins(j).numbersegments              = length(unique([inddata.bifurcation.diameterbins(j).piece.cable]));
                        inddata.bifurcation.diameterbins(j).rallratio.values            = [inddata.bifurcation.diameterbins(j).piece.rallratio];
                        inddata.bifurcation.diameterbins(j).rallratio1.values           = [inddata.bifurcation.diameterbins(j).piece.rallratio1];
                        inddata.bifurcation.diameterbins(j).rallratio2.values           = [inddata.bifurcation.diameterbins(j).piece.rallratio2];
                        inddata.bifurcation.diameterbins(j).rallratio3.values           = [inddata.bifurcation.diameterbins(j).piece.rallratio3];
                        inddata.bifurcation.diameterbins(j).daughterratio.values        = [inddata.bifurcation.diameterbins(j).piece.daughterratio];
                        inddata.bifurcation.diameterbins(j).parentdaughterratio.values  = [inddata.bifurcation.diameterbins(j).piece.parentdaughterratio];
                        inddata.bifurcation.diameterbins(j).parentdaughter2ratio.values = [inddata.bifurcation.diameterbins(j).piece.parentdaughter2ratio];
                        inddata.bifurcation.diameterbins(j).meandiameter.values         = ([inddata.bifurcation.diameterbins(j).piece.proximaldiameter]+[inddata.bifurcation.diameterbins(j).piece.distaldiameter])/2;
                        inddata.bifurcation.diameterbins(j).taperrate.values            = [inddata.bifurcation.diameterbins(j).piece.taperrate];
                        inddata.bifurcation.diameterbins(j).piecelength.values          = [inddata.bifurcation.diameterbins(j).piece.length];
                        
                    end
                    
                    for k = 1:length(inddata.bifurcation.diameterbins(j).piece)
                        if strcmp(inddata.bifurcation.diameterbins(j).piece(k).distaltype,'bifurcation')==1
                            inddata.bifurcation.diameterbins(j).numberbifurcations = 1 + inddata.bifurcation.diameterbins(j).numberbifurcations;
                        end
                        if strcmp(inddata.bifurcation.diameterbins(j).piece(k).distaltype,'m-furcation')==1
                            inddata.bifurcation.diameterbins(j).numberbifurcations = length(inddata.bifurcation.diameterbins(j).piece(k).daughters) - 1 + inddata.bifurcation.diameterbins(j).numberbifurcations;
                        end
                    end
                    
                    if isfield(popdata,'diameterbins') == 0; nextvalue = 1;
                    elseif j > length(popdata.bifurcation.diameterbins); nextvalue = 1;
                    elseif isfield(popdata.bifurcation.diameterbins(j),'length') == 0; nextvalue = 1;
                    elseif isfield(popdata.bifurcation.diameterbins(j).length,'values') == 0; nextvalue = 1;
                    else nextvalue = 1 + length(popdata.bifurcation.diameterbins(j).length.values);
                    end
                    popdata.bifurcation.diameterbins(j).length.values(nextvalue)             = inddata.bifurcation.diameterbins(j).length;
                    popdata.bifurcation.diameterbins(j).surfacearea.values(nextvalue)        = inddata.bifurcation.diameterbins(j).surfacearea;
                    popdata.bifurcation.diameterbins(j).volume.values(nextvalue)             = inddata.bifurcation.diameterbins(j).volume;
                    popdata.bifurcation.diameterbins(j).numbersegments.values(nextvalue)     = inddata.bifurcation.diameterbins(j).numbersegments;
                    popdata.bifurcation.diameterbins(j).numberbifurcations.values(nextvalue) = inddata.bifurcation.diameterbins(j).numberbifurcations;
                    popdata.bifurcation.diameterbins(j).rallratio.values                     = [ [popdata.bifurcation.diameterbins(j).rallratio.values] [inddata.bifurcation.diameterbins(j).rallratio.values] ];
                    popdata.bifurcation.diameterbins(j).rallratio1.values                    = [ [popdata.bifurcation.diameterbins(j).rallratio1.values] [inddata.bifurcation.diameterbins(j).rallratio1.values] ];
                    popdata.bifurcation.diameterbins(j).rallratio2.values                    = [ [popdata.bifurcation.diameterbins(j).rallratio2.values] [inddata.bifurcation.diameterbins(j).rallratio2.values] ];
                    popdata.bifurcation.diameterbins(j).rallratio3.values                    = [ [popdata.bifurcation.diameterbins(j).rallratio3.values] [inddata.bifurcation.diameterbins(j).rallratio3.values] ];
                    popdata.bifurcation.diameterbins(j).daughterratio.values                 = [ [popdata.bifurcation.diameterbins(j).daughterratio.values] [inddata.bifurcation.diameterbins(j).daughterratio.values] ];
                    popdata.bifurcation.diameterbins(j).parentdaughterratio.values           = [ [popdata.bifurcation.diameterbins(j).parentdaughterratio.values] [inddata.bifurcation.diameterbins(j).parentdaughterratio.values] ];
                    popdata.bifurcation.diameterbins(j).parentdaughter2ratio.values          = [ [popdata.bifurcation.diameterbins(j).parentdaughter2ratio.values] [inddata.bifurcation.diameterbins(j).parentdaughter2ratio.values] ];
                    popdata.bifurcation.diameterbins(j).meandiameter.values                  = [ [popdata.bifurcation.diameterbins(j).meandiameter.values] [inddata.bifurcation.diameterbins(j).meandiameter.values] ];
                    popdata.bifurcation.diameterbins(j).taperrate.values                     = [ [popdata.bifurcation.diameterbins(j).taperrate.values] [inddata.bifurcation.diameterbins(j).taperrate.values] ];
                    popdata.bifurcation.diameterbins(j).piecelength.values                   = [ [popdata.bifurcation.diameterbins(j).piecelength.values] [inddata.bifurcation.diameterbins(j).piecelength.values] ];
                    
                    clear nextvalue;
                    
                end
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        
        for i = 1:length(popdata.bifurcation.diameterbins)
            
            typeanalysis.bifurcation.diameter.diameter(i) = popdata.diameterbinmiddles(i);
            
            if isfield(popdata.bifurcation.diameterbins(i).length,'values') == 1
                
                %typeanalysis.bifurcation.diameter.length(i).diameter         = popdata.diameterbinmiddles(i);
                typeanalysis.bifurcation.diameter.length(i).values           = popdata.bifurcation.diameterbins(i).length.values;
                typeanalysis.bifurcation.diameter.length(i).mean             = mean([typeanalysis.bifurcation.diameter.length(i).values]);
                typeanalysis.bifurcation.diameter.length(i).std              = std([typeanalysis.bifurcation.diameter.length(i).values]);
                typeanalysis.bifurcation.diameter.length(i).max              = max([typeanalysis.bifurcation.diameter.length(i).values]);
                typeanalysis.bifurcation.diameter.length(i).min              = min([typeanalysis.bifurcation.diameter.length(i).values]);
                typeanalysis.bifurcation.diameter.length(i).skew             = skewness([typeanalysis.bifurcation.diameter.length(i).values],0);
                typeanalysis.bifurcation.diameter.length(i).kurt             = kurtosis([typeanalysis.bifurcation.diameter.length(i).values],0);
                typeanalysis.bifurcation.diameter.length(i).total            = sum([typeanalysis.bifurcation.diameter.length(i).values]);
                
                typeanalysis.bifurcation.diameter.surfacearea(i).values           = popdata.bifurcation.diameterbins(i).surfacearea.values;
                typeanalysis.bifurcation.diameter.surfacearea(i).mean             = mean([typeanalysis.bifurcation.diameter.surfacearea(i).values]);
                typeanalysis.bifurcation.diameter.surfacearea(i).std              = std([typeanalysis.bifurcation.diameter.surfacearea(i).values]);
                typeanalysis.bifurcation.diameter.surfacearea(i).max              = max([typeanalysis.bifurcation.diameter.surfacearea(i).values]);
                typeanalysis.bifurcation.diameter.surfacearea(i).min              = min([typeanalysis.bifurcation.diameter.surfacearea(i).values]);
                typeanalysis.bifurcation.diameter.surfacearea(i).skew             = skewness([typeanalysis.bifurcation.diameter.surfacearea(i).values],0);
                typeanalysis.bifurcation.diameter.surfacearea(i).kurt             = kurtosis([typeanalysis.bifurcation.diameter.surfacearea(i).values],0);
                typeanalysis.bifurcation.diameter.surfacearea(i).total            = sum([typeanalysis.bifurcation.diameter.surfacearea(i).values]);
                
                typeanalysis.bifurcation.diameter.volume(i).values           = popdata.bifurcation.diameterbins(i).volume.values;
                typeanalysis.bifurcation.diameter.volume(i).mean             = mean([typeanalysis.bifurcation.diameter.volume(i).values]);
                typeanalysis.bifurcation.diameter.volume(i).std              = std([typeanalysis.bifurcation.diameter.volume(i).values]);
                typeanalysis.bifurcation.diameter.volume(i).max              = max([typeanalysis.bifurcation.diameter.volume(i).values]);
                typeanalysis.bifurcation.diameter.volume(i).min              = min([typeanalysis.bifurcation.diameter.volume(i).values]);
                typeanalysis.bifurcation.diameter.volume(i).skew             = skewness([typeanalysis.bifurcation.diameter.volume(i).values],0);
                typeanalysis.bifurcation.diameter.volume(i).kurt             = kurtosis([typeanalysis.bifurcation.diameter.volume(i).values],0);
                typeanalysis.bifurcation.diameter.volume(i).total            = sum([typeanalysis.bifurcation.diameter.volume(i).values]);
                
                typeanalysis.bifurcation.diameter.numbersegments(i).values           = popdata.bifurcation.diameterbins(i).numbersegments.values;
                typeanalysis.bifurcation.diameter.numbersegments(i).mean             = mean([typeanalysis.bifurcation.diameter.numbersegments(i).values]);
                typeanalysis.bifurcation.diameter.numbersegments(i).std              = std([typeanalysis.bifurcation.diameter.numbersegments(i).values]);
                typeanalysis.bifurcation.diameter.numbersegments(i).max              = max([typeanalysis.bifurcation.diameter.numbersegments(i).values]);
                typeanalysis.bifurcation.diameter.numbersegments(i).min              = min([typeanalysis.bifurcation.diameter.numbersegments(i).values]);
                typeanalysis.bifurcation.diameter.numbersegments(i).skew             = skewness([typeanalysis.bifurcation.diameter.numbersegments(i).values],0);
                typeanalysis.bifurcation.diameter.numbersegments(i).kurt             = kurtosis([typeanalysis.bifurcation.diameter.numbersegments(i).values],0);
                typeanalysis.bifurcation.diameter.numbersegments(i).total            = sum([typeanalysis.bifurcation.diameter.numbersegments(i).values]);
                
                typeanalysis.bifurcation.diameter.numberbifurcations(i).values           = popdata.bifurcation.diameterbins(i).numberbifurcations.values;
                typeanalysis.bifurcation.diameter.numberbifurcations(i).mean             = mean([typeanalysis.bifurcation.diameter.numberbifurcations(i).values]);
                typeanalysis.bifurcation.diameter.numberbifurcations(i).std              = std([typeanalysis.bifurcation.diameter.numberbifurcations(i).values]);
                typeanalysis.bifurcation.diameter.numberbifurcations(i).max              = max([typeanalysis.bifurcation.diameter.numberbifurcations(i).values]);
                typeanalysis.bifurcation.diameter.numberbifurcations(i).min              = min([typeanalysis.bifurcation.diameter.numberbifurcations(i).values]);
                typeanalysis.bifurcation.diameter.numberbifurcations(i).skew             = skewness([typeanalysis.bifurcation.diameter.numberbifurcations(i).values],0);
                typeanalysis.bifurcation.diameter.numberbifurcations(i).kurt             = kurtosis([typeanalysis.bifurcation.diameter.numberbifurcations(i).values],0);
                typeanalysis.bifurcation.diameter.numberbifurcations(i).total            = sum([typeanalysis.bifurcation.diameter.numberbifurcations(i).values]);
                
                typeanalysis.bifurcation.diameter.rallratio(i).values           = popdata.bifurcation.diameterbins(i).rallratio.values;
                typeanalysis.bifurcation.diameter.rallratio(i).mean             = mean([typeanalysis.bifurcation.diameter.rallratio(i).values]);
                typeanalysis.bifurcation.diameter.rallratio(i).std              = std([typeanalysis.bifurcation.diameter.rallratio(i).values]);
                typeanalysis.bifurcation.diameter.rallratio(i).max              = max([typeanalysis.bifurcation.diameter.rallratio(i).values]);
                typeanalysis.bifurcation.diameter.rallratio(i).min              = min([typeanalysis.bifurcation.diameter.rallratio(i).values]);
                typeanalysis.bifurcation.diameter.rallratio(i).skew             = skewness([typeanalysis.bifurcation.diameter.rallratio(i).values],0);
                typeanalysis.bifurcation.diameter.rallratio(i).kurt             = kurtosis([typeanalysis.bifurcation.diameter.rallratio(i).values],0);
                
                typeanalysis.bifurcation.diameter.rallratio1(i).values           = popdata.bifurcation.diameterbins(i).rallratio1.values;
                typeanalysis.bifurcation.diameter.rallratio1(i).mean             = mean([typeanalysis.bifurcation.diameter.rallratio1(i).values]);
                typeanalysis.bifurcation.diameter.rallratio1(i).std              = std([typeanalysis.bifurcation.diameter.rallratio1(i).values]);
                typeanalysis.bifurcation.diameter.rallratio1(i).max              = max([typeanalysis.bifurcation.diameter.rallratio1(i).values]);
                typeanalysis.bifurcation.diameter.rallratio1(i).min              = min([typeanalysis.bifurcation.diameter.rallratio1(i).values]);
                typeanalysis.bifurcation.diameter.rallratio1(i).skew             = skewness([typeanalysis.bifurcation.diameter.rallratio1(i).values],0);
                typeanalysis.bifurcation.diameter.rallratio1(i).kurt             = kurtosis([typeanalysis.bifurcation.diameter.rallratio1(i).values],0);
                
                typeanalysis.bifurcation.diameter.rallratio2(i).values           = popdata.bifurcation.diameterbins(i).rallratio2.values;
                typeanalysis.bifurcation.diameter.rallratio2(i).mean             = mean([typeanalysis.bifurcation.diameter.rallratio2(i).values]);
                typeanalysis.bifurcation.diameter.rallratio2(i).std              = std([typeanalysis.bifurcation.diameter.rallratio2(i).values]);
                typeanalysis.bifurcation.diameter.rallratio2(i).max              = max([typeanalysis.bifurcation.diameter.rallratio2(i).values]);
                typeanalysis.bifurcation.diameter.rallratio2(i).min              = min([typeanalysis.bifurcation.diameter.rallratio2(i).values]);
                typeanalysis.bifurcation.diameter.rallratio2(i).skew             = skewness([typeanalysis.bifurcation.diameter.rallratio2(i).values],0);
                typeanalysis.bifurcation.diameter.rallratio2(i).kurt             = kurtosis([typeanalysis.bifurcation.diameter.rallratio2(i).values],0);
                
                typeanalysis.bifurcation.diameter.rallratio3(i).values           = popdata.bifurcation.diameterbins(i).rallratio3.values;
                typeanalysis.bifurcation.diameter.rallratio3(i).mean             = mean([typeanalysis.bifurcation.diameter.rallratio3(i).values]);
                typeanalysis.bifurcation.diameter.rallratio3(i).std              = std([typeanalysis.bifurcation.diameter.rallratio3(i).values]);
                typeanalysis.bifurcation.diameter.rallratio3(i).max              = max([typeanalysis.bifurcation.diameter.rallratio3(i).values]);
                typeanalysis.bifurcation.diameter.rallratio3(i).min              = min([typeanalysis.bifurcation.diameter.rallratio3(i).values]);
                typeanalysis.bifurcation.diameter.rallratio3(i).skew             = skewness([typeanalysis.bifurcation.diameter.rallratio3(i).values],0);
                typeanalysis.bifurcation.diameter.rallratio3(i).kurt             = kurtosis([typeanalysis.bifurcation.diameter.rallratio3(i).values],0);
                
                typeanalysis.bifurcation.diameter.daughterratio(i).values           = popdata.bifurcation.diameterbins(i).daughterratio.values;
                typeanalysis.bifurcation.diameter.daughterratio(i).mean             = mean([typeanalysis.bifurcation.diameter.daughterratio(i).values]);
                typeanalysis.bifurcation.diameter.daughterratio(i).std              = std([typeanalysis.bifurcation.diameter.daughterratio(i).values]);
                typeanalysis.bifurcation.diameter.daughterratio(i).max              = max([typeanalysis.bifurcation.diameter.daughterratio(i).values]);
                typeanalysis.bifurcation.diameter.daughterratio(i).min              = min([typeanalysis.bifurcation.diameter.daughterratio(i).values]);
                typeanalysis.bifurcation.diameter.daughterratio(i).skew             = skewness([typeanalysis.bifurcation.diameter.daughterratio(i).values],0);
                typeanalysis.bifurcation.diameter.daughterratio(i).kurt             = kurtosis([typeanalysis.bifurcation.diameter.daughterratio(i).values],0);
                
                typeanalysis.bifurcation.diameter.parentdaughterratio(i).values           = popdata.bifurcation.diameterbins(i).parentdaughterratio.values;
                typeanalysis.bifurcation.diameter.parentdaughterratio(i).mean             = mean([typeanalysis.bifurcation.diameter.parentdaughterratio(i).values]);
                typeanalysis.bifurcation.diameter.parentdaughterratio(i).std              = std([typeanalysis.bifurcation.diameter.parentdaughterratio(i).values]);
                typeanalysis.bifurcation.diameter.parentdaughterratio(i).max              = max([typeanalysis.bifurcation.diameter.parentdaughterratio(i).values]);
                typeanalysis.bifurcation.diameter.parentdaughterratio(i).min              = min([typeanalysis.bifurcation.diameter.parentdaughterratio(i).values]);
                typeanalysis.bifurcation.diameter.parentdaughterratio(i).skew             = skewness([typeanalysis.bifurcation.diameter.parentdaughterratio(i).values],0);
                typeanalysis.bifurcation.diameter.parentdaughterratio(i).kurt             = kurtosis([typeanalysis.bifurcation.diameter.parentdaughterratio(i).values],0);
                
                typeanalysis.bifurcation.diameter.parentdaughter2ratio(i).values           = popdata.bifurcation.diameterbins(i).parentdaughter2ratio.values;
                typeanalysis.bifurcation.diameter.parentdaughter2ratio(i).mean             = mean([typeanalysis.bifurcation.diameter.parentdaughter2ratio(i).values]);
                typeanalysis.bifurcation.diameter.parentdaughter2ratio(i).std              = std([typeanalysis.bifurcation.diameter.parentdaughter2ratio(i).values]);
                typeanalysis.bifurcation.diameter.parentdaughter2ratio(i).max              = max([typeanalysis.bifurcation.diameter.parentdaughter2ratio(i).values]);
                typeanalysis.bifurcation.diameter.parentdaughter2ratio(i).min              = min([typeanalysis.bifurcation.diameter.parentdaughter2ratio(i).values]);
                typeanalysis.bifurcation.diameter.parentdaughter2ratio(i).skew             = skewness([typeanalysis.bifurcation.diameter.parentdaughter2ratio(i).values],0);
                typeanalysis.bifurcation.diameter.parentdaughter2ratio(i).kurt             = kurtosis([typeanalysis.bifurcation.diameter.parentdaughter2ratio(i).values],0);
                
                typeanalysis.bifurcation.diameter.meandiameter(i).values           = popdata.bifurcation.diameterbins(i).meandiameter.values;
                typeanalysis.bifurcation.diameter.meandiameter(i).mean             = sum([popdata.bifurcation.diameterbins(i).meandiameter.values].*[popdata.bifurcation.diameterbins(i).piecelength.values])/sum([popdata.bifurcation.diameterbins(i).piecelength.values]);
                typeanalysis.bifurcation.diameter.meandiameter(i).std              = std([typeanalysis.bifurcation.diameter.meandiameter(i).values]);
                typeanalysis.bifurcation.diameter.meandiameter(i).max              = max([typeanalysis.bifurcation.diameter.meandiameter(i).values]);
                typeanalysis.bifurcation.diameter.meandiameter(i).min              = min([typeanalysis.bifurcation.diameter.meandiameter(i).values]);
                typeanalysis.bifurcation.diameter.meandiameter(i).skew             = skewness([typeanalysis.bifurcation.diameter.meandiameter(i).values],0);
                typeanalysis.bifurcation.diameter.meandiameter(i).kurt             = kurtosis([typeanalysis.bifurcation.diameter.meandiameter(i).values],0);
                
                typeanalysis.bifurcation.diameter.taperrate(i).values           = popdata.bifurcation.diameterbins(i).taperrate.values;
                typeanalysis.bifurcation.diameter.taperrate(i).mean             = sum([popdata.bifurcation.diameterbins(i).taperrate.values].*[popdata.bifurcation.diameterbins(i).piecelength.values])/sum([popdata.bifurcation.diameterbins(i).piecelength.values]);
                typeanalysis.bifurcation.diameter.taperrate(i).std              = std([typeanalysis.bifurcation.diameter.taperrate(i).values]);
                typeanalysis.bifurcation.diameter.taperrate(i).max              = max([typeanalysis.bifurcation.diameter.taperrate(i).values]);
                typeanalysis.bifurcation.diameter.taperrate(i).min              = min([typeanalysis.bifurcation.diameter.taperrate(i).values]);
                typeanalysis.bifurcation.diameter.taperrate(i).skew             = skewness([typeanalysis.bifurcation.diameter.taperrate(i).values],0);
                typeanalysis.bifurcation.diameter.taperrate(i).kurt             = kurtosis([typeanalysis.bifurcation.diameter.taperrate(i).values],0);
                
                typeanalysis.bifurcation.diameter.taperratenonzero(i).values           = popdata.bifurcation.diameterbins(i).taperrate.values(popdata.bifurcation.diameterbins(i).taperrate.values~=0);
                typeanalysis.bifurcation.diameter.taperratenonzero(i).mean             = sum([popdata.bifurcation.diameterbins(i).taperrate.values(popdata.bifurcation.diameterbins(i).taperrate.values~=0)].*[popdata.bifurcation.diameterbins(i).piecelength.values(popdata.bifurcation.diameterbins(i).taperrate.values~=0)])/sum([popdata.bifurcation.diameterbins(i).piecelength.values(popdata.bifurcation.diameterbins(i).taperrate.values~=0)]);
                typeanalysis.bifurcation.diameter.taperratenonzero(i).std              = std([typeanalysis.bifurcation.diameter.taperratenonzero(i).values]);
                typeanalysis.bifurcation.diameter.taperratenonzero(i).max              = max([typeanalysis.bifurcation.diameter.taperratenonzero(i).values]);
                typeanalysis.bifurcation.diameter.taperratenonzero(i).min              = min([typeanalysis.bifurcation.diameter.taperratenonzero(i).values]);
                typeanalysis.bifurcation.diameter.taperratenonzero(i).skew             = skewness([typeanalysis.bifurcation.diameter.taperratenonzero(i).values],0);
                typeanalysis.bifurcation.diameter.taperratenonzero(i).kurt             = kurtosis([typeanalysis.bifurcation.diameter.taperratenonzero(i).values],0);
                
                typeanalysis.bifurcation.diameter.bifurcationprobability.length(i)      = typeanalysis.bifurcation.diameter.numberbifurcations(i).total / typeanalysis.bifurcation.diameter.length(i).total;
                typeanalysis.bifurcation.diameter.bifurcationprobability.surfacearea(i) = typeanalysis.bifurcation.diameter.numberbifurcations(i).total / typeanalysis.bifurcation.diameter.surfacearea(i).total;
                typeanalysis.bifurcation.diameter.bifurcationprobability.volume(i)      = typeanalysis.bifurcation.diameter.numberbifurcations(i).total / typeanalysis.bifurcation.diameter.volume(i).total;
                
            else
                typeanalysis.bifurcation.diameter.length(i).mean             = NaN;
                typeanalysis.bifurcation.diameter.length(i).std              = NaN;
                typeanalysis.bifurcation.diameter.length(i).max              = NaN;
                typeanalysis.bifurcation.diameter.length(i).min              = NaN;
                typeanalysis.bifurcation.diameter.length(i).skew             = NaN;
                typeanalysis.bifurcation.diameter.length(i).kurt             = NaN;
                typeanalysis.bifurcation.diameter.length(i).total            = NaN;
                
                typeanalysis.bifurcation.diameter.surfacearea(i).mean             = NaN;
                typeanalysis.bifurcation.diameter.surfacearea(i).std              = NaN;
                typeanalysis.bifurcation.diameter.surfacearea(i).max              = NaN;
                typeanalysis.bifurcation.diameter.surfacearea(i).min              = NaN;
                typeanalysis.bifurcation.diameter.surfacearea(i).skew             = NaN;
                typeanalysis.bifurcation.diameter.surfacearea(i).kurt             = NaN;
                typeanalysis.bifurcation.diameter.surfacearea(i).total            = NaN;
                
                typeanalysis.bifurcation.diameter.volume(i).mean             = NaN;
                typeanalysis.bifurcation.diameter.volume(i).std              = NaN;
                typeanalysis.bifurcation.diameter.volume(i).max              = NaN;
                typeanalysis.bifurcation.diameter.volume(i).min              = NaN;
                typeanalysis.bifurcation.diameter.volume(i).skew             = NaN;
                typeanalysis.bifurcation.diameter.volume(i).kurt             = NaN;
                typeanalysis.bifurcation.diameter.volume(i).total            = NaN;
                
                typeanalysis.bifurcation.diameter.numbersegments(i).mean             = NaN;
                typeanalysis.bifurcation.diameter.numbersegments(i).std              = NaN;
                typeanalysis.bifurcation.diameter.numbersegments(i).max              = NaN;
                typeanalysis.bifurcation.diameter.numbersegments(i).min              = NaN;
                typeanalysis.bifurcation.diameter.numbersegments(i).skew             = NaN;
                typeanalysis.bifurcation.diameter.numbersegments(i).kurt             = NaN;
                typeanalysis.bifurcation.diameter.numbersegments(i).total            = NaN;
                
                typeanalysis.bifurcation.diameter.numberbifurcations(i).mean             = NaN;
                typeanalysis.bifurcation.diameter.numberbifurcations(i).std              = NaN;
                typeanalysis.bifurcation.diameter.numberbifurcations(i).max              = NaN;
                typeanalysis.bifurcation.diameter.numberbifurcations(i).min              = NaN;
                typeanalysis.bifurcation.diameter.numberbifurcations(i).skew             = NaN;
                typeanalysis.bifurcation.diameter.numberbifurcations(i).kurt             = NaN;
                typeanalysis.bifurcation.diameter.numberbifurcations(i).total            = NaN;
                
                typeanalysis.bifurcation.diameter.rallratio(i).mean             = NaN;
                typeanalysis.bifurcation.diameter.rallratio(i).std              = NaN;
                typeanalysis.bifurcation.diameter.rallratio(i).max              = NaN;
                typeanalysis.bifurcation.diameter.rallratio(i).min              = NaN;
                typeanalysis.bifurcation.diameter.rallratio(i).skew             = NaN;
                typeanalysis.bifurcation.diameter.rallratio(i).kurt             = NaN;
                
                typeanalysis.bifurcation.diameter.rallratio1(i).mean             = NaN;
                typeanalysis.bifurcation.diameter.rallratio1(i).std              = NaN;
                typeanalysis.bifurcation.diameter.rallratio1(i).max              = NaN;
                typeanalysis.bifurcation.diameter.rallratio1(i).min              = NaN;
                typeanalysis.bifurcation.diameter.rallratio1(i).skew             = NaN;
                typeanalysis.bifurcation.diameter.rallratio1(i).kurt             = NaN;
                
                typeanalysis.bifurcation.diameter.rallratio2(i).mean             = NaN;
                typeanalysis.bifurcation.diameter.rallratio2(i).std              = NaN;
                typeanalysis.bifurcation.diameter.rallratio2(i).max              = NaN;
                typeanalysis.bifurcation.diameter.rallratio2(i).min              = NaN;
                typeanalysis.bifurcation.diameter.rallratio2(i).skew             = NaN;
                typeanalysis.bifurcation.diameter.rallratio2(i).kurt             = NaN;
                
                typeanalysis.bifurcation.diameter.rallratio3(i).mean             = NaN;
                typeanalysis.bifurcation.diameter.rallratio3(i).std              = NaN;
                typeanalysis.bifurcation.diameter.rallratio3(i).max              = NaN;
                typeanalysis.bifurcation.diameter.rallratio3(i).min              = NaN;
                typeanalysis.bifurcation.diameter.rallratio3(i).skew             = NaN;
                typeanalysis.bifurcation.diameter.rallratio3(i).kurt             = NaN;
                
                typeanalysis.bifurcation.diameter.daughterratio(i).mean             = NaN;
                typeanalysis.bifurcation.diameter.daughterratio(i).std              = NaN;
                typeanalysis.bifurcation.diameter.daughterratio(i).max              = NaN;
                typeanalysis.bifurcation.diameter.daughterratio(i).min              = NaN;
                typeanalysis.bifurcation.diameter.daughterratio(i).skew             = NaN;
                typeanalysis.bifurcation.diameter.daughterratio(i).kurt             = NaN;
                
                typeanalysis.bifurcation.diameter.parentdaughterratio(i).mean             = NaN;
                typeanalysis.bifurcation.diameter.parentdaughterratio(i).std              = NaN;
                typeanalysis.bifurcation.diameter.parentdaughterratio(i).max              = NaN;
                typeanalysis.bifurcation.diameter.parentdaughterratio(i).min              = NaN;
                typeanalysis.bifurcation.diameter.parentdaughterratio(i).skew             = NaN;
                typeanalysis.bifurcation.diameter.parentdaughterratio(i).kurt             = NaN;
                
                typeanalysis.bifurcation.diameter.parentdaughter2ratio(i).mean             = NaN;
                typeanalysis.bifurcation.diameter.parentdaughter2ratio(i).std              = NaN;
                typeanalysis.bifurcation.diameter.parentdaughter2ratio(i).max              = NaN;
                typeanalysis.bifurcation.diameter.parentdaughter2ratio(i).min              = NaN;
                typeanalysis.bifurcation.diameter.parentdaughter2ratio(i).skew             = NaN;
                typeanalysis.bifurcation.diameter.parentdaughter2ratio(i).kurt             = NaN;
                
                typeanalysis.bifurcation.diameter.meandiameter(i).mean             = NaN;
                typeanalysis.bifurcation.diameter.meandiameter(i).std              = NaN;
                typeanalysis.bifurcation.diameter.meandiameter(i).max              = NaN;
                typeanalysis.bifurcation.diameter.meandiameter(i).min              = NaN;
                typeanalysis.bifurcation.diameter.meandiameter(i).skew             = NaN;
                typeanalysis.bifurcation.diameter.meandiameter(i).kurt             = NaN;
                
                typeanalysis.bifurcation.diameter.taperrate(i).mean             = NaN;
                typeanalysis.bifurcation.diameter.taperrate(i).std              = NaN;
                typeanalysis.bifurcation.diameter.taperrate(i).max              = NaN;
                typeanalysis.bifurcation.diameter.taperrate(i).min              = NaN;
                typeanalysis.bifurcation.diameter.taperrate(i).skew             = NaN;
                typeanalysis.bifurcation.diameter.taperrate(i).kurt             = NaN;
                
                typeanalysis.bifurcation.diameter.taperratenonzero(i).mean             = NaN;
                typeanalysis.bifurcation.diameter.taperratenonzero(i).std              = NaN;
                typeanalysis.bifurcation.diameter.taperratenonzero(i).max              = NaN;
                typeanalysis.bifurcation.diameter.taperratenonzero(i).min              = NaN;
                typeanalysis.bifurcation.diameter.taperratenonzero(i).skew             = NaN;
                typeanalysis.bifurcation.diameter.taperratenonzero(i).kurt             = NaN;
                
                typeanalysis.bifurcation.diameter.bifurcationprobability.length(i)      = NaN;
                typeanalysis.bifurcation.diameter.bifurcationprobability.surfacearea(i) = NaN;
                typeanalysis.bifurcation.diameter.bifurcationprobability.volume(i)      = NaN;
                
            end
        end
        
        typeanalysis.bifurcation.diameter = orderfields(typeanalysis.bifurcation.diameter);
        
        
        
        
        
        
        
        
        
        % Begin termination diameter analysis
        
        
        for i = 1:length(popdata.termination.diameterbins)
            popdata.termination.diameterbins(i).meandiameter.values         = [];
            popdata.termination.diameterbins(i).taperrate.values            = [];
            popdata.termination.diameterbins(i).piecelength.values          = [];
        end
        
        
        for i = 1:length(data.individual)
            
            clear inddata;
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            
            for j = 1:length(inddata.termination.diameterbins)
                
                inddata.termination.diameterbins(j).length                      = 0;
                inddata.termination.diameterbins(j).surfacearea                 = 0;
                inddata.termination.diameterbins(j).volume                      = 0;
                inddata.termination.diameterbins(j).numbersegments              = 0;
                inddata.termination.diameterbins(j).numberterminations          = 0;
                inddata.termination.diameterbins(j).meandiameter.values         = [];
                inddata.termination.diameterbins(j).taperrate.values            = [];
                inddata.termination.diameterbins(j).piecelength.values          = [];
                
                if isfield(inddata.termination.diameterbins(j).piece,'id') == 1
                    
                    inddata.termination.diameterbins(j).length                      = sum([inddata.termination.diameterbins(j).piece.length]);
                    inddata.termination.diameterbins(j).surfacearea                 = sum([inddata.termination.diameterbins(j).piece.surfacearea]);
                    inddata.termination.diameterbins(j).volume                      = sum([inddata.termination.diameterbins(j).piece.volume]);
                    inddata.termination.diameterbins(j).numbersegments              = length(unique([inddata.termination.diameterbins(j).piece.cable]));
                    inddata.termination.diameterbins(j).meandiameter.values         = ([inddata.termination.diameterbins(j).piece.proximaldiameter]+[inddata.termination.diameterbins(j).piece.distaldiameter])/2;
                    inddata.termination.diameterbins(j).taperrate.values            = [inddata.termination.diameterbins(j).piece.taperrate];
                    inddata.termination.diameterbins(j).piecelength.values          = [inddata.termination.diameterbins(j).piece.length];
                end
                
                for k = 1:length(inddata.termination.diameterbins(j).piece)
                    if strcmp(inddata.termination.diameterbins(j).piece(k).distaltype,'termination')==1
                        inddata.termination.diameterbins(j).numberterminations = 1 + inddata.termination.diameterbins(j).numberterminations;
                    end
                end
                
                if isfield(popdata,'diameterbins') == 0; nextvalue = 1;
                elseif j > length(popdata.termination.diameterbins); nextvalue = 1;
                elseif isfield(popdata.termination.diameterbins(j),'length') == 0; nextvalue = 1;
                elseif isfield(popdata.termination.diameterbins(j).length,'values') == 0; nextvalue = 1;
                else nextvalue = 1 + length(popdata.termination.diameterbins(j).length.values);
                end
                popdata.termination.diameterbins(j).length.values(nextvalue)             = inddata.termination.diameterbins(j).length;
                popdata.termination.diameterbins(j).surfacearea.values(nextvalue)        = inddata.termination.diameterbins(j).surfacearea;
                popdata.termination.diameterbins(j).volume.values(nextvalue)             = inddata.termination.diameterbins(j).volume;
                popdata.termination.diameterbins(j).numbersegments.values(nextvalue)     = inddata.termination.diameterbins(j).numbersegments;
                popdata.termination.diameterbins(j).numberterminations.values(nextvalue) = inddata.termination.diameterbins(j).numberterminations;
                popdata.termination.diameterbins(j).meandiameter.values                  = [ [popdata.termination.diameterbins(j).meandiameter.values] [inddata.termination.diameterbins(j).meandiameter.values] ];
                popdata.termination.diameterbins(j).taperrate.values                     = [ [popdata.termination.diameterbins(j).taperrate.values] [inddata.termination.diameterbins(j).taperrate.values] ];
                popdata.termination.diameterbins(j).piecelength.values                   = [ [popdata.termination.diameterbins(j).piecelength.values] [inddata.termination.diameterbins(j).piecelength.values] ];
                
                clear nextvalue;
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        for i = 1:length(popdata.termination.diameterbins)
            
            typeanalysis.termination.diameter.diameter(i) = popdata.diameterbinmiddles(i);
            
            if isfield(popdata.termination.diameterbins(i).length,'values') == 1
                
                typeanalysis.termination.diameter.length(i).values           = popdata.termination.diameterbins(i).length.values;
                typeanalysis.termination.diameter.length(i).mean             = mean([typeanalysis.termination.diameter.length(i).values]);
                typeanalysis.termination.diameter.length(i).std              = std([typeanalysis.termination.diameter.length(i).values]);
                typeanalysis.termination.diameter.length(i).max              = max([typeanalysis.termination.diameter.length(i).values]);
                typeanalysis.termination.diameter.length(i).min              = min([typeanalysis.termination.diameter.length(i).values]);
                typeanalysis.termination.diameter.length(i).skew             = skewness([typeanalysis.termination.diameter.length(i).values],0);
                typeanalysis.termination.diameter.length(i).kurt             = kurtosis([typeanalysis.termination.diameter.length(i).values],0);
                typeanalysis.termination.diameter.length(i).total            = sum([typeanalysis.termination.diameter.length(i).values]);
                
                typeanalysis.termination.diameter.surfacearea(i).values           = popdata.termination.diameterbins(i).surfacearea.values;
                typeanalysis.termination.diameter.surfacearea(i).mean             = mean([typeanalysis.termination.diameter.surfacearea(i).values]);
                typeanalysis.termination.diameter.surfacearea(i).std              = std([typeanalysis.termination.diameter.surfacearea(i).values]);
                typeanalysis.termination.diameter.surfacearea(i).max              = max([typeanalysis.termination.diameter.surfacearea(i).values]);
                typeanalysis.termination.diameter.surfacearea(i).min              = min([typeanalysis.termination.diameter.surfacearea(i).values]);
                typeanalysis.termination.diameter.surfacearea(i).skew             = skewness([typeanalysis.termination.diameter.surfacearea(i).values],0);
                typeanalysis.termination.diameter.surfacearea(i).kurt             = kurtosis([typeanalysis.termination.diameter.surfacearea(i).values],0);
                typeanalysis.termination.diameter.surfacearea(i).total            = sum([typeanalysis.termination.diameter.surfacearea(i).values]);
                
                typeanalysis.termination.diameter.volume(i).values           = popdata.termination.diameterbins(i).volume.values;
                typeanalysis.termination.diameter.volume(i).mean             = mean([typeanalysis.termination.diameter.volume(i).values]);
                typeanalysis.termination.diameter.volume(i).std              = std([typeanalysis.termination.diameter.volume(i).values]);
                typeanalysis.termination.diameter.volume(i).max              = max([typeanalysis.termination.diameter.volume(i).values]);
                typeanalysis.termination.diameter.volume(i).min              = min([typeanalysis.termination.diameter.volume(i).values]);
                typeanalysis.termination.diameter.volume(i).skew             = skewness([typeanalysis.termination.diameter.volume(i).values],0);
                typeanalysis.termination.diameter.volume(i).kurt             = kurtosis([typeanalysis.termination.diameter.volume(i).values],0);
                typeanalysis.termination.diameter.volume(i).total            = sum([typeanalysis.termination.diameter.volume(i).values]);
                
                typeanalysis.termination.diameter.numbersegments(i).values           = popdata.termination.diameterbins(i).numbersegments.values;
                typeanalysis.termination.diameter.numbersegments(i).mean             = mean([typeanalysis.termination.diameter.numbersegments(i).values]);
                typeanalysis.termination.diameter.numbersegments(i).std              = std([typeanalysis.termination.diameter.numbersegments(i).values]);
                typeanalysis.termination.diameter.numbersegments(i).max              = max([typeanalysis.termination.diameter.numbersegments(i).values]);
                typeanalysis.termination.diameter.numbersegments(i).min              = min([typeanalysis.termination.diameter.numbersegments(i).values]);
                typeanalysis.termination.diameter.numbersegments(i).skew             = skewness([typeanalysis.termination.diameter.numbersegments(i).values],0);
                typeanalysis.termination.diameter.numbersegments(i).kurt             = kurtosis([typeanalysis.termination.diameter.numbersegments(i).values],0);
                typeanalysis.termination.diameter.numbersegments(i).total            = sum([typeanalysis.termination.diameter.numbersegments(i).values]);
                
                typeanalysis.termination.diameter.numberterminations(i).values           = popdata.termination.diameterbins(i).numberterminations.values;
                typeanalysis.termination.diameter.numberterminations(i).mean             = mean([typeanalysis.termination.diameter.numberterminations(i).values]);
                typeanalysis.termination.diameter.numberterminations(i).std              = std([typeanalysis.termination.diameter.numberterminations(i).values]);
                typeanalysis.termination.diameter.numberterminations(i).max              = max([typeanalysis.termination.diameter.numberterminations(i).values]);
                typeanalysis.termination.diameter.numberterminations(i).min              = min([typeanalysis.termination.diameter.numberterminations(i).values]);
                typeanalysis.termination.diameter.numberterminations(i).skew             = skewness([typeanalysis.termination.diameter.numberterminations(i).values],0);
                typeanalysis.termination.diameter.numberterminations(i).kurt             = kurtosis([typeanalysis.termination.diameter.numberterminations(i).values],0);
                typeanalysis.termination.diameter.numberterminations(i).total            = sum([typeanalysis.termination.diameter.numberterminations(i).values]);
                
                typeanalysis.termination.diameter.meandiameter(i).values           = popdata.termination.diameterbins(i).meandiameter.values;
                typeanalysis.termination.diameter.meandiameter(i).mean             = sum([popdata.termination.diameterbins(i).meandiameter.values].*[popdata.termination.diameterbins(i).piecelength.values])/sum([popdata.termination.diameterbins(i).piecelength.values]);
                typeanalysis.termination.diameter.meandiameter(i).std              = std([typeanalysis.termination.diameter.meandiameter(i).values]);
                typeanalysis.termination.diameter.meandiameter(i).max              = max([typeanalysis.termination.diameter.meandiameter(i).values]);
                typeanalysis.termination.diameter.meandiameter(i).min              = min([typeanalysis.termination.diameter.meandiameter(i).values]);
                typeanalysis.termination.diameter.meandiameter(i).skew             = skewness([typeanalysis.termination.diameter.meandiameter(i).values],0);
                typeanalysis.termination.diameter.meandiameter(i).kurt             = kurtosis([typeanalysis.termination.diameter.meandiameter(i).values],0);
                
                typeanalysis.termination.diameter.taperrate(i).values           = popdata.termination.diameterbins(i).taperrate.values;
                typeanalysis.termination.diameter.taperrate(i).mean             = sum([popdata.termination.diameterbins(i).taperrate.values].*[popdata.termination.diameterbins(i).piecelength.values])/sum([popdata.termination.diameterbins(i).piecelength.values]);
                typeanalysis.termination.diameter.taperrate(i).std              = std([typeanalysis.termination.diameter.taperrate(i).values]);
                typeanalysis.termination.diameter.taperrate(i).max              = max([typeanalysis.termination.diameter.taperrate(i).values]);
                typeanalysis.termination.diameter.taperrate(i).min              = min([typeanalysis.termination.diameter.taperrate(i).values]);
                typeanalysis.termination.diameter.taperrate(i).skew             = skewness([typeanalysis.termination.diameter.taperrate(i).values],0);
                typeanalysis.termination.diameter.taperrate(i).kurt             = kurtosis([typeanalysis.termination.diameter.taperrate(i).values],0);
                
                typeanalysis.termination.diameter.taperratenonzero(i).values           = popdata.termination.diameterbins(i).taperrate.values(popdata.termination.diameterbins(i).taperrate.values~=0);
                typeanalysis.termination.diameter.taperratenonzero(i).mean             = sum([popdata.termination.diameterbins(i).taperrate.values(popdata.termination.diameterbins(i).taperrate.values~=0)].*[popdata.termination.diameterbins(i).piecelength.values(popdata.termination.diameterbins(i).taperrate.values~=0)])/sum([popdata.termination.diameterbins(i).piecelength.values(popdata.termination.diameterbins(i).taperrate.values~=0)]);
                typeanalysis.termination.diameter.taperratenonzero(i).std              = std([typeanalysis.termination.diameter.taperratenonzero(i).values]);
                typeanalysis.termination.diameter.taperratenonzero(i).max              = max([typeanalysis.termination.diameter.taperratenonzero(i).values]);
                typeanalysis.termination.diameter.taperratenonzero(i).min              = min([typeanalysis.termination.diameter.taperratenonzero(i).values]);
                typeanalysis.termination.diameter.taperratenonzero(i).skew             = skewness([typeanalysis.termination.diameter.taperratenonzero(i).values],0);
                typeanalysis.termination.diameter.taperratenonzero(i).kurt             = kurtosis([typeanalysis.termination.diameter.taperratenonzero(i).values],0);
                
                typeanalysis.termination.diameter.terminationprobability.length(i)      = typeanalysis.termination.diameter.numberterminations(i).total / typeanalysis.termination.diameter.length(i).total;
                typeanalysis.termination.diameter.terminationprobability.surfacearea(i) = typeanalysis.termination.diameter.numberterminations(i).total / typeanalysis.termination.diameter.surfacearea(i).total;
                typeanalysis.termination.diameter.terminationprobability.volume(i)      = typeanalysis.termination.diameter.numberterminations(i).total / typeanalysis.termination.diameter.volume(i).total;
                
            else
                disp('Extra diameter bin in termination...');
                keyboard
                
            end
        end
        
        typeanalysis.termination.diameter = orderfields(typeanalysis.termination.diameter);
        eval(['analysis.' currentpiecetype ' = typeanalysis;']);
        eval(['data.population.' currentpiecetype ' = popdata;']);
        
    end
end

warning('on', 'MATLAB:divideByZero');