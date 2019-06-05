function [data,analysis] = branchorderanalyzer(data,analysis)

disp('   Branch order analysis started.');

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
            for j = 1:typeanalysis.maxbranchorder.max
                inddata.branchorderbins(j).numberbifurcations          = [];
                inddata.branchorderbins(j).numberterminations          = [];
                inddata.branchorderbins(j).numbersegments              = [];
                inddata.branchorderbins(j).length.values               = [];
                inddata.branchorderbins(j).surfacearea.values          = [];
                inddata.branchorderbins(j).volume.values               = [];
                inddata.branchorderbins(j).taperrate.values            = [];
                inddata.branchorderbins(j).taperratio.values           = [];
                inddata.branchorderbins(j).proximaldiameter.values     = [];
                inddata.branchorderbins(j).cylindricaldiameter.values  = [];
                inddata.branchorderbins(j).distaldiameter.values       = [];
                inddata.branchorderbins(j).rallratio.values            = [];
                inddata.branchorderbins(j).rallratio1.values           = [];
                inddata.branchorderbins(j).rallratio2.values           = [];
                inddata.branchorderbins(j).rallratio3.values           = [];
                inddata.branchorderbins(j).daughterratio.values        = [];
                inddata.branchorderbins(j).parentdaughterratio.values  = [];
                inddata.branchorderbins(j).parentdaughter2ratio.values = [];
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        for i = 1:length(data.individual)
            
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            
            for j = 1:inddata.maxbranchorder
                
                inddata.branchorderbins(j).numberbifurcations = 0;
                inddata.branchorderbins(j).numberterminations = 0;
                inddata.branchorderbins(j).numbersegments     = 0;
                
                inddata.branchorderbins(j).length.values               = [inddata.branchorderbins(j).cable.length];
                inddata.branchorderbins(j).surfacearea.values          = [inddata.branchorderbins(j).cable.surfacearea];
                inddata.branchorderbins(j).volume.values               = [inddata.branchorderbins(j).cable.volume];
                inddata.branchorderbins(j).taperrate.values            = [inddata.branchorderbins(j).cable.taperrate];
                inddata.branchorderbins(j).taperratio.values           = [inddata.branchorderbins(j).cable.taperratio];
                inddata.branchorderbins(j).proximaldiameter.values     = [inddata.branchorderbins(j).cable.proximaldiameter];
                inddata.branchorderbins(j).cylindricaldiameter.values  = [inddata.branchorderbins(j).cable.cylindricaldiameter];
                inddata.branchorderbins(j).distaldiameter.values       = [inddata.branchorderbins(j).cable.distaldiameter];
                inddata.branchorderbins(j).rallratio.values            = [inddata.branchorderbins(j).cable.rallratio];
                inddata.branchorderbins(j).rallratio1.values           = [inddata.branchorderbins(j).cable.rallratio1];
                inddata.branchorderbins(j).rallratio2.values           = [inddata.branchorderbins(j).cable.rallratio2];
                inddata.branchorderbins(j).rallratio3.values           = [inddata.branchorderbins(j).cable.rallratio3];
                inddata.branchorderbins(j).daughterratio.values        = [inddata.branchorderbins(j).cable.daughterratio];
                inddata.branchorderbins(j).parentdaughterratio.values  = [inddata.branchorderbins(j).cable.parentdaughterratio];
                inddata.branchorderbins(j).parentdaughter2ratio.values = [inddata.branchorderbins(j).cable.parentdaughter2ratio];
                
                
                for k = 1:length(inddata.branchorderbins(j).cable)
                    inddata.branchorderbins(j).numbersegments = 1 + inddata.branchorderbins(j).numbersegments;
                    if strcmp(inddata.branchorderbins(j).cable(k).distaltype,'bifurcation')==1
                        inddata.branchorderbins(j).numberbifurcations = 1 + inddata.branchorderbins(j).numberbifurcations;
                    end
                    if strcmp(inddata.branchorderbins(j).cable(k).distaltype,'m-furcation')==1
                        inddata.branchorderbins(j).numberbifurcations = length(inddata.branchorderbins(j).cable(k).daughters) - 1 + inddata.branchorderbins(j).numberbifurcations;
                    end
                    if strcmp(inddata.branchorderbins(j).cable(k).distaltype,'termination')==1
                        inddata.branchorderbins(j).numberterminations = 1 + inddata.branchorderbins(j).numberterminations;
                    end
                end
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        
        for i = 1:length(data.individual)
            for m = 1:typeanalysis.maxbranchorder.max
                popdata.branchorderbins(m).numberbifurcations(i).values = [];
                popdata.branchorderbins(m).numberterminations(i).values = [];
                popdata.branchorderbins(m).numbersegments(i).values     = [];
                popdata.branchorderbins(m).length.values                = [];
                popdata.branchorderbins(m).surfacearea.values           = [];
                popdata.branchorderbins(m).volume.values                = [];
                popdata.branchorderbins(m).taperrate.values             = [];
                popdata.branchorderbins(m).taperratio.values            = [];
                popdata.branchorderbins(m).proximaldiameter.values      = [];
                popdata.branchorderbins(m).cylindricaldiameter.values   = [];
                popdata.branchorderbins(m).distaldiameter.values        = [];
                popdata.branchorderbins(m).rallratio.values             = [];
                popdata.branchorderbins(m).rallratio1.values            = [];
                popdata.branchorderbins(m).rallratio2.values            = [];
                popdata.branchorderbins(m).rallratio3.values            = [];
                popdata.branchorderbins(m).daughterratio.values         = [];
                popdata.branchorderbins(m).parentdaughterratio.values   = [];
                popdata.branchorderbins(m).parentdaughter2ratio.values  = [];
            end
        end
        
        for i = 1:length(data.individual)
            
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            
            for j = 1:inddata.maxbranchorder
                
                popdata.branchorderbins(j).numbersegments(i).values     = [popdata.branchorderbins(j).numbersegments(i).values inddata.branchorderbins(j).numbersegments];
                popdata.branchorderbins(j).numberbifurcations(i).values = [popdata.branchorderbins(j).numberbifurcations(i).values inddata.branchorderbins(j).numberbifurcations];
                popdata.branchorderbins(j).numberterminations(i).values = [popdata.branchorderbins(j).numberterminations(i).values inddata.branchorderbins(j).numberterminations];
                
                inddata.branchorderbins(j).proximaldiameter.max   = max(inddata.branchorderbins(j).proximaldiameter.values);
                inddata.branchorderbins(j).proximaldiameter.mean  = mean(inddata.branchorderbins(j).proximaldiameter.values);
                inddata.branchorderbins(j).proximaldiameter.min   = min(inddata.branchorderbins(j).proximaldiameter.values);
                inddata.branchorderbins(j).proximaldiameter.std   = std(inddata.branchorderbins(j).proximaldiameter.values);
                inddata.branchorderbins(j).proximaldiameter.total = sum(inddata.branchorderbins(j).proximaldiameter.values);
                inddata.branchorderbins(j).proximaldiameter.skew  = skewness(inddata.branchorderbins(j).proximaldiameter.values,0);
                inddata.branchorderbins(j).proximaldiameter.kurt  = kurtosis(inddata.branchorderbins(j).proximaldiameter.values,0);
                
                inddata.branchorderbins(j).cylindricaldiameter.max   = max(inddata.branchorderbins(j).cylindricaldiameter.values);
                inddata.branchorderbins(j).cylindricaldiameter.mean  = mean(inddata.branchorderbins(j).cylindricaldiameter.values);
                inddata.branchorderbins(j).cylindricaldiameter.min   = min(inddata.branchorderbins(j).cylindricaldiameter.values);
                inddata.branchorderbins(j).cylindricaldiameter.std   = std(inddata.branchorderbins(j).cylindricaldiameter.values);
                inddata.branchorderbins(j).cylindricaldiameter.total = sum(inddata.branchorderbins(j).cylindricaldiameter.values);
                inddata.branchorderbins(j).cylindricaldiameter.skew  = skewness(inddata.branchorderbins(j).cylindricaldiameter.values,0);
                inddata.branchorderbins(j).cylindricaldiameter.kurt  = kurtosis(inddata.branchorderbins(j).cylindricaldiameter.values,0);
                
                inddata.branchorderbins(j).distaldiameter.max   = max(inddata.branchorderbins(j).distaldiameter.values);
                inddata.branchorderbins(j).distaldiameter.mean  = mean(inddata.branchorderbins(j).distaldiameter.values);
                inddata.branchorderbins(j).distaldiameter.min   = min(inddata.branchorderbins(j).distaldiameter.values);
                inddata.branchorderbins(j).distaldiameter.std   = std(inddata.branchorderbins(j).distaldiameter.values);
                inddata.branchorderbins(j).distaldiameter.total = sum(inddata.branchorderbins(j).distaldiameter.values);
                inddata.branchorderbins(j).distaldiameter.skew  = skewness(inddata.branchorderbins(j).distaldiameter.values,0);
                inddata.branchorderbins(j).distaldiameter.kurt  = kurtosis(inddata.branchorderbins(j).distaldiameter.values,0);
                
                inddata.branchorderbins(j).length.max   = max(inddata.branchorderbins(j).length.values);
                inddata.branchorderbins(j).length.mean  = mean(inddata.branchorderbins(j).length.values);
                inddata.branchorderbins(j).length.min   = min(inddata.branchorderbins(j).length.values);
                inddata.branchorderbins(j).length.std   = std(inddata.branchorderbins(j).length.values);
                inddata.branchorderbins(j).length.total = sum(inddata.branchorderbins(j).length.values);
                inddata.branchorderbins(j).length.skew  = skewness(inddata.branchorderbins(j).length.values,0);
                inddata.branchorderbins(j).length.kurt  = kurtosis(inddata.branchorderbins(j).length.values,0);
                
                inddata.branchorderbins(j).surfacearea.max   = max(inddata.branchorderbins(j).surfacearea.values);
                inddata.branchorderbins(j).surfacearea.mean  = mean(inddata.branchorderbins(j).surfacearea.values);
                inddata.branchorderbins(j).surfacearea.min   = min(inddata.branchorderbins(j).surfacearea.values);
                inddata.branchorderbins(j).surfacearea.std   = std(inddata.branchorderbins(j).surfacearea.values);
                inddata.branchorderbins(j).surfacearea.total = sum(inddata.branchorderbins(j).surfacearea.values);
                inddata.branchorderbins(j).surfacearea.skew  = skewness(inddata.branchorderbins(j).surfacearea.values,0);
                inddata.branchorderbins(j).surfacearea.kurt  = kurtosis(inddata.branchorderbins(j).surfacearea.values,0);
                
                inddata.branchorderbins(j).volume.max   = max(inddata.branchorderbins(j).volume.values);
                inddata.branchorderbins(j).volume.mean  = mean(inddata.branchorderbins(j).volume.values);
                inddata.branchorderbins(j).volume.min   = min(inddata.branchorderbins(j).volume.values);
                inddata.branchorderbins(j).volume.std   = std(inddata.branchorderbins(j).volume.values);
                inddata.branchorderbins(j).volume.total = sum(inddata.branchorderbins(j).volume.values);
                inddata.branchorderbins(j).volume.skew  = skewness(inddata.branchorderbins(j).volume.values,0);
                inddata.branchorderbins(j).volume.kurt  = kurtosis(inddata.branchorderbins(j).volume.values,0);
                
                inddata.branchorderbins(j).taperrate.max   = max(inddata.branchorderbins(j).taperrate.values);
                %inddata.branchorderbins(j).taperrate.mean  = mean(inddata.branchorderbins(j).taperrate.values);
                inddata.branchorderbins(j).taperrate.mean  = sum(([inddata.branchorderbins(j).taperrate.values].*[inddata.branchorderbins(j).length.values])/sum([inddata.branchorderbins(j).length.values]));
                inddata.branchorderbins(j).taperrate.min   = min(inddata.branchorderbins(j).taperrate.values);
                inddata.branchorderbins(j).taperrate.std   = std(inddata.branchorderbins(j).taperrate.values);
                inddata.branchorderbins(j).taperrate.total = sum(inddata.branchorderbins(j).taperrate.values);
                inddata.branchorderbins(j).taperrate.skew  = skewness(inddata.branchorderbins(j).taperrate.values,0);
                inddata.branchorderbins(j).taperrate.kurt  = kurtosis(inddata.branchorderbins(j).taperrate.values,0);
                
                inddata.branchorderbins(j).taperratio.max   = max(inddata.branchorderbins(j).taperratio.values);
                inddata.branchorderbins(j).taperratio.mean  = mean(inddata.branchorderbins(j).taperratio.values);
                inddata.branchorderbins(j).taperratio.min   = min(inddata.branchorderbins(j).taperratio.values);
                inddata.branchorderbins(j).taperratio.std   = std(inddata.branchorderbins(j).taperratio.values);
                inddata.branchorderbins(j).taperratio.total = sum(inddata.branchorderbins(j).taperratio.values);
                inddata.branchorderbins(j).taperratio.skew  = skewness(inddata.branchorderbins(j).taperratio.values,0);
                inddata.branchorderbins(j).taperratio.kurt  = kurtosis(inddata.branchorderbins(j).taperratio.values,0);
                
                if j < inddata.maxbranchorder
                    inddata.branchorderbins(j).rallratio.max   = max(inddata.branchorderbins(j).rallratio.values);
                    inddata.branchorderbins(j).rallratio.mean  = mean(inddata.branchorderbins(j).rallratio.values);
                    inddata.branchorderbins(j).rallratio.min   = min(inddata.branchorderbins(j).rallratio.values);
                    inddata.branchorderbins(j).rallratio.std   = std(inddata.branchorderbins(j).rallratio.values);
                    inddata.branchorderbins(j).rallratio.total = sum(inddata.branchorderbins(j).rallratio.values);
                    inddata.branchorderbins(j).rallratio.skew  = skewness(inddata.branchorderbins(j).rallratio.values,0);
                    inddata.branchorderbins(j).rallratio.kurt  = kurtosis(inddata.branchorderbins(j).rallratio.values,0);
                    
                    inddata.branchorderbins(j).rallratio1.max   = max(inddata.branchorderbins(j).rallratio1.values);
                    inddata.branchorderbins(j).rallratio1.mean  = mean(inddata.branchorderbins(j).rallratio1.values);
                    inddata.branchorderbins(j).rallratio1.min   = min(inddata.branchorderbins(j).rallratio1.values);
                    inddata.branchorderbins(j).rallratio1.std   = std(inddata.branchorderbins(j).rallratio1.values);
                    inddata.branchorderbins(j).rallratio1.total = sum(inddata.branchorderbins(j).rallratio1.values);
                    inddata.branchorderbins(j).rallratio1.skew  = skewness(inddata.branchorderbins(j).rallratio1.values,0);
                    inddata.branchorderbins(j).rallratio1.kurt  = kurtosis(inddata.branchorderbins(j).rallratio1.values,0);
                    
                    inddata.branchorderbins(j).rallratio2.max   = max(inddata.branchorderbins(j).rallratio2.values);
                    inddata.branchorderbins(j).rallratio2.mean  = mean(inddata.branchorderbins(j).rallratio2.values);
                    inddata.branchorderbins(j).rallratio2.min   = min(inddata.branchorderbins(j).rallratio2.values);
                    inddata.branchorderbins(j).rallratio2.std   = std(inddata.branchorderbins(j).rallratio2.values);
                    inddata.branchorderbins(j).rallratio2.total = sum(inddata.branchorderbins(j).rallratio2.values);
                    inddata.branchorderbins(j).rallratio2.skew  = skewness(inddata.branchorderbins(j).rallratio2.values,0);
                    inddata.branchorderbins(j).rallratio2.kurt  = kurtosis(inddata.branchorderbins(j).rallratio2.values,0);
                    
                    inddata.branchorderbins(j).rallratio3.max   = max(inddata.branchorderbins(j).rallratio3.values);
                    inddata.branchorderbins(j).rallratio3.mean  = mean(inddata.branchorderbins(j).rallratio3.values);
                    inddata.branchorderbins(j).rallratio3.min   = min(inddata.branchorderbins(j).rallratio3.values);
                    inddata.branchorderbins(j).rallratio3.std   = std(inddata.branchorderbins(j).rallratio3.values);
                    inddata.branchorderbins(j).rallratio3.total = sum(inddata.branchorderbins(j).rallratio3.values);
                    inddata.branchorderbins(j).rallratio3.skew  = skewness(inddata.branchorderbins(j).rallratio3.values,0);
                    inddata.branchorderbins(j).rallratio3.kurt  = kurtosis(inddata.branchorderbins(j).rallratio3.values,0);
                    
                    inddata.branchorderbins(j).daughterratio.max   = max(inddata.branchorderbins(j).daughterratio.values);
                    inddata.branchorderbins(j).daughterratio.mean  = mean(inddata.branchorderbins(j).daughterratio.values);
                    inddata.branchorderbins(j).daughterratio.min   = min(inddata.branchorderbins(j).daughterratio.values);
                    inddata.branchorderbins(j).daughterratio.std   = std(inddata.branchorderbins(j).daughterratio.values);
                    inddata.branchorderbins(j).daughterratio.total = sum(inddata.branchorderbins(j).daughterratio.values);
                    inddata.branchorderbins(j).daughterratio.skew  = skewness(inddata.branchorderbins(j).daughterratio.values,0);
                    inddata.branchorderbins(j).daughterratio.kurt  = kurtosis(inddata.branchorderbins(j).daughterratio.values,0);
                    
                    inddata.branchorderbins(j).parentdaughterratio.max   = max(inddata.branchorderbins(j).parentdaughterratio.values);
                    inddata.branchorderbins(j).parentdaughterratio.mean  = mean(inddata.branchorderbins(j).parentdaughterratio.values);
                    inddata.branchorderbins(j).parentdaughterratio.min   = min(inddata.branchorderbins(j).parentdaughterratio.values);
                    inddata.branchorderbins(j).parentdaughterratio.std   = std(inddata.branchorderbins(j).parentdaughterratio.values);
                    inddata.branchorderbins(j).parentdaughterratio.total = sum(inddata.branchorderbins(j).parentdaughterratio.values);
                    inddata.branchorderbins(j).parentdaughterratio.skew  = skewness(inddata.branchorderbins(j).parentdaughterratio.values,0);
                    inddata.branchorderbins(j).parentdaughterratio.kurt  = kurtosis(inddata.branchorderbins(j).parentdaughterratio.values,0);
                    
                    inddata.branchorderbins(j).parentdaughter2ratio.max   = max(inddata.branchorderbins(j).parentdaughter2ratio.values);
                    inddata.branchorderbins(j).parentdaughter2ratio.mean  = mean(inddata.branchorderbins(j).parentdaughter2ratio.values);
                    inddata.branchorderbins(j).parentdaughter2ratio.min   = min(inddata.branchorderbins(j).parentdaughter2ratio.values);
                    inddata.branchorderbins(j).parentdaughter2ratio.std   = std(inddata.branchorderbins(j).parentdaughter2ratio.values);
                    inddata.branchorderbins(j).parentdaughter2ratio.total = sum(inddata.branchorderbins(j).parentdaughter2ratio.values);
                    inddata.branchorderbins(j).parentdaughter2ratio.skew  = skewness(inddata.branchorderbins(j).parentdaughter2ratio.values,0);
                    inddata.branchorderbins(j).parentdaughter2ratio.kurt  = kurtosis(inddata.branchorderbins(j).parentdaughter2ratio.values,0);
                end
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        
        for i = 1:length(popdata.branchorderbins)
            popdata.branchorderbins(i).length.values               = [popdata.branchorderbins(i).cable.length];
            popdata.branchorderbins(i).surfacearea.values          = [popdata.branchorderbins(i).cable.surfacearea];
            popdata.branchorderbins(i).volume.values               = [popdata.branchorderbins(i).cable.volume];
            popdata.branchorderbins(i).taperrate.values            = [popdata.branchorderbins(i).cable.taperrate];
            popdata.branchorderbins(i).taperratio.values           = [popdata.branchorderbins(i).cable.taperratio];
            popdata.branchorderbins(i).proximaldiameter.values     = [popdata.branchorderbins(i).cable.proximaldiameter];
            popdata.branchorderbins(i).cylindricaldiameter.values  = [popdata.branchorderbins(i).cable.cylindricaldiameter];
            popdata.branchorderbins(i).distaldiameter.values       = [popdata.branchorderbins(i).cable.distaldiameter];
            popdata.branchorderbins(i).rallratio.values            = [popdata.branchorderbins(i).cable.rallratio];
            popdata.branchorderbins(i).rallratio1.values           = [popdata.branchorderbins(i).cable.rallratio1];
            popdata.branchorderbins(i).rallratio2.values           = [popdata.branchorderbins(i).cable.rallratio2];
            popdata.branchorderbins(i).rallratio3.values           = [popdata.branchorderbins(i).cable.rallratio3];
            popdata.branchorderbins(i).daughterratio.values        = [popdata.branchorderbins(i).cable.daughterratio];
            popdata.branchorderbins(i).parentdaughterratio.values  = [popdata.branchorderbins(i).cable.parentdaughterratio];
            popdata.branchorderbins(i).parentdaughter2ratio.values = [popdata.branchorderbins(i).cable.parentdaughter2ratio];
        end
        
        for i = 1:length(popdata.branchorderbins)
            
            popdata.branchorderbins(i).numbersegments       = sum([popdata.branchorderbins(i).numbersegments.values]);
            popdata.branchorderbins(i).numberbifurcations   = sum([popdata.branchorderbins(i).numberbifurcations.values]);
            popdata.branchorderbins(i).numberterminations   = sum([popdata.branchorderbins(i).numberterminations.values]);
            
            popdata.branchorderbins(i).proximaldiameter.max   = max(popdata.branchorderbins(i).proximaldiameter.values);
            popdata.branchorderbins(i).proximaldiameter.mean  = mean(popdata.branchorderbins(i).proximaldiameter.values);
            popdata.branchorderbins(i).proximaldiameter.min   = min(popdata.branchorderbins(i).proximaldiameter.values);
            popdata.branchorderbins(i).proximaldiameter.std   = std(popdata.branchorderbins(i).proximaldiameter.values);
            popdata.branchorderbins(i).proximaldiameter.total = sum(popdata.branchorderbins(i).proximaldiameter.values);
            popdata.branchorderbins(i).proximaldiameter.skew  = skewness(popdata.branchorderbins(i).proximaldiameter.values,0);
            popdata.branchorderbins(i).proximaldiameter.kurt  = kurtosis(popdata.branchorderbins(i).proximaldiameter.values,0);
            
            popdata.branchorderbins(i).cylindricaldiameter.max   = max(popdata.branchorderbins(i).cylindricaldiameter.values);
            popdata.branchorderbins(i).cylindricaldiameter.mean  = mean(popdata.branchorderbins(i).cylindricaldiameter.values);
            popdata.branchorderbins(i).cylindricaldiameter.min   = min(popdata.branchorderbins(i).cylindricaldiameter.values);
            popdata.branchorderbins(i).cylindricaldiameter.std   = std(popdata.branchorderbins(i).cylindricaldiameter.values);
            popdata.branchorderbins(i).cylindricaldiameter.total = sum(popdata.branchorderbins(i).cylindricaldiameter.values);
            popdata.branchorderbins(i).cylindricaldiameter.skew  = skewness(popdata.branchorderbins(i).cylindricaldiameter.values,0);
            popdata.branchorderbins(i).cylindricaldiameter.kurt  = kurtosis(popdata.branchorderbins(i).cylindricaldiameter.values,0);
            
            popdata.branchorderbins(i).distaldiameter.max   = max(popdata.branchorderbins(i).distaldiameter.values);
            popdata.branchorderbins(i).distaldiameter.mean  = mean(popdata.branchorderbins(i).distaldiameter.values);
            popdata.branchorderbins(i).distaldiameter.min   = min(popdata.branchorderbins(i).distaldiameter.values);
            popdata.branchorderbins(i).distaldiameter.std   = std(popdata.branchorderbins(i).distaldiameter.values);
            popdata.branchorderbins(i).distaldiameter.total = sum(popdata.branchorderbins(i).distaldiameter.values);
            popdata.branchorderbins(i).distaldiameter.skew  = skewness(popdata.branchorderbins(i).distaldiameter.values,0);
            popdata.branchorderbins(i).distaldiameter.kurt  = kurtosis(popdata.branchorderbins(i).distaldiameter.values,0);
            
            popdata.branchorderbins(i).length.max   = max(popdata.branchorderbins(i).length.values);
            popdata.branchorderbins(i).length.mean  = mean(popdata.branchorderbins(i).length.values);
            popdata.branchorderbins(i).length.min   = min(popdata.branchorderbins(i).length.values);
            popdata.branchorderbins(i).length.std   = std(popdata.branchorderbins(i).length.values);
            popdata.branchorderbins(i).length.total = sum(popdata.branchorderbins(i).length.values);
            popdata.branchorderbins(i).length.skew  = skewness(popdata.branchorderbins(i).length.values,0);
            popdata.branchorderbins(i).length.kurt  = kurtosis(popdata.branchorderbins(i).length.values,0);
            
            popdata.branchorderbins(i).surfacearea.max   = max(popdata.branchorderbins(i).surfacearea.values);
            popdata.branchorderbins(i).surfacearea.mean  = mean(popdata.branchorderbins(i).surfacearea.values);
            popdata.branchorderbins(i).surfacearea.min   = min(popdata.branchorderbins(i).surfacearea.values);
            popdata.branchorderbins(i).surfacearea.std   = std(popdata.branchorderbins(i).surfacearea.values);
            popdata.branchorderbins(i).surfacearea.total = sum(popdata.branchorderbins(i).surfacearea.values);
            popdata.branchorderbins(i).surfacearea.skew  = skewness(popdata.branchorderbins(i).surfacearea.values,0);
            popdata.branchorderbins(i).surfacearea.kurt  = kurtosis(popdata.branchorderbins(i).surfacearea.values,0);
            
            popdata.branchorderbins(i).volume.max   = max(popdata.branchorderbins(i).volume.values);
            popdata.branchorderbins(i).volume.mean  = mean(popdata.branchorderbins(i).volume.values);
            popdata.branchorderbins(i).volume.min   = min(popdata.branchorderbins(i).volume.values);
            popdata.branchorderbins(i).volume.std   = std(popdata.branchorderbins(i).volume.values);
            popdata.branchorderbins(i).volume.total = sum(popdata.branchorderbins(i).volume.values);
            popdata.branchorderbins(i).volume.skew  = skewness(popdata.branchorderbins(i).volume.values,0);
            popdata.branchorderbins(i).volume.kurt  = kurtosis(popdata.branchorderbins(i).volume.values,0);
            
            popdata.branchorderbins(i).taperrate.max   = max(popdata.branchorderbins(i).taperrate.values);
            %popdata.branchorderbins(i).taperrate.mean  = mean(popdata.branchorderbins(i).taperrate.values);
            popdata.branchorderbins(i).taperrate.mean  = sum(([popdata.branchorderbins(i).taperrate.values].*[popdata.branchorderbins(i).length.values])/sum([popdata.branchorderbins(i).length.values]));
            popdata.branchorderbins(i).taperrate.min   = min(popdata.branchorderbins(i).taperrate.values);
            popdata.branchorderbins(i).taperrate.std   = std(popdata.branchorderbins(i).taperrate.values);
            popdata.branchorderbins(i).taperrate.total = sum(popdata.branchorderbins(i).taperrate.values);
            popdata.branchorderbins(i).taperrate.skew  = skewness(popdata.branchorderbins(i).taperrate.values,0);
            popdata.branchorderbins(i).taperrate.kurt  = kurtosis(popdata.branchorderbins(i).taperrate.values,0);
            
            popdata.branchorderbins(i).taperratio.max   = max(popdata.branchorderbins(i).taperratio.values);
            popdata.branchorderbins(i).taperratio.mean  = mean(popdata.branchorderbins(i).taperratio.values);
            popdata.branchorderbins(i).taperratio.min   = min(popdata.branchorderbins(i).taperratio.values);
            popdata.branchorderbins(i).taperratio.std   = std(popdata.branchorderbins(i).taperratio.values);
            popdata.branchorderbins(i).taperratio.total = sum(popdata.branchorderbins(i).taperratio.values);
            popdata.branchorderbins(i).taperratio.skew  = skewness(popdata.branchorderbins(i).taperratio.values,0);
            popdata.branchorderbins(i).taperratio.kurt  = kurtosis(popdata.branchorderbins(i).taperratio.values,0);
            
            popdata.branchorderbins(i).rallratio.max   = max(popdata.branchorderbins(i).rallratio.values);
            popdata.branchorderbins(i).rallratio.mean  = mean(popdata.branchorderbins(i).rallratio.values);
            popdata.branchorderbins(i).rallratio.min   = min(popdata.branchorderbins(i).rallratio.values);
            popdata.branchorderbins(i).rallratio.std   = std(popdata.branchorderbins(i).rallratio.values);
            popdata.branchorderbins(i).rallratio.total = sum(popdata.branchorderbins(i).rallratio.values);
            popdata.branchorderbins(i).rallratio.skew  = skewness(popdata.branchorderbins(i).rallratio.values,0);
            popdata.branchorderbins(i).rallratio.kurt  = kurtosis(popdata.branchorderbins(i).rallratio.values,0);
            
            popdata.branchorderbins(i).rallratio1.max   = max(popdata.branchorderbins(i).rallratio1.values);
            popdata.branchorderbins(i).rallratio1.mean  = mean(popdata.branchorderbins(i).rallratio1.values);
            popdata.branchorderbins(i).rallratio1.min   = min(popdata.branchorderbins(i).rallratio1.values);
            popdata.branchorderbins(i).rallratio1.std   = std(popdata.branchorderbins(i).rallratio1.values);
            popdata.branchorderbins(i).rallratio1.total = sum(popdata.branchorderbins(i).rallratio1.values);
            popdata.branchorderbins(i).rallratio1.skew  = skewness(popdata.branchorderbins(i).rallratio1.values,0);
            popdata.branchorderbins(i).rallratio1.kurt  = kurtosis(popdata.branchorderbins(i).rallratio1.values,0);
            
            popdata.branchorderbins(i).rallratio2.max   = max(popdata.branchorderbins(i).rallratio2.values);
            popdata.branchorderbins(i).rallratio2.mean  = mean(popdata.branchorderbins(i).rallratio2.values);
            popdata.branchorderbins(i).rallratio2.min   = min(popdata.branchorderbins(i).rallratio2.values);
            popdata.branchorderbins(i).rallratio2.std   = std(popdata.branchorderbins(i).rallratio2.values);
            popdata.branchorderbins(i).rallratio2.total = sum(popdata.branchorderbins(i).rallratio2.values);
            popdata.branchorderbins(i).rallratio2.skew  = skewness(popdata.branchorderbins(i).rallratio2.values,0);
            popdata.branchorderbins(i).rallratio2.kurt  = kurtosis(popdata.branchorderbins(i).rallratio2.values,0);
            
            popdata.branchorderbins(i).rallratio3.max   = max(popdata.branchorderbins(i).rallratio3.values);
            popdata.branchorderbins(i).rallratio3.mean  = mean(popdata.branchorderbins(i).rallratio3.values);
            popdata.branchorderbins(i).rallratio3.min   = min(popdata.branchorderbins(i).rallratio3.values);
            popdata.branchorderbins(i).rallratio3.std   = std(popdata.branchorderbins(i).rallratio3.values);
            popdata.branchorderbins(i).rallratio3.total = sum(popdata.branchorderbins(i).rallratio3.values);
            popdata.branchorderbins(i).rallratio3.skew  = skewness(popdata.branchorderbins(i).rallratio3.values,0);
            popdata.branchorderbins(i).rallratio3.kurt  = kurtosis(popdata.branchorderbins(i).rallratio3.values,0);
            
            popdata.branchorderbins(i).daughterratio.max   = max(popdata.branchorderbins(i).daughterratio.values);
            popdata.branchorderbins(i).daughterratio.mean  = mean(popdata.branchorderbins(i).daughterratio.values);
            popdata.branchorderbins(i).daughterratio.min   = min(popdata.branchorderbins(i).daughterratio.values);
            popdata.branchorderbins(i).daughterratio.std   = std(popdata.branchorderbins(i).daughterratio.values);
            popdata.branchorderbins(i).daughterratio.total = sum(popdata.branchorderbins(i).daughterratio.values);
            popdata.branchorderbins(i).daughterratio.skew  = skewness(popdata.branchorderbins(i).daughterratio.values,0);
            popdata.branchorderbins(i).daughterratio.kurt  = kurtosis(popdata.branchorderbins(i).daughterratio.values,0);
            
            popdata.branchorderbins(i).parentdaughterratio.max   = max(popdata.branchorderbins(i).parentdaughterratio.values);
            popdata.branchorderbins(i).parentdaughterratio.mean  = mean(popdata.branchorderbins(i).parentdaughterratio.values);
            popdata.branchorderbins(i).parentdaughterratio.min   = min(popdata.branchorderbins(i).parentdaughterratio.values);
            popdata.branchorderbins(i).parentdaughterratio.std   = std(popdata.branchorderbins(i).parentdaughterratio.values);
            popdata.branchorderbins(i).parentdaughterratio.total = sum(popdata.branchorderbins(i).parentdaughterratio.values);
            popdata.branchorderbins(i).parentdaughterratio.skew  = skewness(popdata.branchorderbins(i).parentdaughterratio.values,0);
            popdata.branchorderbins(i).parentdaughterratio.kurt  = kurtosis(popdata.branchorderbins(i).parentdaughterratio.values,0);
            
            popdata.branchorderbins(i).parentdaughter2ratio.max   = max(popdata.branchorderbins(i).parentdaughter2ratio.values);
            popdata.branchorderbins(i).parentdaughter2ratio.mean  = mean(popdata.branchorderbins(i).parentdaughter2ratio.values);
            popdata.branchorderbins(i).parentdaughter2ratio.min   = min(popdata.branchorderbins(i).parentdaughter2ratio.values);
            popdata.branchorderbins(i).parentdaughter2ratio.std   = std(popdata.branchorderbins(i).parentdaughter2ratio.values);
            popdata.branchorderbins(i).parentdaughter2ratio.total = sum(popdata.branchorderbins(i).parentdaughter2ratio.values);
            popdata.branchorderbins(i).parentdaughter2ratio.skew  = skewness(popdata.branchorderbins(i).parentdaughter2ratio.values,0);
            popdata.branchorderbins(i).parentdaughter2ratio.kurt  = kurtosis(popdata.branchorderbins(i).parentdaughter2ratio.values,0);
            
        end
        
        for i = 1:typeanalysis.maxbranchorder.max
            typeanalysis.branchorder.branchorder(i)                 = i;
            typeanalysis.branchorder.numberbifurcations(i).values   = [];
            typeanalysis.branchorder.numberterminations(i).values   = [];
            typeanalysis.branchorder.numbersegments(i).values       = [];
            typeanalysis.branchorder.length(i).values               = [];
            typeanalysis.branchorder.totallength(i).values          = [];
            typeanalysis.branchorder.surfacearea(i).values          = [];
            typeanalysis.branchorder.totalsurfacearea(i).values     = [];
            typeanalysis.branchorder.volume(i).values               = [];
            typeanalysis.branchorder.totalvolume(i).values          = [];
            typeanalysis.branchorder.taperrate(i).values            = [];
            typeanalysis.branchorder.taperratio(i).values           = [];
            typeanalysis.branchorder.proximaldiameter(i).values     = [];
            typeanalysis.branchorder.cylindricaldiameter(i).values  = [];
            typeanalysis.branchorder.distaldiameter(i).values       = [];
            typeanalysis.branchorder.rallratio(i).values            = [];
            typeanalysis.branchorder.rallratio1(i).values           = [];
            typeanalysis.branchorder.rallratio2(i).values           = [];
            typeanalysis.branchorder.rallratio3(i).values           = [];
            typeanalysis.branchorder.daughterratio(i).values        = [];
            typeanalysis.branchorder.parentdaughterratio(i).values  = [];
            typeanalysis.branchorder.parentdaughter2ratio(i).values = [];
        end
        
        
        for i = 1:length(data.individual)
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            for j = 1:inddata.maxbranchorder
                typeanalysis.branchorder.numberbifurcations(j).values = [[typeanalysis.branchorder.numberbifurcations(j).values] [inddata.branchorderbins(j).numberbifurcations]];
                typeanalysis.branchorder.numberterminations(j).values = [[typeanalysis.branchorder.numberterminations(j).values] [inddata.branchorderbins(j).numberterminations]];
                typeanalysis.branchorder.numbersegments(j).values     = [[typeanalysis.branchorder.numbersegments(j).values] [inddata.branchorderbins(j).numbersegments]];
                typeanalysis.branchorder.totallength(j).values        = [[typeanalysis.branchorder.totallength(j).values] [inddata.branchorderbins(j).length.total]];
                typeanalysis.branchorder.totalsurfacearea(j).values   = [[typeanalysis.branchorder.totalsurfacearea(j).values] [inddata.branchorderbins(j).surfacearea.total]];
                typeanalysis.branchorder.totalvolume(j).values        = [[typeanalysis.branchorder.totalvolume(j).values] [inddata.branchorderbins(j).volume.total]];
            end
        end
        
        for i = 1:typeanalysis.maxbranchorder.max
            typeanalysis.branchorder.length(i).values                  = [popdata.branchorderbins(i).cable.length];
            typeanalysis.branchorder.surfacearea(i).values             = [popdata.branchorderbins(i).cable.surfacearea];
            typeanalysis.branchorder.volume(i).values                  = [popdata.branchorderbins(i).cable.volume];
            typeanalysis.branchorder.taperrate(i).values               = [popdata.branchorderbins(i).cable.taperrate];
            typeanalysis.branchorder.taperratio(i).values              = [popdata.branchorderbins(i).cable.taperratio];
            typeanalysis.branchorder.proximaldiameter(i).values        = [popdata.branchorderbins(i).cable.proximaldiameter];
            typeanalysis.branchorder.cylindricaldiameter(i).values     = [popdata.branchorderbins(i).cable.cylindricaldiameter];
            typeanalysis.branchorder.distaldiameter(i).values          = [popdata.branchorderbins(i).cable.distaldiameter];
            if i < typeanalysis.maxbranchorder.max
                typeanalysis.branchorder.rallratio(i).values            = [popdata.branchorderbins(i).cable.rallratio];
                typeanalysis.branchorder.rallratio1(i).values           = [popdata.branchorderbins(i).cable.rallratio1];
                typeanalysis.branchorder.rallratio2(i).values           = [popdata.branchorderbins(i).cable.rallratio2];
                typeanalysis.branchorder.rallratio3(i).values           = [popdata.branchorderbins(i).cable.rallratio3];
                typeanalysis.branchorder.daughterratio(i).values        = [popdata.branchorderbins(i).cable.daughterratio];
                typeanalysis.branchorder.parentdaughterratio(i).values  = [popdata.branchorderbins(i).cable.parentdaughterratio];
                typeanalysis.branchorder.parentdaughter2ratio(i).values = [popdata.branchorderbins(i).cable.parentdaughter2ratio];
            end
        end
        
        for i = 1:typeanalysis.maxbranchorder.max
            typeanalysis.branchorder.numberbifurcations(i).mean  = mean(typeanalysis.branchorder.numberbifurcations(i).values);
            typeanalysis.branchorder.numberbifurcations(i).std   = std(typeanalysis.branchorder.numberbifurcations(i).values);
            typeanalysis.branchorder.numberbifurcations(i).skew  = skewness(typeanalysis.branchorder.numberbifurcations(i).values,0);
            typeanalysis.branchorder.numberbifurcations(i).kurt  = kurtosis(typeanalysis.branchorder.numberbifurcations(i).values,0);
            typeanalysis.branchorder.numberbifurcations(i).min   = min(typeanalysis.branchorder.numberbifurcations(i).values);
            typeanalysis.branchorder.numberbifurcations(i).max   = max(typeanalysis.branchorder.numberbifurcations(i).values);
            typeanalysis.branchorder.numberbifurcations(i).total = sum(typeanalysis.branchorder.numberbifurcations(i).values);
            
            typeanalysis.branchorder.numberterminations(i).mean  = mean(typeanalysis.branchorder.numberterminations(i).values);
            typeanalysis.branchorder.numberterminations(i).std   = std(typeanalysis.branchorder.numberterminations(i).values);
            typeanalysis.branchorder.numberterminations(i).skew  = skewness(typeanalysis.branchorder.numberterminations(i).values,0);
            typeanalysis.branchorder.numberterminations(i).kurt  = kurtosis(typeanalysis.branchorder.numberterminations(i).values,0);
            typeanalysis.branchorder.numberterminations(i).min   = min(typeanalysis.branchorder.numberterminations(i).values);
            typeanalysis.branchorder.numberterminations(i).max   = max(typeanalysis.branchorder.numberterminations(i).values);
            typeanalysis.branchorder.numberterminations(i).total = sum(typeanalysis.branchorder.numberterminations(i).values);
            
            typeanalysis.branchorder.numbersegments(i).mean  = mean(typeanalysis.branchorder.numbersegments(i).values);
            typeanalysis.branchorder.numbersegments(i).std   = std(typeanalysis.branchorder.numbersegments(i).values);
            typeanalysis.branchorder.numbersegments(i).skew  = skewness(typeanalysis.branchorder.numbersegments(i).values,0);
            typeanalysis.branchorder.numbersegments(i).kurt  = kurtosis(typeanalysis.branchorder.numbersegments(i).values,0);
            typeanalysis.branchorder.numbersegments(i).min   = min(typeanalysis.branchorder.numbersegments(i).values);
            typeanalysis.branchorder.numbersegments(i).max   = max(typeanalysis.branchorder.numbersegments(i).values);
            typeanalysis.branchorder.numbersegments(i).total = sum(typeanalysis.branchorder.numbersegments(i).values);
            
            typeanalysis.branchorder.totallength(i).mean = mean(typeanalysis.branchorder.totallength(i).values);
            typeanalysis.branchorder.totallength(i).std  = std(typeanalysis.branchorder.totallength(i).values);
            typeanalysis.branchorder.totallength(i).skew = skewness(typeanalysis.branchorder.totallength(i).values,0);
            typeanalysis.branchorder.totallength(i).kurt = kurtosis(typeanalysis.branchorder.totallength(i).values,0);
            typeanalysis.branchorder.totallength(i).min  = min(typeanalysis.branchorder.totallength(i).values);
            typeanalysis.branchorder.totallength(i).max  = max(typeanalysis.branchorder.totallength(i).values);
            
            typeanalysis.branchorder.length(i).mean  = mean(typeanalysis.branchorder.length(i).values);
            typeanalysis.branchorder.length(i).std   = std(typeanalysis.branchorder.length(i).values);
            typeanalysis.branchorder.length(i).skew  = skewness(typeanalysis.branchorder.length(i).values,0);
            typeanalysis.branchorder.length(i).kurt  = kurtosis(typeanalysis.branchorder.length(i).values,0);
            typeanalysis.branchorder.length(i).min   = min(typeanalysis.branchorder.length(i).values);
            typeanalysis.branchorder.length(i).max   = max(typeanalysis.branchorder.length(i).values);
            typeanalysis.branchorder.length(i).total = sum(typeanalysis.branchorder.length(i).values);
            
            typeanalysis.branchorder.totalsurfacearea(i).mean = mean(typeanalysis.branchorder.totalsurfacearea(i).values);
            typeanalysis.branchorder.totalsurfacearea(i).std  = std(typeanalysis.branchorder.totalsurfacearea(i).values);
            typeanalysis.branchorder.totalsurfacearea(i).skew = skewness(typeanalysis.branchorder.totalsurfacearea(i).values,0);
            typeanalysis.branchorder.totalsurfacearea(i).kurt = kurtosis(typeanalysis.branchorder.totalsurfacearea(i).values,0);
            typeanalysis.branchorder.totalsurfacearea(i).min  = min(typeanalysis.branchorder.totalsurfacearea(i).values);
            typeanalysis.branchorder.totalsurfacearea(i).max  = max(typeanalysis.branchorder.totalsurfacearea(i).values);
            
            typeanalysis.branchorder.surfacearea(i).mean  = mean(typeanalysis.branchorder.surfacearea(i).values);
            typeanalysis.branchorder.surfacearea(i).std   = std(typeanalysis.branchorder.surfacearea(i).values);
            typeanalysis.branchorder.surfacearea(i).skew  = skewness(typeanalysis.branchorder.surfacearea(i).values,0);
            typeanalysis.branchorder.surfacearea(i).kurt  = kurtosis(typeanalysis.branchorder.surfacearea(i).values,0);
            typeanalysis.branchorder.surfacearea(i).min   = min(typeanalysis.branchorder.surfacearea(i).values);
            typeanalysis.branchorder.surfacearea(i).max   = max(typeanalysis.branchorder.surfacearea(i).values);
            typeanalysis.branchorder.surfacearea(i).total = sum(typeanalysis.branchorder.surfacearea(i).values);
            
            typeanalysis.branchorder.totalvolume(i).mean = mean(typeanalysis.branchorder.totalvolume(i).values);
            typeanalysis.branchorder.totalvolume(i).std  = std(typeanalysis.branchorder.totalvolume(i).values);
            typeanalysis.branchorder.totalvolume(i).skew = skewness(typeanalysis.branchorder.totalvolume(i).values,0);
            typeanalysis.branchorder.totalvolume(i).kurt = kurtosis(typeanalysis.branchorder.totalvolume(i).values,0);
            typeanalysis.branchorder.totalvolume(i).min  = min(typeanalysis.branchorder.totalvolume(i).values);
            typeanalysis.branchorder.totalvolume(i).max  = max(typeanalysis.branchorder.totalvolume(i).values);
            
            typeanalysis.branchorder.volume(i).mean  = mean(typeanalysis.branchorder.volume(i).values);
            typeanalysis.branchorder.volume(i).std   = std(typeanalysis.branchorder.volume(i).values);
            typeanalysis.branchorder.volume(i).skew  = skewness(typeanalysis.branchorder.volume(i).values,0);
            typeanalysis.branchorder.volume(i).kurt  = kurtosis(typeanalysis.branchorder.volume(i).values,0);
            typeanalysis.branchorder.volume(i).min   = min(typeanalysis.branchorder.volume(i).values);
            typeanalysis.branchorder.volume(i).max   = max(typeanalysis.branchorder.volume(i).values);
            typeanalysis.branchorder.volume(i).total = sum(typeanalysis.branchorder.volume(i).values);
            
            %typeanalysis.branchorder.taperrate(i).mean = mean(typeanalysis.branchorder.taperrate(i).values);
            typeanalysis.branchorder.taperrate(i).mean = sum(([typeanalysis.branchorder.taperrate(i).values].*[typeanalysis.branchorder.length(i).values])/sum([typeanalysis.branchorder.length(i).values]));
            typeanalysis.branchorder.taperrate(i).std  = std(typeanalysis.branchorder.taperrate(i).values);
            typeanalysis.branchorder.taperrate(i).skew = skewness(typeanalysis.branchorder.taperrate(i).values,0);
            typeanalysis.branchorder.taperrate(i).kurt = kurtosis(typeanalysis.branchorder.taperrate(i).values,0);
            typeanalysis.branchorder.taperrate(i).min  = min(typeanalysis.branchorder.taperrate(i).values);
            typeanalysis.branchorder.taperrate(i).max  = max(typeanalysis.branchorder.taperrate(i).values);
            
            typeanalysis.branchorder.taperratio(i).mean = mean(typeanalysis.branchorder.taperratio(i).values);
            typeanalysis.branchorder.taperratio(i).std  = std(typeanalysis.branchorder.taperratio(i).values);
            typeanalysis.branchorder.taperratio(i).skew = skewness(typeanalysis.branchorder.taperratio(i).values,0);
            typeanalysis.branchorder.taperratio(i).kurt = kurtosis(typeanalysis.branchorder.taperratio(i).values,0);
            typeanalysis.branchorder.taperratio(i).min  = min(typeanalysis.branchorder.taperratio(i).values);
            typeanalysis.branchorder.taperratio(i).max  = max(typeanalysis.branchorder.taperratio(i).values);
            
            typeanalysis.branchorder.proximaldiameter(i).mean = mean(typeanalysis.branchorder.proximaldiameter(i).values);
            typeanalysis.branchorder.proximaldiameter(i).std  = std(typeanalysis.branchorder.proximaldiameter(i).values);
            typeanalysis.branchorder.proximaldiameter(i).skew = skewness(typeanalysis.branchorder.proximaldiameter(i).values,0);
            typeanalysis.branchorder.proximaldiameter(i).kurt = kurtosis(typeanalysis.branchorder.proximaldiameter(i).values,0);
            typeanalysis.branchorder.proximaldiameter(i).min  = min(typeanalysis.branchorder.proximaldiameter(i).values);
            typeanalysis.branchorder.proximaldiameter(i).max  = max(typeanalysis.branchorder.proximaldiameter(i).values);
            
            typeanalysis.branchorder.cylindricaldiameter(i).mean = mean(typeanalysis.branchorder.cylindricaldiameter(i).values);
            typeanalysis.branchorder.cylindricaldiameter(i).std  = std(typeanalysis.branchorder.cylindricaldiameter(i).values);
            typeanalysis.branchorder.cylindricaldiameter(i).skew = skewness(typeanalysis.branchorder.cylindricaldiameter(i).values,0);
            typeanalysis.branchorder.cylindricaldiameter(i).kurt = kurtosis(typeanalysis.branchorder.cylindricaldiameter(i).values,0);
            typeanalysis.branchorder.cylindricaldiameter(i).min  = min(typeanalysis.branchorder.cylindricaldiameter(i).values);
            typeanalysis.branchorder.cylindricaldiameter(i).max  = max(typeanalysis.branchorder.cylindricaldiameter(i).values);
            
            typeanalysis.branchorder.distaldiameter(i).mean = mean(typeanalysis.branchorder.distaldiameter(i).values);
            typeanalysis.branchorder.distaldiameter(i).std  = std(typeanalysis.branchorder.distaldiameter(i).values);
            typeanalysis.branchorder.distaldiameter(i).skew = skewness(typeanalysis.branchorder.distaldiameter(i).values,0);
            typeanalysis.branchorder.distaldiameter(i).kurt = kurtosis(typeanalysis.branchorder.distaldiameter(i).values,0);
            typeanalysis.branchorder.distaldiameter(i).min  = min(typeanalysis.branchorder.distaldiameter(i).values);
            typeanalysis.branchorder.distaldiameter(i).max  = max(typeanalysis.branchorder.distaldiameter(i).values);
            
            %if i < typeanalysis.maxbranchorder.max
            typeanalysis.branchorder.rallratio(i).mean = mean(typeanalysis.branchorder.rallratio(i).values    );
            typeanalysis.branchorder.rallratio(i).std  = std(typeanalysis.branchorder.rallratio(i).values     );
            typeanalysis.branchorder.rallratio(i).skew = skewness(typeanalysis.branchorder.rallratio(i).values,0);
            typeanalysis.branchorder.rallratio(i).kurt = kurtosis(typeanalysis.branchorder.rallratio(i).values,0);
            typeanalysis.branchorder.rallratio(i).min  = min(typeanalysis.branchorder.rallratio(i).values);
            typeanalysis.branchorder.rallratio(i).max  = max(typeanalysis.branchorder.rallratio(i).values);
            
            typeanalysis.branchorder.rallratio1(i).mean = mean(typeanalysis.branchorder.rallratio1(i).values    );
            typeanalysis.branchorder.rallratio1(i).std  = std(typeanalysis.branchorder.rallratio1(i).values     );
            typeanalysis.branchorder.rallratio1(i).skew = skewness(typeanalysis.branchorder.rallratio1(i).values,0);
            typeanalysis.branchorder.rallratio1(i).kurt = kurtosis(typeanalysis.branchorder.rallratio1(i).values,0);
            typeanalysis.branchorder.rallratio1(i).min  = min(typeanalysis.branchorder.rallratio1(i).values);
            typeanalysis.branchorder.rallratio1(i).max  = max(typeanalysis.branchorder.rallratio1(i).values);
            
            typeanalysis.branchorder.rallratio2(i).mean = mean(typeanalysis.branchorder.rallratio2(i).values    );
            typeanalysis.branchorder.rallratio2(i).std  = std(typeanalysis.branchorder.rallratio2(i).values     );
            typeanalysis.branchorder.rallratio2(i).skew = skewness(typeanalysis.branchorder.rallratio2(i).values,0);
            typeanalysis.branchorder.rallratio2(i).kurt = kurtosis(typeanalysis.branchorder.rallratio2(i).values,0);
            typeanalysis.branchorder.rallratio2(i).min  = min(typeanalysis.branchorder.rallratio2(i).values);
            typeanalysis.branchorder.rallratio2(i).max  = max(typeanalysis.branchorder.rallratio2(i).values);
            
            typeanalysis.branchorder.rallratio3(i).mean = mean(typeanalysis.branchorder.rallratio3(i).values    );
            typeanalysis.branchorder.rallratio3(i).std  = std(typeanalysis.branchorder.rallratio3(i).values     );
            typeanalysis.branchorder.rallratio3(i).skew = skewness(typeanalysis.branchorder.rallratio3(i).values,0);
            typeanalysis.branchorder.rallratio3(i).kurt = kurtosis(typeanalysis.branchorder.rallratio3(i).values,0);
            typeanalysis.branchorder.rallratio3(i).min  = min(typeanalysis.branchorder.rallratio3(i).values);
            typeanalysis.branchorder.rallratio3(i).max  = max(typeanalysis.branchorder.rallratio3(i).values);
            
            typeanalysis.branchorder.daughterratio(i).mean = mean(typeanalysis.branchorder.daughterratio(i).values     );
            typeanalysis.branchorder.daughterratio(i).std  = std(typeanalysis.branchorder.daughterratio(i).values      );
            typeanalysis.branchorder.daughterratio(i).skew = skewness(typeanalysis.branchorder.daughterratio(i).values,0);
            typeanalysis.branchorder.daughterratio(i).kurt = kurtosis(typeanalysis.branchorder.daughterratio(i).values,0);
            typeanalysis.branchorder.daughterratio(i).min  = min(typeanalysis.branchorder.daughterratio(i).values);
            typeanalysis.branchorder.daughterratio(i).max  = max(typeanalysis.branchorder.daughterratio(i).values);
            
            typeanalysis.branchorder.parentdaughterratio(i).mean = mean(typeanalysis.branchorder.parentdaughterratio(i).values     );
            typeanalysis.branchorder.parentdaughterratio(i).std  = std(typeanalysis.branchorder.parentdaughterratio(i).values      );
            typeanalysis.branchorder.parentdaughterratio(i).skew = skewness(typeanalysis.branchorder.parentdaughterratio(i).values,0);
            typeanalysis.branchorder.parentdaughterratio(i).kurt = kurtosis(typeanalysis.branchorder.parentdaughterratio(i).values,0);
            typeanalysis.branchorder.parentdaughterratio(i).min  = min(typeanalysis.branchorder.parentdaughterratio(i).values);
            typeanalysis.branchorder.parentdaughterratio(i).max  = max(typeanalysis.branchorder.parentdaughterratio(i).values);
            
            typeanalysis.branchorder.parentdaughter2ratio(i).mean = mean(typeanalysis.branchorder.parentdaughter2ratio(i).values     );
            typeanalysis.branchorder.parentdaughter2ratio(i).std  = std(typeanalysis.branchorder.parentdaughter2ratio(i).values      );
            typeanalysis.branchorder.parentdaughter2ratio(i).skew = skewness(typeanalysis.branchorder.parentdaughter2ratio(i).values,0);
            typeanalysis.branchorder.parentdaughter2ratio(i).kurt = kurtosis(typeanalysis.branchorder.parentdaughter2ratio(i).values,0);
            typeanalysis.branchorder.parentdaughter2ratio(i).min  = min(typeanalysis.branchorder.parentdaughter2ratio(i).values);
            typeanalysis.branchorder.parentdaughter2ratio(i).max  = max(typeanalysis.branchorder.parentdaughter2ratio(i).values);
            %end
            
            typeanalysis.branchorder.bifurcationprobability.length(i) = typeanalysis.branchorder.numberbifurcations(i).total / typeanalysis.branchorder.length(i).total;
            typeanalysis.branchorder.terminationprobability.length(i) = typeanalysis.branchorder.numberterminations(i).total / typeanalysis.branchorder.length(i).total;
            
            typeanalysis.branchorder.bifurcationprobability.surfacearea(i) = typeanalysis.branchorder.numberbifurcations(i).total / typeanalysis.branchorder.surfacearea(i).total;
            typeanalysis.branchorder.terminationprobability.surfacearea(i) = typeanalysis.branchorder.numberterminations(i).total / typeanalysis.branchorder.surfacearea(i).total;
            
            typeanalysis.branchorder.bifurcationprobability.volume(i) = typeanalysis.branchorder.numberbifurcations(i).total / typeanalysis.branchorder.volume(i).total;
            typeanalysis.branchorder.terminationprobability.volume(i) = typeanalysis.branchorder.numberterminations(i).total / typeanalysis.branchorder.volume(i).total;
        end
        
        
        
        
        
        
        
        
        % Begin bifurcation branch order analysis
        
        for i = 1:length(data.individual)
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            for j = 1:typeanalysis.maxbranchorder.max
                inddata.bifurcation.branchorderbins(j).numbersegments              = [];
                inddata.bifurcation.branchorderbins(j).length.values               = [];
                inddata.bifurcation.branchorderbins(j).surfacearea.values          = [];
                inddata.bifurcation.branchorderbins(j).volume.values               = [];
                inddata.bifurcation.branchorderbins(j).taperrate.values            = [];
                inddata.bifurcation.branchorderbins(j).taperratio.values           = [];
                inddata.bifurcation.branchorderbins(j).proximaldiameter.values     = [];
                inddata.bifurcation.branchorderbins(j).cylindricaldiameter.values  = [];
                inddata.bifurcation.branchorderbins(j).distaldiameter.values       = [];
                inddata.bifurcation.branchorderbins(j).rallratio.values            = [];
                inddata.bifurcation.branchorderbins(j).rallratio1.values           = [];
                inddata.bifurcation.branchorderbins(j).rallratio2.values           = [];
                inddata.bifurcation.branchorderbins(j).rallratio3.values           = [];
                inddata.bifurcation.branchorderbins(j).daughterratio.values        = [];
                inddata.bifurcation.branchorderbins(j).parentdaughterratio.values  = [];
                inddata.bifurcation.branchorderbins(j).parentdaughter2ratio.values = [];
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        for i = 1:length(data.individual)
            
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            
            for j = 1:inddata.maxbranchorder
                
                if isfield(inddata.bifurcation.branchorderbins(j),'cable')
                    
                    if isfield(inddata.bifurcation.branchorderbins(j).cable,'id')==1
                        
                        inddata.bifurcation.branchorderbins(j).numbersegments     = 0;
                        
                        inddata.bifurcation.branchorderbins(j).length.values               = [inddata.bifurcation.branchorderbins(j).cable.length];
                        inddata.bifurcation.branchorderbins(j).surfacearea.values          = [inddata.bifurcation.branchorderbins(j).cable.surfacearea];
                        inddata.bifurcation.branchorderbins(j).volume.values               = [inddata.bifurcation.branchorderbins(j).cable.volume];
                        inddata.bifurcation.branchorderbins(j).taperrate.values            = [inddata.bifurcation.branchorderbins(j).cable.taperrate];
                        inddata.bifurcation.branchorderbins(j).taperratio.values           = [inddata.bifurcation.branchorderbins(j).cable.taperratio];
                        inddata.bifurcation.branchorderbins(j).proximaldiameter.values     = [inddata.bifurcation.branchorderbins(j).cable.proximaldiameter];
                        inddata.bifurcation.branchorderbins(j).cylindricaldiameter.values  = [inddata.bifurcation.branchorderbins(j).cable.cylindricaldiameter];
                        inddata.bifurcation.branchorderbins(j).distaldiameter.values       = [inddata.bifurcation.branchorderbins(j).cable.distaldiameter];
                        inddata.bifurcation.branchorderbins(j).rallratio.values            = [inddata.bifurcation.branchorderbins(j).cable.rallratio];
                        inddata.bifurcation.branchorderbins(j).rallratio1.values           = [inddata.bifurcation.branchorderbins(j).cable.rallratio1];
                        inddata.bifurcation.branchorderbins(j).rallratio2.values           = [inddata.bifurcation.branchorderbins(j).cable.rallratio2];
                        inddata.bifurcation.branchorderbins(j).rallratio3.values           = [inddata.bifurcation.branchorderbins(j).cable.rallratio3];
                        inddata.bifurcation.branchorderbins(j).daughterratio.values        = [inddata.bifurcation.branchorderbins(j).cable.daughterratio];
                        inddata.bifurcation.branchorderbins(j).parentdaughterratio.values  = [inddata.bifurcation.branchorderbins(j).cable.parentdaughterratio];
                        inddata.bifurcation.branchorderbins(j).parentdaughter2ratio.values = [inddata.bifurcation.branchorderbins(j).cable.parentdaughter2ratio];
                        
                        
                        for k = 1:length(inddata.bifurcation.branchorderbins(j).cable)
                            inddata.bifurcation.branchorderbins(j).numbersegments = 1 + inddata.bifurcation.branchorderbins(j).numbersegments;
                        end
                    end
                end
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        for i = 1:length(data.individual)
            for m = 1:typeanalysis.maxbranchorder.max
                popdata.bifurcation.branchorderbins(m).numbersegments(i).values     = [];
                popdata.bifurcation.branchorderbins(m).length.values                = [];
                popdata.bifurcation.branchorderbins(m).surfacearea.values           = [];
                popdata.bifurcation.branchorderbins(m).volume.values                = [];
                popdata.bifurcation.branchorderbins(m).taperrate.values             = [];
                popdata.bifurcation.branchorderbins(m).taperratio.values            = [];
                popdata.bifurcation.branchorderbins(m).proximaldiameter.values      = [];
                popdata.bifurcation.branchorderbins(m).cylindricaldiameter.values   = [];
                popdata.bifurcation.branchorderbins(m).distaldiameter.values        = [];
                popdata.bifurcation.branchorderbins(m).rallratio.values             = [];
                popdata.bifurcation.branchorderbins(m).rallratio1.values            = [];
                popdata.bifurcation.branchorderbins(m).rallratio2.values            = [];
                popdata.bifurcation.branchorderbins(m).rallratio3.values            = [];
                popdata.bifurcation.branchorderbins(m).daughterratio.values         = [];
                popdata.bifurcation.branchorderbins(m).parentdaughterratio.values   = [];
                popdata.bifurcation.branchorderbins(m).parentdaughter2ratio.values  = [];
            end
        end
        
        for i = 1:length(data.individual)
            
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            
            for j = 1:inddata.maxbranchorder
                
                popdata.bifurcation.branchorderbins(j).numbersegments(i).values = [popdata.bifurcation.branchorderbins(j).numbersegments(i).values inddata.branchorderbins(j).numbersegments];
                
                inddata.bifurcation.branchorderbins(j).proximaldiameter.max   = max(inddata.bifurcation.branchorderbins(j).proximaldiameter.values);
                inddata.bifurcation.branchorderbins(j).proximaldiameter.mean  = mean(inddata.bifurcation.branchorderbins(j).proximaldiameter.values);
                inddata.bifurcation.branchorderbins(j).proximaldiameter.min   = min(inddata.bifurcation.branchorderbins(j).proximaldiameter.values);
                inddata.bifurcation.branchorderbins(j).proximaldiameter.std   = std(inddata.bifurcation.branchorderbins(j).proximaldiameter.values);
                inddata.bifurcation.branchorderbins(j).proximaldiameter.total = sum(inddata.bifurcation.branchorderbins(j).proximaldiameter.values);
                inddata.bifurcation.branchorderbins(j).proximaldiameter.skew  = skewness(inddata.bifurcation.branchorderbins(j).proximaldiameter.values,0);
                inddata.bifurcation.branchorderbins(j).proximaldiameter.kurt  = kurtosis(inddata.bifurcation.branchorderbins(j).proximaldiameter.values,0);
                
                inddata.bifurcation.branchorderbins(j).cylindricaldiameter.max   = max(inddata.bifurcation.branchorderbins(j).cylindricaldiameter.values);
                inddata.bifurcation.branchorderbins(j).cylindricaldiameter.mean  = mean(inddata.bifurcation.branchorderbins(j).cylindricaldiameter.values);
                inddata.bifurcation.branchorderbins(j).cylindricaldiameter.min   = min(inddata.bifurcation.branchorderbins(j).cylindricaldiameter.values);
                inddata.bifurcation.branchorderbins(j).cylindricaldiameter.std   = std(inddata.bifurcation.branchorderbins(j).cylindricaldiameter.values);
                inddata.bifurcation.branchorderbins(j).cylindricaldiameter.total = sum(inddata.bifurcation.branchorderbins(j).cylindricaldiameter.values);
                inddata.bifurcation.branchorderbins(j).cylindricaldiameter.skew  = skewness(inddata.bifurcation.branchorderbins(j).cylindricaldiameter.values,0);
                inddata.bifurcation.branchorderbins(j).cylindricaldiameter.kurt  = kurtosis(inddata.bifurcation.branchorderbins(j).cylindricaldiameter.values,0);
                
                inddata.bifurcation.branchorderbins(j).distaldiameter.max   = max(inddata.bifurcation.branchorderbins(j).distaldiameter.values);
                inddata.bifurcation.branchorderbins(j).distaldiameter.mean  = mean(inddata.bifurcation.branchorderbins(j).distaldiameter.values);
                inddata.bifurcation.branchorderbins(j).distaldiameter.min   = min(inddata.bifurcation.branchorderbins(j).distaldiameter.values);
                inddata.bifurcation.branchorderbins(j).distaldiameter.std   = std(inddata.bifurcation.branchorderbins(j).distaldiameter.values);
                inddata.bifurcation.branchorderbins(j).distaldiameter.total = sum(inddata.bifurcation.branchorderbins(j).distaldiameter.values);
                inddata.bifurcation.branchorderbins(j).distaldiameter.skew  = skewness(inddata.bifurcation.branchorderbins(j).distaldiameter.values,0);
                inddata.bifurcation.branchorderbins(j).distaldiameter.kurt  = kurtosis(inddata.bifurcation.branchorderbins(j).distaldiameter.values,0);
                
                inddata.bifurcation.branchorderbins(j).length.max   = max(inddata.bifurcation.branchorderbins(j).length.values);
                inddata.bifurcation.branchorderbins(j).length.mean  = mean(inddata.bifurcation.branchorderbins(j).length.values);
                inddata.bifurcation.branchorderbins(j).length.min   = min(inddata.bifurcation.branchorderbins(j).length.values);
                inddata.bifurcation.branchorderbins(j).length.std   = std(inddata.bifurcation.branchorderbins(j).length.values);
                inddata.bifurcation.branchorderbins(j).length.total = sum(inddata.bifurcation.branchorderbins(j).length.values);
                inddata.bifurcation.branchorderbins(j).length.skew  = skewness(inddata.bifurcation.branchorderbins(j).length.values,0);
                inddata.bifurcation.branchorderbins(j).length.kurt  = kurtosis(inddata.bifurcation.branchorderbins(j).length.values,0);
                
                inddata.bifurcation.branchorderbins(j).surfacearea.max   = max(inddata.bifurcation.branchorderbins(j).surfacearea.values);
                inddata.bifurcation.branchorderbins(j).surfacearea.mean  = mean(inddata.bifurcation.branchorderbins(j).surfacearea.values);
                inddata.bifurcation.branchorderbins(j).surfacearea.min   = min(inddata.bifurcation.branchorderbins(j).surfacearea.values);
                inddata.bifurcation.branchorderbins(j).surfacearea.std   = std(inddata.bifurcation.branchorderbins(j).surfacearea.values);
                inddata.bifurcation.branchorderbins(j).surfacearea.total = sum(inddata.bifurcation.branchorderbins(j).surfacearea.values);
                inddata.bifurcation.branchorderbins(j).surfacearea.skew  = skewness(inddata.bifurcation.branchorderbins(j).surfacearea.values,0);
                inddata.bifurcation.branchorderbins(j).surfacearea.kurt  = kurtosis(inddata.bifurcation.branchorderbins(j).surfacearea.values,0);
                
                inddata.bifurcation.branchorderbins(j).volume.max   = max(inddata.bifurcation.branchorderbins(j).volume.values);
                inddata.bifurcation.branchorderbins(j).volume.mean  = mean(inddata.bifurcation.branchorderbins(j).volume.values);
                inddata.bifurcation.branchorderbins(j).volume.min   = min(inddata.bifurcation.branchorderbins(j).volume.values);
                inddata.bifurcation.branchorderbins(j).volume.std   = std(inddata.bifurcation.branchorderbins(j).volume.values);
                inddata.bifurcation.branchorderbins(j).volume.total = sum(inddata.bifurcation.branchorderbins(j).volume.values);
                inddata.bifurcation.branchorderbins(j).volume.skew  = skewness(inddata.bifurcation.branchorderbins(j).volume.values,0);
                inddata.bifurcation.branchorderbins(j).volume.kurt  = kurtosis(inddata.bifurcation.branchorderbins(j).volume.values,0);
                
                inddata.bifurcation.branchorderbins(j).taperrate.max   = max(inddata.bifurcation.branchorderbins(j).taperrate.values);
                %inddata.bifurcation.branchorderbins(j).taperrate.mean  = mean(inddata.bifurcation.branchorderbins(j).taperrate.values);
                inddata.bifurcation.branchorderbins(j).taperrate.mean  = sum(([inddata.bifurcation.branchorderbins(j).taperrate.values].*[inddata.bifurcation.branchorderbins(j).length.values])/sum([inddata.bifurcation.branchorderbins(j).length.values]));
                inddata.bifurcation.branchorderbins(j).taperrate.min   = min(inddata.bifurcation.branchorderbins(j).taperrate.values);
                inddata.bifurcation.branchorderbins(j).taperrate.std   = std(inddata.bifurcation.branchorderbins(j).taperrate.values);
                inddata.bifurcation.branchorderbins(j).taperrate.total = sum(inddata.bifurcation.branchorderbins(j).taperrate.values);
                inddata.bifurcation.branchorderbins(j).taperrate.skew  = skewness(inddata.bifurcation.branchorderbins(j).taperrate.values,0);
                inddata.bifurcation.branchorderbins(j).taperrate.kurt  = kurtosis(inddata.bifurcation.branchorderbins(j).taperrate.values,0);
                
                inddata.bifurcation.branchorderbins(j).taperratio.max   = max(inddata.bifurcation.branchorderbins(j).taperratio.values);
                inddata.bifurcation.branchorderbins(j).taperratio.mean  = mean(inddata.bifurcation.branchorderbins(j).taperratio.values);
                inddata.bifurcation.branchorderbins(j).taperratio.min   = min(inddata.bifurcation.branchorderbins(j).taperratio.values);
                inddata.bifurcation.branchorderbins(j).taperratio.std   = std(inddata.bifurcation.branchorderbins(j).taperratio.values);
                inddata.bifurcation.branchorderbins(j).taperratio.total = sum(inddata.bifurcation.branchorderbins(j).taperratio.values);
                inddata.bifurcation.branchorderbins(j).taperratio.skew  = skewness(inddata.bifurcation.branchorderbins(j).taperratio.values,0);
                inddata.bifurcation.branchorderbins(j).taperratio.kurt  = kurtosis(inddata.bifurcation.branchorderbins(j).taperratio.values,0);
                
                if j < inddata.maxbranchorder
                    inddata.bifurcation.branchorderbins(j).rallratio.max   = max(inddata.bifurcation.branchorderbins(j).rallratio.values);
                    inddata.bifurcation.branchorderbins(j).rallratio.mean  = mean(inddata.bifurcation.branchorderbins(j).rallratio.values);
                    inddata.bifurcation.branchorderbins(j).rallratio.min   = min(inddata.bifurcation.branchorderbins(j).rallratio.values);
                    inddata.bifurcation.branchorderbins(j).rallratio.std   = std(inddata.bifurcation.branchorderbins(j).rallratio.values);
                    inddata.bifurcation.branchorderbins(j).rallratio.total = sum(inddata.bifurcation.branchorderbins(j).rallratio.values);
                    inddata.bifurcation.branchorderbins(j).rallratio.skew  = skewness(inddata.bifurcation.branchorderbins(j).rallratio.values,0);
                    inddata.bifurcation.branchorderbins(j).rallratio.kurt  = kurtosis(inddata.bifurcation.branchorderbins(j).rallratio.values,0);
                    
                    inddata.bifurcation.branchorderbins(j).rallratio1.max   = max(inddata.bifurcation.branchorderbins(j).rallratio1.values);
                    inddata.bifurcation.branchorderbins(j).rallratio1.mean  = mean(inddata.bifurcation.branchorderbins(j).rallratio1.values);
                    inddata.bifurcation.branchorderbins(j).rallratio1.min   = min(inddata.bifurcation.branchorderbins(j).rallratio1.values);
                    inddata.bifurcation.branchorderbins(j).rallratio1.std   = std(inddata.bifurcation.branchorderbins(j).rallratio1.values);
                    inddata.bifurcation.branchorderbins(j).rallratio1.total = sum(inddata.bifurcation.branchorderbins(j).rallratio1.values);
                    inddata.bifurcation.branchorderbins(j).rallratio1.skew  = skewness(inddata.bifurcation.branchorderbins(j).rallratio1.values,0);
                    inddata.bifurcation.branchorderbins(j).rallratio1.kurt  = kurtosis(inddata.bifurcation.branchorderbins(j).rallratio1.values,0);
                    
                    inddata.bifurcation.branchorderbins(j).rallratio2.max   = max(inddata.bifurcation.branchorderbins(j).rallratio2.values);
                    inddata.bifurcation.branchorderbins(j).rallratio2.mean  = mean(inddata.bifurcation.branchorderbins(j).rallratio2.values);
                    inddata.bifurcation.branchorderbins(j).rallratio2.min   = min(inddata.bifurcation.branchorderbins(j).rallratio2.values);
                    inddata.bifurcation.branchorderbins(j).rallratio2.std   = std(inddata.bifurcation.branchorderbins(j).rallratio2.values);
                    inddata.bifurcation.branchorderbins(j).rallratio2.total = sum(inddata.bifurcation.branchorderbins(j).rallratio2.values);
                    inddata.bifurcation.branchorderbins(j).rallratio2.skew  = skewness(inddata.bifurcation.branchorderbins(j).rallratio2.values,0);
                    inddata.bifurcation.branchorderbins(j).rallratio2.kurt  = kurtosis(inddata.bifurcation.branchorderbins(j).rallratio2.values,0);
                    
                    inddata.bifurcation.branchorderbins(j).rallratio3.max   = max(inddata.bifurcation.branchorderbins(j).rallratio3.values);
                    inddata.bifurcation.branchorderbins(j).rallratio3.mean  = mean(inddata.bifurcation.branchorderbins(j).rallratio3.values);
                    inddata.bifurcation.branchorderbins(j).rallratio3.min   = min(inddata.bifurcation.branchorderbins(j).rallratio3.values);
                    inddata.bifurcation.branchorderbins(j).rallratio3.std   = std(inddata.bifurcation.branchorderbins(j).rallratio3.values);
                    inddata.bifurcation.branchorderbins(j).rallratio3.total = sum(inddata.bifurcation.branchorderbins(j).rallratio3.values);
                    inddata.bifurcation.branchorderbins(j).rallratio3.skew  = skewness(inddata.bifurcation.branchorderbins(j).rallratio3.values,0);
                    inddata.bifurcation.branchorderbins(j).rallratio3.kurt  = kurtosis(inddata.bifurcation.branchorderbins(j).rallratio3.values,0);
                    
                    inddata.bifurcation.branchorderbins(j).daughterratio.max   = max(inddata.bifurcation.branchorderbins(j).daughterratio.values);
                    inddata.bifurcation.branchorderbins(j).daughterratio.mean  = mean(inddata.bifurcation.branchorderbins(j).daughterratio.values);
                    inddata.bifurcation.branchorderbins(j).daughterratio.min   = min(inddata.bifurcation.branchorderbins(j).daughterratio.values);
                    inddata.bifurcation.branchorderbins(j).daughterratio.std   = std(inddata.bifurcation.branchorderbins(j).daughterratio.values);
                    inddata.bifurcation.branchorderbins(j).daughterratio.total = sum(inddata.bifurcation.branchorderbins(j).daughterratio.values);
                    inddata.bifurcation.branchorderbins(j).daughterratio.skew  = skewness(inddata.bifurcation.branchorderbins(j).daughterratio.values,0);
                    inddata.bifurcation.branchorderbins(j).daughterratio.kurt  = kurtosis(inddata.bifurcation.branchorderbins(j).daughterratio.values,0);
                    
                    inddata.bifurcation.branchorderbins(j).parentdaughterratio.max   = max(inddata.bifurcation.branchorderbins(j).parentdaughterratio.values);
                    inddata.bifurcation.branchorderbins(j).parentdaughterratio.mean  = mean(inddata.bifurcation.branchorderbins(j).parentdaughterratio.values);
                    inddata.bifurcation.branchorderbins(j).parentdaughterratio.min   = min(inddata.bifurcation.branchorderbins(j).parentdaughterratio.values);
                    inddata.bifurcation.branchorderbins(j).parentdaughterratio.std   = std(inddata.bifurcation.branchorderbins(j).parentdaughterratio.values);
                    inddata.bifurcation.branchorderbins(j).parentdaughterratio.total = sum(inddata.bifurcation.branchorderbins(j).parentdaughterratio.values);
                    inddata.bifurcation.branchorderbins(j).parentdaughterratio.skew  = skewness(inddata.bifurcation.branchorderbins(j).parentdaughterratio.values,0);
                    inddata.bifurcation.branchorderbins(j).parentdaughterratio.kurt  = kurtosis(inddata.bifurcation.branchorderbins(j).parentdaughterratio.values,0);
                    
                    inddata.bifurcation.branchorderbins(j).parentdaughter2ratio.max   = max(inddata.bifurcation.branchorderbins(j).parentdaughter2ratio.values);
                    inddata.bifurcation.branchorderbins(j).parentdaughter2ratio.mean  = mean(inddata.bifurcation.branchorderbins(j).parentdaughter2ratio.values);
                    inddata.bifurcation.branchorderbins(j).parentdaughter2ratio.min   = min(inddata.bifurcation.branchorderbins(j).parentdaughter2ratio.values);
                    inddata.bifurcation.branchorderbins(j).parentdaughter2ratio.std   = std(inddata.bifurcation.branchorderbins(j).parentdaughter2ratio.values);
                    inddata.bifurcation.branchorderbins(j).parentdaughter2ratio.total = sum(inddata.bifurcation.branchorderbins(j).parentdaughter2ratio.values);
                    inddata.bifurcation.branchorderbins(j).parentdaughter2ratio.skew  = skewness(inddata.bifurcation.branchorderbins(j).parentdaughter2ratio.values,0);
                    inddata.bifurcation.branchorderbins(j).parentdaughter2ratio.kurt  = kurtosis(inddata.bifurcation.branchorderbins(j).parentdaughter2ratio.values,0);
                end
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        
        for i = 1:length(popdata.bifurcation.branchorderbins)
            if isfield(popdata.bifurcation.branchorderbins(i).cable,'id')==1
                popdata.bifurcation.branchorderbins(i).length.values               = [popdata.bifurcation.branchorderbins(i).cable.length];
                popdata.bifurcation.branchorderbins(i).surfacearea.values          = [popdata.bifurcation.branchorderbins(i).cable.surfacearea];
                popdata.bifurcation.branchorderbins(i).volume.values               = [popdata.bifurcation.branchorderbins(i).cable.volume];
                popdata.bifurcation.branchorderbins(i).taperrate.values            = [popdata.bifurcation.branchorderbins(i).cable.taperrate];
                popdata.bifurcation.branchorderbins(i).taperratio.values           = [popdata.bifurcation.branchorderbins(i).cable.taperratio];
                popdata.bifurcation.branchorderbins(i).proximaldiameter.values     = [popdata.bifurcation.branchorderbins(i).cable.proximaldiameter];
                popdata.bifurcation.branchorderbins(i).cylindricaldiameter.values  = [popdata.bifurcation.branchorderbins(i).cable.cylindricaldiameter];
                popdata.bifurcation.branchorderbins(i).distaldiameter.values       = [popdata.bifurcation.branchorderbins(i).cable.distaldiameter];
                popdata.bifurcation.branchorderbins(i).rallratio.values            = [popdata.bifurcation.branchorderbins(i).cable.rallratio];
                popdata.bifurcation.branchorderbins(i).rallratio1.values           = [popdata.bifurcation.branchorderbins(i).cable.rallratio1];
                popdata.bifurcation.branchorderbins(i).rallratio2.values           = [popdata.bifurcation.branchorderbins(i).cable.rallratio2];
                popdata.bifurcation.branchorderbins(i).rallratio3.values           = [popdata.bifurcation.branchorderbins(i).cable.rallratio3];
                popdata.bifurcation.branchorderbins(i).daughterratio.values        = [popdata.bifurcation.branchorderbins(i).cable.daughterratio];
                popdata.bifurcation.branchorderbins(i).parentdaughterratio.values  = [popdata.bifurcation.branchorderbins(i).cable.parentdaughterratio];
                popdata.bifurcation.branchorderbins(i).parentdaughter2ratio.values = [popdata.bifurcation.branchorderbins(i).cable.parentdaughter2ratio];
            end
        end
        
        for i = 1:length(popdata.bifurcation.branchorderbins)
            
            popdata.bifurcation.branchorderbins(i).numbersegments       = sum([popdata.bifurcation.branchorderbins(i).numbersegments.values]);
            
            popdata.bifurcation.branchorderbins(i).proximaldiameter.max   = max(popdata.bifurcation.branchorderbins(i).proximaldiameter.values);
            popdata.bifurcation.branchorderbins(i).proximaldiameter.mean  = mean(popdata.bifurcation.branchorderbins(i).proximaldiameter.values);
            popdata.bifurcation.branchorderbins(i).proximaldiameter.min   = min(popdata.bifurcation.branchorderbins(i).proximaldiameter.values);
            popdata.bifurcation.branchorderbins(i).proximaldiameter.std   = std(popdata.bifurcation.branchorderbins(i).proximaldiameter.values);
            popdata.bifurcation.branchorderbins(i).proximaldiameter.total = sum(popdata.bifurcation.branchorderbins(i).proximaldiameter.values);
            popdata.bifurcation.branchorderbins(i).proximaldiameter.skew  = skewness(popdata.bifurcation.branchorderbins(i).proximaldiameter.values,0);
            popdata.bifurcation.branchorderbins(i).proximaldiameter.kurt  = kurtosis(popdata.bifurcation.branchorderbins(i).proximaldiameter.values,0);
            
            popdata.bifurcation.branchorderbins(i).cylindricaldiameter.max   = max(popdata.bifurcation.branchorderbins(i).cylindricaldiameter.values);
            popdata.bifurcation.branchorderbins(i).cylindricaldiameter.mean  = mean(popdata.bifurcation.branchorderbins(i).cylindricaldiameter.values);
            popdata.bifurcation.branchorderbins(i).cylindricaldiameter.min   = min(popdata.bifurcation.branchorderbins(i).cylindricaldiameter.values);
            popdata.bifurcation.branchorderbins(i).cylindricaldiameter.std   = std(popdata.bifurcation.branchorderbins(i).cylindricaldiameter.values);
            popdata.bifurcation.branchorderbins(i).cylindricaldiameter.total = sum(popdata.bifurcation.branchorderbins(i).cylindricaldiameter.values);
            popdata.bifurcation.branchorderbins(i).cylindricaldiameter.skew  = skewness(popdata.bifurcation.branchorderbins(i).cylindricaldiameter.values,0);
            popdata.bifurcation.branchorderbins(i).cylindricaldiameter.kurt  = kurtosis(popdata.bifurcation.branchorderbins(i).cylindricaldiameter.values,0);
            
            popdata.bifurcation.branchorderbins(i).distaldiameter.max   = max(popdata.bifurcation.branchorderbins(i).distaldiameter.values);
            popdata.bifurcation.branchorderbins(i).distaldiameter.mean  = mean(popdata.bifurcation.branchorderbins(i).distaldiameter.values);
            popdata.bifurcation.branchorderbins(i).distaldiameter.min   = min(popdata.bifurcation.branchorderbins(i).distaldiameter.values);
            popdata.bifurcation.branchorderbins(i).distaldiameter.std   = std(popdata.bifurcation.branchorderbins(i).distaldiameter.values);
            popdata.bifurcation.branchorderbins(i).distaldiameter.total = sum(popdata.bifurcation.branchorderbins(i).distaldiameter.values);
            popdata.bifurcation.branchorderbins(i).distaldiameter.skew  = skewness(popdata.bifurcation.branchorderbins(i).distaldiameter.values,0);
            popdata.bifurcation.branchorderbins(i).distaldiameter.kurt  = kurtosis(popdata.bifurcation.branchorderbins(i).distaldiameter.values,0);
            
            popdata.bifurcation.branchorderbins(i).length.max   = max(popdata.bifurcation.branchorderbins(i).length.values);
            popdata.bifurcation.branchorderbins(i).length.mean  = mean(popdata.bifurcation.branchorderbins(i).length.values);
            popdata.bifurcation.branchorderbins(i).length.min   = min(popdata.bifurcation.branchorderbins(i).length.values);
            popdata.bifurcation.branchorderbins(i).length.std   = std(popdata.bifurcation.branchorderbins(i).length.values);
            popdata.bifurcation.branchorderbins(i).length.total = sum(popdata.bifurcation.branchorderbins(i).length.values);
            popdata.bifurcation.branchorderbins(i).length.skew  = skewness(popdata.bifurcation.branchorderbins(i).length.values,0);
            popdata.bifurcation.branchorderbins(i).length.kurt  = kurtosis(popdata.bifurcation.branchorderbins(i).length.values,0);
            
            popdata.bifurcation.branchorderbins(i).surfacearea.max   = max(popdata.bifurcation.branchorderbins(i).surfacearea.values);
            popdata.bifurcation.branchorderbins(i).surfacearea.mean  = mean(popdata.bifurcation.branchorderbins(i).surfacearea.values);
            popdata.bifurcation.branchorderbins(i).surfacearea.min   = min(popdata.bifurcation.branchorderbins(i).surfacearea.values);
            popdata.bifurcation.branchorderbins(i).surfacearea.std   = std(popdata.bifurcation.branchorderbins(i).surfacearea.values);
            popdata.bifurcation.branchorderbins(i).surfacearea.total = sum(popdata.bifurcation.branchorderbins(i).surfacearea.values);
            popdata.bifurcation.branchorderbins(i).surfacearea.skew  = skewness(popdata.bifurcation.branchorderbins(i).surfacearea.values,0);
            popdata.bifurcation.branchorderbins(i).surfacearea.kurt  = kurtosis(popdata.bifurcation.branchorderbins(i).surfacearea.values,0);
            
            popdata.bifurcation.branchorderbins(i).volume.max   = max(popdata.bifurcation.branchorderbins(i).volume.values);
            popdata.bifurcation.branchorderbins(i).volume.mean  = mean(popdata.bifurcation.branchorderbins(i).volume.values);
            popdata.bifurcation.branchorderbins(i).volume.min   = min(popdata.bifurcation.branchorderbins(i).volume.values);
            popdata.bifurcation.branchorderbins(i).volume.std   = std(popdata.bifurcation.branchorderbins(i).volume.values);
            popdata.bifurcation.branchorderbins(i).volume.total = sum(popdata.bifurcation.branchorderbins(i).volume.values);
            popdata.bifurcation.branchorderbins(i).volume.skew  = skewness(popdata.bifurcation.branchorderbins(i).volume.values,0);
            popdata.bifurcation.branchorderbins(i).volume.kurt  = kurtosis(popdata.bifurcation.branchorderbins(i).volume.values,0);
            
            popdata.bifurcation.branchorderbins(i).taperrate.max   = max(popdata.bifurcation.branchorderbins(i).taperrate.values);
            %popdata.bifurcation.branchorderbins(i).taperrate.mean  = mean(popdata.bifurcation.branchorderbins(i).taperrate.values);
            popdata.bifurcation.branchorderbins(i).taperrate.mean  = sum(([popdata.bifurcation.branchorderbins(i).taperrate.values].*[popdata.bifurcation.branchorderbins(i).length.values])/sum([popdata.bifurcation.branchorderbins(i).length.values]));
            popdata.bifurcation.branchorderbins(i).taperrate.min   = min(popdata.bifurcation.branchorderbins(i).taperrate.values);
            popdata.bifurcation.branchorderbins(i).taperrate.std   = std(popdata.bifurcation.branchorderbins(i).taperrate.values);
            popdata.bifurcation.branchorderbins(i).taperrate.total = sum(popdata.bifurcation.branchorderbins(i).taperrate.values);
            popdata.bifurcation.branchorderbins(i).taperrate.skew  = skewness(popdata.bifurcation.branchorderbins(i).taperrate.values,0);
            popdata.bifurcation.branchorderbins(i).taperrate.kurt  = kurtosis(popdata.bifurcation.branchorderbins(i).taperrate.values,0);
            
            popdata.bifurcation.branchorderbins(i).taperratio.max   = max(popdata.bifurcation.branchorderbins(i).taperratio.values);
            popdata.bifurcation.branchorderbins(i).taperratio.mean  = mean(popdata.bifurcation.branchorderbins(i).taperratio.values);
            popdata.bifurcation.branchorderbins(i).taperratio.min   = min(popdata.bifurcation.branchorderbins(i).taperratio.values);
            popdata.bifurcation.branchorderbins(i).taperratio.std   = std(popdata.bifurcation.branchorderbins(i).taperratio.values);
            popdata.bifurcation.branchorderbins(i).taperratio.total = sum(popdata.bifurcation.branchorderbins(i).taperratio.values);
            popdata.bifurcation.branchorderbins(i).taperratio.skew  = skewness(popdata.bifurcation.branchorderbins(i).taperratio.values,0);
            popdata.bifurcation.branchorderbins(i).taperratio.kurt  = kurtosis(popdata.bifurcation.branchorderbins(i).taperratio.values,0);
            
            popdata.bifurcation.branchorderbins(i).rallratio.max   = max(popdata.bifurcation.branchorderbins(i).rallratio.values);
            popdata.bifurcation.branchorderbins(i).rallratio.mean  = mean(popdata.bifurcation.branchorderbins(i).rallratio.values);
            popdata.bifurcation.branchorderbins(i).rallratio.min   = min(popdata.bifurcation.branchorderbins(i).rallratio.values);
            popdata.bifurcation.branchorderbins(i).rallratio.std   = std(popdata.bifurcation.branchorderbins(i).rallratio.values);
            popdata.bifurcation.branchorderbins(i).rallratio.total = sum(popdata.bifurcation.branchorderbins(i).rallratio.values);
            popdata.bifurcation.branchorderbins(i).rallratio.skew  = skewness(popdata.bifurcation.branchorderbins(i).rallratio.values,0);
            popdata.bifurcation.branchorderbins(i).rallratio.kurt  = kurtosis(popdata.bifurcation.branchorderbins(i).rallratio.values,0);
            
            popdata.bifurcation.branchorderbins(i).rallratio1.max   = max(popdata.bifurcation.branchorderbins(i).rallratio1.values);
            popdata.bifurcation.branchorderbins(i).rallratio1.mean  = mean(popdata.bifurcation.branchorderbins(i).rallratio1.values);
            popdata.bifurcation.branchorderbins(i).rallratio1.min   = min(popdata.bifurcation.branchorderbins(i).rallratio1.values);
            popdata.bifurcation.branchorderbins(i).rallratio1.std   = std(popdata.bifurcation.branchorderbins(i).rallratio1.values);
            popdata.bifurcation.branchorderbins(i).rallratio1.total = sum(popdata.bifurcation.branchorderbins(i).rallratio1.values);
            popdata.bifurcation.branchorderbins(i).rallratio1.skew  = skewness(popdata.bifurcation.branchorderbins(i).rallratio1.values,0);
            popdata.bifurcation.branchorderbins(i).rallratio1.kurt  = kurtosis(popdata.bifurcation.branchorderbins(i).rallratio1.values,0);
            
            popdata.bifurcation.branchorderbins(i).rallratio2.max   = max(popdata.bifurcation.branchorderbins(i).rallratio2.values);
            popdata.bifurcation.branchorderbins(i).rallratio2.mean  = mean(popdata.bifurcation.branchorderbins(i).rallratio2.values);
            popdata.bifurcation.branchorderbins(i).rallratio2.min   = min(popdata.bifurcation.branchorderbins(i).rallratio2.values);
            popdata.bifurcation.branchorderbins(i).rallratio2.std   = std(popdata.bifurcation.branchorderbins(i).rallratio2.values);
            popdata.bifurcation.branchorderbins(i).rallratio2.total = sum(popdata.bifurcation.branchorderbins(i).rallratio2.values);
            popdata.bifurcation.branchorderbins(i).rallratio2.skew  = skewness(popdata.bifurcation.branchorderbins(i).rallratio2.values,0);
            popdata.bifurcation.branchorderbins(i).rallratio2.kurt  = kurtosis(popdata.bifurcation.branchorderbins(i).rallratio2.values,0);
            
            popdata.bifurcation.branchorderbins(i).rallratio3.max   = max(popdata.bifurcation.branchorderbins(i).rallratio3.values);
            popdata.bifurcation.branchorderbins(i).rallratio3.mean  = mean(popdata.bifurcation.branchorderbins(i).rallratio3.values);
            popdata.bifurcation.branchorderbins(i).rallratio3.min   = min(popdata.bifurcation.branchorderbins(i).rallratio3.values);
            popdata.bifurcation.branchorderbins(i).rallratio3.std   = std(popdata.bifurcation.branchorderbins(i).rallratio3.values);
            popdata.bifurcation.branchorderbins(i).rallratio3.total = sum(popdata.bifurcation.branchorderbins(i).rallratio3.values);
            popdata.bifurcation.branchorderbins(i).rallratio3.skew  = skewness(popdata.bifurcation.branchorderbins(i).rallratio3.values,0);
            popdata.bifurcation.branchorderbins(i).rallratio3.kurt  = kurtosis(popdata.bifurcation.branchorderbins(i).rallratio3.values,0);
            
            popdata.bifurcation.branchorderbins(i).daughterratio.max   = max(popdata.bifurcation.branchorderbins(i).daughterratio.values);
            popdata.bifurcation.branchorderbins(i).daughterratio.mean  = mean(popdata.bifurcation.branchorderbins(i).daughterratio.values);
            popdata.bifurcation.branchorderbins(i).daughterratio.min   = min(popdata.bifurcation.branchorderbins(i).daughterratio.values);
            popdata.bifurcation.branchorderbins(i).daughterratio.std   = std(popdata.bifurcation.branchorderbins(i).daughterratio.values);
            popdata.bifurcation.branchorderbins(i).daughterratio.total = sum(popdata.bifurcation.branchorderbins(i).daughterratio.values);
            popdata.bifurcation.branchorderbins(i).daughterratio.skew  = skewness(popdata.bifurcation.branchorderbins(i).daughterratio.values,0);
            popdata.bifurcation.branchorderbins(i).daughterratio.kurt  = kurtosis(popdata.bifurcation.branchorderbins(i).daughterratio.values,0);
            
            popdata.bifurcation.branchorderbins(i).parentdaughterratio.max   = max(popdata.bifurcation.branchorderbins(i).parentdaughterratio.values);
            popdata.bifurcation.branchorderbins(i).parentdaughterratio.mean  = mean(popdata.bifurcation.branchorderbins(i).parentdaughterratio.values);
            popdata.bifurcation.branchorderbins(i).parentdaughterratio.min   = min(popdata.bifurcation.branchorderbins(i).parentdaughterratio.values);
            popdata.bifurcation.branchorderbins(i).parentdaughterratio.std   = std(popdata.bifurcation.branchorderbins(i).parentdaughterratio.values);
            popdata.bifurcation.branchorderbins(i).parentdaughterratio.total = sum(popdata.bifurcation.branchorderbins(i).parentdaughterratio.values);
            popdata.bifurcation.branchorderbins(i).parentdaughterratio.skew  = skewness(popdata.bifurcation.branchorderbins(i).parentdaughterratio.values,0);
            popdata.bifurcation.branchorderbins(i).parentdaughterratio.kurt  = kurtosis(popdata.bifurcation.branchorderbins(i).parentdaughterratio.values,0);
            
            popdata.bifurcation.branchorderbins(i).parentdaughter2ratio.max   = max(popdata.bifurcation.branchorderbins(i).parentdaughter2ratio.values);
            popdata.bifurcation.branchorderbins(i).parentdaughter2ratio.mean  = mean(popdata.bifurcation.branchorderbins(i).parentdaughter2ratio.values);
            popdata.bifurcation.branchorderbins(i).parentdaughter2ratio.min   = min(popdata.bifurcation.branchorderbins(i).parentdaughter2ratio.values);
            popdata.bifurcation.branchorderbins(i).parentdaughter2ratio.std   = std(popdata.bifurcation.branchorderbins(i).parentdaughter2ratio.values);
            popdata.bifurcation.branchorderbins(i).parentdaughter2ratio.total = sum(popdata.bifurcation.branchorderbins(i).parentdaughter2ratio.values);
            popdata.bifurcation.branchorderbins(i).parentdaughter2ratio.skew  = skewness(popdata.bifurcation.branchorderbins(i).parentdaughter2ratio.values,0);
            popdata.bifurcation.branchorderbins(i).parentdaughter2ratio.kurt  = kurtosis(popdata.bifurcation.branchorderbins(i).parentdaughter2ratio.values,0);
            
        end
        
        for i = 1:typeanalysis.maxbranchorder.max
            typeanalysis.bifurcation.branchorder.branchorder(i)                 = i;
            typeanalysis.bifurcation.branchorder.numbersegments(i).values       = [];
            typeanalysis.bifurcation.branchorder.length(i).values               = [];
            typeanalysis.bifurcation.branchorder.totallength(i).values          = [];
            typeanalysis.bifurcation.branchorder.surfacearea(i).values          = [];
            typeanalysis.bifurcation.branchorder.totalsurfacearea(i).values     = [];
            typeanalysis.bifurcation.branchorder.volume(i).values               = [];
            typeanalysis.bifurcation.branchorder.totalvolume(i).values          = [];
            typeanalysis.bifurcation.branchorder.taperrate(i).values            = [];
            typeanalysis.bifurcation.branchorder.taperratio(i).values           = [];
            typeanalysis.bifurcation.branchorder.proximaldiameter(i).values     = [];
            typeanalysis.bifurcation.branchorder.cylindricaldiameter(i).values  = [];
            typeanalysis.bifurcation.branchorder.distaldiameter(i).values       = [];
            typeanalysis.bifurcation.branchorder.rallratio(i).values            = [];
            typeanalysis.bifurcation.branchorder.rallratio1(i).values           = [];
            typeanalysis.bifurcation.branchorder.rallratio2(i).values           = [];
            typeanalysis.bifurcation.branchorder.rallratio3(i).values           = [];
            typeanalysis.bifurcation.branchorder.daughterratio(i).values        = [];
            typeanalysis.bifurcation.branchorder.parentdaughterratio(i).values  = [];
            typeanalysis.bifurcation.branchorder.parentdaughter2ratio(i).values = [];
        end
        
        
        for i = 1:length(data.individual)
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            for j = 1:inddata.maxbranchorder
                typeanalysis.bifurcation.branchorder.numbersegments(j).values     = [[typeanalysis.bifurcation.branchorder.numbersegments(j).values] [inddata.bifurcation.branchorderbins(j).numbersegments]];
                typeanalysis.bifurcation.branchorder.totallength(j).values        = [[typeanalysis.bifurcation.branchorder.totallength(j).values] [inddata.bifurcation.branchorderbins(j).length.total]];
                typeanalysis.bifurcation.branchorder.totalsurfacearea(j).values   = [[typeanalysis.bifurcation.branchorder.totalsurfacearea(j).values] [inddata.bifurcation.branchorderbins(j).surfacearea.total]];
                typeanalysis.bifurcation.branchorder.totalvolume(j).values        = [[typeanalysis.bifurcation.branchorder.totalvolume(j).values] [inddata.bifurcation.branchorderbins(j).volume.total]];
            end
        end
        
        for i = 1:typeanalysis.maxbranchorder.max
            if isfield(popdata.bifurcation.branchorderbins(i).cable,'id')==1
                typeanalysis.bifurcation.branchorder.length(i).values                  = [popdata.bifurcation.branchorderbins(i).cable.length];
                typeanalysis.bifurcation.branchorder.surfacearea(i).values             = [popdata.bifurcation.branchorderbins(i).cable.surfacearea];
                typeanalysis.bifurcation.branchorder.volume(i).values                  = [popdata.bifurcation.branchorderbins(i).cable.volume];
                typeanalysis.bifurcation.branchorder.taperrate(i).values               = [popdata.bifurcation.branchorderbins(i).cable.taperrate];
                typeanalysis.bifurcation.branchorder.taperratio(i).values              = [popdata.bifurcation.branchorderbins(i).cable.taperratio];
                typeanalysis.bifurcation.branchorder.proximaldiameter(i).values        = [popdata.bifurcation.branchorderbins(i).cable.proximaldiameter];
                typeanalysis.bifurcation.branchorder.cylindricaldiameter(i).values     = [popdata.bifurcation.branchorderbins(i).cable.cylindricaldiameter];
                typeanalysis.bifurcation.branchorder.distaldiameter(i).values          = [popdata.bifurcation.branchorderbins(i).cable.distaldiameter];
                if i < typeanalysis.maxbranchorder.max
                    typeanalysis.bifurcation.branchorder.rallratio(i).values            = [popdata.bifurcation.branchorderbins(i).cable.rallratio];
                    typeanalysis.bifurcation.branchorder.rallratio1(i).values           = [popdata.bifurcation.branchorderbins(i).cable.rallratio1];
                    typeanalysis.bifurcation.branchorder.rallratio2(i).values           = [popdata.bifurcation.branchorderbins(i).cable.rallratio2];
                    typeanalysis.bifurcation.branchorder.rallratio3(i).values           = [popdata.bifurcation.branchorderbins(i).cable.rallratio3];
                    typeanalysis.bifurcation.branchorder.daughterratio(i).values        = [popdata.bifurcation.branchorderbins(i).cable.daughterratio];
                    typeanalysis.bifurcation.branchorder.parentdaughterratio(i).values  = [popdata.bifurcation.branchorderbins(i).cable.parentdaughterratio];
                    typeanalysis.bifurcation.branchorder.parentdaughter2ratio(i).values = [popdata.bifurcation.branchorderbins(i).cable.parentdaughter2ratio];
                end
            end
        end
        
        for i = 1:typeanalysis.maxbranchorder.max
            typeanalysis.bifurcation.branchorder.numbersegments(i).mean  = mean(typeanalysis.bifurcation.branchorder.numbersegments(i).values);
            typeanalysis.bifurcation.branchorder.numbersegments(i).std   = std(typeanalysis.bifurcation.branchorder.numbersegments(i).values);
            typeanalysis.bifurcation.branchorder.numbersegments(i).skew  = skewness(typeanalysis.bifurcation.branchorder.numbersegments(i).values,0);
            typeanalysis.bifurcation.branchorder.numbersegments(i).kurt  = kurtosis(typeanalysis.bifurcation.branchorder.numbersegments(i).values,0);
            typeanalysis.bifurcation.branchorder.numbersegments(i).min   = min(typeanalysis.bifurcation.branchorder.numbersegments(i).values);
            typeanalysis.bifurcation.branchorder.numbersegments(i).max   = max(typeanalysis.bifurcation.branchorder.numbersegments(i).values);
            typeanalysis.bifurcation.branchorder.numbersegments(i).total = sum(typeanalysis.bifurcation.branchorder.numbersegments(i).values);
            
            typeanalysis.bifurcation.branchorder.totallength(i).mean = mean(typeanalysis.bifurcation.branchorder.totallength(i).values);
            typeanalysis.bifurcation.branchorder.totallength(i).std  = std(typeanalysis.bifurcation.branchorder.totallength(i).values);
            typeanalysis.bifurcation.branchorder.totallength(i).skew = skewness(typeanalysis.bifurcation.branchorder.totallength(i).values,0);
            typeanalysis.bifurcation.branchorder.totallength(i).kurt = kurtosis(typeanalysis.bifurcation.branchorder.totallength(i).values,0);
            typeanalysis.bifurcation.branchorder.totallength(i).min  = min(typeanalysis.bifurcation.branchorder.totallength(i).values);
            typeanalysis.bifurcation.branchorder.totallength(i).max  = max(typeanalysis.bifurcation.branchorder.totallength(i).values);
            
            typeanalysis.bifurcation.branchorder.length(i).mean  = mean(typeanalysis.bifurcation.branchorder.length(i).values);
            typeanalysis.bifurcation.branchorder.length(i).std   = std(typeanalysis.bifurcation.branchorder.length(i).values);
            typeanalysis.bifurcation.branchorder.length(i).skew  = skewness(typeanalysis.bifurcation.branchorder.length(i).values,0);
            typeanalysis.bifurcation.branchorder.length(i).kurt  = kurtosis(typeanalysis.bifurcation.branchorder.length(i).values,0);
            typeanalysis.bifurcation.branchorder.length(i).min   = min(typeanalysis.bifurcation.branchorder.length(i).values);
            typeanalysis.bifurcation.branchorder.length(i).max   = max(typeanalysis.bifurcation.branchorder.length(i).values);
            typeanalysis.bifurcation.branchorder.length(i).total = sum(typeanalysis.bifurcation.branchorder.length(i).values);
            
            typeanalysis.bifurcation.branchorder.totalsurfacearea(i).mean = mean(typeanalysis.bifurcation.branchorder.totalsurfacearea(i).values);
            typeanalysis.bifurcation.branchorder.totalsurfacearea(i).std  = std(typeanalysis.bifurcation.branchorder.totalsurfacearea(i).values);
            typeanalysis.bifurcation.branchorder.totalsurfacearea(i).skew = skewness(typeanalysis.bifurcation.branchorder.totalsurfacearea(i).values,0);
            typeanalysis.bifurcation.branchorder.totalsurfacearea(i).kurt = kurtosis(typeanalysis.bifurcation.branchorder.totalsurfacearea(i).values,0);
            typeanalysis.bifurcation.branchorder.totalsurfacearea(i).min  = min(typeanalysis.bifurcation.branchorder.totalsurfacearea(i).values);
            typeanalysis.bifurcation.branchorder.totalsurfacearea(i).max  = max(typeanalysis.bifurcation.branchorder.totalsurfacearea(i).values);
            
            typeanalysis.bifurcation.branchorder.surfacearea(i).mean  = mean(typeanalysis.bifurcation.branchorder.surfacearea(i).values);
            typeanalysis.bifurcation.branchorder.surfacearea(i).std   = std(typeanalysis.bifurcation.branchorder.surfacearea(i).values);
            typeanalysis.bifurcation.branchorder.surfacearea(i).skew  = skewness(typeanalysis.bifurcation.branchorder.surfacearea(i).values,0);
            typeanalysis.bifurcation.branchorder.surfacearea(i).kurt  = kurtosis(typeanalysis.bifurcation.branchorder.surfacearea(i).values,0);
            typeanalysis.bifurcation.branchorder.surfacearea(i).min   = min(typeanalysis.bifurcation.branchorder.surfacearea(i).values);
            typeanalysis.bifurcation.branchorder.surfacearea(i).max   = max(typeanalysis.bifurcation.branchorder.surfacearea(i).values);
            typeanalysis.bifurcation.branchorder.surfacearea(i).total = sum(typeanalysis.bifurcation.branchorder.surfacearea(i).values);
            
            typeanalysis.bifurcation.branchorder.totalvolume(i).mean = mean(typeanalysis.bifurcation.branchorder.totalvolume(i).values);
            typeanalysis.bifurcation.branchorder.totalvolume(i).std  = std(typeanalysis.bifurcation.branchorder.totalvolume(i).values);
            typeanalysis.bifurcation.branchorder.totalvolume(i).skew = skewness(typeanalysis.bifurcation.branchorder.totalvolume(i).values,0);
            typeanalysis.bifurcation.branchorder.totalvolume(i).kurt = kurtosis(typeanalysis.bifurcation.branchorder.totalvolume(i).values,0);
            typeanalysis.bifurcation.branchorder.totalvolume(i).min  = min(typeanalysis.bifurcation.branchorder.totalvolume(i).values);
            typeanalysis.bifurcation.branchorder.totalvolume(i).max  = max(typeanalysis.bifurcation.branchorder.totalvolume(i).values);
            
            typeanalysis.bifurcation.branchorder.volume(i).mean  = mean(typeanalysis.bifurcation.branchorder.volume(i).values);
            typeanalysis.bifurcation.branchorder.volume(i).std   = std(typeanalysis.bifurcation.branchorder.volume(i).values);
            typeanalysis.bifurcation.branchorder.volume(i).skew  = skewness(typeanalysis.bifurcation.branchorder.volume(i).values,0);
            typeanalysis.bifurcation.branchorder.volume(i).kurt  = kurtosis(typeanalysis.bifurcation.branchorder.volume(i).values,0);
            typeanalysis.bifurcation.branchorder.volume(i).min   = min(typeanalysis.bifurcation.branchorder.volume(i).values);
            typeanalysis.bifurcation.branchorder.volume(i).max   = max(typeanalysis.bifurcation.branchorder.volume(i).values);
            typeanalysis.bifurcation.branchorder.volume(i).total = sum(typeanalysis.bifurcation.branchorder.volume(i).values);
            
            %typeanalysis.bifurcation.branchorder.taperrate(i).mean = mean(typeanalysis.bifurcation.branchorder.taperrate(i).values);
            typeanalysis.bifurcation.branchorder.taperrate(i).mean = sum(([typeanalysis.bifurcation.branchorder.taperrate(i).values].*[typeanalysis.bifurcation.branchorder.length(i).values])/sum([typeanalysis.bifurcation.branchorder.length(i).values]));
            typeanalysis.bifurcation.branchorder.taperrate(i).std  = std(typeanalysis.bifurcation.branchorder.taperrate(i).values);
            typeanalysis.bifurcation.branchorder.taperrate(i).skew = skewness(typeanalysis.bifurcation.branchorder.taperrate(i).values,0);
            typeanalysis.bifurcation.branchorder.taperrate(i).kurt = kurtosis(typeanalysis.bifurcation.branchorder.taperrate(i).values,0);
            typeanalysis.bifurcation.branchorder.taperrate(i).min  = min(typeanalysis.bifurcation.branchorder.taperrate(i).values);
            typeanalysis.bifurcation.branchorder.taperrate(i).max  = max(typeanalysis.bifurcation.branchorder.taperrate(i).values);
            
            typeanalysis.bifurcation.branchorder.taperratio(i).mean = mean(typeanalysis.bifurcation.branchorder.taperratio(i).values);
            typeanalysis.bifurcation.branchorder.taperratio(i).std  = std(typeanalysis.bifurcation.branchorder.taperratio(i).values);
            typeanalysis.bifurcation.branchorder.taperratio(i).skew = skewness(typeanalysis.bifurcation.branchorder.taperratio(i).values,0);
            typeanalysis.bifurcation.branchorder.taperratio(i).kurt = kurtosis(typeanalysis.bifurcation.branchorder.taperratio(i).values,0);
            typeanalysis.bifurcation.branchorder.taperratio(i).min  = min(typeanalysis.bifurcation.branchorder.taperratio(i).values);
            typeanalysis.bifurcation.branchorder.taperratio(i).max  = max(typeanalysis.bifurcation.branchorder.taperratio(i).values);
            
            typeanalysis.bifurcation.branchorder.proximaldiameter(i).mean = mean(typeanalysis.bifurcation.branchorder.proximaldiameter(i).values);
            typeanalysis.bifurcation.branchorder.proximaldiameter(i).std  = std(typeanalysis.bifurcation.branchorder.proximaldiameter(i).values);
            typeanalysis.bifurcation.branchorder.proximaldiameter(i).skew = skewness(typeanalysis.bifurcation.branchorder.proximaldiameter(i).values,0);
            typeanalysis.bifurcation.branchorder.proximaldiameter(i).kurt = kurtosis(typeanalysis.bifurcation.branchorder.proximaldiameter(i).values,0);
            typeanalysis.bifurcation.branchorder.proximaldiameter(i).min  = min(typeanalysis.bifurcation.branchorder.proximaldiameter(i).values);
            typeanalysis.bifurcation.branchorder.proximaldiameter(i).max  = max(typeanalysis.bifurcation.branchorder.proximaldiameter(i).values);
            
            typeanalysis.bifurcation.branchorder.cylindricaldiameter(i).mean = mean(typeanalysis.bifurcation.branchorder.cylindricaldiameter(i).values);
            typeanalysis.bifurcation.branchorder.cylindricaldiameter(i).std  = std(typeanalysis.bifurcation.branchorder.cylindricaldiameter(i).values);
            typeanalysis.bifurcation.branchorder.cylindricaldiameter(i).skew = skewness(typeanalysis.bifurcation.branchorder.cylindricaldiameter(i).values,0);
            typeanalysis.bifurcation.branchorder.cylindricaldiameter(i).kurt = kurtosis(typeanalysis.bifurcation.branchorder.cylindricaldiameter(i).values,0);
            typeanalysis.bifurcation.branchorder.cylindricaldiameter(i).min  = min(typeanalysis.bifurcation.branchorder.cylindricaldiameter(i).values);
            typeanalysis.bifurcation.branchorder.cylindricaldiameter(i).max  = max(typeanalysis.bifurcation.branchorder.cylindricaldiameter(i).values);
            
            typeanalysis.bifurcation.branchorder.distaldiameter(i).mean = mean(typeanalysis.bifurcation.branchorder.distaldiameter(i).values);
            typeanalysis.bifurcation.branchorder.distaldiameter(i).std  = std(typeanalysis.bifurcation.branchorder.distaldiameter(i).values);
            typeanalysis.bifurcation.branchorder.distaldiameter(i).skew = skewness(typeanalysis.bifurcation.branchorder.distaldiameter(i).values,0);
            typeanalysis.bifurcation.branchorder.distaldiameter(i).kurt = kurtosis(typeanalysis.bifurcation.branchorder.distaldiameter(i).values,0);
            typeanalysis.bifurcation.branchorder.distaldiameter(i).min  = min(typeanalysis.bifurcation.branchorder.distaldiameter(i).values);
            typeanalysis.bifurcation.branchorder.distaldiameter(i).max  = max(typeanalysis.bifurcation.branchorder.distaldiameter(i).values);
            
            typeanalysis.bifurcation.branchorder.rallratio(i).mean = mean(typeanalysis.bifurcation.branchorder.rallratio(i).values    );
            typeanalysis.bifurcation.branchorder.rallratio(i).std  = std(typeanalysis.bifurcation.branchorder.rallratio(i).values     );
            typeanalysis.bifurcation.branchorder.rallratio(i).skew = skewness(typeanalysis.bifurcation.branchorder.rallratio(i).values,0);
            typeanalysis.bifurcation.branchorder.rallratio(i).kurt = kurtosis(typeanalysis.bifurcation.branchorder.rallratio(i).values,0);
            typeanalysis.bifurcation.branchorder.rallratio(i).min  = min(typeanalysis.bifurcation.branchorder.rallratio(i).values);
            typeanalysis.bifurcation.branchorder.rallratio(i).max  = max(typeanalysis.bifurcation.branchorder.rallratio(i).values);
            
            typeanalysis.bifurcation.branchorder.rallratio1(i).mean = mean(typeanalysis.bifurcation.branchorder.rallratio1(i).values    );
            typeanalysis.bifurcation.branchorder.rallratio1(i).std  = std(typeanalysis.bifurcation.branchorder.rallratio1(i).values     );
            typeanalysis.bifurcation.branchorder.rallratio1(i).skew = skewness(typeanalysis.bifurcation.branchorder.rallratio1(i).values,0);
            typeanalysis.bifurcation.branchorder.rallratio1(i).kurt = kurtosis(typeanalysis.bifurcation.branchorder.rallratio1(i).values,0);
            typeanalysis.bifurcation.branchorder.rallratio1(i).min  = min(typeanalysis.bifurcation.branchorder.rallratio1(i).values);
            typeanalysis.bifurcation.branchorder.rallratio1(i).max  = max(typeanalysis.bifurcation.branchorder.rallratio1(i).values);
            
            typeanalysis.bifurcation.branchorder.rallratio2(i).mean = mean(typeanalysis.bifurcation.branchorder.rallratio2(i).values    );
            typeanalysis.bifurcation.branchorder.rallratio2(i).std  = std(typeanalysis.bifurcation.branchorder.rallratio2(i).values     );
            typeanalysis.bifurcation.branchorder.rallratio2(i).skew = skewness(typeanalysis.bifurcation.branchorder.rallratio2(i).values,0);
            typeanalysis.bifurcation.branchorder.rallratio2(i).kurt = kurtosis(typeanalysis.bifurcation.branchorder.rallratio2(i).values,0);
            typeanalysis.bifurcation.branchorder.rallratio2(i).min  = min(typeanalysis.bifurcation.branchorder.rallratio2(i).values);
            typeanalysis.bifurcation.branchorder.rallratio2(i).max  = max(typeanalysis.bifurcation.branchorder.rallratio2(i).values);
            
            typeanalysis.bifurcation.branchorder.rallratio3(i).mean = mean(typeanalysis.bifurcation.branchorder.rallratio3(i).values    );
            typeanalysis.bifurcation.branchorder.rallratio3(i).std  = std(typeanalysis.bifurcation.branchorder.rallratio3(i).values     );
            typeanalysis.bifurcation.branchorder.rallratio3(i).skew = skewness(typeanalysis.bifurcation.branchorder.rallratio3(i).values,0);
            typeanalysis.bifurcation.branchorder.rallratio3(i).kurt = kurtosis(typeanalysis.bifurcation.branchorder.rallratio3(i).values,0);
            typeanalysis.bifurcation.branchorder.rallratio3(i).min  = min(typeanalysis.bifurcation.branchorder.rallratio3(i).values);
            typeanalysis.bifurcation.branchorder.rallratio3(i).max  = max(typeanalysis.bifurcation.branchorder.rallratio3(i).values);
            
            typeanalysis.bifurcation.branchorder.daughterratio(i).mean = mean(typeanalysis.bifurcation.branchorder.daughterratio(i).values     );
            typeanalysis.bifurcation.branchorder.daughterratio(i).std  = std(typeanalysis.bifurcation.branchorder.daughterratio(i).values      );
            typeanalysis.bifurcation.branchorder.daughterratio(i).skew = skewness(typeanalysis.bifurcation.branchorder.daughterratio(i).values,0);
            typeanalysis.bifurcation.branchorder.daughterratio(i).kurt = kurtosis(typeanalysis.bifurcation.branchorder.daughterratio(i).values,0);
            typeanalysis.bifurcation.branchorder.daughterratio(i).min  = min(typeanalysis.bifurcation.branchorder.daughterratio(i).values);
            typeanalysis.bifurcation.branchorder.daughterratio(i).max  = max(typeanalysis.bifurcation.branchorder.daughterratio(i).values);
            
            typeanalysis.bifurcation.branchorder.parentdaughterratio(i).mean = mean(typeanalysis.bifurcation.branchorder.parentdaughterratio(i).values     );
            typeanalysis.bifurcation.branchorder.parentdaughterratio(i).std  = std(typeanalysis.bifurcation.branchorder.parentdaughterratio(i).values      );
            typeanalysis.bifurcation.branchorder.parentdaughterratio(i).skew = skewness(typeanalysis.bifurcation.branchorder.parentdaughterratio(i).values,0);
            typeanalysis.bifurcation.branchorder.parentdaughterratio(i).kurt = kurtosis(typeanalysis.bifurcation.branchorder.parentdaughterratio(i).values,0);
            typeanalysis.bifurcation.branchorder.parentdaughterratio(i).min  = min(typeanalysis.bifurcation.branchorder.parentdaughterratio(i).values);
            typeanalysis.bifurcation.branchorder.parentdaughterratio(i).max  = max(typeanalysis.bifurcation.branchorder.parentdaughterratio(i).values);
            
            typeanalysis.bifurcation.branchorder.parentdaughter2ratio(i).mean = mean(typeanalysis.bifurcation.branchorder.parentdaughter2ratio(i).values     );
            typeanalysis.bifurcation.branchorder.parentdaughter2ratio(i).std  = std(typeanalysis.bifurcation.branchorder.parentdaughter2ratio(i).values      );
            typeanalysis.bifurcation.branchorder.parentdaughter2ratio(i).skew = skewness(typeanalysis.bifurcation.branchorder.parentdaughter2ratio(i).values,0);
            typeanalysis.bifurcation.branchorder.parentdaughter2ratio(i).kurt = kurtosis(typeanalysis.bifurcation.branchorder.parentdaughter2ratio(i).values,0);
            typeanalysis.bifurcation.branchorder.parentdaughter2ratio(i).min  = min(typeanalysis.bifurcation.branchorder.parentdaughter2ratio(i).values);
            typeanalysis.bifurcation.branchorder.parentdaughter2ratio(i).max  = max(typeanalysis.bifurcation.branchorder.parentdaughter2ratio(i).values);
            
            %if i < typeanalysis.maxbranchorder.max
            typeanalysis.bifurcation.branchorder.bifurcationprobability.length(i) = typeanalysis.bifurcation.branchorder.numbersegments(i).total / typeanalysis.bifurcation.branchorder.length(i).total;
            %typeanalysis.bifurcation.branchorder.terminationprobability.length(i) = typeanalysis.bifurcation.branchorder.numberterminations(i).total / typeanalysis.bifurcation.branchorder.length(i).total;
            
            typeanalysis.bifurcation.branchorder.bifurcationprobability.surfacearea(i) = typeanalysis.bifurcation.branchorder.numbersegments(i).total / typeanalysis.bifurcation.branchorder.surfacearea(i).total;
            %typeanalysis.bifurcation.branchorder.terminationprobability.surfacearea(i) = typeanalysis.bifurcation.branchorder.numberterminations(i).total / typeanalysis.bifurcation.branchorder.surfacearea(i).total;
            
            typeanalysis.bifurcation.branchorder.bifurcationprobability.volume(i) = typeanalysis.bifurcation.branchorder.numbersegments(i).total / typeanalysis.bifurcation.branchorder.volume(i).total;
            %typeanalysis.bifurcation.branchorder.terminationprobability.volume(i) = typeanalysis.bifurcation.branchorder.numberterminations(i).total / typeanalysis.bifurcation.branchorder.volume(i).total;
            %end
        end
        
        
        
        
        
        
        
        
        
        % Begin termination branch order analysis
        
        for i = 1:length(data.individual)
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            for j = 1:typeanalysis.maxbranchorder.max
                inddata.termination.branchorderbins(j).numbersegments              = [];
                inddata.termination.branchorderbins(j).length.values               = [];
                inddata.termination.branchorderbins(j).surfacearea.values          = [];
                inddata.termination.branchorderbins(j).volume.values               = [];
                inddata.termination.branchorderbins(j).taperrate.values            = [];
                inddata.termination.branchorderbins(j).taperratio.values           = [];
                inddata.termination.branchorderbins(j).proximaldiameter.values     = [];
                inddata.termination.branchorderbins(j).cylindricaldiameter.values  = [];
                inddata.termination.branchorderbins(j).distaldiameter.values       = [];
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        for i = 1:length(data.individual)
            
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            
            for j = 1:inddata.maxbranchorder
                
                if isfield(inddata.termination.branchorderbins(j).cable,'id')==1
                    
                    inddata.termination.branchorderbins(j).numbersegments     = 0;
                    
                    inddata.termination.branchorderbins(j).length.values               = [inddata.termination.branchorderbins(j).cable.length];
                    inddata.termination.branchorderbins(j).surfacearea.values          = [inddata.termination.branchorderbins(j).cable.surfacearea];
                    inddata.termination.branchorderbins(j).volume.values               = [inddata.termination.branchorderbins(j).cable.volume];
                    inddata.termination.branchorderbins(j).taperrate.values            = [inddata.termination.branchorderbins(j).cable.taperrate];
                    inddata.termination.branchorderbins(j).taperratio.values           = [inddata.termination.branchorderbins(j).cable.taperratio];
                    inddata.termination.branchorderbins(j).proximaldiameter.values     = [inddata.termination.branchorderbins(j).cable.proximaldiameter];
                    inddata.termination.branchorderbins(j).cylindricaldiameter.values  = [inddata.termination.branchorderbins(j).cable.cylindricaldiameter];
                    inddata.termination.branchorderbins(j).distaldiameter.values       = [inddata.termination.branchorderbins(j).cable.distaldiameter];
                    
                    
                    for k = 1:length(inddata.termination.branchorderbins(j).cable)
                        inddata.termination.branchorderbins(j).numbersegments = 1 + inddata.termination.branchorderbins(j).numbersegments;
                    end
                end
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        for i = 1:length(data.individual)
            for m = 1:typeanalysis.maxbranchorder.max
                popdata.termination.branchorderbins(m).numbersegments(i).values     = [];
                popdata.termination.branchorderbins(m).length.values                = [];
                popdata.termination.branchorderbins(m).surfacearea.values           = [];
                popdata.termination.branchorderbins(m).volume.values                = [];
                popdata.termination.branchorderbins(m).taperrate.values             = [];
                popdata.termination.branchorderbins(m).taperratio.values            = [];
                popdata.termination.branchorderbins(m).proximaldiameter.values      = [];
                popdata.termination.branchorderbins(m).cylindricaldiameter.values   = [];
                popdata.termination.branchorderbins(m).distaldiameter.values        = [];
            end
        end
        
        for i = 1:length(data.individual)
            
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            
            for j = 1:inddata.maxbranchorder
                
                popdata.termination.branchorderbins(j).numbersegments(i).values = [popdata.termination.branchorderbins(j).numbersegments(i).values inddata.branchorderbins(j).numbersegments];
                
                inddata.termination.branchorderbins(j).proximaldiameter.max   = max(inddata.termination.branchorderbins(j).proximaldiameter.values);
                inddata.termination.branchorderbins(j).proximaldiameter.mean  = mean(inddata.termination.branchorderbins(j).proximaldiameter.values);
                inddata.termination.branchorderbins(j).proximaldiameter.min   = min(inddata.termination.branchorderbins(j).proximaldiameter.values);
                inddata.termination.branchorderbins(j).proximaldiameter.std   = std(inddata.termination.branchorderbins(j).proximaldiameter.values);
                inddata.termination.branchorderbins(j).proximaldiameter.total = sum(inddata.termination.branchorderbins(j).proximaldiameter.values);
                inddata.termination.branchorderbins(j).proximaldiameter.skew  = skewness(inddata.termination.branchorderbins(j).proximaldiameter.values,0);
                inddata.termination.branchorderbins(j).proximaldiameter.kurt  = kurtosis(inddata.termination.branchorderbins(j).proximaldiameter.values,0);
                
                inddata.termination.branchorderbins(j).cylindricaldiameter.max   = max(inddata.termination.branchorderbins(j).cylindricaldiameter.values);
                inddata.termination.branchorderbins(j).cylindricaldiameter.mean  = mean(inddata.termination.branchorderbins(j).cylindricaldiameter.values);
                inddata.termination.branchorderbins(j).cylindricaldiameter.min   = min(inddata.termination.branchorderbins(j).cylindricaldiameter.values);
                inddata.termination.branchorderbins(j).cylindricaldiameter.std   = std(inddata.termination.branchorderbins(j).cylindricaldiameter.values);
                inddata.termination.branchorderbins(j).cylindricaldiameter.total = sum(inddata.termination.branchorderbins(j).cylindricaldiameter.values);
                inddata.termination.branchorderbins(j).cylindricaldiameter.skew  = skewness(inddata.termination.branchorderbins(j).cylindricaldiameter.values,0);
                inddata.termination.branchorderbins(j).cylindricaldiameter.kurt  = kurtosis(inddata.termination.branchorderbins(j).cylindricaldiameter.values,0);
                
                inddata.termination.branchorderbins(j).distaldiameter.max   = max(inddata.termination.branchorderbins(j).distaldiameter.values);
                inddata.termination.branchorderbins(j).distaldiameter.mean  = mean(inddata.termination.branchorderbins(j).distaldiameter.values);
                inddata.termination.branchorderbins(j).distaldiameter.min   = min(inddata.termination.branchorderbins(j).distaldiameter.values);
                inddata.termination.branchorderbins(j).distaldiameter.std   = std(inddata.termination.branchorderbins(j).distaldiameter.values);
                inddata.termination.branchorderbins(j).distaldiameter.total = sum(inddata.termination.branchorderbins(j).distaldiameter.values);
                inddata.termination.branchorderbins(j).distaldiameter.skew  = skewness(inddata.termination.branchorderbins(j).distaldiameter.values,0);
                inddata.termination.branchorderbins(j).distaldiameter.kurt  = kurtosis(inddata.termination.branchorderbins(j).distaldiameter.values,0);
                
                inddata.termination.branchorderbins(j).length.max   = max(inddata.termination.branchorderbins(j).length.values);
                inddata.termination.branchorderbins(j).length.mean  = mean(inddata.termination.branchorderbins(j).length.values);
                inddata.termination.branchorderbins(j).length.min   = min(inddata.termination.branchorderbins(j).length.values);
                inddata.termination.branchorderbins(j).length.std   = std(inddata.termination.branchorderbins(j).length.values);
                inddata.termination.branchorderbins(j).length.total = sum(inddata.termination.branchorderbins(j).length.values);
                inddata.termination.branchorderbins(j).length.skew  = skewness(inddata.termination.branchorderbins(j).length.values,0);
                inddata.termination.branchorderbins(j).length.kurt  = kurtosis(inddata.termination.branchorderbins(j).length.values,0);
                
                inddata.termination.branchorderbins(j).surfacearea.max   = max(inddata.termination.branchorderbins(j).surfacearea.values);
                inddata.termination.branchorderbins(j).surfacearea.mean  = mean(inddata.termination.branchorderbins(j).surfacearea.values);
                inddata.termination.branchorderbins(j).surfacearea.min   = min(inddata.termination.branchorderbins(j).surfacearea.values);
                inddata.termination.branchorderbins(j).surfacearea.std   = std(inddata.termination.branchorderbins(j).surfacearea.values);
                inddata.termination.branchorderbins(j).surfacearea.total = sum(inddata.termination.branchorderbins(j).surfacearea.values);
                inddata.termination.branchorderbins(j).surfacearea.skew  = skewness(inddata.termination.branchorderbins(j).surfacearea.values,0);
                inddata.termination.branchorderbins(j).surfacearea.kurt  = kurtosis(inddata.termination.branchorderbins(j).surfacearea.values,0);
                
                inddata.termination.branchorderbins(j).volume.max   = max(inddata.termination.branchorderbins(j).volume.values);
                inddata.termination.branchorderbins(j).volume.mean  = mean(inddata.termination.branchorderbins(j).volume.values);
                inddata.termination.branchorderbins(j).volume.min   = min(inddata.termination.branchorderbins(j).volume.values);
                inddata.termination.branchorderbins(j).volume.std   = std(inddata.termination.branchorderbins(j).volume.values);
                inddata.termination.branchorderbins(j).volume.total = sum(inddata.termination.branchorderbins(j).volume.values);
                inddata.termination.branchorderbins(j).volume.skew  = skewness(inddata.termination.branchorderbins(j).volume.values,0);
                inddata.termination.branchorderbins(j).volume.kurt  = kurtosis(inddata.termination.branchorderbins(j).volume.values,0);
                
                inddata.termination.branchorderbins(j).taperrate.max   = max(inddata.termination.branchorderbins(j).taperrate.values);
                %inddata.termination.branchorderbins(j).taperrate.mean  = mean(inddata.termination.branchorderbins(j).taperrate.values);
                inddata.termination.branchorderbins(j).taperrate.mean  = sum(([inddata.termination.branchorderbins(j).taperrate.values].*[inddata.termination.branchorderbins(j).length.values])/sum([inddata.termination.branchorderbins(j).length.values]));
                inddata.termination.branchorderbins(j).taperrate.min   = min(inddata.termination.branchorderbins(j).taperrate.values);
                inddata.termination.branchorderbins(j).taperrate.std   = std(inddata.termination.branchorderbins(j).taperrate.values);
                inddata.termination.branchorderbins(j).taperrate.total = sum(inddata.termination.branchorderbins(j).taperrate.values);
                inddata.termination.branchorderbins(j).taperrate.skew  = skewness(inddata.termination.branchorderbins(j).taperrate.values,0);
                inddata.termination.branchorderbins(j).taperrate.kurt  = kurtosis(inddata.termination.branchorderbins(j).taperrate.values,0);
                
                inddata.termination.branchorderbins(j).taperratio.max   = max(inddata.termination.branchorderbins(j).taperratio.values);
                inddata.termination.branchorderbins(j).taperratio.mean  = mean(inddata.termination.branchorderbins(j).taperratio.values);
                inddata.termination.branchorderbins(j).taperratio.min   = min(inddata.termination.branchorderbins(j).taperratio.values);
                inddata.termination.branchorderbins(j).taperratio.std   = std(inddata.termination.branchorderbins(j).taperratio.values);
                inddata.termination.branchorderbins(j).taperratio.total = sum(inddata.termination.branchorderbins(j).taperratio.values);
                inddata.termination.branchorderbins(j).taperratio.skew  = skewness(inddata.termination.branchorderbins(j).taperratio.values,0);
                inddata.termination.branchorderbins(j).taperratio.kurt  = kurtosis(inddata.termination.branchorderbins(j).taperratio.values,0);
                
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        
        for i = 1:length(popdata.termination.branchorderbins)
            if isfield(popdata.termination.branchorderbins(i).cable,'id')==1
                popdata.termination.branchorderbins(i).length.values               = [popdata.termination.branchorderbins(i).cable.length];
                popdata.termination.branchorderbins(i).surfacearea.values          = [popdata.termination.branchorderbins(i).cable.surfacearea];
                popdata.termination.branchorderbins(i).volume.values               = [popdata.termination.branchorderbins(i).cable.volume];
                popdata.termination.branchorderbins(i).taperrate.values            = [popdata.termination.branchorderbins(i).cable.taperrate];
                popdata.termination.branchorderbins(i).taperratio.values           = [popdata.termination.branchorderbins(i).cable.taperratio];
                popdata.termination.branchorderbins(i).proximaldiameter.values     = [popdata.termination.branchorderbins(i).cable.proximaldiameter];
                popdata.termination.branchorderbins(i).cylindricaldiameter.values  = [popdata.termination.branchorderbins(i).cable.cylindricaldiameter];
                popdata.termination.branchorderbins(i).distaldiameter.values       = [popdata.termination.branchorderbins(i).cable.distaldiameter];
            end
        end
        
        for i = 1:length(popdata.termination.branchorderbins)
            
            popdata.termination.branchorderbins(i).numbersegments       = sum([popdata.termination.branchorderbins(i).numbersegments.values]);
            
            popdata.termination.branchorderbins(i).proximaldiameter.max   = max(popdata.termination.branchorderbins(i).proximaldiameter.values);
            popdata.termination.branchorderbins(i).proximaldiameter.mean  = mean(popdata.termination.branchorderbins(i).proximaldiameter.values);
            popdata.termination.branchorderbins(i).proximaldiameter.min   = min(popdata.termination.branchorderbins(i).proximaldiameter.values);
            popdata.termination.branchorderbins(i).proximaldiameter.std   = std(popdata.termination.branchorderbins(i).proximaldiameter.values);
            popdata.termination.branchorderbins(i).proximaldiameter.total = sum(popdata.termination.branchorderbins(i).proximaldiameter.values);
            popdata.termination.branchorderbins(i).proximaldiameter.skew  = skewness(popdata.termination.branchorderbins(i).proximaldiameter.values,0);
            popdata.termination.branchorderbins(i).proximaldiameter.kurt  = kurtosis(popdata.termination.branchorderbins(i).proximaldiameter.values,0);
            
            popdata.termination.branchorderbins(i).cylindricaldiameter.max   = max(popdata.termination.branchorderbins(i).cylindricaldiameter.values);
            popdata.termination.branchorderbins(i).cylindricaldiameter.mean  = mean(popdata.termination.branchorderbins(i).cylindricaldiameter.values);
            popdata.termination.branchorderbins(i).cylindricaldiameter.min   = min(popdata.termination.branchorderbins(i).cylindricaldiameter.values);
            popdata.termination.branchorderbins(i).cylindricaldiameter.std   = std(popdata.termination.branchorderbins(i).cylindricaldiameter.values);
            popdata.termination.branchorderbins(i).cylindricaldiameter.total = sum(popdata.termination.branchorderbins(i).cylindricaldiameter.values);
            popdata.termination.branchorderbins(i).cylindricaldiameter.skew  = skewness(popdata.termination.branchorderbins(i).cylindricaldiameter.values,0);
            popdata.termination.branchorderbins(i).cylindricaldiameter.kurt  = kurtosis(popdata.termination.branchorderbins(i).cylindricaldiameter.values,0);
            
            popdata.termination.branchorderbins(i).distaldiameter.max   = max(popdata.termination.branchorderbins(i).distaldiameter.values);
            popdata.termination.branchorderbins(i).distaldiameter.mean  = mean(popdata.termination.branchorderbins(i).distaldiameter.values);
            popdata.termination.branchorderbins(i).distaldiameter.min   = min(popdata.termination.branchorderbins(i).distaldiameter.values);
            popdata.termination.branchorderbins(i).distaldiameter.std   = std(popdata.termination.branchorderbins(i).distaldiameter.values);
            popdata.termination.branchorderbins(i).distaldiameter.total = sum(popdata.termination.branchorderbins(i).distaldiameter.values);
            popdata.termination.branchorderbins(i).distaldiameter.skew  = skewness(popdata.termination.branchorderbins(i).distaldiameter.values,0);
            popdata.termination.branchorderbins(i).distaldiameter.kurt  = kurtosis(popdata.termination.branchorderbins(i).distaldiameter.values,0);
            
            popdata.termination.branchorderbins(i).length.max   = max(popdata.termination.branchorderbins(i).length.values);
            popdata.termination.branchorderbins(i).length.mean  = mean(popdata.termination.branchorderbins(i).length.values);
            popdata.termination.branchorderbins(i).length.min   = min(popdata.termination.branchorderbins(i).length.values);
            popdata.termination.branchorderbins(i).length.std   = std(popdata.termination.branchorderbins(i).length.values);
            popdata.termination.branchorderbins(i).length.total = sum(popdata.termination.branchorderbins(i).length.values);
            popdata.termination.branchorderbins(i).length.skew  = skewness(popdata.termination.branchorderbins(i).length.values,0);
            popdata.termination.branchorderbins(i).length.kurt  = kurtosis(popdata.termination.branchorderbins(i).length.values,0);
            
            popdata.termination.branchorderbins(i).surfacearea.max   = max(popdata.termination.branchorderbins(i).surfacearea.values);
            popdata.termination.branchorderbins(i).surfacearea.mean  = mean(popdata.termination.branchorderbins(i).surfacearea.values);
            popdata.termination.branchorderbins(i).surfacearea.min   = min(popdata.termination.branchorderbins(i).surfacearea.values);
            popdata.termination.branchorderbins(i).surfacearea.std   = std(popdata.termination.branchorderbins(i).surfacearea.values);
            popdata.termination.branchorderbins(i).surfacearea.total = sum(popdata.termination.branchorderbins(i).surfacearea.values);
            popdata.termination.branchorderbins(i).surfacearea.skew  = skewness(popdata.termination.branchorderbins(i).surfacearea.values,0);
            popdata.termination.branchorderbins(i).surfacearea.kurt  = kurtosis(popdata.termination.branchorderbins(i).surfacearea.values,0);
            
            popdata.termination.branchorderbins(i).volume.max   = max(popdata.termination.branchorderbins(i).volume.values);
            popdata.termination.branchorderbins(i).volume.mean  = mean(popdata.termination.branchorderbins(i).volume.values);
            popdata.termination.branchorderbins(i).volume.min   = min(popdata.termination.branchorderbins(i).volume.values);
            popdata.termination.branchorderbins(i).volume.std   = std(popdata.termination.branchorderbins(i).volume.values);
            popdata.termination.branchorderbins(i).volume.total = sum(popdata.termination.branchorderbins(i).volume.values);
            popdata.termination.branchorderbins(i).volume.skew  = skewness(popdata.termination.branchorderbins(i).volume.values,0);
            popdata.termination.branchorderbins(i).volume.kurt  = kurtosis(popdata.termination.branchorderbins(i).volume.values,0);
            
            popdata.termination.branchorderbins(i).taperrate.max   = max(popdata.termination.branchorderbins(i).taperrate.values);
            %popdata.termination.branchorderbins(i).taperrate.mean  = mean(popdata.termination.branchorderbins(i).taperrate.values);
            popdata.termination.branchorderbins(i).taperrate.mean  = sum(([popdata.termination.branchorderbins(i).taperrate.values].*[popdata.termination.branchorderbins(i).length.values])/sum([popdata.termination.branchorderbins(i).length.values]));
            popdata.termination.branchorderbins(i).taperrate.min   = min(popdata.termination.branchorderbins(i).taperrate.values);
            popdata.termination.branchorderbins(i).taperrate.std   = std(popdata.termination.branchorderbins(i).taperrate.values);
            popdata.termination.branchorderbins(i).taperrate.total = sum(popdata.termination.branchorderbins(i).taperrate.values);
            popdata.termination.branchorderbins(i).taperrate.skew  = skewness(popdata.termination.branchorderbins(i).taperrate.values,0);
            popdata.termination.branchorderbins(i).taperrate.kurt  = kurtosis(popdata.termination.branchorderbins(i).taperrate.values,0);
            
            popdata.termination.branchorderbins(i).taperratio.max   = max(popdata.termination.branchorderbins(i).taperratio.values);
            popdata.termination.branchorderbins(i).taperratio.mean  = mean(popdata.termination.branchorderbins(i).taperratio.values);
            popdata.termination.branchorderbins(i).taperratio.min   = min(popdata.termination.branchorderbins(i).taperratio.values);
            popdata.termination.branchorderbins(i).taperratio.std   = std(popdata.termination.branchorderbins(i).taperratio.values);
            popdata.termination.branchorderbins(i).taperratio.total = sum(popdata.termination.branchorderbins(i).taperratio.values);
            popdata.termination.branchorderbins(i).taperratio.skew  = skewness(popdata.termination.branchorderbins(i).taperratio.values,0);
            popdata.termination.branchorderbins(i).taperratio.kurt  = kurtosis(popdata.termination.branchorderbins(i).taperratio.values,0);
            
        end
        
        for i = 1:typeanalysis.maxbranchorder.max
            typeanalysis.termination.branchorder.branchorder(i)                 = i;
            typeanalysis.termination.branchorder.numbersegments(i).values       = [];
            typeanalysis.termination.branchorder.length(i).values               = [];
            typeanalysis.termination.branchorder.totallength(i).values          = [];
            typeanalysis.termination.branchorder.surfacearea(i).values          = [];
            typeanalysis.termination.branchorder.totalsurfacearea(i).values     = [];
            typeanalysis.termination.branchorder.volume(i).values               = [];
            typeanalysis.termination.branchorder.totalvolume(i).values          = [];
            typeanalysis.termination.branchorder.taperrate(i).values            = [];
            typeanalysis.termination.branchorder.taperratio(i).values           = [];
            typeanalysis.termination.branchorder.proximaldiameter(i).values     = [];
            typeanalysis.termination.branchorder.cylindricaldiameter(i).values  = [];
            typeanalysis.termination.branchorder.distaldiameter(i).values       = [];
        end
        
        
        for i = 1:length(data.individual)
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            for j = 1:inddata.maxbranchorder
                typeanalysis.termination.branchorder.numbersegments(j).values     = [[typeanalysis.termination.branchorder.numbersegments(j).values] [inddata.termination.branchorderbins(j).numbersegments]];
                typeanalysis.termination.branchorder.totallength(j).values        = [[typeanalysis.termination.branchorder.totallength(j).values] [inddata.termination.branchorderbins(j).length.total]];
                typeanalysis.termination.branchorder.totalsurfacearea(j).values   = [[typeanalysis.termination.branchorder.totalsurfacearea(j).values] [inddata.termination.branchorderbins(j).surfacearea.total]];
                typeanalysis.termination.branchorder.totalvolume(j).values        = [[typeanalysis.termination.branchorder.totalvolume(j).values] [inddata.termination.branchorderbins(j).volume.total]];
            end
        end
        
        for i = 1:typeanalysis.maxbranchorder.max
            if isfield(popdata.termination.branchorderbins(i).cable,'id')==1
                typeanalysis.termination.branchorder.length(i).values                  = [popdata.termination.branchorderbins(i).cable.length];
                typeanalysis.termination.branchorder.surfacearea(i).values             = [popdata.termination.branchorderbins(i).cable.surfacearea];
                typeanalysis.termination.branchorder.volume(i).values                  = [popdata.termination.branchorderbins(i).cable.volume];
                typeanalysis.termination.branchorder.taperrate(i).values               = [popdata.termination.branchorderbins(i).cable.taperrate];
                typeanalysis.termination.branchorder.taperratio(i).values              = [popdata.termination.branchorderbins(i).cable.taperratio];
                typeanalysis.termination.branchorder.proximaldiameter(i).values        = [popdata.termination.branchorderbins(i).cable.proximaldiameter];
                typeanalysis.termination.branchorder.cylindricaldiameter(i).values     = [popdata.termination.branchorderbins(i).cable.cylindricaldiameter];
                typeanalysis.termination.branchorder.distaldiameter(i).values          = [popdata.termination.branchorderbins(i).cable.distaldiameter];
            end
        end
        
        for i = 1:typeanalysis.maxbranchorder.max
            
            typeanalysis.termination.branchorder.numbersegments(i).mean  = mean(typeanalysis.termination.branchorder.numbersegments(i).values);
            typeanalysis.termination.branchorder.numbersegments(i).std   = std(typeanalysis.termination.branchorder.numbersegments(i).values);
            typeanalysis.termination.branchorder.numbersegments(i).skew  = skewness(typeanalysis.termination.branchorder.numbersegments(i).values,0);
            typeanalysis.termination.branchorder.numbersegments(i).kurt  = kurtosis(typeanalysis.termination.branchorder.numbersegments(i).values,0);
            typeanalysis.termination.branchorder.numbersegments(i).min   = min(typeanalysis.termination.branchorder.numbersegments(i).values);
            typeanalysis.termination.branchorder.numbersegments(i).max   = max(typeanalysis.termination.branchorder.numbersegments(i).values);
            typeanalysis.termination.branchorder.numbersegments(i).total = sum(typeanalysis.termination.branchorder.numbersegments(i).values);
            
            typeanalysis.termination.branchorder.totallength(i).mean = mean(typeanalysis.termination.branchorder.totallength(i).values);
            typeanalysis.termination.branchorder.totallength(i).std  = std(typeanalysis.termination.branchorder.totallength(i).values);
            typeanalysis.termination.branchorder.totallength(i).skew = skewness(typeanalysis.termination.branchorder.totallength(i).values,0);
            typeanalysis.termination.branchorder.totallength(i).kurt = kurtosis(typeanalysis.termination.branchorder.totallength(i).values,0);
            typeanalysis.termination.branchorder.totallength(i).min  = min(typeanalysis.termination.branchorder.totallength(i).values);
            typeanalysis.termination.branchorder.totallength(i).max  = max(typeanalysis.termination.branchorder.totallength(i).values);
            
            typeanalysis.termination.branchorder.length(i).mean  = mean(typeanalysis.termination.branchorder.length(i).values);
            typeanalysis.termination.branchorder.length(i).std   = std(typeanalysis.termination.branchorder.length(i).values);
            typeanalysis.termination.branchorder.length(i).skew  = skewness(typeanalysis.termination.branchorder.length(i).values,0);
            typeanalysis.termination.branchorder.length(i).kurt  = kurtosis(typeanalysis.termination.branchorder.length(i).values,0);
            typeanalysis.termination.branchorder.length(i).min   = min(typeanalysis.termination.branchorder.length(i).values);
            typeanalysis.termination.branchorder.length(i).max   = max(typeanalysis.termination.branchorder.length(i).values);
            typeanalysis.termination.branchorder.length(i).total = sum(typeanalysis.termination.branchorder.length(i).values);
            
            typeanalysis.termination.branchorder.totalsurfacearea(i).mean = mean(typeanalysis.termination.branchorder.totalsurfacearea(i).values);
            typeanalysis.termination.branchorder.totalsurfacearea(i).std  = std(typeanalysis.termination.branchorder.totalsurfacearea(i).values);
            typeanalysis.termination.branchorder.totalsurfacearea(i).skew = skewness(typeanalysis.termination.branchorder.totalsurfacearea(i).values,0);
            typeanalysis.termination.branchorder.totalsurfacearea(i).kurt = kurtosis(typeanalysis.termination.branchorder.totalsurfacearea(i).values,0);
            typeanalysis.termination.branchorder.totalsurfacearea(i).min  = min(typeanalysis.termination.branchorder.totalsurfacearea(i).values);
            typeanalysis.termination.branchorder.totalsurfacearea(i).max  = max(typeanalysis.termination.branchorder.totalsurfacearea(i).values);
            
            typeanalysis.termination.branchorder.surfacearea(i).mean  = mean(typeanalysis.termination.branchorder.surfacearea(i).values);
            typeanalysis.termination.branchorder.surfacearea(i).std   = std(typeanalysis.termination.branchorder.surfacearea(i).values);
            typeanalysis.termination.branchorder.surfacearea(i).skew  = skewness(typeanalysis.termination.branchorder.surfacearea(i).values,0);
            typeanalysis.termination.branchorder.surfacearea(i).kurt  = kurtosis(typeanalysis.termination.branchorder.surfacearea(i).values,0);
            typeanalysis.termination.branchorder.surfacearea(i).min   = min(typeanalysis.termination.branchorder.surfacearea(i).values);
            typeanalysis.termination.branchorder.surfacearea(i).max   = max(typeanalysis.termination.branchorder.surfacearea(i).values);
            typeanalysis.termination.branchorder.surfacearea(i).total = sum(typeanalysis.termination.branchorder.surfacearea(i).values);
            
            typeanalysis.termination.branchorder.totalvolume(i).mean = mean(typeanalysis.termination.branchorder.totalvolume(i).values);
            typeanalysis.termination.branchorder.totalvolume(i).std  = std(typeanalysis.termination.branchorder.totalvolume(i).values);
            typeanalysis.termination.branchorder.totalvolume(i).skew = skewness(typeanalysis.termination.branchorder.totalvolume(i).values,0);
            typeanalysis.termination.branchorder.totalvolume(i).kurt = kurtosis(typeanalysis.termination.branchorder.totalvolume(i).values,0);
            typeanalysis.termination.branchorder.totalvolume(i).min  = min(typeanalysis.termination.branchorder.totalvolume(i).values);
            typeanalysis.termination.branchorder.totalvolume(i).max  = max(typeanalysis.termination.branchorder.totalvolume(i).values);
            
            typeanalysis.termination.branchorder.volume(i).mean  = mean(typeanalysis.termination.branchorder.volume(i).values);
            typeanalysis.termination.branchorder.volume(i).std   = std(typeanalysis.termination.branchorder.volume(i).values);
            typeanalysis.termination.branchorder.volume(i).skew  = skewness(typeanalysis.termination.branchorder.volume(i).values,0);
            typeanalysis.termination.branchorder.volume(i).kurt  = kurtosis(typeanalysis.termination.branchorder.volume(i).values,0);
            typeanalysis.termination.branchorder.volume(i).min   = min(typeanalysis.termination.branchorder.volume(i).values);
            typeanalysis.termination.branchorder.volume(i).max   = max(typeanalysis.termination.branchorder.volume(i).values);
            typeanalysis.termination.branchorder.volume(i).total = sum(typeanalysis.termination.branchorder.volume(i).values);
            
            %typeanalysis.termination.branchorder.taperrate(i).mean = mean(typeanalysis.termination.branchorder.taperrate(i).values);
            typeanalysis.termination.branchorder.taperrate(i).mean = sum(([typeanalysis.termination.branchorder.taperrate(i).values].*[typeanalysis.termination.branchorder.length(i).values])/sum([typeanalysis.termination.branchorder.length(i).values]));
            typeanalysis.termination.branchorder.taperrate(i).std  = std(typeanalysis.termination.branchorder.taperrate(i).values);
            typeanalysis.termination.branchorder.taperrate(i).skew = skewness(typeanalysis.termination.branchorder.taperrate(i).values,0);
            typeanalysis.termination.branchorder.taperrate(i).kurt = kurtosis(typeanalysis.termination.branchorder.taperrate(i).values,0);
            typeanalysis.termination.branchorder.taperrate(i).min  = min(typeanalysis.termination.branchorder.taperrate(i).values);
            typeanalysis.termination.branchorder.taperrate(i).max  = max(typeanalysis.termination.branchorder.taperrate(i).values);
            
            typeanalysis.termination.branchorder.taperratio(i).mean = mean(typeanalysis.termination.branchorder.taperratio(i).values);
            typeanalysis.termination.branchorder.taperratio(i).std  = std(typeanalysis.termination.branchorder.taperratio(i).values);
            typeanalysis.termination.branchorder.taperratio(i).skew = skewness(typeanalysis.termination.branchorder.taperratio(i).values,0);
            typeanalysis.termination.branchorder.taperratio(i).kurt = kurtosis(typeanalysis.termination.branchorder.taperratio(i).values,0);
            typeanalysis.termination.branchorder.taperratio(i).min  = min(typeanalysis.termination.branchorder.taperratio(i).values);
            typeanalysis.termination.branchorder.taperratio(i).max  = max(typeanalysis.termination.branchorder.taperratio(i).values);
            
            typeanalysis.termination.branchorder.proximaldiameter(i).mean = mean(typeanalysis.termination.branchorder.proximaldiameter(i).values);
            typeanalysis.termination.branchorder.proximaldiameter(i).std  = std(typeanalysis.termination.branchorder.proximaldiameter(i).values);
            typeanalysis.termination.branchorder.proximaldiameter(i).skew = skewness(typeanalysis.termination.branchorder.proximaldiameter(i).values,0);
            typeanalysis.termination.branchorder.proximaldiameter(i).kurt = kurtosis(typeanalysis.termination.branchorder.proximaldiameter(i).values,0);
            typeanalysis.termination.branchorder.proximaldiameter(i).min  = min(typeanalysis.termination.branchorder.proximaldiameter(i).values);
            typeanalysis.termination.branchorder.proximaldiameter(i).max  = max(typeanalysis.termination.branchorder.proximaldiameter(i).values);
            
            typeanalysis.termination.branchorder.cylindricaldiameter(i).mean = mean(typeanalysis.termination.branchorder.cylindricaldiameter(i).values);
            typeanalysis.termination.branchorder.cylindricaldiameter(i).std  = std(typeanalysis.termination.branchorder.cylindricaldiameter(i).values);
            typeanalysis.termination.branchorder.cylindricaldiameter(i).skew = skewness(typeanalysis.termination.branchorder.cylindricaldiameter(i).values,0);
            typeanalysis.termination.branchorder.cylindricaldiameter(i).kurt = kurtosis(typeanalysis.termination.branchorder.cylindricaldiameter(i).values,0);
            typeanalysis.termination.branchorder.cylindricaldiameter(i).min  = min(typeanalysis.termination.branchorder.cylindricaldiameter(i).values);
            typeanalysis.termination.branchorder.cylindricaldiameter(i).max  = max(typeanalysis.termination.branchorder.cylindricaldiameter(i).values);
            
            typeanalysis.termination.branchorder.distaldiameter(i).mean = mean(typeanalysis.termination.branchorder.distaldiameter(i).values);
            typeanalysis.termination.branchorder.distaldiameter(i).std  = std(typeanalysis.termination.branchorder.distaldiameter(i).values);
            typeanalysis.termination.branchorder.distaldiameter(i).skew = skewness(typeanalysis.termination.branchorder.distaldiameter(i).values,0);
            typeanalysis.termination.branchorder.distaldiameter(i).kurt = kurtosis(typeanalysis.termination.branchorder.distaldiameter(i).values,0);
            typeanalysis.termination.branchorder.distaldiameter(i).min  = min(typeanalysis.termination.branchorder.distaldiameter(i).values);
            typeanalysis.termination.branchorder.distaldiameter(i).max  = max(typeanalysis.termination.branchorder.distaldiameter(i).values);
            
            %typeanalysis.termination.branchorder.terminationprobability.length(i) = typeanalysis.termination.branchorder.numberterminations(i).total / typeanalysis.termination.branchorder.length(i).total;
            typeanalysis.termination.branchorder.terminationprobability.length(i) = typeanalysis.termination.branchorder.numbersegments(i).total / typeanalysis.termination.branchorder.length(i).total;
            
            %typeanalysis.termination.branchorder.terminationprobability.surfacearea(i) = typeanalysis.termination.branchorder.numberterminations(i).total / typeanalysis.termination.branchorder.surfacearea(i).total;
            typeanalysis.termination.branchorder.terminationprobability.surfacearea(i) = typeanalysis.termination.branchorder.numbersegments(i).total / typeanalysis.termination.branchorder.surfacearea(i).total;
            
            %typeanalysis.termination.branchorder.terminationprobability.volume(i) = typeanalysis.termination.branchorder.numberterminations(i).total / typeanalysis.termination.branchorder.volume(i).total;
            typeanalysis.termination.branchorder.terminationprobability.volume(i) = typeanalysis.termination.branchorder.numbersegments(i).total / typeanalysis.termination.branchorder.volume(i).total;
            
            
        end
        
        eval(['analysis.' currentpiecetype ' = typeanalysis;']);
        eval(['data.population.' currentpiecetype ' = popdata;']);
        
    end
end

warning('on', 'MATLAB:divideByZero');