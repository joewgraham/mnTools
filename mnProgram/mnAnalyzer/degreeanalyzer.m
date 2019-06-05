function [data,analysis] = degreeanalyzer(data,analysis)

disp('   Degree analysis started.');

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
        
        for i = 1:length(data.individual)
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            for j = 1:typeanalysis.maxdegree.max
                inddata.degreebins(j).numberbifurcations          = [];
                inddata.degreebins(j).numberterminations          = [];
                inddata.degreebins(j).numbersegments              = [];
                inddata.degreebins(j).length.values               = [];
                inddata.degreebins(j).surfacearea.values          = [];
                inddata.degreebins(j).volume.values               = [];
                inddata.degreebins(j).taperrate.values            = [];
                inddata.degreebins(j).taperratio.values           = [];
                inddata.degreebins(j).proximaldiameter.values     = [];
                inddata.degreebins(j).cylindricaldiameter.values  = [];
                inddata.degreebins(j).distaldiameter.values       = [];
                inddata.degreebins(j).rallratio.values            = [];
                inddata.degreebins(j).rallratio1.values           = [];
                inddata.degreebins(j).rallratio2.values           = [];
                inddata.degreebins(j).rallratio3.values           = [];
                inddata.degreebins(j).daughterratio.values        = [];
                inddata.degreebins(j).parentdaughterratio.values  = [];
                inddata.degreebins(j).parentdaughter2ratio.values = [];
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        for i = 1:length(data.individual)
            
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            
            for j = 1:inddata.maxdegree
                
                if length(inddata.degreebins(j).cable) > 0
                    
                    inddata.degreebins(j).numberbifurcations = 0;
                    inddata.degreebins(j).numberterminations = 0;
                    inddata.degreebins(j).numbersegments     = 0;
                    
                    
                    
                    inddata.degreebins(j).length.values               = [inddata.degreebins(j).cable.length];
                    inddata.degreebins(j).surfacearea.values          = [inddata.degreebins(j).cable.surfacearea];
                    inddata.degreebins(j).volume.values               = [inddata.degreebins(j).cable.volume];
                    inddata.degreebins(j).taperrate.values            = [inddata.degreebins(j).cable.taperrate];
                    inddata.degreebins(j).taperratio.values           = [inddata.degreebins(j).cable.taperratio];
                    inddata.degreebins(j).proximaldiameter.values     = [inddata.degreebins(j).cable.proximaldiameter];
                    inddata.degreebins(j).cylindricaldiameter.values  = [inddata.degreebins(j).cable.cylindricaldiameter];
                    inddata.degreebins(j).distaldiameter.values       = [inddata.degreebins(j).cable.distaldiameter];
                    inddata.degreebins(j).rallratio.values            = [inddata.degreebins(j).cable.rallratio];
                    inddata.degreebins(j).rallratio1.values           = [inddata.degreebins(j).cable.rallratio1];
                    inddata.degreebins(j).rallratio2.values           = [inddata.degreebins(j).cable.rallratio2];
                    inddata.degreebins(j).rallratio3.values           = [inddata.degreebins(j).cable.rallratio3];
                    inddata.degreebins(j).daughterratio.values        = [inddata.degreebins(j).cable.daughterratio];
                    inddata.degreebins(j).parentdaughterratio.values  = [inddata.degreebins(j).cable.parentdaughterratio];
                    inddata.degreebins(j).parentdaughter2ratio.values = [inddata.degreebins(j).cable.parentdaughter2ratio];
                    
                    
                    for k = 1:length(inddata.degreebins(j).cable)
                        inddata.degreebins(j).numbersegments = 1 + inddata.degreebins(j).numbersegments;
                        if strcmp(inddata.degreebins(j).cable(k).distaltype,'bifurcation')==1
                            inddata.degreebins(j).numberbifurcations = 1 + inddata.degreebins(j).numberbifurcations;
                        end
                        if strcmp(inddata.degreebins(j).cable(k).distaltype,'termination')==1
                            inddata.degreebins(j).numberterminations = 1 + inddata.degreebins(j).numberterminations;
                        end
                    end
                end
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        
        for i = 1:length(data.individual)
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            for m = 1:typeanalysis.maxdegree.max
                popdata.degreebins(m).numberbifurcations(i).values = [];
                popdata.degreebins(m).numberterminations(i).values = [];
                popdata.degreebins(m).numbersegments(i).values     = [];
                popdata.degreebins(m).length.values                = [];
                popdata.degreebins(m).surfacearea.values           = [];
                popdata.degreebins(m).volume.values                = [];
                popdata.degreebins(m).taperrate.values             = [];
                popdata.degreebins(m).taperratio.values            = [];
                popdata.degreebins(m).proximaldiameter.values      = [];
                popdata.degreebins(m).cylindricaldiameter.values   = [];
                popdata.degreebins(m).distaldiameter.values        = [];
                popdata.degreebins(m).rallratio.values             = [];
                popdata.degreebins(m).rallratio1.values            = [];
                popdata.degreebins(m).rallratio2.values            = [];
                popdata.degreebins(m).rallratio3.values            = [];
                popdata.degreebins(m).daughterratio.values         = [];
                popdata.degreebins(m).parentdaughterratio.values   = [];
                popdata.degreebins(m).parentdaughter2ratio.values  = [];
            end
        end
        
        for i = 1:length(data.individual)
            
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            
            for j = 1:inddata.maxdegree
                
                popdata.degreebins(j).numbersegments(i).values     = [popdata.degreebins(j).numbersegments(i).values inddata.degreebins(j).numbersegments];
                popdata.degreebins(j).numberbifurcations(i).values = [popdata.degreebins(j).numberbifurcations(i).values inddata.degreebins(j).numberbifurcations];
                popdata.degreebins(j).numberterminations(i).values = [popdata.degreebins(j).numberterminations(i).values inddata.degreebins(j).numberterminations];
                
                inddata.degreebins(j).proximaldiameter.max   = max(inddata.degreebins(j).proximaldiameter.values);
                inddata.degreebins(j).proximaldiameter.mean  = mean(inddata.degreebins(j).proximaldiameter.values);
                inddata.degreebins(j).proximaldiameter.min   = min(inddata.degreebins(j).proximaldiameter.values);
                inddata.degreebins(j).proximaldiameter.std   = std(inddata.degreebins(j).proximaldiameter.values);
                inddata.degreebins(j).proximaldiameter.total = sum(inddata.degreebins(j).proximaldiameter.values);
                inddata.degreebins(j).proximaldiameter.skew  = skewness(inddata.degreebins(j).proximaldiameter.values,0);
                inddata.degreebins(j).proximaldiameter.kurt  = kurtosis(inddata.degreebins(j).proximaldiameter.values,0);
                
                inddata.degreebins(j).cylindricaldiameter.max   = max(inddata.degreebins(j).cylindricaldiameter.values);
                inddata.degreebins(j).cylindricaldiameter.mean  = mean(inddata.degreebins(j).cylindricaldiameter.values);
                inddata.degreebins(j).cylindricaldiameter.min   = min(inddata.degreebins(j).cylindricaldiameter.values);
                inddata.degreebins(j).cylindricaldiameter.std   = std(inddata.degreebins(j).cylindricaldiameter.values);
                inddata.degreebins(j).cylindricaldiameter.total = sum(inddata.degreebins(j).cylindricaldiameter.values);
                inddata.degreebins(j).cylindricaldiameter.skew  = skewness(inddata.degreebins(j).cylindricaldiameter.values,0);
                inddata.degreebins(j).cylindricaldiameter.kurt  = kurtosis(inddata.degreebins(j).cylindricaldiameter.values,0);
                
                inddata.degreebins(j).distaldiameter.max   = max(inddata.degreebins(j).distaldiameter.values);
                inddata.degreebins(j).distaldiameter.mean  = mean(inddata.degreebins(j).distaldiameter.values);
                inddata.degreebins(j).distaldiameter.min   = min(inddata.degreebins(j).distaldiameter.values);
                inddata.degreebins(j).distaldiameter.std   = std(inddata.degreebins(j).distaldiameter.values);
                inddata.degreebins(j).distaldiameter.total = sum(inddata.degreebins(j).distaldiameter.values);
                inddata.degreebins(j).distaldiameter.skew  = skewness(inddata.degreebins(j).distaldiameter.values,0);
                inddata.degreebins(j).distaldiameter.kurt  = kurtosis(inddata.degreebins(j).distaldiameter.values,0);
                
                inddata.degreebins(j).length.max   = max(inddata.degreebins(j).length.values);
                inddata.degreebins(j).length.mean  = mean(inddata.degreebins(j).length.values);
                inddata.degreebins(j).length.min   = min(inddata.degreebins(j).length.values);
                inddata.degreebins(j).length.std   = std(inddata.degreebins(j).length.values);
                inddata.degreebins(j).length.total = sum(inddata.degreebins(j).length.values);
                inddata.degreebins(j).length.skew  = skewness(inddata.degreebins(j).length.values,0);
                inddata.degreebins(j).length.kurt  = kurtosis(inddata.degreebins(j).length.values,0);
                
                inddata.degreebins(j).surfacearea.max   = max(inddata.degreebins(j).surfacearea.values);
                inddata.degreebins(j).surfacearea.mean  = mean(inddata.degreebins(j).surfacearea.values);
                inddata.degreebins(j).surfacearea.min   = min(inddata.degreebins(j).surfacearea.values);
                inddata.degreebins(j).surfacearea.std   = std(inddata.degreebins(j).surfacearea.values);
                inddata.degreebins(j).surfacearea.total = sum(inddata.degreebins(j).surfacearea.values);
                inddata.degreebins(j).surfacearea.skew  = skewness(inddata.degreebins(j).surfacearea.values,0);
                inddata.degreebins(j).surfacearea.kurt  = kurtosis(inddata.degreebins(j).surfacearea.values,0);
                
                inddata.degreebins(j).volume.max   = max(inddata.degreebins(j).volume.values);
                inddata.degreebins(j).volume.mean  = mean(inddata.degreebins(j).volume.values);
                inddata.degreebins(j).volume.min   = min(inddata.degreebins(j).volume.values);
                inddata.degreebins(j).volume.std   = std(inddata.degreebins(j).volume.values);
                inddata.degreebins(j).volume.total = sum(inddata.degreebins(j).volume.values);
                inddata.degreebins(j).volume.skew  = skewness(inddata.degreebins(j).volume.values,0);
                inddata.degreebins(j).volume.kurt  = kurtosis(inddata.degreebins(j).volume.values,0);
                
                inddata.degreebins(j).taperrate.max   = max(inddata.degreebins(j).taperrate.values);
                %inddata.degreebins(j).taperrate.mean  = mean(inddata.degreebins(j).taperrate.values);
                inddata.degreebins(j).taperrate.mean  = sum(([inddata.degreebins(j).taperrate.values].*[inddata.degreebins(j).length.values])/sum([inddata.degreebins(j).length.values]));
                inddata.degreebins(j).taperrate.min   = min(inddata.degreebins(j).taperrate.values);
                inddata.degreebins(j).taperrate.std   = std(inddata.degreebins(j).taperrate.values);
                inddata.degreebins(j).taperrate.total = sum(inddata.degreebins(j).taperrate.values);
                inddata.degreebins(j).taperrate.skew  = skewness(inddata.degreebins(j).taperrate.values,0);
                inddata.degreebins(j).taperrate.kurt  = kurtosis(inddata.degreebins(j).taperrate.values,0);
                
                inddata.degreebins(j).taperratio.max   = max(inddata.degreebins(j).taperratio.values);
                inddata.degreebins(j).taperratio.mean  = mean(inddata.degreebins(j).taperratio.values);
                inddata.degreebins(j).taperratio.min   = min(inddata.degreebins(j).taperratio.values);
                inddata.degreebins(j).taperratio.std   = std(inddata.degreebins(j).taperratio.values);
                inddata.degreebins(j).taperratio.total = sum(inddata.degreebins(j).taperratio.values);
                inddata.degreebins(j).taperratio.skew  = skewness(inddata.degreebins(j).taperratio.values,0);
                inddata.degreebins(j).taperratio.kurt  = kurtosis(inddata.degreebins(j).taperratio.values,0);
                
                if j < inddata.maxdegree
                    inddata.degreebins(j).rallratio.max   = max(inddata.degreebins(j).rallratio.values);
                    inddata.degreebins(j).rallratio.mean  = mean(inddata.degreebins(j).rallratio.values);
                    inddata.degreebins(j).rallratio.min   = min(inddata.degreebins(j).rallratio.values);
                    inddata.degreebins(j).rallratio.std   = std(inddata.degreebins(j).rallratio.values);
                    inddata.degreebins(j).rallratio.total = sum(inddata.degreebins(j).rallratio.values);
                    inddata.degreebins(j).rallratio.skew  = skewness(inddata.degreebins(j).rallratio.values,0);
                    inddata.degreebins(j).rallratio.kurt  = kurtosis(inddata.degreebins(j).rallratio.values,0);
                    
                    inddata.degreebins(j).rallratio1.max   = max(inddata.degreebins(j).rallratio1.values);
                    inddata.degreebins(j).rallratio1.mean  = mean(inddata.degreebins(j).rallratio1.values);
                    inddata.degreebins(j).rallratio1.min   = min(inddata.degreebins(j).rallratio1.values);
                    inddata.degreebins(j).rallratio1.std   = std(inddata.degreebins(j).rallratio1.values);
                    inddata.degreebins(j).rallratio1.total = sum(inddata.degreebins(j).rallratio1.values);
                    inddata.degreebins(j).rallratio1.skew  = skewness(inddata.degreebins(j).rallratio1.values,0);
                    inddata.degreebins(j).rallratio1.kurt  = kurtosis(inddata.degreebins(j).rallratio1.values,0);
                    
                    inddata.degreebins(j).rallratio2.max   = max(inddata.degreebins(j).rallratio2.values);
                    inddata.degreebins(j).rallratio2.mean  = mean(inddata.degreebins(j).rallratio2.values);
                    inddata.degreebins(j).rallratio2.min   = min(inddata.degreebins(j).rallratio2.values);
                    inddata.degreebins(j).rallratio2.std   = std(inddata.degreebins(j).rallratio2.values);
                    inddata.degreebins(j).rallratio2.total = sum(inddata.degreebins(j).rallratio2.values);
                    inddata.degreebins(j).rallratio2.skew  = skewness(inddata.degreebins(j).rallratio2.values,0);
                    inddata.degreebins(j).rallratio2.kurt  = kurtosis(inddata.degreebins(j).rallratio2.values,0);
                    
                    inddata.degreebins(j).rallratio3.max   = max(inddata.degreebins(j).rallratio3.values);
                    inddata.degreebins(j).rallratio3.mean  = mean(inddata.degreebins(j).rallratio3.values);
                    inddata.degreebins(j).rallratio3.min   = min(inddata.degreebins(j).rallratio3.values);
                    inddata.degreebins(j).rallratio3.std   = std(inddata.degreebins(j).rallratio3.values);
                    inddata.degreebins(j).rallratio3.total = sum(inddata.degreebins(j).rallratio3.values);
                    inddata.degreebins(j).rallratio3.skew  = skewness(inddata.degreebins(j).rallratio3.values,0);
                    inddata.degreebins(j).rallratio3.kurt  = kurtosis(inddata.degreebins(j).rallratio3.values,0);
                    
                    inddata.degreebins(j).daughterratio.max   = max(inddata.degreebins(j).daughterratio.values);
                    inddata.degreebins(j).daughterratio.mean  = mean(inddata.degreebins(j).daughterratio.values);
                    inddata.degreebins(j).daughterratio.min   = min(inddata.degreebins(j).daughterratio.values);
                    inddata.degreebins(j).daughterratio.std   = std(inddata.degreebins(j).daughterratio.values);
                    inddata.degreebins(j).daughterratio.total = sum(inddata.degreebins(j).daughterratio.values);
                    inddata.degreebins(j).daughterratio.skew  = skewness(inddata.degreebins(j).daughterratio.values,0);
                    inddata.degreebins(j).daughterratio.kurt  = kurtosis(inddata.degreebins(j).daughterratio.values,0);
                    
                    inddata.degreebins(j).parentdaughterratio.max   = max(inddata.degreebins(j).parentdaughterratio.values);
                    inddata.degreebins(j).parentdaughterratio.mean  = mean(inddata.degreebins(j).parentdaughterratio.values);
                    inddata.degreebins(j).parentdaughterratio.min   = min(inddata.degreebins(j).parentdaughterratio.values);
                    inddata.degreebins(j).parentdaughterratio.std   = std(inddata.degreebins(j).parentdaughterratio.values);
                    inddata.degreebins(j).parentdaughterratio.total = sum(inddata.degreebins(j).parentdaughterratio.values);
                    inddata.degreebins(j).parentdaughterratio.skew  = skewness(inddata.degreebins(j).parentdaughterratio.values,0);
                    inddata.degreebins(j).parentdaughterratio.kurt  = kurtosis(inddata.degreebins(j).parentdaughterratio.values,0);
                    
                    inddata.degreebins(j).parentdaughter2ratio.max   = max(inddata.degreebins(j).parentdaughter2ratio.values);
                    inddata.degreebins(j).parentdaughter2ratio.mean  = mean(inddata.degreebins(j).parentdaughter2ratio.values);
                    inddata.degreebins(j).parentdaughter2ratio.min   = min(inddata.degreebins(j).parentdaughter2ratio.values);
                    inddata.degreebins(j).parentdaughter2ratio.std   = std(inddata.degreebins(j).parentdaughter2ratio.values);
                    inddata.degreebins(j).parentdaughter2ratio.total = sum(inddata.degreebins(j).parentdaughter2ratio.values);
                    inddata.degreebins(j).parentdaughter2ratio.skew  = skewness(inddata.degreebins(j).parentdaughter2ratio.values,0);
                    inddata.degreebins(j).parentdaughter2ratio.kurt  = kurtosis(inddata.degreebins(j).parentdaughter2ratio.values,0);
                end
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        
        for i = 1:length(popdata.degreebins)
            if isfield(popdata.degreebins(i).cable,'length')
                popdata.degreebins(i).length.values               = [popdata.degreebins(i).cable.length];
                popdata.degreebins(i).surfacearea.values          = [popdata.degreebins(i).cable.surfacearea];
                popdata.degreebins(i).volume.values               = [popdata.degreebins(i).cable.volume];
                popdata.degreebins(i).taperrate.values            = [popdata.degreebins(i).cable.taperrate];
                popdata.degreebins(i).taperratio.values           = [popdata.degreebins(i).cable.taperratio];
                popdata.degreebins(i).proximaldiameter.values     = [popdata.degreebins(i).cable.proximaldiameter];
                popdata.degreebins(i).cylindricaldiameter.values  = [popdata.degreebins(i).cable.cylindricaldiameter];
                popdata.degreebins(i).distaldiameter.values       = [popdata.degreebins(i).cable.distaldiameter];
                popdata.degreebins(i).rallratio.values            = [popdata.degreebins(i).cable.rallratio];
                popdata.degreebins(i).rallratio1.values           = [popdata.degreebins(i).cable.rallratio1];
                popdata.degreebins(i).rallratio2.values           = [popdata.degreebins(i).cable.rallratio2];
                popdata.degreebins(i).rallratio3.values           = [popdata.degreebins(i).cable.rallratio3];
                popdata.degreebins(i).daughterratio.values        = [popdata.degreebins(i).cable.daughterratio];
                popdata.degreebins(i).parentdaughterratio.values  = [popdata.degreebins(i).cable.parentdaughterratio];
                popdata.degreebins(i).parentdaughter2ratio.values = [popdata.degreebins(i).cable.parentdaughter2ratio];
            end
        end
        
        for i = 1:length(popdata.degreebins)
            
            popdata.degreebins(i).numbersegments       = sum([popdata.degreebins(i).numbersegments.values]);
            popdata.degreebins(i).numberbifurcations   = sum([popdata.degreebins(i).numberbifurcations.values]);
            popdata.degreebins(i).numberterminations   = sum([popdata.degreebins(i).numberterminations.values]);
            
            popdata.degreebins(i).proximaldiameter.max   = max(popdata.degreebins(i).proximaldiameter.values);
            popdata.degreebins(i).proximaldiameter.mean  = mean(popdata.degreebins(i).proximaldiameter.values);
            popdata.degreebins(i).proximaldiameter.min   = min(popdata.degreebins(i).proximaldiameter.values);
            popdata.degreebins(i).proximaldiameter.std   = std(popdata.degreebins(i).proximaldiameter.values);
            popdata.degreebins(i).proximaldiameter.total = sum(popdata.degreebins(i).proximaldiameter.values);
            popdata.degreebins(i).proximaldiameter.skew  = skewness(popdata.degreebins(i).proximaldiameter.values,0);
            popdata.degreebins(i).proximaldiameter.kurt  = kurtosis(popdata.degreebins(i).proximaldiameter.values,0);
            
            popdata.degreebins(i).cylindricaldiameter.max   = max(popdata.degreebins(i).cylindricaldiameter.values);
            popdata.degreebins(i).cylindricaldiameter.mean  = mean(popdata.degreebins(i).cylindricaldiameter.values);
            popdata.degreebins(i).cylindricaldiameter.min   = min(popdata.degreebins(i).cylindricaldiameter.values);
            popdata.degreebins(i).cylindricaldiameter.std   = std(popdata.degreebins(i).cylindricaldiameter.values);
            popdata.degreebins(i).cylindricaldiameter.total = sum(popdata.degreebins(i).cylindricaldiameter.values);
            popdata.degreebins(i).cylindricaldiameter.skew  = skewness(popdata.degreebins(i).cylindricaldiameter.values,0);
            popdata.degreebins(i).cylindricaldiameter.kurt  = kurtosis(popdata.degreebins(i).cylindricaldiameter.values,0);
            
            popdata.degreebins(i).distaldiameter.max   = max(popdata.degreebins(i).distaldiameter.values);
            popdata.degreebins(i).distaldiameter.mean  = mean(popdata.degreebins(i).distaldiameter.values);
            popdata.degreebins(i).distaldiameter.min   = min(popdata.degreebins(i).distaldiameter.values);
            popdata.degreebins(i).distaldiameter.std   = std(popdata.degreebins(i).distaldiameter.values);
            popdata.degreebins(i).distaldiameter.total = sum(popdata.degreebins(i).distaldiameter.values);
            popdata.degreebins(i).distaldiameter.skew  = skewness(popdata.degreebins(i).distaldiameter.values,0);
            popdata.degreebins(i).distaldiameter.kurt  = kurtosis(popdata.degreebins(i).distaldiameter.values,0);
            
            popdata.degreebins(i).length.max   = max(popdata.degreebins(i).length.values);
            popdata.degreebins(i).length.mean  = mean(popdata.degreebins(i).length.values);
            popdata.degreebins(i).length.min   = min(popdata.degreebins(i).length.values);
            popdata.degreebins(i).length.std   = std(popdata.degreebins(i).length.values);
            popdata.degreebins(i).length.total = sum(popdata.degreebins(i).length.values);
            popdata.degreebins(i).length.skew  = skewness(popdata.degreebins(i).length.values,0);
            popdata.degreebins(i).length.kurt  = kurtosis(popdata.degreebins(i).length.values,0);
            
            popdata.degreebins(i).surfacearea.max   = max(popdata.degreebins(i).surfacearea.values);
            popdata.degreebins(i).surfacearea.mean  = mean(popdata.degreebins(i).surfacearea.values);
            popdata.degreebins(i).surfacearea.min   = min(popdata.degreebins(i).surfacearea.values);
            popdata.degreebins(i).surfacearea.std   = std(popdata.degreebins(i).surfacearea.values);
            popdata.degreebins(i).surfacearea.total = sum(popdata.degreebins(i).surfacearea.values);
            popdata.degreebins(i).surfacearea.skew  = skewness(popdata.degreebins(i).surfacearea.values,0);
            popdata.degreebins(i).surfacearea.kurt  = kurtosis(popdata.degreebins(i).surfacearea.values,0);
            
            popdata.degreebins(i).volume.max   = max(popdata.degreebins(i).volume.values);
            popdata.degreebins(i).volume.mean  = mean(popdata.degreebins(i).volume.values);
            popdata.degreebins(i).volume.min   = min(popdata.degreebins(i).volume.values);
            popdata.degreebins(i).volume.std   = std(popdata.degreebins(i).volume.values);
            popdata.degreebins(i).volume.total = sum(popdata.degreebins(i).volume.values);
            popdata.degreebins(i).volume.skew  = skewness(popdata.degreebins(i).volume.values,0);
            popdata.degreebins(i).volume.kurt  = kurtosis(popdata.degreebins(i).volume.values,0);
            
            popdata.degreebins(i).taperrate.max   = max(popdata.degreebins(i).taperrate.values);
            %popdata.degreebins(i).taperrate.mean  = mean(popdata.degreebins(i).taperrate.values);
            popdata.degreebins(i).taperrate.mean  = sum(([popdata.degreebins(i).taperrate.values].*[popdata.degreebins(i).length.values])/sum([popdata.degreebins(i).length.values]));
            popdata.degreebins(i).taperrate.min   = min(popdata.degreebins(i).taperrate.values);
            popdata.degreebins(i).taperrate.std   = std(popdata.degreebins(i).taperrate.values);
            popdata.degreebins(i).taperrate.total = sum(popdata.degreebins(i).taperrate.values);
            popdata.degreebins(i).taperrate.skew  = skewness(popdata.degreebins(i).taperrate.values,0);
            popdata.degreebins(i).taperrate.kurt  = kurtosis(popdata.degreebins(i).taperrate.values,0);
            
            popdata.degreebins(i).taperratio.max   = max(popdata.degreebins(i).taperratio.values);
            popdata.degreebins(i).taperratio.mean  = mean(popdata.degreebins(i).taperratio.values);
            popdata.degreebins(i).taperratio.min   = min(popdata.degreebins(i).taperratio.values);
            popdata.degreebins(i).taperratio.std   = std(popdata.degreebins(i).taperratio.values);
            popdata.degreebins(i).taperratio.total = sum(popdata.degreebins(i).taperratio.values);
            popdata.degreebins(i).taperratio.skew  = skewness(popdata.degreebins(i).taperratio.values,0);
            popdata.degreebins(i).taperratio.kurt  = kurtosis(popdata.degreebins(i).taperratio.values,0);
            
            popdata.degreebins(i).rallratio.max   = max(popdata.degreebins(i).rallratio.values);
            popdata.degreebins(i).rallratio.mean  = mean(popdata.degreebins(i).rallratio.values);
            popdata.degreebins(i).rallratio.min   = min(popdata.degreebins(i).rallratio.values);
            popdata.degreebins(i).rallratio.std   = std(popdata.degreebins(i).rallratio.values);
            popdata.degreebins(i).rallratio.total = sum(popdata.degreebins(i).rallratio.values);
            popdata.degreebins(i).rallratio.skew  = skewness(popdata.degreebins(i).rallratio.values,0);
            popdata.degreebins(i).rallratio.kurt  = kurtosis(popdata.degreebins(i).rallratio.values,0);
            
            popdata.degreebins(i).rallratio1.max   = max(popdata.degreebins(i).rallratio1.values);
            popdata.degreebins(i).rallratio1.mean  = mean(popdata.degreebins(i).rallratio1.values);
            popdata.degreebins(i).rallratio1.min   = min(popdata.degreebins(i).rallratio1.values);
            popdata.degreebins(i).rallratio1.std   = std(popdata.degreebins(i).rallratio1.values);
            popdata.degreebins(i).rallratio1.total = sum(popdata.degreebins(i).rallratio1.values);
            popdata.degreebins(i).rallratio1.skew  = skewness(popdata.degreebins(i).rallratio1.values,0);
            popdata.degreebins(i).rallratio1.kurt  = kurtosis(popdata.degreebins(i).rallratio1.values,0);
            
            popdata.degreebins(i).rallratio2.max   = max(popdata.degreebins(i).rallratio2.values);
            popdata.degreebins(i).rallratio2.mean  = mean(popdata.degreebins(i).rallratio2.values);
            popdata.degreebins(i).rallratio2.min   = min(popdata.degreebins(i).rallratio2.values);
            popdata.degreebins(i).rallratio2.std   = std(popdata.degreebins(i).rallratio2.values);
            popdata.degreebins(i).rallratio2.total = sum(popdata.degreebins(i).rallratio2.values);
            popdata.degreebins(i).rallratio2.skew  = skewness(popdata.degreebins(i).rallratio2.values,0);
            popdata.degreebins(i).rallratio2.kurt  = kurtosis(popdata.degreebins(i).rallratio2.values,0);
            
            popdata.degreebins(i).rallratio3.max   = max(popdata.degreebins(i).rallratio3.values);
            popdata.degreebins(i).rallratio3.mean  = mean(popdata.degreebins(i).rallratio3.values);
            popdata.degreebins(i).rallratio3.min   = min(popdata.degreebins(i).rallratio3.values);
            popdata.degreebins(i).rallratio3.std   = std(popdata.degreebins(i).rallratio3.values);
            popdata.degreebins(i).rallratio3.total = sum(popdata.degreebins(i).rallratio3.values);
            popdata.degreebins(i).rallratio3.skew  = skewness(popdata.degreebins(i).rallratio3.values,0);
            popdata.degreebins(i).rallratio3.kurt  = kurtosis(popdata.degreebins(i).rallratio3.values,0);
            
            popdata.degreebins(i).daughterratio.max   = max(popdata.degreebins(i).daughterratio.values);
            popdata.degreebins(i).daughterratio.mean  = mean(popdata.degreebins(i).daughterratio.values);
            popdata.degreebins(i).daughterratio.min   = min(popdata.degreebins(i).daughterratio.values);
            popdata.degreebins(i).daughterratio.std   = std(popdata.degreebins(i).daughterratio.values);
            popdata.degreebins(i).daughterratio.total = sum(popdata.degreebins(i).daughterratio.values);
            popdata.degreebins(i).daughterratio.skew  = skewness(popdata.degreebins(i).daughterratio.values,0);
            popdata.degreebins(i).daughterratio.kurt  = kurtosis(popdata.degreebins(i).daughterratio.values,0);
            
            popdata.degreebins(i).parentdaughterratio.max   = max(popdata.degreebins(i).parentdaughterratio.values);
            popdata.degreebins(i).parentdaughterratio.mean  = mean(popdata.degreebins(i).parentdaughterratio.values);
            popdata.degreebins(i).parentdaughterratio.min   = min(popdata.degreebins(i).parentdaughterratio.values);
            popdata.degreebins(i).parentdaughterratio.std   = std(popdata.degreebins(i).parentdaughterratio.values);
            popdata.degreebins(i).parentdaughterratio.total = sum(popdata.degreebins(i).parentdaughterratio.values);
            popdata.degreebins(i).parentdaughterratio.skew  = skewness(popdata.degreebins(i).parentdaughterratio.values,0);
            popdata.degreebins(i).parentdaughterratio.kurt  = kurtosis(popdata.degreebins(i).parentdaughterratio.values,0);
            
            popdata.degreebins(i).parentdaughter2ratio.max   = max(popdata.degreebins(i).parentdaughter2ratio.values);
            popdata.degreebins(i).parentdaughter2ratio.mean  = mean(popdata.degreebins(i).parentdaughter2ratio.values);
            popdata.degreebins(i).parentdaughter2ratio.min   = min(popdata.degreebins(i).parentdaughter2ratio.values);
            popdata.degreebins(i).parentdaughter2ratio.std   = std(popdata.degreebins(i).parentdaughter2ratio.values);
            popdata.degreebins(i).parentdaughter2ratio.total = sum(popdata.degreebins(i).parentdaughter2ratio.values);
            popdata.degreebins(i).parentdaughter2ratio.skew  = skewness(popdata.degreebins(i).parentdaughter2ratio.values,0);
            popdata.degreebins(i).parentdaughter2ratio.kurt  = kurtosis(popdata.degreebins(i).parentdaughter2ratio.values,0);
            
        end
        
        for i = 1:typeanalysis.maxdegree.max
            typeanalysis.degree.degree(i)                      = i;
            typeanalysis.degree.numberbifurcations(i).values   = [];
            typeanalysis.degree.numberterminations(i).values   = [];
            typeanalysis.degree.numbersegments(i).values       = [];
            typeanalysis.degree.length(i).values               = [];
            typeanalysis.degree.totallength(i).values          = [];
            typeanalysis.degree.surfacearea(i).values          = [];
            typeanalysis.degree.totalsurfacearea(i).values     = [];
            typeanalysis.degree.volume(i).values               = [];
            typeanalysis.degree.totalvolume(i).values          = [];
            typeanalysis.degree.taperrate(i).values            = [];
            typeanalysis.degree.taperratio(i).values           = [];
            typeanalysis.degree.proximaldiameter(i).values     = [];
            typeanalysis.degree.cylindricaldiameter(i).values  = [];
            typeanalysis.degree.distaldiameter(i).values       = [];
            typeanalysis.degree.rallratio(i).values            = [];
            typeanalysis.degree.rallratio1(i).values           = [];
            typeanalysis.degree.rallratio2(i).values           = [];
            typeanalysis.degree.rallratio3(i).values           = [];
            typeanalysis.degree.daughterratio(i).values        = [];
            typeanalysis.degree.parentdaughterratio(i).values  = [];
            typeanalysis.degree.parentdaughter2ratio(i).values = [];
        end
        
        
        for i = 1:length(data.individual)
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            for j = 1:inddata.maxdegree
                typeanalysis.degree.numberbifurcations(j).values = [[typeanalysis.degree.numberbifurcations(j).values] [inddata.degreebins(j).numberbifurcations]];
                typeanalysis.degree.numberterminations(j).values = [[typeanalysis.degree.numberterminations(j).values] [inddata.degreebins(j).numberterminations]];
                typeanalysis.degree.numbersegments(j).values     = [[typeanalysis.degree.numbersegments(j).values] [inddata.degreebins(j).numbersegments]];
                typeanalysis.degree.totallength(j).values        = [[typeanalysis.degree.totallength(j).values] [inddata.degreebins(j).length.total]];
                typeanalysis.degree.totalsurfacearea(j).values   = [[typeanalysis.degree.totalsurfacearea(j).values] [inddata.degreebins(j).surfacearea.total]];
                typeanalysis.degree.totalvolume(j).values        = [[typeanalysis.degree.totalvolume(j).values] [inddata.degreebins(j).volume.total]];
            end
        end
        
        for i = 1:typeanalysis.maxdegree.max
            if isfield(popdata.degreebins(i).cable,'length')
                typeanalysis.degree.length(i).values                  = [popdata.degreebins(i).cable.length];
                typeanalysis.degree.surfacearea(i).values             = [popdata.degreebins(i).cable.surfacearea];
                typeanalysis.degree.volume(i).values                  = [popdata.degreebins(i).cable.volume];
                typeanalysis.degree.taperrate(i).values               = [popdata.degreebins(i).cable.taperrate];
                typeanalysis.degree.taperratio(i).values              = [popdata.degreebins(i).cable.taperratio];
                typeanalysis.degree.proximaldiameter(i).values        = [popdata.degreebins(i).cable.proximaldiameter];
                typeanalysis.degree.cylindricaldiameter(i).values     = [popdata.degreebins(i).cable.cylindricaldiameter];
                typeanalysis.degree.distaldiameter(i).values          = [popdata.degreebins(i).cable.distaldiameter];
                if i > 1
                    typeanalysis.degree.rallratio(i).values            = [popdata.degreebins(i).cable.rallratio];
                    typeanalysis.degree.rallratio1(i).values           = [popdata.degreebins(i).cable.rallratio1];
                    typeanalysis.degree.rallratio2(i).values           = [popdata.degreebins(i).cable.rallratio2];
                    typeanalysis.degree.rallratio3(i).values           = [popdata.degreebins(i).cable.rallratio3];
                    typeanalysis.degree.daughterratio(i).values        = [popdata.degreebins(i).cable.daughterratio];
                    typeanalysis.degree.parentdaughterratio(i).values  = [popdata.degreebins(i).cable.parentdaughterratio];
                    typeanalysis.degree.parentdaughter2ratio(i).values = [popdata.degreebins(i).cable.parentdaughter2ratio];
                end
            end
        end
        
        for i = 1:typeanalysis.maxdegree.max
            typeanalysis.degree.numberbifurcations(i).mean  = mean(typeanalysis.degree.numberbifurcations(i).values);
            typeanalysis.degree.numberbifurcations(i).std   = std(typeanalysis.degree.numberbifurcations(i).values);
            typeanalysis.degree.numberbifurcations(i).skew  = skewness(typeanalysis.degree.numberbifurcations(i).values,0);
            typeanalysis.degree.numberbifurcations(i).kurt  = kurtosis(typeanalysis.degree.numberbifurcations(i).values,0);
            typeanalysis.degree.numberbifurcations(i).min   = min(typeanalysis.degree.numberbifurcations(i).values);
            typeanalysis.degree.numberbifurcations(i).max   = max(typeanalysis.degree.numberbifurcations(i).values);
            typeanalysis.degree.numberbifurcations(i).total = sum(typeanalysis.degree.numberbifurcations(i).values);
            
            typeanalysis.degree.numberterminations(i).mean  = mean(typeanalysis.degree.numberterminations(i).values);
            typeanalysis.degree.numberterminations(i).std   = std(typeanalysis.degree.numberterminations(i).values);
            typeanalysis.degree.numberterminations(i).skew  = skewness(typeanalysis.degree.numberterminations(i).values,0);
            typeanalysis.degree.numberterminations(i).kurt  = kurtosis(typeanalysis.degree.numberterminations(i).values,0);
            typeanalysis.degree.numberterminations(i).min   = min(typeanalysis.degree.numberterminations(i).values);
            typeanalysis.degree.numberterminations(i).max   = max(typeanalysis.degree.numberterminations(i).values);
            typeanalysis.degree.numberterminations(i).total = sum(typeanalysis.degree.numberterminations(i).values);
            
            typeanalysis.degree.numbersegments(i).mean  = mean(typeanalysis.degree.numbersegments(i).values);
            typeanalysis.degree.numbersegments(i).std   = std(typeanalysis.degree.numbersegments(i).values);
            typeanalysis.degree.numbersegments(i).skew  = skewness(typeanalysis.degree.numbersegments(i).values,0);
            typeanalysis.degree.numbersegments(i).kurt  = kurtosis(typeanalysis.degree.numbersegments(i).values,0);
            typeanalysis.degree.numbersegments(i).min   = min(typeanalysis.degree.numbersegments(i).values);
            typeanalysis.degree.numbersegments(i).max   = max(typeanalysis.degree.numbersegments(i).values);
            typeanalysis.degree.numbersegments(i).total = sum(typeanalysis.degree.numbersegments(i).values);
            
            typeanalysis.degree.totallength(i).mean = mean(typeanalysis.degree.totallength(i).values);
            typeanalysis.degree.totallength(i).std  = std(typeanalysis.degree.totallength(i).values);
            typeanalysis.degree.totallength(i).skew = skewness(typeanalysis.degree.totallength(i).values,0);
            typeanalysis.degree.totallength(i).kurt = kurtosis(typeanalysis.degree.totallength(i).values,0);
            typeanalysis.degree.totallength(i).min  = min(typeanalysis.degree.totallength(i).values);
            typeanalysis.degree.totallength(i).max  = max(typeanalysis.degree.totallength(i).values);
            
            typeanalysis.degree.length(i).mean  = mean(typeanalysis.degree.length(i).values);
            typeanalysis.degree.length(i).std   = std(typeanalysis.degree.length(i).values);
            typeanalysis.degree.length(i).skew  = skewness(typeanalysis.degree.length(i).values,0);
            typeanalysis.degree.length(i).kurt  = kurtosis(typeanalysis.degree.length(i).values,0);
            typeanalysis.degree.length(i).min   = min(typeanalysis.degree.length(i).values);
            typeanalysis.degree.length(i).max   = max(typeanalysis.degree.length(i).values);
            typeanalysis.degree.length(i).total = sum(typeanalysis.degree.length(i).values);
            
            typeanalysis.degree.totalsurfacearea(i).mean = mean(typeanalysis.degree.totalsurfacearea(i).values);
            typeanalysis.degree.totalsurfacearea(i).std  = std(typeanalysis.degree.totalsurfacearea(i).values);
            typeanalysis.degree.totalsurfacearea(i).skew = skewness(typeanalysis.degree.totalsurfacearea(i).values,0);
            typeanalysis.degree.totalsurfacearea(i).kurt = kurtosis(typeanalysis.degree.totalsurfacearea(i).values,0);
            typeanalysis.degree.totalsurfacearea(i).min  = min(typeanalysis.degree.totalsurfacearea(i).values);
            typeanalysis.degree.totalsurfacearea(i).max  = max(typeanalysis.degree.totalsurfacearea(i).values);
            
            typeanalysis.degree.surfacearea(i).mean  = mean(typeanalysis.degree.surfacearea(i).values);
            typeanalysis.degree.surfacearea(i).std   = std(typeanalysis.degree.surfacearea(i).values);
            typeanalysis.degree.surfacearea(i).skew  = skewness(typeanalysis.degree.surfacearea(i).values,0);
            typeanalysis.degree.surfacearea(i).kurt  = kurtosis(typeanalysis.degree.surfacearea(i).values,0);
            typeanalysis.degree.surfacearea(i).min   = min(typeanalysis.degree.surfacearea(i).values);
            typeanalysis.degree.surfacearea(i).max   = max(typeanalysis.degree.surfacearea(i).values);
            typeanalysis.degree.surfacearea(i).total = sum(typeanalysis.degree.surfacearea(i).values);
            
            typeanalysis.degree.totalvolume(i).mean = mean(typeanalysis.degree.totalvolume(i).values);
            typeanalysis.degree.totalvolume(i).std  = std(typeanalysis.degree.totalvolume(i).values);
            typeanalysis.degree.totalvolume(i).skew = skewness(typeanalysis.degree.totalvolume(i).values,0);
            typeanalysis.degree.totalvolume(i).kurt = kurtosis(typeanalysis.degree.totalvolume(i).values,0);
            typeanalysis.degree.totalvolume(i).min  = min(typeanalysis.degree.totalvolume(i).values);
            typeanalysis.degree.totalvolume(i).max  = max(typeanalysis.degree.totalvolume(i).values);
            
            typeanalysis.degree.volume(i).mean  = mean(typeanalysis.degree.volume(i).values);
            typeanalysis.degree.volume(i).std   = std(typeanalysis.degree.volume(i).values);
            typeanalysis.degree.volume(i).skew  = skewness(typeanalysis.degree.volume(i).values,0);
            typeanalysis.degree.volume(i).kurt  = kurtosis(typeanalysis.degree.volume(i).values,0);
            typeanalysis.degree.volume(i).min   = min(typeanalysis.degree.volume(i).values);
            typeanalysis.degree.volume(i).max   = max(typeanalysis.degree.volume(i).values);
            typeanalysis.degree.volume(i).total = sum(typeanalysis.degree.volume(i).values);
            
            %typeanalysis.degree.taperrate(i).mean = mean(typeanalysis.degree.taperrate(i).values);
            typeanalysis.degree.taperrate(i).mean = sum(([typeanalysis.degree.taperrate(i).values].*[typeanalysis.degree.length(i).values])/sum([typeanalysis.degree.length(i).values]));
            typeanalysis.degree.taperrate(i).std  = std(typeanalysis.degree.taperrate(i).values);
            typeanalysis.degree.taperrate(i).skew = skewness(typeanalysis.degree.taperrate(i).values,0);
            typeanalysis.degree.taperrate(i).kurt = kurtosis(typeanalysis.degree.taperrate(i).values,0);
            typeanalysis.degree.taperrate(i).min  = min(typeanalysis.degree.taperrate(i).values);
            typeanalysis.degree.taperrate(i).max  = max(typeanalysis.degree.taperrate(i).values);
            
            typeanalysis.degree.taperratio(i).mean = mean(typeanalysis.degree.taperratio(i).values);
            typeanalysis.degree.taperratio(i).std  = std(typeanalysis.degree.taperratio(i).values);
            typeanalysis.degree.taperratio(i).skew = skewness(typeanalysis.degree.taperratio(i).values,0);
            typeanalysis.degree.taperratio(i).kurt = kurtosis(typeanalysis.degree.taperratio(i).values,0);
            typeanalysis.degree.taperratio(i).min  = min(typeanalysis.degree.taperratio(i).values);
            typeanalysis.degree.taperratio(i).max  = max(typeanalysis.degree.taperratio(i).values);
            
            typeanalysis.degree.proximaldiameter(i).mean = mean(typeanalysis.degree.proximaldiameter(i).values);
            typeanalysis.degree.proximaldiameter(i).std  = std(typeanalysis.degree.proximaldiameter(i).values);
            typeanalysis.degree.proximaldiameter(i).skew = skewness(typeanalysis.degree.proximaldiameter(i).values,0);
            typeanalysis.degree.proximaldiameter(i).kurt = kurtosis(typeanalysis.degree.proximaldiameter(i).values,0);
            typeanalysis.degree.proximaldiameter(i).min  = min(typeanalysis.degree.proximaldiameter(i).values);
            typeanalysis.degree.proximaldiameter(i).max  = max(typeanalysis.degree.proximaldiameter(i).values);
            
            typeanalysis.degree.cylindricaldiameter(i).mean = mean(typeanalysis.degree.cylindricaldiameter(i).values);
            typeanalysis.degree.cylindricaldiameter(i).std  = std(typeanalysis.degree.cylindricaldiameter(i).values);
            typeanalysis.degree.cylindricaldiameter(i).skew = skewness(typeanalysis.degree.cylindricaldiameter(i).values,0);
            typeanalysis.degree.cylindricaldiameter(i).kurt = kurtosis(typeanalysis.degree.cylindricaldiameter(i).values,0);
            typeanalysis.degree.cylindricaldiameter(i).min  = min(typeanalysis.degree.cylindricaldiameter(i).values);
            typeanalysis.degree.cylindricaldiameter(i).max  = max(typeanalysis.degree.cylindricaldiameter(i).values);
            
            typeanalysis.degree.distaldiameter(i).mean = mean(typeanalysis.degree.distaldiameter(i).values);
            typeanalysis.degree.distaldiameter(i).std  = std(typeanalysis.degree.distaldiameter(i).values);
            typeanalysis.degree.distaldiameter(i).skew = skewness(typeanalysis.degree.distaldiameter(i).values,0);
            typeanalysis.degree.distaldiameter(i).kurt = kurtosis(typeanalysis.degree.distaldiameter(i).values,0);
            typeanalysis.degree.distaldiameter(i).min  = min(typeanalysis.degree.distaldiameter(i).values);
            typeanalysis.degree.distaldiameter(i).max  = max(typeanalysis.degree.distaldiameter(i).values);
            
            %if i < typeanalysis.maxdegree.max
            typeanalysis.degree.rallratio(i).mean = mean(typeanalysis.degree.rallratio(i).values    );
            typeanalysis.degree.rallratio(i).std  = std(typeanalysis.degree.rallratio(i).values     );
            typeanalysis.degree.rallratio(i).skew = skewness(typeanalysis.degree.rallratio(i).values,0);
            typeanalysis.degree.rallratio(i).kurt = kurtosis(typeanalysis.degree.rallratio(i).values,0);
            typeanalysis.degree.rallratio(i).min  = min(typeanalysis.degree.rallratio(i).values);
            typeanalysis.degree.rallratio(i).max  = max(typeanalysis.degree.rallratio(i).values);
            
            typeanalysis.degree.rallratio1(i).mean = mean(typeanalysis.degree.rallratio1(i).values    );
            typeanalysis.degree.rallratio1(i).std  = std(typeanalysis.degree.rallratio1(i).values     );
            typeanalysis.degree.rallratio1(i).skew = skewness(typeanalysis.degree.rallratio1(i).values,0);
            typeanalysis.degree.rallratio1(i).kurt = kurtosis(typeanalysis.degree.rallratio1(i).values,0);
            typeanalysis.degree.rallratio1(i).min  = min(typeanalysis.degree.rallratio1(i).values);
            typeanalysis.degree.rallratio1(i).max  = max(typeanalysis.degree.rallratio1(i).values);
            
            typeanalysis.degree.rallratio2(i).mean = mean(typeanalysis.degree.rallratio2(i).values    );
            typeanalysis.degree.rallratio2(i).std  = std(typeanalysis.degree.rallratio2(i).values     );
            typeanalysis.degree.rallratio2(i).skew = skewness(typeanalysis.degree.rallratio2(i).values,0);
            typeanalysis.degree.rallratio2(i).kurt = kurtosis(typeanalysis.degree.rallratio2(i).values,0);
            typeanalysis.degree.rallratio2(i).min  = min(typeanalysis.degree.rallratio2(i).values);
            typeanalysis.degree.rallratio2(i).max  = max(typeanalysis.degree.rallratio2(i).values);
            
            typeanalysis.degree.rallratio3(i).mean = mean(typeanalysis.degree.rallratio3(i).values    );
            typeanalysis.degree.rallratio3(i).std  = std(typeanalysis.degree.rallratio3(i).values     );
            typeanalysis.degree.rallratio3(i).skew = skewness(typeanalysis.degree.rallratio3(i).values,0);
            typeanalysis.degree.rallratio3(i).kurt = kurtosis(typeanalysis.degree.rallratio3(i).values,0);
            typeanalysis.degree.rallratio3(i).min  = min(typeanalysis.degree.rallratio3(i).values);
            typeanalysis.degree.rallratio3(i).max  = max(typeanalysis.degree.rallratio3(i).values);
            
            typeanalysis.degree.daughterratio(i).mean = mean(typeanalysis.degree.daughterratio(i).values     );
            typeanalysis.degree.daughterratio(i).std  = std(typeanalysis.degree.daughterratio(i).values      );
            typeanalysis.degree.daughterratio(i).skew = skewness(typeanalysis.degree.daughterratio(i).values,0);
            typeanalysis.degree.daughterratio(i).kurt = kurtosis(typeanalysis.degree.daughterratio(i).values,0);
            typeanalysis.degree.daughterratio(i).min  = min(typeanalysis.degree.daughterratio(i).values);
            typeanalysis.degree.daughterratio(i).max  = max(typeanalysis.degree.daughterratio(i).values);
            
            typeanalysis.degree.parentdaughterratio(i).mean = mean(typeanalysis.degree.parentdaughterratio(i).values     );
            typeanalysis.degree.parentdaughterratio(i).std  = std(typeanalysis.degree.parentdaughterratio(i).values      );
            typeanalysis.degree.parentdaughterratio(i).skew = skewness(typeanalysis.degree.parentdaughterratio(i).values,0);
            typeanalysis.degree.parentdaughterratio(i).kurt = kurtosis(typeanalysis.degree.parentdaughterratio(i).values,0);
            typeanalysis.degree.parentdaughterratio(i).min  = min(typeanalysis.degree.parentdaughterratio(i).values);
            typeanalysis.degree.parentdaughterratio(i).max  = max(typeanalysis.degree.parentdaughterratio(i).values);
            
            typeanalysis.degree.parentdaughter2ratio(i).mean = mean(typeanalysis.degree.parentdaughter2ratio(i).values     );
            typeanalysis.degree.parentdaughter2ratio(i).std  = std(typeanalysis.degree.parentdaughter2ratio(i).values      );
            typeanalysis.degree.parentdaughter2ratio(i).skew = skewness(typeanalysis.degree.parentdaughter2ratio(i).values,0);
            typeanalysis.degree.parentdaughter2ratio(i).kurt = kurtosis(typeanalysis.degree.parentdaughter2ratio(i).values,0);
            typeanalysis.degree.parentdaughter2ratio(i).min  = min(typeanalysis.degree.parentdaughter2ratio(i).values);
            typeanalysis.degree.parentdaughter2ratio(i).max  = max(typeanalysis.degree.parentdaughter2ratio(i).values);
            %end
            
            typeanalysis.degree.bifurcationprobability.length(i) = typeanalysis.degree.numberbifurcations(i).total / typeanalysis.degree.length(i).total;
            typeanalysis.degree.terminationprobability.length(i) = typeanalysis.degree.numberterminations(i).total / typeanalysis.degree.length(i).total;
            
            typeanalysis.degree.bifurcationprobability.surfacearea(i) = typeanalysis.degree.numberbifurcations(i).total / typeanalysis.degree.surfacearea(i).total;
            typeanalysis.degree.terminationprobability.surfacearea(i) = typeanalysis.degree.numberterminations(i).total / typeanalysis.degree.surfacearea(i).total;
            
            typeanalysis.degree.bifurcationprobability.volume(i) = typeanalysis.degree.numberbifurcations(i).total / typeanalysis.degree.volume(i).total;
            typeanalysis.degree.terminationprobability.volume(i) = typeanalysis.degree.numberterminations(i).total / typeanalysis.degree.volume(i).total;
        end
        
        
        
        
        
        
        
        
        % Begin bifurcation branch order typeanalysis
        
        for i = 1:length(data.individual)
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            for j = 1:typeanalysis.maxdegree.max
                inddata.bifurcation.degreebins(j).numbersegments              = [];
                inddata.bifurcation.degreebins(j).length.values               = [];
                inddata.bifurcation.degreebins(j).surfacearea.values          = [];
                inddata.bifurcation.degreebins(j).volume.values               = [];
                inddata.bifurcation.degreebins(j).taperrate.values            = [];
                inddata.bifurcation.degreebins(j).taperratio.values           = [];
                inddata.bifurcation.degreebins(j).proximaldiameter.values     = [];
                inddata.bifurcation.degreebins(j).cylindricaldiameter.values  = [];
                inddata.bifurcation.degreebins(j).distaldiameter.values       = [];
                inddata.bifurcation.degreebins(j).rallratio.values            = [];
                inddata.bifurcation.degreebins(j).rallratio1.values           = [];
                inddata.bifurcation.degreebins(j).rallratio2.values           = [];
                inddata.bifurcation.degreebins(j).rallratio3.values           = [];
                inddata.bifurcation.degreebins(j).daughterratio.values        = [];
                inddata.bifurcation.degreebins(j).parentdaughterratio.values  = [];
                inddata.bifurcation.degreebins(j).parentdaughter2ratio.values = [];
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        for i = 1:length(data.individual)
            
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            
            for j = 1:inddata.maxdegree
                
                if isfield(inddata.bifurcation.degreebins(j),'cable')
                    
                    if isfield(inddata.bifurcation.degreebins(j).cable,'id')==1
                        
                        inddata.bifurcation.degreebins(j).numbersegments     = 0;
                        
                        inddata.bifurcation.degreebins(j).length.values               = [inddata.bifurcation.degreebins(j).cable.length];
                        inddata.bifurcation.degreebins(j).surfacearea.values          = [inddata.bifurcation.degreebins(j).cable.surfacearea];
                        inddata.bifurcation.degreebins(j).volume.values               = [inddata.bifurcation.degreebins(j).cable.volume];
                        inddata.bifurcation.degreebins(j).taperrate.values            = [inddata.bifurcation.degreebins(j).cable.taperrate];
                        inddata.bifurcation.degreebins(j).taperratio.values           = [inddata.bifurcation.degreebins(j).cable.taperratio];
                        inddata.bifurcation.degreebins(j).proximaldiameter.values     = [inddata.bifurcation.degreebins(j).cable.proximaldiameter];
                        inddata.bifurcation.degreebins(j).cylindricaldiameter.values  = [inddata.bifurcation.degreebins(j).cable.cylindricaldiameter];
                        inddata.bifurcation.degreebins(j).distaldiameter.values       = [inddata.bifurcation.degreebins(j).cable.distaldiameter];
                        inddata.bifurcation.degreebins(j).rallratio.values            = [inddata.bifurcation.degreebins(j).cable.rallratio];
                        inddata.bifurcation.degreebins(j).rallratio1.values           = [inddata.bifurcation.degreebins(j).cable.rallratio1];
                        inddata.bifurcation.degreebins(j).rallratio2.values           = [inddata.bifurcation.degreebins(j).cable.rallratio2];
                        inddata.bifurcation.degreebins(j).rallratio3.values           = [inddata.bifurcation.degreebins(j).cable.rallratio3];
                        inddata.bifurcation.degreebins(j).daughterratio.values        = [inddata.bifurcation.degreebins(j).cable.daughterratio];
                        inddata.bifurcation.degreebins(j).parentdaughterratio.values  = [inddata.bifurcation.degreebins(j).cable.parentdaughterratio];
                        inddata.bifurcation.degreebins(j).parentdaughter2ratio.values = [inddata.bifurcation.degreebins(j).cable.parentdaughter2ratio];
                        
                        
                        for k = 1:length(inddata.bifurcation.degreebins(j).cable)
                            inddata.bifurcation.degreebins(j).numbersegments = 1 + inddata.bifurcation.degreebins(j).numbersegments;
                        end
                    end
                end
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        for i = 1:length(data.individual)
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            for m = 1:typeanalysis.maxdegree.max
                popdata.bifurcation.degreebins(m).numbersegments(i).values     = [];
                popdata.bifurcation.degreebins(m).length.values                = [];
                popdata.bifurcation.degreebins(m).surfacearea.values           = [];
                popdata.bifurcation.degreebins(m).volume.values                = [];
                popdata.bifurcation.degreebins(m).taperrate.values             = [];
                popdata.bifurcation.degreebins(m).taperratio.values            = [];
                popdata.bifurcation.degreebins(m).proximaldiameter.values      = [];
                popdata.bifurcation.degreebins(m).cylindricaldiameter.values   = [];
                popdata.bifurcation.degreebins(m).distaldiameter.values        = [];
                popdata.bifurcation.degreebins(m).rallratio.values             = [];
                popdata.bifurcation.degreebins(m).rallratio1.values            = [];
                popdata.bifurcation.degreebins(m).rallratio2.values            = [];
                popdata.bifurcation.degreebins(m).rallratio3.values            = [];
                popdata.bifurcation.degreebins(m).daughterratio.values         = [];
                popdata.bifurcation.degreebins(m).parentdaughterratio.values   = [];
                popdata.bifurcation.degreebins(m).parentdaughter2ratio.values  = [];
            end
        end
        
        for i = 1:length(data.individual)
            
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            
            for j = 1:inddata.maxdegree
                
                popdata.bifurcation.degreebins(j).numbersegments(i).values = [popdata.bifurcation.degreebins(j).numbersegments(i).values inddata.degreebins(j).numbersegments];
                
                inddata.bifurcation.degreebins(j).proximaldiameter.max   = max(inddata.bifurcation.degreebins(j).proximaldiameter.values);
                inddata.bifurcation.degreebins(j).proximaldiameter.mean  = mean(inddata.bifurcation.degreebins(j).proximaldiameter.values);
                inddata.bifurcation.degreebins(j).proximaldiameter.min   = min(inddata.bifurcation.degreebins(j).proximaldiameter.values);
                inddata.bifurcation.degreebins(j).proximaldiameter.std   = std(inddata.bifurcation.degreebins(j).proximaldiameter.values);
                inddata.bifurcation.degreebins(j).proximaldiameter.total = sum(inddata.bifurcation.degreebins(j).proximaldiameter.values);
                inddata.bifurcation.degreebins(j).proximaldiameter.skew  = skewness(inddata.bifurcation.degreebins(j).proximaldiameter.values,0);
                inddata.bifurcation.degreebins(j).proximaldiameter.kurt  = kurtosis(inddata.bifurcation.degreebins(j).proximaldiameter.values,0);
                
                inddata.bifurcation.degreebins(j).cylindricaldiameter.max   = max(inddata.bifurcation.degreebins(j).cylindricaldiameter.values);
                inddata.bifurcation.degreebins(j).cylindricaldiameter.mean  = mean(inddata.bifurcation.degreebins(j).cylindricaldiameter.values);
                inddata.bifurcation.degreebins(j).cylindricaldiameter.min   = min(inddata.bifurcation.degreebins(j).cylindricaldiameter.values);
                inddata.bifurcation.degreebins(j).cylindricaldiameter.std   = std(inddata.bifurcation.degreebins(j).cylindricaldiameter.values);
                inddata.bifurcation.degreebins(j).cylindricaldiameter.total = sum(inddata.bifurcation.degreebins(j).cylindricaldiameter.values);
                inddata.bifurcation.degreebins(j).cylindricaldiameter.skew  = skewness(inddata.bifurcation.degreebins(j).cylindricaldiameter.values,0);
                inddata.bifurcation.degreebins(j).cylindricaldiameter.kurt  = kurtosis(inddata.bifurcation.degreebins(j).cylindricaldiameter.values,0);
                
                inddata.bifurcation.degreebins(j).distaldiameter.max   = max(inddata.bifurcation.degreebins(j).distaldiameter.values);
                inddata.bifurcation.degreebins(j).distaldiameter.mean  = mean(inddata.bifurcation.degreebins(j).distaldiameter.values);
                inddata.bifurcation.degreebins(j).distaldiameter.min   = min(inddata.bifurcation.degreebins(j).distaldiameter.values);
                inddata.bifurcation.degreebins(j).distaldiameter.std   = std(inddata.bifurcation.degreebins(j).distaldiameter.values);
                inddata.bifurcation.degreebins(j).distaldiameter.total = sum(inddata.bifurcation.degreebins(j).distaldiameter.values);
                inddata.bifurcation.degreebins(j).distaldiameter.skew  = skewness(inddata.bifurcation.degreebins(j).distaldiameter.values,0);
                inddata.bifurcation.degreebins(j).distaldiameter.kurt  = kurtosis(inddata.bifurcation.degreebins(j).distaldiameter.values,0);
                
                inddata.bifurcation.degreebins(j).length.max   = max(inddata.bifurcation.degreebins(j).length.values);
                inddata.bifurcation.degreebins(j).length.mean  = mean(inddata.bifurcation.degreebins(j).length.values);
                inddata.bifurcation.degreebins(j).length.min   = min(inddata.bifurcation.degreebins(j).length.values);
                inddata.bifurcation.degreebins(j).length.std   = std(inddata.bifurcation.degreebins(j).length.values);
                inddata.bifurcation.degreebins(j).length.total = sum(inddata.bifurcation.degreebins(j).length.values);
                inddata.bifurcation.degreebins(j).length.skew  = skewness(inddata.bifurcation.degreebins(j).length.values,0);
                inddata.bifurcation.degreebins(j).length.kurt  = kurtosis(inddata.bifurcation.degreebins(j).length.values,0);
                
                inddata.bifurcation.degreebins(j).surfacearea.max   = max(inddata.bifurcation.degreebins(j).surfacearea.values);
                inddata.bifurcation.degreebins(j).surfacearea.mean  = mean(inddata.bifurcation.degreebins(j).surfacearea.values);
                inddata.bifurcation.degreebins(j).surfacearea.min   = min(inddata.bifurcation.degreebins(j).surfacearea.values);
                inddata.bifurcation.degreebins(j).surfacearea.std   = std(inddata.bifurcation.degreebins(j).surfacearea.values);
                inddata.bifurcation.degreebins(j).surfacearea.total = sum(inddata.bifurcation.degreebins(j).surfacearea.values);
                inddata.bifurcation.degreebins(j).surfacearea.skew  = skewness(inddata.bifurcation.degreebins(j).surfacearea.values,0);
                inddata.bifurcation.degreebins(j).surfacearea.kurt  = kurtosis(inddata.bifurcation.degreebins(j).surfacearea.values,0);
                
                inddata.bifurcation.degreebins(j).volume.max   = max(inddata.bifurcation.degreebins(j).volume.values);
                inddata.bifurcation.degreebins(j).volume.mean  = mean(inddata.bifurcation.degreebins(j).volume.values);
                inddata.bifurcation.degreebins(j).volume.min   = min(inddata.bifurcation.degreebins(j).volume.values);
                inddata.bifurcation.degreebins(j).volume.std   = std(inddata.bifurcation.degreebins(j).volume.values);
                inddata.bifurcation.degreebins(j).volume.total = sum(inddata.bifurcation.degreebins(j).volume.values);
                inddata.bifurcation.degreebins(j).volume.skew  = skewness(inddata.bifurcation.degreebins(j).volume.values,0);
                inddata.bifurcation.degreebins(j).volume.kurt  = kurtosis(inddata.bifurcation.degreebins(j).volume.values,0);
                
                inddata.bifurcation.degreebins(j).taperrate.max   = max(inddata.bifurcation.degreebins(j).taperrate.values);
                %inddata.bifurcation.degreebins(j).taperrate.mean  = mean(inddata.bifurcation.degreebins(j).taperrate.values);
                inddata.bifurcation.degreebins(j).taperrate.mean  = sum(([inddata.bifurcation.degreebins(j).taperrate.values].*[inddata.bifurcation.degreebins(j).length.values])/sum([inddata.bifurcation.degreebins(j).length.values]));
                inddata.bifurcation.degreebins(j).taperrate.min   = min(inddata.bifurcation.degreebins(j).taperrate.values);
                inddata.bifurcation.degreebins(j).taperrate.std   = std(inddata.bifurcation.degreebins(j).taperrate.values);
                inddata.bifurcation.degreebins(j).taperrate.total = sum(inddata.bifurcation.degreebins(j).taperrate.values);
                inddata.bifurcation.degreebins(j).taperrate.skew  = skewness(inddata.bifurcation.degreebins(j).taperrate.values,0);
                inddata.bifurcation.degreebins(j).taperrate.kurt  = kurtosis(inddata.bifurcation.degreebins(j).taperrate.values,0);
                
                inddata.bifurcation.degreebins(j).taperratio.max   = max(inddata.bifurcation.degreebins(j).taperratio.values);
                inddata.bifurcation.degreebins(j).taperratio.mean  = mean(inddata.bifurcation.degreebins(j).taperratio.values);
                inddata.bifurcation.degreebins(j).taperratio.min   = min(inddata.bifurcation.degreebins(j).taperratio.values);
                inddata.bifurcation.degreebins(j).taperratio.std   = std(inddata.bifurcation.degreebins(j).taperratio.values);
                inddata.bifurcation.degreebins(j).taperratio.total = sum(inddata.bifurcation.degreebins(j).taperratio.values);
                inddata.bifurcation.degreebins(j).taperratio.skew  = skewness(inddata.bifurcation.degreebins(j).taperratio.values,0);
                inddata.bifurcation.degreebins(j).taperratio.kurt  = kurtosis(inddata.bifurcation.degreebins(j).taperratio.values,0);
                
                if j < inddata.maxdegree
                    inddata.bifurcation.degreebins(j).rallratio.max   = max(inddata.bifurcation.degreebins(j).rallratio.values);
                    inddata.bifurcation.degreebins(j).rallratio.mean  = mean(inddata.bifurcation.degreebins(j).rallratio.values);
                    inddata.bifurcation.degreebins(j).rallratio.min   = min(inddata.bifurcation.degreebins(j).rallratio.values);
                    inddata.bifurcation.degreebins(j).rallratio.std   = std(inddata.bifurcation.degreebins(j).rallratio.values);
                    inddata.bifurcation.degreebins(j).rallratio.total = sum(inddata.bifurcation.degreebins(j).rallratio.values);
                    inddata.bifurcation.degreebins(j).rallratio.skew  = skewness(inddata.bifurcation.degreebins(j).rallratio.values,0);
                    inddata.bifurcation.degreebins(j).rallratio.kurt  = kurtosis(inddata.bifurcation.degreebins(j).rallratio.values,0);
                    
                    inddata.bifurcation.degreebins(j).rallratio1.max   = max(inddata.bifurcation.degreebins(j).rallratio1.values);
                    inddata.bifurcation.degreebins(j).rallratio1.mean  = mean(inddata.bifurcation.degreebins(j).rallratio1.values);
                    inddata.bifurcation.degreebins(j).rallratio1.min   = min(inddata.bifurcation.degreebins(j).rallratio1.values);
                    inddata.bifurcation.degreebins(j).rallratio1.std   = std(inddata.bifurcation.degreebins(j).rallratio1.values);
                    inddata.bifurcation.degreebins(j).rallratio1.total = sum(inddata.bifurcation.degreebins(j).rallratio1.values);
                    inddata.bifurcation.degreebins(j).rallratio1.skew  = skewness(inddata.bifurcation.degreebins(j).rallratio1.values,0);
                    inddata.bifurcation.degreebins(j).rallratio1.kurt  = kurtosis(inddata.bifurcation.degreebins(j).rallratio1.values,0);
                    
                    inddata.bifurcation.degreebins(j).rallratio2.max   = max(inddata.bifurcation.degreebins(j).rallratio2.values);
                    inddata.bifurcation.degreebins(j).rallratio2.mean  = mean(inddata.bifurcation.degreebins(j).rallratio2.values);
                    inddata.bifurcation.degreebins(j).rallratio2.min   = min(inddata.bifurcation.degreebins(j).rallratio2.values);
                    inddata.bifurcation.degreebins(j).rallratio2.std   = std(inddata.bifurcation.degreebins(j).rallratio2.values);
                    inddata.bifurcation.degreebins(j).rallratio2.total = sum(inddata.bifurcation.degreebins(j).rallratio2.values);
                    inddata.bifurcation.degreebins(j).rallratio2.skew  = skewness(inddata.bifurcation.degreebins(j).rallratio2.values,0);
                    inddata.bifurcation.degreebins(j).rallratio2.kurt  = kurtosis(inddata.bifurcation.degreebins(j).rallratio2.values,0);
                    
                    inddata.bifurcation.degreebins(j).rallratio3.max   = max(inddata.bifurcation.degreebins(j).rallratio3.values);
                    inddata.bifurcation.degreebins(j).rallratio3.mean  = mean(inddata.bifurcation.degreebins(j).rallratio3.values);
                    inddata.bifurcation.degreebins(j).rallratio3.min   = min(inddata.bifurcation.degreebins(j).rallratio3.values);
                    inddata.bifurcation.degreebins(j).rallratio3.std   = std(inddata.bifurcation.degreebins(j).rallratio3.values);
                    inddata.bifurcation.degreebins(j).rallratio3.total = sum(inddata.bifurcation.degreebins(j).rallratio3.values);
                    inddata.bifurcation.degreebins(j).rallratio3.skew  = skewness(inddata.bifurcation.degreebins(j).rallratio3.values,0);
                    inddata.bifurcation.degreebins(j).rallratio3.kurt  = kurtosis(inddata.bifurcation.degreebins(j).rallratio3.values,0);
                    
                    inddata.bifurcation.degreebins(j).daughterratio.max   = max(inddata.bifurcation.degreebins(j).daughterratio.values);
                    inddata.bifurcation.degreebins(j).daughterratio.mean  = mean(inddata.bifurcation.degreebins(j).daughterratio.values);
                    inddata.bifurcation.degreebins(j).daughterratio.min   = min(inddata.bifurcation.degreebins(j).daughterratio.values);
                    inddata.bifurcation.degreebins(j).daughterratio.std   = std(inddata.bifurcation.degreebins(j).daughterratio.values);
                    inddata.bifurcation.degreebins(j).daughterratio.total = sum(inddata.bifurcation.degreebins(j).daughterratio.values);
                    inddata.bifurcation.degreebins(j).daughterratio.skew  = skewness(inddata.bifurcation.degreebins(j).daughterratio.values,0);
                    inddata.bifurcation.degreebins(j).daughterratio.kurt  = kurtosis(inddata.bifurcation.degreebins(j).daughterratio.values,0);
                    
                    inddata.bifurcation.degreebins(j).parentdaughterratio.max   = max(inddata.bifurcation.degreebins(j).parentdaughterratio.values);
                    inddata.bifurcation.degreebins(j).parentdaughterratio.mean  = mean(inddata.bifurcation.degreebins(j).parentdaughterratio.values);
                    inddata.bifurcation.degreebins(j).parentdaughterratio.min   = min(inddata.bifurcation.degreebins(j).parentdaughterratio.values);
                    inddata.bifurcation.degreebins(j).parentdaughterratio.std   = std(inddata.bifurcation.degreebins(j).parentdaughterratio.values);
                    inddata.bifurcation.degreebins(j).parentdaughterratio.total = sum(inddata.bifurcation.degreebins(j).parentdaughterratio.values);
                    inddata.bifurcation.degreebins(j).parentdaughterratio.skew  = skewness(inddata.bifurcation.degreebins(j).parentdaughterratio.values,0);
                    inddata.bifurcation.degreebins(j).parentdaughterratio.kurt  = kurtosis(inddata.bifurcation.degreebins(j).parentdaughterratio.values,0);
                    
                    inddata.bifurcation.degreebins(j).parentdaughter2ratio.max   = max(inddata.bifurcation.degreebins(j).parentdaughter2ratio.values);
                    inddata.bifurcation.degreebins(j).parentdaughter2ratio.mean  = mean(inddata.bifurcation.degreebins(j).parentdaughter2ratio.values);
                    inddata.bifurcation.degreebins(j).parentdaughter2ratio.min   = min(inddata.bifurcation.degreebins(j).parentdaughter2ratio.values);
                    inddata.bifurcation.degreebins(j).parentdaughter2ratio.std   = std(inddata.bifurcation.degreebins(j).parentdaughter2ratio.values);
                    inddata.bifurcation.degreebins(j).parentdaughter2ratio.total = sum(inddata.bifurcation.degreebins(j).parentdaughter2ratio.values);
                    inddata.bifurcation.degreebins(j).parentdaughter2ratio.skew  = skewness(inddata.bifurcation.degreebins(j).parentdaughter2ratio.values,0);
                    inddata.bifurcation.degreebins(j).parentdaughter2ratio.kurt  = kurtosis(inddata.bifurcation.degreebins(j).parentdaughter2ratio.values,0);
                end
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        
        for i = 1:length(popdata.bifurcation.degreebins)
            if isfield(popdata.bifurcation.degreebins(i).cable,'id')==1
                popdata.bifurcation.degreebins(i).length.values               = [popdata.bifurcation.degreebins(i).cable.length];
                popdata.bifurcation.degreebins(i).surfacearea.values          = [popdata.bifurcation.degreebins(i).cable.surfacearea];
                popdata.bifurcation.degreebins(i).volume.values               = [popdata.bifurcation.degreebins(i).cable.volume];
                popdata.bifurcation.degreebins(i).taperrate.values            = [popdata.bifurcation.degreebins(i).cable.taperrate];
                popdata.bifurcation.degreebins(i).taperratio.values           = [popdata.bifurcation.degreebins(i).cable.taperratio];
                popdata.bifurcation.degreebins(i).proximaldiameter.values     = [popdata.bifurcation.degreebins(i).cable.proximaldiameter];
                popdata.bifurcation.degreebins(i).cylindricaldiameter.values  = [popdata.bifurcation.degreebins(i).cable.cylindricaldiameter];
                popdata.bifurcation.degreebins(i).distaldiameter.values       = [popdata.bifurcation.degreebins(i).cable.distaldiameter];
                popdata.bifurcation.degreebins(i).rallratio.values            = [popdata.bifurcation.degreebins(i).cable.rallratio];
                popdata.bifurcation.degreebins(i).rallratio1.values           = [popdata.bifurcation.degreebins(i).cable.rallratio1];
                popdata.bifurcation.degreebins(i).rallratio2.values           = [popdata.bifurcation.degreebins(i).cable.rallratio2];
                popdata.bifurcation.degreebins(i).rallratio3.values           = [popdata.bifurcation.degreebins(i).cable.rallratio3];
                popdata.bifurcation.degreebins(i).daughterratio.values        = [popdata.bifurcation.degreebins(i).cable.daughterratio];
                popdata.bifurcation.degreebins(i).parentdaughterratio.values  = [popdata.bifurcation.degreebins(i).cable.parentdaughterratio];
                popdata.bifurcation.degreebins(i).parentdaughter2ratio.values = [popdata.bifurcation.degreebins(i).cable.parentdaughter2ratio];
            end
        end
        
        for i = 1:length(popdata.bifurcation.degreebins)
            
            popdata.bifurcation.degreebins(i).numbersegments       = sum([popdata.bifurcation.degreebins(i).numbersegments.values]);
            
            popdata.bifurcation.degreebins(i).proximaldiameter.max   = max(popdata.bifurcation.degreebins(i).proximaldiameter.values);
            popdata.bifurcation.degreebins(i).proximaldiameter.mean  = mean(popdata.bifurcation.degreebins(i).proximaldiameter.values);
            popdata.bifurcation.degreebins(i).proximaldiameter.min   = min(popdata.bifurcation.degreebins(i).proximaldiameter.values);
            popdata.bifurcation.degreebins(i).proximaldiameter.std   = std(popdata.bifurcation.degreebins(i).proximaldiameter.values);
            popdata.bifurcation.degreebins(i).proximaldiameter.total = sum(popdata.bifurcation.degreebins(i).proximaldiameter.values);
            popdata.bifurcation.degreebins(i).proximaldiameter.skew  = skewness(popdata.bifurcation.degreebins(i).proximaldiameter.values,0);
            popdata.bifurcation.degreebins(i).proximaldiameter.kurt  = kurtosis(popdata.bifurcation.degreebins(i).proximaldiameter.values,0);
            
            popdata.bifurcation.degreebins(i).cylindricaldiameter.max   = max(popdata.bifurcation.degreebins(i).cylindricaldiameter.values);
            popdata.bifurcation.degreebins(i).cylindricaldiameter.mean  = mean(popdata.bifurcation.degreebins(i).cylindricaldiameter.values);
            popdata.bifurcation.degreebins(i).cylindricaldiameter.min   = min(popdata.bifurcation.degreebins(i).cylindricaldiameter.values);
            popdata.bifurcation.degreebins(i).cylindricaldiameter.std   = std(popdata.bifurcation.degreebins(i).cylindricaldiameter.values);
            popdata.bifurcation.degreebins(i).cylindricaldiameter.total = sum(popdata.bifurcation.degreebins(i).cylindricaldiameter.values);
            popdata.bifurcation.degreebins(i).cylindricaldiameter.skew  = skewness(popdata.bifurcation.degreebins(i).cylindricaldiameter.values,0);
            popdata.bifurcation.degreebins(i).cylindricaldiameter.kurt  = kurtosis(popdata.bifurcation.degreebins(i).cylindricaldiameter.values,0);
            
            popdata.bifurcation.degreebins(i).distaldiameter.max   = max(popdata.bifurcation.degreebins(i).distaldiameter.values);
            popdata.bifurcation.degreebins(i).distaldiameter.mean  = mean(popdata.bifurcation.degreebins(i).distaldiameter.values);
            popdata.bifurcation.degreebins(i).distaldiameter.min   = min(popdata.bifurcation.degreebins(i).distaldiameter.values);
            popdata.bifurcation.degreebins(i).distaldiameter.std   = std(popdata.bifurcation.degreebins(i).distaldiameter.values);
            popdata.bifurcation.degreebins(i).distaldiameter.total = sum(popdata.bifurcation.degreebins(i).distaldiameter.values);
            popdata.bifurcation.degreebins(i).distaldiameter.skew  = skewness(popdata.bifurcation.degreebins(i).distaldiameter.values,0);
            popdata.bifurcation.degreebins(i).distaldiameter.kurt  = kurtosis(popdata.bifurcation.degreebins(i).distaldiameter.values,0);
            
            popdata.bifurcation.degreebins(i).length.max   = max(popdata.bifurcation.degreebins(i).length.values);
            popdata.bifurcation.degreebins(i).length.mean  = mean(popdata.bifurcation.degreebins(i).length.values);
            popdata.bifurcation.degreebins(i).length.min   = min(popdata.bifurcation.degreebins(i).length.values);
            popdata.bifurcation.degreebins(i).length.std   = std(popdata.bifurcation.degreebins(i).length.values);
            popdata.bifurcation.degreebins(i).length.total = sum(popdata.bifurcation.degreebins(i).length.values);
            popdata.bifurcation.degreebins(i).length.skew  = skewness(popdata.bifurcation.degreebins(i).length.values,0);
            popdata.bifurcation.degreebins(i).length.kurt  = kurtosis(popdata.bifurcation.degreebins(i).length.values,0);
            
            popdata.bifurcation.degreebins(i).surfacearea.max   = max(popdata.bifurcation.degreebins(i).surfacearea.values);
            popdata.bifurcation.degreebins(i).surfacearea.mean  = mean(popdata.bifurcation.degreebins(i).surfacearea.values);
            popdata.bifurcation.degreebins(i).surfacearea.min   = min(popdata.bifurcation.degreebins(i).surfacearea.values);
            popdata.bifurcation.degreebins(i).surfacearea.std   = std(popdata.bifurcation.degreebins(i).surfacearea.values);
            popdata.bifurcation.degreebins(i).surfacearea.total = sum(popdata.bifurcation.degreebins(i).surfacearea.values);
            popdata.bifurcation.degreebins(i).surfacearea.skew  = skewness(popdata.bifurcation.degreebins(i).surfacearea.values,0);
            popdata.bifurcation.degreebins(i).surfacearea.kurt  = kurtosis(popdata.bifurcation.degreebins(i).surfacearea.values,0);
            
            popdata.bifurcation.degreebins(i).volume.max   = max(popdata.bifurcation.degreebins(i).volume.values);
            popdata.bifurcation.degreebins(i).volume.mean  = mean(popdata.bifurcation.degreebins(i).volume.values);
            popdata.bifurcation.degreebins(i).volume.min   = min(popdata.bifurcation.degreebins(i).volume.values);
            popdata.bifurcation.degreebins(i).volume.std   = std(popdata.bifurcation.degreebins(i).volume.values);
            popdata.bifurcation.degreebins(i).volume.total = sum(popdata.bifurcation.degreebins(i).volume.values);
            popdata.bifurcation.degreebins(i).volume.skew  = skewness(popdata.bifurcation.degreebins(i).volume.values,0);
            popdata.bifurcation.degreebins(i).volume.kurt  = kurtosis(popdata.bifurcation.degreebins(i).volume.values,0);
            
            popdata.bifurcation.degreebins(i).taperrate.max   = max(popdata.bifurcation.degreebins(i).taperrate.values);
            %popdata.bifurcation.degreebins(i).taperrate.mean  = mean(popdata.bifurcation.degreebins(i).taperrate.values);
            popdata.bifurcation.degreebins(i).taperrate.mean  = sum(([popdata.bifurcation.degreebins(i).taperrate.values].*[popdata.bifurcation.degreebins(i).length.values])/sum([popdata.bifurcation.degreebins(i).length.values]));
            popdata.bifurcation.degreebins(i).taperrate.min   = min(popdata.bifurcation.degreebins(i).taperrate.values);
            popdata.bifurcation.degreebins(i).taperrate.std   = std(popdata.bifurcation.degreebins(i).taperrate.values);
            popdata.bifurcation.degreebins(i).taperrate.total = sum(popdata.bifurcation.degreebins(i).taperrate.values);
            popdata.bifurcation.degreebins(i).taperrate.skew  = skewness(popdata.bifurcation.degreebins(i).taperrate.values,0);
            popdata.bifurcation.degreebins(i).taperrate.kurt  = kurtosis(popdata.bifurcation.degreebins(i).taperrate.values,0);
            
            popdata.bifurcation.degreebins(i).taperratio.max   = max(popdata.bifurcation.degreebins(i).taperratio.values);
            popdata.bifurcation.degreebins(i).taperratio.mean  = mean(popdata.bifurcation.degreebins(i).taperratio.values);
            popdata.bifurcation.degreebins(i).taperratio.min   = min(popdata.bifurcation.degreebins(i).taperratio.values);
            popdata.bifurcation.degreebins(i).taperratio.std   = std(popdata.bifurcation.degreebins(i).taperratio.values);
            popdata.bifurcation.degreebins(i).taperratio.total = sum(popdata.bifurcation.degreebins(i).taperratio.values);
            popdata.bifurcation.degreebins(i).taperratio.skew  = skewness(popdata.bifurcation.degreebins(i).taperratio.values,0);
            popdata.bifurcation.degreebins(i).taperratio.kurt  = kurtosis(popdata.bifurcation.degreebins(i).taperratio.values,0);
            
            popdata.bifurcation.degreebins(i).rallratio.max   = max(popdata.bifurcation.degreebins(i).rallratio.values);
            popdata.bifurcation.degreebins(i).rallratio.mean  = mean(popdata.bifurcation.degreebins(i).rallratio.values);
            popdata.bifurcation.degreebins(i).rallratio.min   = min(popdata.bifurcation.degreebins(i).rallratio.values);
            popdata.bifurcation.degreebins(i).rallratio.std   = std(popdata.bifurcation.degreebins(i).rallratio.values);
            popdata.bifurcation.degreebins(i).rallratio.total = sum(popdata.bifurcation.degreebins(i).rallratio.values);
            popdata.bifurcation.degreebins(i).rallratio.skew  = skewness(popdata.bifurcation.degreebins(i).rallratio.values,0);
            popdata.bifurcation.degreebins(i).rallratio.kurt  = kurtosis(popdata.bifurcation.degreebins(i).rallratio.values,0);
            
            popdata.bifurcation.degreebins(i).rallratio1.max   = max(popdata.bifurcation.degreebins(i).rallratio1.values);
            popdata.bifurcation.degreebins(i).rallratio1.mean  = mean(popdata.bifurcation.degreebins(i).rallratio1.values);
            popdata.bifurcation.degreebins(i).rallratio1.min   = min(popdata.bifurcation.degreebins(i).rallratio1.values);
            popdata.bifurcation.degreebins(i).rallratio1.std   = std(popdata.bifurcation.degreebins(i).rallratio1.values);
            popdata.bifurcation.degreebins(i).rallratio1.total = sum(popdata.bifurcation.degreebins(i).rallratio1.values);
            popdata.bifurcation.degreebins(i).rallratio1.skew  = skewness(popdata.bifurcation.degreebins(i).rallratio1.values,0);
            popdata.bifurcation.degreebins(i).rallratio1.kurt  = kurtosis(popdata.bifurcation.degreebins(i).rallratio1.values,0);
            
            popdata.bifurcation.degreebins(i).rallratio2.max   = max(popdata.bifurcation.degreebins(i).rallratio2.values);
            popdata.bifurcation.degreebins(i).rallratio2.mean  = mean(popdata.bifurcation.degreebins(i).rallratio2.values);
            popdata.bifurcation.degreebins(i).rallratio2.min   = min(popdata.bifurcation.degreebins(i).rallratio2.values);
            popdata.bifurcation.degreebins(i).rallratio2.std   = std(popdata.bifurcation.degreebins(i).rallratio2.values);
            popdata.bifurcation.degreebins(i).rallratio2.total = sum(popdata.bifurcation.degreebins(i).rallratio2.values);
            popdata.bifurcation.degreebins(i).rallratio2.skew  = skewness(popdata.bifurcation.degreebins(i).rallratio2.values,0);
            popdata.bifurcation.degreebins(i).rallratio2.kurt  = kurtosis(popdata.bifurcation.degreebins(i).rallratio2.values,0);
            
            popdata.bifurcation.degreebins(i).rallratio3.max   = max(popdata.bifurcation.degreebins(i).rallratio3.values);
            popdata.bifurcation.degreebins(i).rallratio3.mean  = mean(popdata.bifurcation.degreebins(i).rallratio3.values);
            popdata.bifurcation.degreebins(i).rallratio3.min   = min(popdata.bifurcation.degreebins(i).rallratio3.values);
            popdata.bifurcation.degreebins(i).rallratio3.std   = std(popdata.bifurcation.degreebins(i).rallratio3.values);
            popdata.bifurcation.degreebins(i).rallratio3.total = sum(popdata.bifurcation.degreebins(i).rallratio3.values);
            popdata.bifurcation.degreebins(i).rallratio3.skew  = skewness(popdata.bifurcation.degreebins(i).rallratio3.values,0);
            popdata.bifurcation.degreebins(i).rallratio3.kurt  = kurtosis(popdata.bifurcation.degreebins(i).rallratio3.values,0);
            
            popdata.bifurcation.degreebins(i).daughterratio.max   = max(popdata.bifurcation.degreebins(i).daughterratio.values);
            popdata.bifurcation.degreebins(i).daughterratio.mean  = mean(popdata.bifurcation.degreebins(i).daughterratio.values);
            popdata.bifurcation.degreebins(i).daughterratio.min   = min(popdata.bifurcation.degreebins(i).daughterratio.values);
            popdata.bifurcation.degreebins(i).daughterratio.std   = std(popdata.bifurcation.degreebins(i).daughterratio.values);
            popdata.bifurcation.degreebins(i).daughterratio.total = sum(popdata.bifurcation.degreebins(i).daughterratio.values);
            popdata.bifurcation.degreebins(i).daughterratio.skew  = skewness(popdata.bifurcation.degreebins(i).daughterratio.values,0);
            popdata.bifurcation.degreebins(i).daughterratio.kurt  = kurtosis(popdata.bifurcation.degreebins(i).daughterratio.values,0);
            
            popdata.bifurcation.degreebins(i).parentdaughterratio.max   = max(popdata.bifurcation.degreebins(i).parentdaughterratio.values);
            popdata.bifurcation.degreebins(i).parentdaughterratio.mean  = mean(popdata.bifurcation.degreebins(i).parentdaughterratio.values);
            popdata.bifurcation.degreebins(i).parentdaughterratio.min   = min(popdata.bifurcation.degreebins(i).parentdaughterratio.values);
            popdata.bifurcation.degreebins(i).parentdaughterratio.std   = std(popdata.bifurcation.degreebins(i).parentdaughterratio.values);
            popdata.bifurcation.degreebins(i).parentdaughterratio.total = sum(popdata.bifurcation.degreebins(i).parentdaughterratio.values);
            popdata.bifurcation.degreebins(i).parentdaughterratio.skew  = skewness(popdata.bifurcation.degreebins(i).parentdaughterratio.values,0);
            popdata.bifurcation.degreebins(i).parentdaughterratio.kurt  = kurtosis(popdata.bifurcation.degreebins(i).parentdaughterratio.values,0);
            
            popdata.bifurcation.degreebins(i).parentdaughter2ratio.max   = max(popdata.bifurcation.degreebins(i).parentdaughter2ratio.values);
            popdata.bifurcation.degreebins(i).parentdaughter2ratio.mean  = mean(popdata.bifurcation.degreebins(i).parentdaughter2ratio.values);
            popdata.bifurcation.degreebins(i).parentdaughter2ratio.min   = min(popdata.bifurcation.degreebins(i).parentdaughter2ratio.values);
            popdata.bifurcation.degreebins(i).parentdaughter2ratio.std   = std(popdata.bifurcation.degreebins(i).parentdaughter2ratio.values);
            popdata.bifurcation.degreebins(i).parentdaughter2ratio.total = sum(popdata.bifurcation.degreebins(i).parentdaughter2ratio.values);
            popdata.bifurcation.degreebins(i).parentdaughter2ratio.skew  = skewness(popdata.bifurcation.degreebins(i).parentdaughter2ratio.values,0);
            popdata.bifurcation.degreebins(i).parentdaughter2ratio.kurt  = kurtosis(popdata.bifurcation.degreebins(i).parentdaughter2ratio.values,0);
            
        end
        
        for i = 1:typeanalysis.maxdegree.max
            typeanalysis.bifurcation.degree.degree(i)                 = i;
            typeanalysis.bifurcation.degree.numbersegments(i).values       = [];
            typeanalysis.bifurcation.degree.length(i).values               = [];
            typeanalysis.bifurcation.degree.totallength(i).values          = [];
            typeanalysis.bifurcation.degree.surfacearea(i).values          = [];
            typeanalysis.bifurcation.degree.totalsurfacearea(i).values     = [];
            typeanalysis.bifurcation.degree.volume(i).values               = [];
            typeanalysis.bifurcation.degree.totalvolume(i).values          = [];
            typeanalysis.bifurcation.degree.taperrate(i).values            = [];
            typeanalysis.bifurcation.degree.taperratio(i).values           = [];
            typeanalysis.bifurcation.degree.proximaldiameter(i).values     = [];
            typeanalysis.bifurcation.degree.cylindricaldiameter(i).values  = [];
            typeanalysis.bifurcation.degree.distaldiameter(i).values       = [];
            typeanalysis.bifurcation.degree.rallratio(i).values            = [];
            typeanalysis.bifurcation.degree.rallratio1(i).values           = [];
            typeanalysis.bifurcation.degree.rallratio2(i).values           = [];
            typeanalysis.bifurcation.degree.rallratio3(i).values           = [];
            typeanalysis.bifurcation.degree.daughterratio(i).values        = [];
            typeanalysis.bifurcation.degree.parentdaughterratio(i).values  = [];
            typeanalysis.bifurcation.degree.parentdaughter2ratio(i).values = [];
        end
        
        
        for i = 1:length(data.individual)
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            for j = 1:inddata.maxdegree
                typeanalysis.bifurcation.degree.numbersegments(j).values     = [[typeanalysis.bifurcation.degree.numbersegments(j).values] [inddata.bifurcation.degreebins(j).numbersegments]];
                typeanalysis.bifurcation.degree.totallength(j).values        = [[typeanalysis.bifurcation.degree.totallength(j).values] [inddata.bifurcation.degreebins(j).length.total]];
                typeanalysis.bifurcation.degree.totalsurfacearea(j).values   = [[typeanalysis.bifurcation.degree.totalsurfacearea(j).values] [inddata.bifurcation.degreebins(j).surfacearea.total]];
                typeanalysis.bifurcation.degree.totalvolume(j).values        = [[typeanalysis.bifurcation.degree.totalvolume(j).values] [inddata.bifurcation.degreebins(j).volume.total]];
            end
        end
        
        for i = 1:typeanalysis.maxdegree.max
            if isfield(popdata.bifurcation.degreebins(i).cable,'id')==1
                typeanalysis.bifurcation.degree.length(i).values                  = [popdata.bifurcation.degreebins(i).cable.length];
                typeanalysis.bifurcation.degree.surfacearea(i).values             = [popdata.bifurcation.degreebins(i).cable.surfacearea];
                typeanalysis.bifurcation.degree.volume(i).values                  = [popdata.bifurcation.degreebins(i).cable.volume];
                typeanalysis.bifurcation.degree.taperrate(i).values               = [popdata.bifurcation.degreebins(i).cable.taperrate];
                typeanalysis.bifurcation.degree.taperratio(i).values              = [popdata.bifurcation.degreebins(i).cable.taperratio];
                typeanalysis.bifurcation.degree.proximaldiameter(i).values        = [popdata.bifurcation.degreebins(i).cable.proximaldiameter];
                typeanalysis.bifurcation.degree.cylindricaldiameter(i).values     = [popdata.bifurcation.degreebins(i).cable.cylindricaldiameter];
                typeanalysis.bifurcation.degree.distaldiameter(i).values          = [popdata.bifurcation.degreebins(i).cable.distaldiameter];
                if i < typeanalysis.maxdegree.max
                    typeanalysis.bifurcation.degree.rallratio(i).values            = [popdata.bifurcation.degreebins(i).cable.rallratio];
                    typeanalysis.bifurcation.degree.rallratio1(i).values           = [popdata.bifurcation.degreebins(i).cable.rallratio1];
                    typeanalysis.bifurcation.degree.rallratio2(i).values           = [popdata.bifurcation.degreebins(i).cable.rallratio2];
                    typeanalysis.bifurcation.degree.rallratio3(i).values           = [popdata.bifurcation.degreebins(i).cable.rallratio3];
                    typeanalysis.bifurcation.degree.daughterratio(i).values        = [popdata.bifurcation.degreebins(i).cable.daughterratio];
                    typeanalysis.bifurcation.degree.parentdaughterratio(i).values  = [popdata.bifurcation.degreebins(i).cable.parentdaughterratio];
                    typeanalysis.bifurcation.degree.parentdaughter2ratio(i).values = [popdata.bifurcation.degreebins(i).cable.parentdaughter2ratio];
                end
            end
        end
        
        for i = 1:typeanalysis.maxdegree.max
            typeanalysis.bifurcation.degree.numbersegments(i).mean  = mean(typeanalysis.bifurcation.degree.numbersegments(i).values);
            typeanalysis.bifurcation.degree.numbersegments(i).std   = std(typeanalysis.bifurcation.degree.numbersegments(i).values);
            typeanalysis.bifurcation.degree.numbersegments(i).skew  = skewness(typeanalysis.bifurcation.degree.numbersegments(i).values,0);
            typeanalysis.bifurcation.degree.numbersegments(i).kurt  = kurtosis(typeanalysis.bifurcation.degree.numbersegments(i).values,0);
            typeanalysis.bifurcation.degree.numbersegments(i).min   = min(typeanalysis.bifurcation.degree.numbersegments(i).values);
            typeanalysis.bifurcation.degree.numbersegments(i).max   = max(typeanalysis.bifurcation.degree.numbersegments(i).values);
            typeanalysis.bifurcation.degree.numbersegments(i).total = sum(typeanalysis.bifurcation.degree.numbersegments(i).values);
            
            typeanalysis.bifurcation.degree.totallength(i).mean = mean(typeanalysis.bifurcation.degree.totallength(i).values);
            typeanalysis.bifurcation.degree.totallength(i).std  = std(typeanalysis.bifurcation.degree.totallength(i).values);
            typeanalysis.bifurcation.degree.totallength(i).skew = skewness(typeanalysis.bifurcation.degree.totallength(i).values,0);
            typeanalysis.bifurcation.degree.totallength(i).kurt = kurtosis(typeanalysis.bifurcation.degree.totallength(i).values,0);
            typeanalysis.bifurcation.degree.totallength(i).min  = min(typeanalysis.bifurcation.degree.totallength(i).values);
            typeanalysis.bifurcation.degree.totallength(i).max  = max(typeanalysis.bifurcation.degree.totallength(i).values);
            
            typeanalysis.bifurcation.degree.length(i).mean  = mean(typeanalysis.bifurcation.degree.length(i).values);
            typeanalysis.bifurcation.degree.length(i).std   = std(typeanalysis.bifurcation.degree.length(i).values);
            typeanalysis.bifurcation.degree.length(i).skew  = skewness(typeanalysis.bifurcation.degree.length(i).values,0);
            typeanalysis.bifurcation.degree.length(i).kurt  = kurtosis(typeanalysis.bifurcation.degree.length(i).values,0);
            typeanalysis.bifurcation.degree.length(i).min   = min(typeanalysis.bifurcation.degree.length(i).values);
            typeanalysis.bifurcation.degree.length(i).max   = max(typeanalysis.bifurcation.degree.length(i).values);
            typeanalysis.bifurcation.degree.length(i).total = sum(typeanalysis.bifurcation.degree.length(i).values);
            
            typeanalysis.bifurcation.degree.totalsurfacearea(i).mean = mean(typeanalysis.bifurcation.degree.totalsurfacearea(i).values);
            typeanalysis.bifurcation.degree.totalsurfacearea(i).std  = std(typeanalysis.bifurcation.degree.totalsurfacearea(i).values);
            typeanalysis.bifurcation.degree.totalsurfacearea(i).skew = skewness(typeanalysis.bifurcation.degree.totalsurfacearea(i).values,0);
            typeanalysis.bifurcation.degree.totalsurfacearea(i).kurt = kurtosis(typeanalysis.bifurcation.degree.totalsurfacearea(i).values,0);
            typeanalysis.bifurcation.degree.totalsurfacearea(i).min  = min(typeanalysis.bifurcation.degree.totalsurfacearea(i).values);
            typeanalysis.bifurcation.degree.totalsurfacearea(i).max  = max(typeanalysis.bifurcation.degree.totalsurfacearea(i).values);
            
            typeanalysis.bifurcation.degree.surfacearea(i).mean  = mean(typeanalysis.bifurcation.degree.surfacearea(i).values);
            typeanalysis.bifurcation.degree.surfacearea(i).std   = std(typeanalysis.bifurcation.degree.surfacearea(i).values);
            typeanalysis.bifurcation.degree.surfacearea(i).skew  = skewness(typeanalysis.bifurcation.degree.surfacearea(i).values,0);
            typeanalysis.bifurcation.degree.surfacearea(i).kurt  = kurtosis(typeanalysis.bifurcation.degree.surfacearea(i).values,0);
            typeanalysis.bifurcation.degree.surfacearea(i).min   = min(typeanalysis.bifurcation.degree.surfacearea(i).values);
            typeanalysis.bifurcation.degree.surfacearea(i).max   = max(typeanalysis.bifurcation.degree.surfacearea(i).values);
            typeanalysis.bifurcation.degree.surfacearea(i).total = sum(typeanalysis.bifurcation.degree.surfacearea(i).values);
            
            typeanalysis.bifurcation.degree.totalvolume(i).mean = mean(typeanalysis.bifurcation.degree.totalvolume(i).values);
            typeanalysis.bifurcation.degree.totalvolume(i).std  = std(typeanalysis.bifurcation.degree.totalvolume(i).values);
            typeanalysis.bifurcation.degree.totalvolume(i).skew = skewness(typeanalysis.bifurcation.degree.totalvolume(i).values,0);
            typeanalysis.bifurcation.degree.totalvolume(i).kurt = kurtosis(typeanalysis.bifurcation.degree.totalvolume(i).values,0);
            typeanalysis.bifurcation.degree.totalvolume(i).min  = min(typeanalysis.bifurcation.degree.totalvolume(i).values);
            typeanalysis.bifurcation.degree.totalvolume(i).max  = max(typeanalysis.bifurcation.degree.totalvolume(i).values);
            
            typeanalysis.bifurcation.degree.volume(i).mean  = mean(typeanalysis.bifurcation.degree.volume(i).values);
            typeanalysis.bifurcation.degree.volume(i).std   = std(typeanalysis.bifurcation.degree.volume(i).values);
            typeanalysis.bifurcation.degree.volume(i).skew  = skewness(typeanalysis.bifurcation.degree.volume(i).values,0);
            typeanalysis.bifurcation.degree.volume(i).kurt  = kurtosis(typeanalysis.bifurcation.degree.volume(i).values,0);
            typeanalysis.bifurcation.degree.volume(i).min   = min(typeanalysis.bifurcation.degree.volume(i).values);
            typeanalysis.bifurcation.degree.volume(i).max   = max(typeanalysis.bifurcation.degree.volume(i).values);
            typeanalysis.bifurcation.degree.volume(i).total = sum(typeanalysis.bifurcation.degree.volume(i).values);
            
            %typeanalysis.bifurcation.degree.taperrate(i).mean = mean(typeanalysis.bifurcation.degree.taperrate(i).values);
            typeanalysis.bifurcation.degree.taperrate(i).mean = sum(([typeanalysis.bifurcation.degree.taperrate(i).values].*[typeanalysis.bifurcation.degree.length(i).values])/sum([typeanalysis.bifurcation.degree.length(i).values]));
            typeanalysis.bifurcation.degree.taperrate(i).std  = std(typeanalysis.bifurcation.degree.taperrate(i).values);
            typeanalysis.bifurcation.degree.taperrate(i).skew = skewness(typeanalysis.bifurcation.degree.taperrate(i).values,0);
            typeanalysis.bifurcation.degree.taperrate(i).kurt = kurtosis(typeanalysis.bifurcation.degree.taperrate(i).values,0);
            typeanalysis.bifurcation.degree.taperrate(i).min  = min(typeanalysis.bifurcation.degree.taperrate(i).values);
            typeanalysis.bifurcation.degree.taperrate(i).max  = max(typeanalysis.bifurcation.degree.taperrate(i).values);
            
            typeanalysis.bifurcation.degree.taperratio(i).mean = mean(typeanalysis.bifurcation.degree.taperratio(i).values);
            typeanalysis.bifurcation.degree.taperratio(i).std  = std(typeanalysis.bifurcation.degree.taperratio(i).values);
            typeanalysis.bifurcation.degree.taperratio(i).skew = skewness(typeanalysis.bifurcation.degree.taperratio(i).values,0);
            typeanalysis.bifurcation.degree.taperratio(i).kurt = kurtosis(typeanalysis.bifurcation.degree.taperratio(i).values,0);
            typeanalysis.bifurcation.degree.taperratio(i).min  = min(typeanalysis.bifurcation.degree.taperratio(i).values);
            typeanalysis.bifurcation.degree.taperratio(i).max  = max(typeanalysis.bifurcation.degree.taperratio(i).values);
            
            typeanalysis.bifurcation.degree.proximaldiameter(i).mean = mean(typeanalysis.bifurcation.degree.proximaldiameter(i).values);
            typeanalysis.bifurcation.degree.proximaldiameter(i).std  = std(typeanalysis.bifurcation.degree.proximaldiameter(i).values);
            typeanalysis.bifurcation.degree.proximaldiameter(i).skew = skewness(typeanalysis.bifurcation.degree.proximaldiameter(i).values,0);
            typeanalysis.bifurcation.degree.proximaldiameter(i).kurt = kurtosis(typeanalysis.bifurcation.degree.proximaldiameter(i).values,0);
            typeanalysis.bifurcation.degree.proximaldiameter(i).min  = min(typeanalysis.bifurcation.degree.proximaldiameter(i).values);
            typeanalysis.bifurcation.degree.proximaldiameter(i).max  = max(typeanalysis.bifurcation.degree.proximaldiameter(i).values);
            
            typeanalysis.bifurcation.degree.cylindricaldiameter(i).mean = mean(typeanalysis.bifurcation.degree.cylindricaldiameter(i).values);
            typeanalysis.bifurcation.degree.cylindricaldiameter(i).std  = std(typeanalysis.bifurcation.degree.cylindricaldiameter(i).values);
            typeanalysis.bifurcation.degree.cylindricaldiameter(i).skew = skewness(typeanalysis.bifurcation.degree.cylindricaldiameter(i).values,0);
            typeanalysis.bifurcation.degree.cylindricaldiameter(i).kurt = kurtosis(typeanalysis.bifurcation.degree.cylindricaldiameter(i).values,0);
            typeanalysis.bifurcation.degree.cylindricaldiameter(i).min  = min(typeanalysis.bifurcation.degree.cylindricaldiameter(i).values);
            typeanalysis.bifurcation.degree.cylindricaldiameter(i).max  = max(typeanalysis.bifurcation.degree.cylindricaldiameter(i).values);
            
            typeanalysis.bifurcation.degree.distaldiameter(i).mean = mean(typeanalysis.bifurcation.degree.distaldiameter(i).values);
            typeanalysis.bifurcation.degree.distaldiameter(i).std  = std(typeanalysis.bifurcation.degree.distaldiameter(i).values);
            typeanalysis.bifurcation.degree.distaldiameter(i).skew = skewness(typeanalysis.bifurcation.degree.distaldiameter(i).values,0);
            typeanalysis.bifurcation.degree.distaldiameter(i).kurt = kurtosis(typeanalysis.bifurcation.degree.distaldiameter(i).values,0);
            typeanalysis.bifurcation.degree.distaldiameter(i).min  = min(typeanalysis.bifurcation.degree.distaldiameter(i).values);
            typeanalysis.bifurcation.degree.distaldiameter(i).max  = max(typeanalysis.bifurcation.degree.distaldiameter(i).values);
            
            typeanalysis.bifurcation.degree.rallratio(i).mean = mean(typeanalysis.bifurcation.degree.rallratio(i).values    );
            typeanalysis.bifurcation.degree.rallratio(i).std  = std(typeanalysis.bifurcation.degree.rallratio(i).values     );
            typeanalysis.bifurcation.degree.rallratio(i).skew = skewness(typeanalysis.bifurcation.degree.rallratio(i).values,0);
            typeanalysis.bifurcation.degree.rallratio(i).kurt = kurtosis(typeanalysis.bifurcation.degree.rallratio(i).values,0);
            typeanalysis.bifurcation.degree.rallratio(i).min  = min(typeanalysis.bifurcation.degree.rallratio(i).values);
            typeanalysis.bifurcation.degree.rallratio(i).max  = max(typeanalysis.bifurcation.degree.rallratio(i).values);
            
            typeanalysis.bifurcation.degree.rallratio1(i).mean = mean(typeanalysis.bifurcation.degree.rallratio1(i).values    );
            typeanalysis.bifurcation.degree.rallratio1(i).std  = std(typeanalysis.bifurcation.degree.rallratio1(i).values     );
            typeanalysis.bifurcation.degree.rallratio1(i).skew = skewness(typeanalysis.bifurcation.degree.rallratio1(i).values,0);
            typeanalysis.bifurcation.degree.rallratio1(i).kurt = kurtosis(typeanalysis.bifurcation.degree.rallratio1(i).values,0);
            typeanalysis.bifurcation.degree.rallratio1(i).min  = min(typeanalysis.bifurcation.degree.rallratio1(i).values);
            typeanalysis.bifurcation.degree.rallratio1(i).max  = max(typeanalysis.bifurcation.degree.rallratio1(i).values);
            
            typeanalysis.bifurcation.degree.rallratio2(i).mean = mean(typeanalysis.bifurcation.degree.rallratio2(i).values    );
            typeanalysis.bifurcation.degree.rallratio2(i).std  = std(typeanalysis.bifurcation.degree.rallratio2(i).values     );
            typeanalysis.bifurcation.degree.rallratio2(i).skew = skewness(typeanalysis.bifurcation.degree.rallratio2(i).values,0);
            typeanalysis.bifurcation.degree.rallratio2(i).kurt = kurtosis(typeanalysis.bifurcation.degree.rallratio2(i).values,0);
            typeanalysis.bifurcation.degree.rallratio2(i).min  = min(typeanalysis.bifurcation.degree.rallratio2(i).values);
            typeanalysis.bifurcation.degree.rallratio2(i).max  = max(typeanalysis.bifurcation.degree.rallratio2(i).values);
            
            typeanalysis.bifurcation.degree.rallratio3(i).mean = mean(typeanalysis.bifurcation.degree.rallratio3(i).values    );
            typeanalysis.bifurcation.degree.rallratio3(i).std  = std(typeanalysis.bifurcation.degree.rallratio3(i).values     );
            typeanalysis.bifurcation.degree.rallratio3(i).skew = skewness(typeanalysis.bifurcation.degree.rallratio3(i).values,0);
            typeanalysis.bifurcation.degree.rallratio3(i).kurt = kurtosis(typeanalysis.bifurcation.degree.rallratio3(i).values,0);
            typeanalysis.bifurcation.degree.rallratio3(i).min  = min(typeanalysis.bifurcation.degree.rallratio3(i).values);
            typeanalysis.bifurcation.degree.rallratio3(i).max  = max(typeanalysis.bifurcation.degree.rallratio3(i).values);
            
            typeanalysis.bifurcation.degree.daughterratio(i).mean = mean(typeanalysis.bifurcation.degree.daughterratio(i).values     );
            typeanalysis.bifurcation.degree.daughterratio(i).std  = std(typeanalysis.bifurcation.degree.daughterratio(i).values      );
            typeanalysis.bifurcation.degree.daughterratio(i).skew = skewness(typeanalysis.bifurcation.degree.daughterratio(i).values,0);
            typeanalysis.bifurcation.degree.daughterratio(i).kurt = kurtosis(typeanalysis.bifurcation.degree.daughterratio(i).values,0);
            typeanalysis.bifurcation.degree.daughterratio(i).min  = min(typeanalysis.bifurcation.degree.daughterratio(i).values);
            typeanalysis.bifurcation.degree.daughterratio(i).max  = max(typeanalysis.bifurcation.degree.daughterratio(i).values);
            
            typeanalysis.bifurcation.degree.parentdaughterratio(i).mean = mean(typeanalysis.bifurcation.degree.parentdaughterratio(i).values     );
            typeanalysis.bifurcation.degree.parentdaughterratio(i).std  = std(typeanalysis.bifurcation.degree.parentdaughterratio(i).values      );
            typeanalysis.bifurcation.degree.parentdaughterratio(i).skew = skewness(typeanalysis.bifurcation.degree.parentdaughterratio(i).values,0);
            typeanalysis.bifurcation.degree.parentdaughterratio(i).kurt = kurtosis(typeanalysis.bifurcation.degree.parentdaughterratio(i).values,0);
            typeanalysis.bifurcation.degree.parentdaughterratio(i).min  = min(typeanalysis.bifurcation.degree.parentdaughterratio(i).values);
            typeanalysis.bifurcation.degree.parentdaughterratio(i).max  = max(typeanalysis.bifurcation.degree.parentdaughterratio(i).values);
            
            typeanalysis.bifurcation.degree.parentdaughter2ratio(i).mean = mean(typeanalysis.bifurcation.degree.parentdaughter2ratio(i).values     );
            typeanalysis.bifurcation.degree.parentdaughter2ratio(i).std  = std(typeanalysis.bifurcation.degree.parentdaughter2ratio(i).values      );
            typeanalysis.bifurcation.degree.parentdaughter2ratio(i).skew = skewness(typeanalysis.bifurcation.degree.parentdaughter2ratio(i).values,0);
            typeanalysis.bifurcation.degree.parentdaughter2ratio(i).kurt = kurtosis(typeanalysis.bifurcation.degree.parentdaughter2ratio(i).values,0);
            typeanalysis.bifurcation.degree.parentdaughter2ratio(i).min  = min(typeanalysis.bifurcation.degree.parentdaughter2ratio(i).values);
            typeanalysis.bifurcation.degree.parentdaughter2ratio(i).max  = max(typeanalysis.bifurcation.degree.parentdaughter2ratio(i).values);
            
        end
        
        
        
        
        
        
        
        
        
        % Begin termination branch order typeanalysis
        
        for i = 1:length(data.individual)
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            %for j = 1:typeanalysis.maxdegree.max
            for j = 1:1
                inddata.termination.degreebins(j).numbersegments              = [];
                inddata.termination.degreebins(j).length.values               = [];
                inddata.termination.degreebins(j).surfacearea.values          = [];
                inddata.termination.degreebins(j).volume.values               = [];
                inddata.termination.degreebins(j).taperrate.values            = [];
                inddata.termination.degreebins(j).taperratio.values           = [];
                inddata.termination.degreebins(j).proximaldiameter.values     = [];
                inddata.termination.degreebins(j).cylindricaldiameter.values  = [];
                inddata.termination.degreebins(j).distaldiameter.values       = [];
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        for i = 1:length(data.individual)
            
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            
            %for j = 1:inddata.maxdegree
            for j = 1:1
                
                if isfield(inddata.termination.degreebins(j).cable,'id')==1
                    
                    inddata.termination.degreebins(j).numbersegments     = 0;
                    
                    inddata.termination.degreebins(j).length.values               = [inddata.termination.degreebins(j).cable.length];
                    inddata.termination.degreebins(j).surfacearea.values          = [inddata.termination.degreebins(j).cable.surfacearea];
                    inddata.termination.degreebins(j).volume.values               = [inddata.termination.degreebins(j).cable.volume];
                    inddata.termination.degreebins(j).taperrate.values            = [inddata.termination.degreebins(j).cable.taperrate];
                    inddata.termination.degreebins(j).taperratio.values           = [inddata.termination.degreebins(j).cable.taperratio];
                    inddata.termination.degreebins(j).proximaldiameter.values     = [inddata.termination.degreebins(j).cable.proximaldiameter];
                    inddata.termination.degreebins(j).cylindricaldiameter.values  = [inddata.termination.degreebins(j).cable.cylindricaldiameter];
                    inddata.termination.degreebins(j).distaldiameter.values       = [inddata.termination.degreebins(j).cable.distaldiameter];
                    
                    
                    for k = 1:length(inddata.termination.degreebins(j).cable)
                        inddata.termination.degreebins(j).numbersegments = 1 + inddata.termination.degreebins(j).numbersegments;
                    end
                end
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        for i = 1:length(data.individual)
            %for m = 1:typeanalysis.maxdegree.max
            for m = 1:1
                popdata.termination.degreebins(m).numbersegments(i).values     = [];
                popdata.termination.degreebins(m).length.values                = [];
                popdata.termination.degreebins(m).surfacearea.values           = [];
                popdata.termination.degreebins(m).volume.values                = [];
                popdata.termination.degreebins(m).taperrate.values             = [];
                popdata.termination.degreebins(m).taperratio.values            = [];
                popdata.termination.degreebins(m).proximaldiameter.values      = [];
                popdata.termination.degreebins(m).cylindricaldiameter.values   = [];
                popdata.termination.degreebins(m).distaldiameter.values        = [];
            end
        end
        
        for i = 1:length(data.individual)
            
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            
            %for j = 1:inddata.maxdegree
            for j = 1:1
                
                popdata.termination.degreebins(j).numbersegments(i).values = [popdata.termination.degreebins(j).numbersegments(i).values inddata.degreebins(j).numbersegments];
                
                inddata.termination.degreebins(j).proximaldiameter.max   = max(inddata.termination.degreebins(j).proximaldiameter.values);
                inddata.termination.degreebins(j).proximaldiameter.mean  = mean(inddata.termination.degreebins(j).proximaldiameter.values);
                inddata.termination.degreebins(j).proximaldiameter.min   = min(inddata.termination.degreebins(j).proximaldiameter.values);
                inddata.termination.degreebins(j).proximaldiameter.std   = std(inddata.termination.degreebins(j).proximaldiameter.values);
                inddata.termination.degreebins(j).proximaldiameter.total = sum(inddata.termination.degreebins(j).proximaldiameter.values);
                inddata.termination.degreebins(j).proximaldiameter.skew  = skewness(inddata.termination.degreebins(j).proximaldiameter.values,0);
                inddata.termination.degreebins(j).proximaldiameter.kurt  = kurtosis(inddata.termination.degreebins(j).proximaldiameter.values,0);
                
                inddata.termination.degreebins(j).cylindricaldiameter.max   = max(inddata.termination.degreebins(j).cylindricaldiameter.values);
                inddata.termination.degreebins(j).cylindricaldiameter.mean  = mean(inddata.termination.degreebins(j).cylindricaldiameter.values);
                inddata.termination.degreebins(j).cylindricaldiameter.min   = min(inddata.termination.degreebins(j).cylindricaldiameter.values);
                inddata.termination.degreebins(j).cylindricaldiameter.std   = std(inddata.termination.degreebins(j).cylindricaldiameter.values);
                inddata.termination.degreebins(j).cylindricaldiameter.total = sum(inddata.termination.degreebins(j).cylindricaldiameter.values);
                inddata.termination.degreebins(j).cylindricaldiameter.skew  = skewness(inddata.termination.degreebins(j).cylindricaldiameter.values,0);
                inddata.termination.degreebins(j).cylindricaldiameter.kurt  = kurtosis(inddata.termination.degreebins(j).cylindricaldiameter.values,0);
                
                inddata.termination.degreebins(j).distaldiameter.max   = max(inddata.termination.degreebins(j).distaldiameter.values);
                inddata.termination.degreebins(j).distaldiameter.mean  = mean(inddata.termination.degreebins(j).distaldiameter.values);
                inddata.termination.degreebins(j).distaldiameter.min   = min(inddata.termination.degreebins(j).distaldiameter.values);
                inddata.termination.degreebins(j).distaldiameter.std   = std(inddata.termination.degreebins(j).distaldiameter.values);
                inddata.termination.degreebins(j).distaldiameter.total = sum(inddata.termination.degreebins(j).distaldiameter.values);
                inddata.termination.degreebins(j).distaldiameter.skew  = skewness(inddata.termination.degreebins(j).distaldiameter.values,0);
                inddata.termination.degreebins(j).distaldiameter.kurt  = kurtosis(inddata.termination.degreebins(j).distaldiameter.values,0);
                
                inddata.termination.degreebins(j).length.max   = max(inddata.termination.degreebins(j).length.values);
                inddata.termination.degreebins(j).length.mean  = mean(inddata.termination.degreebins(j).length.values);
                inddata.termination.degreebins(j).length.min   = min(inddata.termination.degreebins(j).length.values);
                inddata.termination.degreebins(j).length.std   = std(inddata.termination.degreebins(j).length.values);
                inddata.termination.degreebins(j).length.total = sum(inddata.termination.degreebins(j).length.values);
                inddata.termination.degreebins(j).length.skew  = skewness(inddata.termination.degreebins(j).length.values,0);
                inddata.termination.degreebins(j).length.kurt  = kurtosis(inddata.termination.degreebins(j).length.values,0);
                
                inddata.termination.degreebins(j).surfacearea.max   = max(inddata.termination.degreebins(j).surfacearea.values);
                inddata.termination.degreebins(j).surfacearea.mean  = mean(inddata.termination.degreebins(j).surfacearea.values);
                inddata.termination.degreebins(j).surfacearea.min   = min(inddata.termination.degreebins(j).surfacearea.values);
                inddata.termination.degreebins(j).surfacearea.std   = std(inddata.termination.degreebins(j).surfacearea.values);
                inddata.termination.degreebins(j).surfacearea.total = sum(inddata.termination.degreebins(j).surfacearea.values);
                inddata.termination.degreebins(j).surfacearea.skew  = skewness(inddata.termination.degreebins(j).surfacearea.values,0);
                inddata.termination.degreebins(j).surfacearea.kurt  = kurtosis(inddata.termination.degreebins(j).surfacearea.values,0);
                
                inddata.termination.degreebins(j).volume.max   = max(inddata.termination.degreebins(j).volume.values);
                inddata.termination.degreebins(j).volume.mean  = mean(inddata.termination.degreebins(j).volume.values);
                inddata.termination.degreebins(j).volume.min   = min(inddata.termination.degreebins(j).volume.values);
                inddata.termination.degreebins(j).volume.std   = std(inddata.termination.degreebins(j).volume.values);
                inddata.termination.degreebins(j).volume.total = sum(inddata.termination.degreebins(j).volume.values);
                inddata.termination.degreebins(j).volume.skew  = skewness(inddata.termination.degreebins(j).volume.values,0);
                inddata.termination.degreebins(j).volume.kurt  = kurtosis(inddata.termination.degreebins(j).volume.values,0);
                
                inddata.termination.degreebins(j).taperrate.max   = max(inddata.termination.degreebins(j).taperrate.values);
                %inddata.termination.degreebins(j).taperrate.mean  = mean(inddata.termination.degreebins(j).taperrate.values);
                inddata.termination.degreebins(j).taperrate.mean  = sum(([inddata.termination.degreebins(j).taperrate.values].*[inddata.termination.degreebins(j).length.values])/sum([inddata.termination.degreebins(j).length.values]));
                inddata.termination.degreebins(j).taperrate.min   = min(inddata.termination.degreebins(j).taperrate.values);
                inddata.termination.degreebins(j).taperrate.std   = std(inddata.termination.degreebins(j).taperrate.values);
                inddata.termination.degreebins(j).taperrate.total = sum(inddata.termination.degreebins(j).taperrate.values);
                inddata.termination.degreebins(j).taperrate.skew  = skewness(inddata.termination.degreebins(j).taperrate.values,0);
                inddata.termination.degreebins(j).taperrate.kurt  = kurtosis(inddata.termination.degreebins(j).taperrate.values,0);
                
                inddata.termination.degreebins(j).taperratio.max   = max(inddata.termination.degreebins(j).taperratio.values);
                inddata.termination.degreebins(j).taperratio.mean  = mean(inddata.termination.degreebins(j).taperratio.values);
                inddata.termination.degreebins(j).taperratio.min   = min(inddata.termination.degreebins(j).taperratio.values);
                inddata.termination.degreebins(j).taperratio.std   = std(inddata.termination.degreebins(j).taperratio.values);
                inddata.termination.degreebins(j).taperratio.total = sum(inddata.termination.degreebins(j).taperratio.values);
                inddata.termination.degreebins(j).taperratio.skew  = skewness(inddata.termination.degreebins(j).taperratio.values,0);
                inddata.termination.degreebins(j).taperratio.kurt  = kurtosis(inddata.termination.degreebins(j).taperratio.values,0);
                
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        
        %for i = 1:length(popdata.termination.degreebins)
        for i = 1:1
            if isfield(popdata.termination.degreebins(i).cable,'id')==1
                popdata.termination.degreebins(i).length.values               = [popdata.termination.degreebins(i).cable.length];
                popdata.termination.degreebins(i).surfacearea.values          = [popdata.termination.degreebins(i).cable.surfacearea];
                popdata.termination.degreebins(i).volume.values               = [popdata.termination.degreebins(i).cable.volume];
                popdata.termination.degreebins(i).taperrate.values            = [popdata.termination.degreebins(i).cable.taperrate];
                popdata.termination.degreebins(i).taperratio.values           = [popdata.termination.degreebins(i).cable.taperratio];
                popdata.termination.degreebins(i).proximaldiameter.values     = [popdata.termination.degreebins(i).cable.proximaldiameter];
                popdata.termination.degreebins(i).cylindricaldiameter.values  = [popdata.termination.degreebins(i).cable.cylindricaldiameter];
                popdata.termination.degreebins(i).distaldiameter.values       = [popdata.termination.degreebins(i).cable.distaldiameter];
            end
        end
        
        %for i = 1:length(popdata.termination.degreebins)
        for i = 1:1
            
            popdata.termination.degreebins(i).numbersegments       = sum([popdata.termination.degreebins(i).numbersegments.values]);
            
            popdata.termination.degreebins(i).proximaldiameter.max   = max(popdata.termination.degreebins(i).proximaldiameter.values);
            popdata.termination.degreebins(i).proximaldiameter.mean  = mean(popdata.termination.degreebins(i).proximaldiameter.values);
            popdata.termination.degreebins(i).proximaldiameter.min   = min(popdata.termination.degreebins(i).proximaldiameter.values);
            popdata.termination.degreebins(i).proximaldiameter.std   = std(popdata.termination.degreebins(i).proximaldiameter.values);
            popdata.termination.degreebins(i).proximaldiameter.total = sum(popdata.termination.degreebins(i).proximaldiameter.values);
            popdata.termination.degreebins(i).proximaldiameter.skew  = skewness(popdata.termination.degreebins(i).proximaldiameter.values,0);
            popdata.termination.degreebins(i).proximaldiameter.kurt  = kurtosis(popdata.termination.degreebins(i).proximaldiameter.values,0);
            
            popdata.termination.degreebins(i).cylindricaldiameter.max   = max(popdata.termination.degreebins(i).cylindricaldiameter.values);
            popdata.termination.degreebins(i).cylindricaldiameter.mean  = mean(popdata.termination.degreebins(i).cylindricaldiameter.values);
            popdata.termination.degreebins(i).cylindricaldiameter.min   = min(popdata.termination.degreebins(i).cylindricaldiameter.values);
            popdata.termination.degreebins(i).cylindricaldiameter.std   = std(popdata.termination.degreebins(i).cylindricaldiameter.values);
            popdata.termination.degreebins(i).cylindricaldiameter.total = sum(popdata.termination.degreebins(i).cylindricaldiameter.values);
            popdata.termination.degreebins(i).cylindricaldiameter.skew  = skewness(popdata.termination.degreebins(i).cylindricaldiameter.values,0);
            popdata.termination.degreebins(i).cylindricaldiameter.kurt  = kurtosis(popdata.termination.degreebins(i).cylindricaldiameter.values,0);
            
            popdata.termination.degreebins(i).distaldiameter.max   = max(popdata.termination.degreebins(i).distaldiameter.values);
            popdata.termination.degreebins(i).distaldiameter.mean  = mean(popdata.termination.degreebins(i).distaldiameter.values);
            popdata.termination.degreebins(i).distaldiameter.min   = min(popdata.termination.degreebins(i).distaldiameter.values);
            popdata.termination.degreebins(i).distaldiameter.std   = std(popdata.termination.degreebins(i).distaldiameter.values);
            popdata.termination.degreebins(i).distaldiameter.total = sum(popdata.termination.degreebins(i).distaldiameter.values);
            popdata.termination.degreebins(i).distaldiameter.skew  = skewness(popdata.termination.degreebins(i).distaldiameter.values,0);
            popdata.termination.degreebins(i).distaldiameter.kurt  = kurtosis(popdata.termination.degreebins(i).distaldiameter.values,0);
            
            popdata.termination.degreebins(i).length.max   = max(popdata.termination.degreebins(i).length.values);
            popdata.termination.degreebins(i).length.mean  = mean(popdata.termination.degreebins(i).length.values);
            popdata.termination.degreebins(i).length.min   = min(popdata.termination.degreebins(i).length.values);
            popdata.termination.degreebins(i).length.std   = std(popdata.termination.degreebins(i).length.values);
            popdata.termination.degreebins(i).length.total = sum(popdata.termination.degreebins(i).length.values);
            popdata.termination.degreebins(i).length.skew  = skewness(popdata.termination.degreebins(i).length.values,0);
            popdata.termination.degreebins(i).length.kurt  = kurtosis(popdata.termination.degreebins(i).length.values,0);
            
            popdata.termination.degreebins(i).surfacearea.max   = max(popdata.termination.degreebins(i).surfacearea.values);
            popdata.termination.degreebins(i).surfacearea.mean  = mean(popdata.termination.degreebins(i).surfacearea.values);
            popdata.termination.degreebins(i).surfacearea.min   = min(popdata.termination.degreebins(i).surfacearea.values);
            popdata.termination.degreebins(i).surfacearea.std   = std(popdata.termination.degreebins(i).surfacearea.values);
            popdata.termination.degreebins(i).surfacearea.total = sum(popdata.termination.degreebins(i).surfacearea.values);
            popdata.termination.degreebins(i).surfacearea.skew  = skewness(popdata.termination.degreebins(i).surfacearea.values,0);
            popdata.termination.degreebins(i).surfacearea.kurt  = kurtosis(popdata.termination.degreebins(i).surfacearea.values,0);
            
            popdata.termination.degreebins(i).volume.max   = max(popdata.termination.degreebins(i).volume.values);
            popdata.termination.degreebins(i).volume.mean  = mean(popdata.termination.degreebins(i).volume.values);
            popdata.termination.degreebins(i).volume.min   = min(popdata.termination.degreebins(i).volume.values);
            popdata.termination.degreebins(i).volume.std   = std(popdata.termination.degreebins(i).volume.values);
            popdata.termination.degreebins(i).volume.total = sum(popdata.termination.degreebins(i).volume.values);
            popdata.termination.degreebins(i).volume.skew  = skewness(popdata.termination.degreebins(i).volume.values,0);
            popdata.termination.degreebins(i).volume.kurt  = kurtosis(popdata.termination.degreebins(i).volume.values,0);
            
            popdata.termination.degreebins(i).taperrate.max   = max(popdata.termination.degreebins(i).taperrate.values);
            %popdata.termination.degreebins(i).taperrate.mean  = mean(popdata.termination.degreebins(i).taperrate.values);
            popdata.termination.degreebins(i).taperrate.mean  = sum(([popdata.termination.degreebins(i).taperrate.values].*[popdata.termination.degreebins(i).length.values])/sum([popdata.termination.degreebins(i).length.values]));
            popdata.termination.degreebins(i).taperrate.min   = min(popdata.termination.degreebins(i).taperrate.values);
            popdata.termination.degreebins(i).taperrate.std   = std(popdata.termination.degreebins(i).taperrate.values);
            popdata.termination.degreebins(i).taperrate.total = sum(popdata.termination.degreebins(i).taperrate.values);
            popdata.termination.degreebins(i).taperrate.skew  = skewness(popdata.termination.degreebins(i).taperrate.values,0);
            popdata.termination.degreebins(i).taperrate.kurt  = kurtosis(popdata.termination.degreebins(i).taperrate.values,0);
            
            popdata.termination.degreebins(i).taperratio.max   = max(popdata.termination.degreebins(i).taperratio.values);
            popdata.termination.degreebins(i).taperratio.mean  = mean(popdata.termination.degreebins(i).taperratio.values);
            popdata.termination.degreebins(i).taperratio.min   = min(popdata.termination.degreebins(i).taperratio.values);
            popdata.termination.degreebins(i).taperratio.std   = std(popdata.termination.degreebins(i).taperratio.values);
            popdata.termination.degreebins(i).taperratio.total = sum(popdata.termination.degreebins(i).taperratio.values);
            popdata.termination.degreebins(i).taperratio.skew  = skewness(popdata.termination.degreebins(i).taperratio.values,0);
            popdata.termination.degreebins(i).taperratio.kurt  = kurtosis(popdata.termination.degreebins(i).taperratio.values,0);
            
        end
        
        %for i = 1:typeanalysis.maxdegree.max
        for i = 1:1
            typeanalysis.termination.degree.degree(i)                 = i;
            typeanalysis.termination.degree.numbersegments(i).values       = [];
            typeanalysis.termination.degree.length(i).values               = [];
            typeanalysis.termination.degree.totallength(i).values          = [];
            typeanalysis.termination.degree.surfacearea(i).values          = [];
            typeanalysis.termination.degree.totalsurfacearea(i).values     = [];
            typeanalysis.termination.degree.volume(i).values               = [];
            typeanalysis.termination.degree.totalvolume(i).values          = [];
            typeanalysis.termination.degree.taperrate(i).values            = [];
            typeanalysis.termination.degree.taperratio(i).values           = [];
            typeanalysis.termination.degree.proximaldiameter(i).values     = [];
            typeanalysis.termination.degree.cylindricaldiameter(i).values  = [];
            typeanalysis.termination.degree.distaldiameter(i).values       = [];
        end
        
        
        for i = 1:length(data.individual)
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            %for j = 1:inddata.maxdegree
            for j = 1:1
                typeanalysis.termination.degree.numbersegments(j).values     = [[typeanalysis.termination.degree.numbersegments(j).values] [inddata.termination.degreebins(j).numbersegments]];
                typeanalysis.termination.degree.totallength(j).values        = [[typeanalysis.termination.degree.totallength(j).values] [inddata.termination.degreebins(j).length.total]];
                typeanalysis.termination.degree.totalsurfacearea(j).values   = [[typeanalysis.termination.degree.totalsurfacearea(j).values] [inddata.termination.degreebins(j).surfacearea.total]];
                typeanalysis.termination.degree.totalvolume(j).values        = [[typeanalysis.termination.degree.totalvolume(j).values] [inddata.termination.degreebins(j).volume.total]];
            end
        end
        
        %for i = 1:typeanalysis.maxdegree.max
        for i = 1:1
            if isfield(popdata.termination.degreebins(i).cable,'id')==1
                typeanalysis.termination.degree.length(i).values                  = [popdata.termination.degreebins(i).cable.length];
                typeanalysis.termination.degree.surfacearea(i).values             = [popdata.termination.degreebins(i).cable.surfacearea];
                typeanalysis.termination.degree.volume(i).values                  = [popdata.termination.degreebins(i).cable.volume];
                typeanalysis.termination.degree.taperrate(i).values               = [popdata.termination.degreebins(i).cable.taperrate];
                typeanalysis.termination.degree.taperratio(i).values              = [popdata.termination.degreebins(i).cable.taperratio];
                typeanalysis.termination.degree.proximaldiameter(i).values        = [popdata.termination.degreebins(i).cable.proximaldiameter];
                typeanalysis.termination.degree.cylindricaldiameter(i).values     = [popdata.termination.degreebins(i).cable.cylindricaldiameter];
                typeanalysis.termination.degree.distaldiameter(i).values          = [popdata.termination.degreebins(i).cable.distaldiameter];
            end
        end
        
        %for i = 1:typeanalysis.maxdegree.max
        for i = 1:1
            
            typeanalysis.termination.degree.numbersegments(i).mean  = mean(typeanalysis.termination.degree.numbersegments(i).values);
            typeanalysis.termination.degree.numbersegments(i).std   = std(typeanalysis.termination.degree.numbersegments(i).values);
            typeanalysis.termination.degree.numbersegments(i).skew  = skewness(typeanalysis.termination.degree.numbersegments(i).values,0);
            typeanalysis.termination.degree.numbersegments(i).kurt  = kurtosis(typeanalysis.termination.degree.numbersegments(i).values,0);
            typeanalysis.termination.degree.numbersegments(i).min   = min(typeanalysis.termination.degree.numbersegments(i).values);
            typeanalysis.termination.degree.numbersegments(i).max   = max(typeanalysis.termination.degree.numbersegments(i).values);
            typeanalysis.termination.degree.numbersegments(i).total = sum(typeanalysis.termination.degree.numbersegments(i).values);
            
            typeanalysis.termination.degree.totallength(i).mean = mean(typeanalysis.termination.degree.totallength(i).values);
            typeanalysis.termination.degree.totallength(i).std  = std(typeanalysis.termination.degree.totallength(i).values);
            typeanalysis.termination.degree.totallength(i).skew = skewness(typeanalysis.termination.degree.totallength(i).values,0);
            typeanalysis.termination.degree.totallength(i).kurt = kurtosis(typeanalysis.termination.degree.totallength(i).values,0);
            typeanalysis.termination.degree.totallength(i).min  = min(typeanalysis.termination.degree.totallength(i).values);
            typeanalysis.termination.degree.totallength(i).max  = max(typeanalysis.termination.degree.totallength(i).values);
            
            typeanalysis.termination.degree.length(i).mean  = mean(typeanalysis.termination.degree.length(i).values);
            typeanalysis.termination.degree.length(i).std   = std(typeanalysis.termination.degree.length(i).values);
            typeanalysis.termination.degree.length(i).skew  = skewness(typeanalysis.termination.degree.length(i).values,0);
            typeanalysis.termination.degree.length(i).kurt  = kurtosis(typeanalysis.termination.degree.length(i).values,0);
            typeanalysis.termination.degree.length(i).min   = min(typeanalysis.termination.degree.length(i).values);
            typeanalysis.termination.degree.length(i).max   = max(typeanalysis.termination.degree.length(i).values);
            typeanalysis.termination.degree.length(i).total = sum(typeanalysis.termination.degree.length(i).values);
            
            typeanalysis.termination.degree.totalsurfacearea(i).mean = mean(typeanalysis.termination.degree.totalsurfacearea(i).values);
            typeanalysis.termination.degree.totalsurfacearea(i).std  = std(typeanalysis.termination.degree.totalsurfacearea(i).values);
            typeanalysis.termination.degree.totalsurfacearea(i).skew = skewness(typeanalysis.termination.degree.totalsurfacearea(i).values,0);
            typeanalysis.termination.degree.totalsurfacearea(i).kurt = kurtosis(typeanalysis.termination.degree.totalsurfacearea(i).values,0);
            typeanalysis.termination.degree.totalsurfacearea(i).min  = min(typeanalysis.termination.degree.totalsurfacearea(i).values);
            typeanalysis.termination.degree.totalsurfacearea(i).max  = max(typeanalysis.termination.degree.totalsurfacearea(i).values);
            
            typeanalysis.termination.degree.surfacearea(i).mean  = mean(typeanalysis.termination.degree.surfacearea(i).values);
            typeanalysis.termination.degree.surfacearea(i).std   = std(typeanalysis.termination.degree.surfacearea(i).values);
            typeanalysis.termination.degree.surfacearea(i).skew  = skewness(typeanalysis.termination.degree.surfacearea(i).values,0);
            typeanalysis.termination.degree.surfacearea(i).kurt  = kurtosis(typeanalysis.termination.degree.surfacearea(i).values,0);
            typeanalysis.termination.degree.surfacearea(i).min   = min(typeanalysis.termination.degree.surfacearea(i).values);
            typeanalysis.termination.degree.surfacearea(i).max   = max(typeanalysis.termination.degree.surfacearea(i).values);
            typeanalysis.termination.degree.surfacearea(i).total = sum(typeanalysis.termination.degree.surfacearea(i).values);
            
            typeanalysis.termination.degree.totalvolume(i).mean = mean(typeanalysis.termination.degree.totalvolume(i).values);
            typeanalysis.termination.degree.totalvolume(i).std  = std(typeanalysis.termination.degree.totalvolume(i).values);
            typeanalysis.termination.degree.totalvolume(i).skew = skewness(typeanalysis.termination.degree.totalvolume(i).values,0);
            typeanalysis.termination.degree.totalvolume(i).kurt = kurtosis(typeanalysis.termination.degree.totalvolume(i).values,0);
            typeanalysis.termination.degree.totalvolume(i).min  = min(typeanalysis.termination.degree.totalvolume(i).values);
            typeanalysis.termination.degree.totalvolume(i).max  = max(typeanalysis.termination.degree.totalvolume(i).values);
            
            typeanalysis.termination.degree.volume(i).mean  = mean(typeanalysis.termination.degree.volume(i).values);
            typeanalysis.termination.degree.volume(i).std   = std(typeanalysis.termination.degree.volume(i).values);
            typeanalysis.termination.degree.volume(i).skew  = skewness(typeanalysis.termination.degree.volume(i).values,0);
            typeanalysis.termination.degree.volume(i).kurt  = kurtosis(typeanalysis.termination.degree.volume(i).values,0);
            typeanalysis.termination.degree.volume(i).min   = min(typeanalysis.termination.degree.volume(i).values);
            typeanalysis.termination.degree.volume(i).max   = max(typeanalysis.termination.degree.volume(i).values);
            typeanalysis.termination.degree.volume(i).total = sum(typeanalysis.termination.degree.volume(i).values);
            
            %typeanalysis.termination.degree.taperrate(i).mean = mean(typeanalysis.termination.degree.taperrate(i).values);
            typeanalysis.termination.degree.taperrate(i).mean = sum(([typeanalysis.termination.degree.taperrate(i).values].*[typeanalysis.termination.degree.length(i).values])/sum([typeanalysis.termination.degree.length(i).values]));
            typeanalysis.termination.degree.taperrate(i).std  = std(typeanalysis.termination.degree.taperrate(i).values);
            typeanalysis.termination.degree.taperrate(i).skew = skewness(typeanalysis.termination.degree.taperrate(i).values,0);
            typeanalysis.termination.degree.taperrate(i).kurt = kurtosis(typeanalysis.termination.degree.taperrate(i).values,0);
            typeanalysis.termination.degree.taperrate(i).min  = min(typeanalysis.termination.degree.taperrate(i).values);
            typeanalysis.termination.degree.taperrate(i).max  = max(typeanalysis.termination.degree.taperrate(i).values);
            
            typeanalysis.termination.degree.taperratio(i).mean = mean(typeanalysis.termination.degree.taperratio(i).values);
            typeanalysis.termination.degree.taperratio(i).std  = std(typeanalysis.termination.degree.taperratio(i).values);
            typeanalysis.termination.degree.taperratio(i).skew = skewness(typeanalysis.termination.degree.taperratio(i).values,0);
            typeanalysis.termination.degree.taperratio(i).kurt = kurtosis(typeanalysis.termination.degree.taperratio(i).values,0);
            typeanalysis.termination.degree.taperratio(i).min  = min(typeanalysis.termination.degree.taperratio(i).values);
            typeanalysis.termination.degree.taperratio(i).max  = max(typeanalysis.termination.degree.taperratio(i).values);
            
            typeanalysis.termination.degree.proximaldiameter(i).mean = mean(typeanalysis.termination.degree.proximaldiameter(i).values);
            typeanalysis.termination.degree.proximaldiameter(i).std  = std(typeanalysis.termination.degree.proximaldiameter(i).values);
            typeanalysis.termination.degree.proximaldiameter(i).skew = skewness(typeanalysis.termination.degree.proximaldiameter(i).values,0);
            typeanalysis.termination.degree.proximaldiameter(i).kurt = kurtosis(typeanalysis.termination.degree.proximaldiameter(i).values,0);
            typeanalysis.termination.degree.proximaldiameter(i).min  = min(typeanalysis.termination.degree.proximaldiameter(i).values);
            typeanalysis.termination.degree.proximaldiameter(i).max  = max(typeanalysis.termination.degree.proximaldiameter(i).values);
            
            typeanalysis.termination.degree.cylindricaldiameter(i).mean = mean(typeanalysis.termination.degree.cylindricaldiameter(i).values);
            typeanalysis.termination.degree.cylindricaldiameter(i).std  = std(typeanalysis.termination.degree.cylindricaldiameter(i).values);
            typeanalysis.termination.degree.cylindricaldiameter(i).skew = skewness(typeanalysis.termination.degree.cylindricaldiameter(i).values,0);
            typeanalysis.termination.degree.cylindricaldiameter(i).kurt = kurtosis(typeanalysis.termination.degree.cylindricaldiameter(i).values,0);
            typeanalysis.termination.degree.cylindricaldiameter(i).min  = min(typeanalysis.termination.degree.cylindricaldiameter(i).values);
            typeanalysis.termination.degree.cylindricaldiameter(i).max  = max(typeanalysis.termination.degree.cylindricaldiameter(i).values);
            
            typeanalysis.termination.degree.distaldiameter(i).mean = mean(typeanalysis.termination.degree.distaldiameter(i).values);
            typeanalysis.termination.degree.distaldiameter(i).std  = std(typeanalysis.termination.degree.distaldiameter(i).values);
            typeanalysis.termination.degree.distaldiameter(i).skew = skewness(typeanalysis.termination.degree.distaldiameter(i).values,0);
            typeanalysis.termination.degree.distaldiameter(i).kurt = kurtosis(typeanalysis.termination.degree.distaldiameter(i).values,0);
            typeanalysis.termination.degree.distaldiameter(i).min  = min(typeanalysis.termination.degree.distaldiameter(i).values);
            typeanalysis.termination.degree.distaldiameter(i).max  = max(typeanalysis.termination.degree.distaldiameter(i).values);
            
            
        end
        
        eval(['analysis.' currentpiecetype ' = typeanalysis;']);
        eval(['data.population.' currentpiecetype ' = popdata;']);
        
    end
end

warning('on', 'MATLAB:divideByZero');