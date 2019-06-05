function [data,analysis] = cableanalyzer(data,analysis)

disp('   Cable analysis started.');

warning('off', 'MATLAB:divideByZero');

piecetypes{1} = 'soma';
piecetypes{2} = 'axon';
piecetypes{3} = 'dendrite';
piecetypes{4} = 'apical';

for piecetype = 2:4
    
    if isfield(data.population,piecetypes{piecetype})
        
        currentpiecetype = piecetypes{piecetype};
        clear typeanalysis;
        eval(['typeanalysis = analysis.' currentpiecetype ';']);
        
        numberofcables = 0;
        numberofbifurcations = 0;
        numberofterminations = 0;
        
        for i = 1:length(data.individual)
            
            if isfield(data.individual(i),piecetypes{piecetype})
                
                clear inddata;
                eval(['inddata = data.individual(i).' currentpiecetype ';']);
                
                for j = 1:length(inddata.cablebins)
                    
                    numberofcables = numberofcables + 1;
                    
                    typeanalysis.cable.branchorder.values(numberofcables)            = inddata.cablebins(j).branchorder;
                    typeanalysis.cable.degree.values(numberofcables)                 = inddata.cablebins(j).degree;
                    typeanalysis.cable.proximaldiameter.values(numberofcables)       = inddata.cablebins(j).proximaldiameter;
                    typeanalysis.cable.cylindricaldiameter.values(numberofcables)    = inddata.cablebins(j).cylindricaldiameter;
                    typeanalysis.cable.distaldiameter.values(numberofcables)         = inddata.cablebins(j).distaldiameter;
                    typeanalysis.cable.length.values(numberofcables)                 = inddata.cablebins(j).length;
                    typeanalysis.cable.surfacearea.values(numberofcables)            = inddata.cablebins(j).surfacearea;
                    typeanalysis.cable.volume.values(numberofcables)                 = inddata.cablebins(j).volume;
                    typeanalysis.cable.proximalxdirection.values(numberofcables)     = inddata.cablebins(j).proximalxdirection;
                    typeanalysis.cable.proximalydirection.values(numberofcables)     = inddata.cablebins(j).proximalydirection;
                    typeanalysis.cable.proximalzdirection.values(numberofcables)     = inddata.cablebins(j).proximalzdirection;
                    typeanalysis.cable.distalxdirection.values(numberofcables)       = inddata.cablebins(j).distalxdirection;
                    typeanalysis.cable.distalydirection.values(numberofcables)       = inddata.cablebins(j).distalydirection;
                    typeanalysis.cable.distalzdirection.values(numberofcables)       = inddata.cablebins(j).distalzdirection;
                    typeanalysis.cable.taperrate.values(numberofcables)              = inddata.cablebins(j).taperrate;
                    typeanalysis.cable.taperratio.values(numberofcables)             = inddata.cablebins(j).taperratio;
                    typeanalysis.cable.proximalpathlength.values(numberofcables)     = inddata.cablebins(j).proximalpathlength;
                    typeanalysis.cable.distalpathlength.values(numberofcables)       = inddata.cablebins(j).distalpathlength;
                    typeanalysis.cable.proximalradialdistance.values(numberofcables) = inddata.cablebins(j).proximalradialdistance;
                    typeanalysis.cable.distalradialdistance.values(numberofcables)   = inddata.cablebins(j).distalradialdistance;
                    typeanalysis.cable.proximaltaperrate.values(numberofcables)      = inddata.cablebins(j).proximaltaperrate;
                    typeanalysis.cable.distaltaperrate.values(numberofcables)        = inddata.cablebins(j).distaltaperrate;
                    
                    if strcmp(inddata.cablebins(j).distaltype,'bifurcation') == 1
                        
                        numberofbifurcations = numberofbifurcations + 1;
                        
                        typeanalysis.cable.rallratio.values(numberofbifurcations)            = inddata.cablebins(j).rallratio;
                        
                        typeanalysis.cable.rallratio1.values(numberofbifurcations)           = inddata.cablebins(j).rallratio1;
                        typeanalysis.cable.rallratio2.values(numberofbifurcations)           = inddata.cablebins(j).rallratio2;
                        typeanalysis.cable.rallratio3.values(numberofbifurcations)           = inddata.cablebins(j).rallratio3;
                        typeanalysis.cable.daughter1diameter.values(numberofbifurcations)    = inddata.cablebins(j).daughter1diameter;
                        typeanalysis.cable.daughter2diameter.values(numberofbifurcations)    = inddata.cablebins(j).daughter2diameter;
                        typeanalysis.cable.daughterratio.values(numberofbifurcations)        = inddata.cablebins(j).daughterratio;
                        typeanalysis.cable.parentdaughterratio.values(numberofbifurcations)  = inddata.cablebins(j).parentdaughterratio;
                        typeanalysis.cable.parentdaughter2ratio.values(numberofbifurcations) = inddata.cablebins(j).parentdaughter2ratio;
                        
                        typeanalysis.bifurcation.cable.branchorder.values(numberofbifurcations)            = inddata.cablebins(j).branchorder;
                        typeanalysis.bifurcation.cable.degree.values(numberofbifurcations)                 = inddata.cablebins(j).degree;
                        typeanalysis.bifurcation.cable.proximaldiameter.values(numberofbifurcations)       = inddata.cablebins(j).proximaldiameter;
                        typeanalysis.bifurcation.cable.cylindricaldiameter.values(numberofbifurcations)    = inddata.cablebins(j).cylindricaldiameter;
                        typeanalysis.bifurcation.cable.distaldiameter.values(numberofbifurcations)         = inddata.cablebins(j).distaldiameter;
                        typeanalysis.bifurcation.cable.length.values(numberofbifurcations)                 = inddata.cablebins(j).length;
                        typeanalysis.bifurcation.cable.surfacearea.values(numberofbifurcations)            = inddata.cablebins(j).surfacearea;
                        typeanalysis.bifurcation.cable.volume.values(numberofbifurcations)                 = inddata.cablebins(j).volume;
                        typeanalysis.bifurcation.cable.proximalxdirection.values(numberofbifurcations)     = inddata.cablebins(j).proximalxdirection;
                        typeanalysis.bifurcation.cable.proximalydirection.values(numberofbifurcations)     = inddata.cablebins(j).proximalydirection;
                        typeanalysis.bifurcation.cable.proximalzdirection.values(numberofbifurcations)     = inddata.cablebins(j).proximalzdirection;
                        typeanalysis.bifurcation.cable.distalxdirection.values(numberofbifurcations)       = inddata.cablebins(j).distalxdirection;
                        typeanalysis.bifurcation.cable.distalydirection.values(numberofbifurcations)       = inddata.cablebins(j).distalydirection;
                        typeanalysis.bifurcation.cable.distalzdirection.values(numberofbifurcations)       = inddata.cablebins(j).distalzdirection;
                        typeanalysis.bifurcation.cable.taperrate.values(numberofbifurcations)              = inddata.cablebins(j).taperrate;
                        typeanalysis.bifurcation.cable.taperratio.values(numberofbifurcations)             = inddata.cablebins(j).taperratio;
                        typeanalysis.bifurcation.cable.proximalpathlength.values(numberofbifurcations)     = inddata.cablebins(j).proximalpathlength;
                        typeanalysis.bifurcation.cable.distalpathlength.values(numberofbifurcations)       = inddata.cablebins(j).distalpathlength;
                        typeanalysis.bifurcation.cable.proximalradialdistance.values(numberofbifurcations) = inddata.cablebins(j).proximalradialdistance;
                        typeanalysis.bifurcation.cable.distalradialdistance.values(numberofbifurcations)   = inddata.cablebins(j).distalradialdistance;
                        typeanalysis.bifurcation.cable.proximaltaperrate.values(numberofbifurcations)            = inddata.cablebins(j).proximaltaperrate;
                        typeanalysis.bifurcation.cable.distaltaperrate.values(numberofbifurcations)              = inddata.cablebins(j).distaltaperrate;
                        typeanalysis.bifurcation.cable.rallratio.values(numberofbifurcations)              = inddata.cablebins(j).rallratio;
                        typeanalysis.bifurcation.cable.rallratio1.values(numberofbifurcations)             = inddata.cablebins(j).rallratio1;
                        typeanalysis.bifurcation.cable.rallratio2.values(numberofbifurcations)             = inddata.cablebins(j).rallratio2;
                        typeanalysis.bifurcation.cable.rallratio3.values(numberofbifurcations)             = inddata.cablebins(j).rallratio3;
                        typeanalysis.bifurcation.cable.daughter1diameter.values(numberofbifurcations)      = inddata.cablebins(j).daughter1diameter;
                        typeanalysis.bifurcation.cable.daughter2diameter.values(numberofbifurcations)      = inddata.cablebins(j).daughter2diameter;
                        typeanalysis.bifurcation.cable.daughterratio.values(numberofbifurcations)          = inddata.cablebins(j).daughterratio;
                        typeanalysis.bifurcation.cable.parentdaughterratio.values(numberofbifurcations)    = inddata.cablebins(j).parentdaughterratio;
                        typeanalysis.bifurcation.cable.parentdaughter2ratio.values(numberofbifurcations)   = inddata.cablebins(j).parentdaughter2ratio;
                        
                        typeanalysis.bifurcation.cable.partitionasymmetry.values(numberofbifurcations)     = inddata.cablebins(j).partitionasymmetry;
                        typeanalysis.bifurcation.cable.surfaceasymmetry.values(numberofbifurcations)       = inddata.cablebins(j).surfaceasymmetry;
                        
                    elseif strcmp(inddata.cablebins(j).distaltype,'m-furcation') == 1
                        
%                         numberofbifurcations = numberofbifurcations + 1;
%                         
%                         typeanalysis.cable.rallratio.values(numberofbifurcations)            = NaN;
%                         typeanalysis.cable.rallratio1.values(numberofbifurcations)           = NaN;
%                         typeanalysis.cable.rallratio2.values(numberofbifurcations)           = NaN;
%                         typeanalysis.cable.rallratio3.values(numberofbifurcations)           = NaN;
%                         typeanalysis.cable.daughter1diameter.values(numberofbifurcations)    = NaN;
%                         typeanalysis.cable.daughter2diameter.values(numberofbifurcations)    = NaN;
%                         typeanalysis.cable.daughterratio.values(numberofbifurcations)        = NaN;
%                         typeanalysis.cable.parentdaughterratio.values(numberofbifurcations)  = NaN;
%                         typeanalysis.cable.parentdaughter2ratio.values(numberofbifurcations) = NaN;
%                         
%                         typeanalysis.bifurcation.cable.branchorder.values(numberofbifurcations)            = inddata.cablebins(j).branchorder;
%                         typeanalysis.bifurcation.cable.degree.values(numberofbifurcations)                 = inddata.cablebins(j).degree;
%                         typeanalysis.bifurcation.cable.proximaldiameter.values(numberofbifurcations)       = inddata.cablebins(j).proximaldiameter;
%                         typeanalysis.bifurcation.cable.cylindricaldiameter.values(numberofbifurcations)    = inddata.cablebins(j).cylindricaldiameter;
%                         typeanalysis.bifurcation.cable.distaldiameter.values(numberofbifurcations)         = inddata.cablebins(j).distaldiameter;
%                         typeanalysis.bifurcation.cable.length.values(numberofbifurcations)                 = inddata.cablebins(j).length;
%                         typeanalysis.bifurcation.cable.surfacearea.values(numberofbifurcations)            = inddata.cablebins(j).surfacearea;
%                         typeanalysis.bifurcation.cable.volume.values(numberofbifurcations)                 = inddata.cablebins(j).volume;
%                         typeanalysis.bifurcation.cable.proximalxdirection.values(numberofbifurcations)     = inddata.cablebins(j).proximalxdirection;
%                         typeanalysis.bifurcation.cable.proximalydirection.values(numberofbifurcations)     = inddata.cablebins(j).proximalydirection;
%                         typeanalysis.bifurcation.cable.proximalzdirection.values(numberofbifurcations)     = inddata.cablebins(j).proximalzdirection;
%                         typeanalysis.bifurcation.cable.distalxdirection.values(numberofbifurcations)       = inddata.cablebins(j).distalxdirection;
%                         typeanalysis.bifurcation.cable.distalydirection.values(numberofbifurcations)       = inddata.cablebins(j).distalydirection;
%                         typeanalysis.bifurcation.cable.distalzdirection.values(numberofbifurcations)       = inddata.cablebins(j).distalzdirection;
%                         typeanalysis.bifurcation.cable.taperrate.values(numberofbifurcations)              = inddata.cablebins(j).taperrate;
%                         typeanalysis.bifurcation.cable.taperratio.values(numberofbifurcations)             = inddata.cablebins(j).taperratio;
%                         typeanalysis.bifurcation.cable.proximalpathlength.values(numberofbifurcations)     = inddata.cablebins(j).proximalpathlength;
%                         typeanalysis.bifurcation.cable.distalpathlength.values(numberofbifurcations)       = inddata.cablebins(j).distalpathlength;
%                         typeanalysis.bifurcation.cable.proximalradialdistance.values(numberofbifurcations) = inddata.cablebins(j).proximalradialdistance;
%                         typeanalysis.bifurcation.cable.distalradialdistance.values(numberofbifurcations)   = inddata.cablebins(j).distalradialdistance;
%                         typeanalysis.bifurcation.cable.proximaltaperrate.values(numberofbifurcations)            = inddata.cablebins(j).proximaltaperrate;
%                         typeanalysis.bifurcation.cable.distaltaperrate.values(numberofbifurcations)              = inddata.cablebins(j).distaltaperrate;
%                         
%                         typeanalysis.bifurcation.cable.rallratio.values(numberofbifurcations)              = NaN;
%                         typeanalysis.bifurcation.cable.rallratio1.values(numberofbifurcations)             = NaN;
%                         typeanalysis.bifurcation.cable.rallratio2.values(numberofbifurcations)             = NaN;
%                         typeanalysis.bifurcation.cable.rallratio3.values(numberofbifurcations)             = NaN;
%                         typeanalysis.bifurcation.cable.daughter1diameter.values(numberofbifurcations)      = NaN;
%                         typeanalysis.bifurcation.cable.daughter2diameter.values(numberofbifurcations)      = NaN;
%                         typeanalysis.bifurcation.cable.daughterratio.values(numberofbifurcations)          = NaN;
%                         typeanalysis.bifurcation.cable.parentdaughterratio.values(numberofbifurcations)    = NaN;
%                         typeanalysis.bifurcation.cable.parentdaughter2ratio.values(numberofbifurcations)   = NaN;
%                         
%                         typeanalysis.bifurcation.cable.partitionasymmetry.values(numberofbifurcations)     = inddata.cablebins(j).partitionasymmetry;
%                         typeanalysis.bifurcation.cable.surfaceasymmetry.values(numberofbifurcations)       = inddata.cablebins(j).surfaceasymmetry;
                        
                    elseif strcmp(inddata.cablebins(j).distaltype,'termination') == 1
                        
                        numberofterminations = numberofterminations + 1;
                        
                        typeanalysis.termination.cable.branchorder.values(numberofterminations)            = inddata.cablebins(j).branchorder;
                        typeanalysis.termination.cable.degree.values(numberofterminations)                 = inddata.cablebins(j).degree;
                        typeanalysis.termination.cable.proximaldiameter.values(numberofterminations)       = inddata.cablebins(j).proximaldiameter;
                        typeanalysis.termination.cable.cylindricaldiameter.values(numberofterminations)    = inddata.cablebins(j).cylindricaldiameter;
                        typeanalysis.termination.cable.distaldiameter.values(numberofterminations)         = inddata.cablebins(j).distaldiameter;
                        typeanalysis.termination.cable.length.values(numberofterminations)                 = inddata.cablebins(j).length;
                        typeanalysis.termination.cable.surfacearea.values(numberofterminations)            = inddata.cablebins(j).surfacearea;
                        typeanalysis.termination.cable.volume.values(numberofterminations)                 = inddata.cablebins(j).volume;
                        typeanalysis.termination.cable.proximalxdirection.values(numberofterminations)     = inddata.cablebins(j).proximalxdirection;
                        typeanalysis.termination.cable.proximalydirection.values(numberofterminations)     = inddata.cablebins(j).proximalydirection;
                        typeanalysis.termination.cable.proximalzdirection.values(numberofterminations)     = inddata.cablebins(j).proximalzdirection;
                        typeanalysis.termination.cable.distalxdirection.values(numberofterminations)       = inddata.cablebins(j).distalxdirection;
                        typeanalysis.termination.cable.distalydirection.values(numberofterminations)       = inddata.cablebins(j).distalydirection;
                        typeanalysis.termination.cable.distalzdirection.values(numberofterminations)       = inddata.cablebins(j).distalzdirection;
                        typeanalysis.termination.cable.taperrate.values(numberofterminations)              = inddata.cablebins(j).taperrate;
                        typeanalysis.termination.cable.taperratio.values(numberofterminations)             = inddata.cablebins(j).taperratio;
                        typeanalysis.termination.cable.proximalpathlength.values(numberofterminations)     = inddata.cablebins(j).proximalpathlength;
                        typeanalysis.termination.cable.distalpathlength.values(numberofterminations)       = inddata.cablebins(j).distalpathlength;
                        typeanalysis.termination.cable.proximalradialdistance.values(numberofterminations) = inddata.cablebins(j).proximalradialdistance;
                        typeanalysis.termination.cable.distalradialdistance.values(numberofterminations)   = inddata.cablebins(j).distalradialdistance;
                        typeanalysis.termination.cable.proximaltaperrate.values(numberofterminations)            = inddata.cablebins(j).proximaltaperrate;
                        typeanalysis.termination.cable.distaltaperrate.values(numberofterminations)              = inddata.cablebins(j).distaltaperrate;
                    else
                        
                        disp('Error in cable distal type in ''cableanalyzer.m''.');
                        keyboard
                        
                    end
                end
            end
        end
        
        typeanalysis.cable.branchorder.max   = max(typeanalysis.cable.branchorder.values);
        typeanalysis.cable.branchorder.min   = min(typeanalysis.cable.branchorder.values);
        typeanalysis.cable.branchorder.mean  = mean(typeanalysis.cable.branchorder.values);
        typeanalysis.cable.branchorder.std   = std(typeanalysis.cable.branchorder.values);
        typeanalysis.cable.branchorder.total = sum(typeanalysis.cable.branchorder.values);
        typeanalysis.cable.branchorder.skew  = skewness(typeanalysis.cable.branchorder.values,0);
        typeanalysis.cable.branchorder.kurt  = kurtosis(typeanalysis.cable.branchorder.values,0);
        
        typeanalysis.cable.degree.max   = max(typeanalysis.cable.degree.values);
        typeanalysis.cable.degree.min   = min(typeanalysis.cable.degree.values);
        typeanalysis.cable.degree.mean  = mean(typeanalysis.cable.degree.values);
        typeanalysis.cable.degree.std   = std(typeanalysis.cable.degree.values);
        typeanalysis.cable.degree.total = sum(typeanalysis.cable.degree.values);
        typeanalysis.cable.degree.skew  = skewness(typeanalysis.cable.degree.values,0);
        typeanalysis.cable.degree.kurt  = kurtosis(typeanalysis.cable.degree.values,0);
        
        typeanalysis.cable.proximaldiameter.max   = max(typeanalysis.cable.proximaldiameter.values);
        typeanalysis.cable.proximaldiameter.min   = min(typeanalysis.cable.proximaldiameter.values);
        typeanalysis.cable.proximaldiameter.mean  = mean(typeanalysis.cable.proximaldiameter.values);
        typeanalysis.cable.proximaldiameter.std   = std(typeanalysis.cable.proximaldiameter.values);
        typeanalysis.cable.proximaldiameter.total = sum(typeanalysis.cable.proximaldiameter.values);
        typeanalysis.cable.proximaldiameter.skew  = skewness(typeanalysis.cable.proximaldiameter.values,0);
        typeanalysis.cable.proximaldiameter.kurt  = kurtosis(typeanalysis.cable.proximaldiameter.values,0);
        
        typeanalysis.cable.cylindricaldiameter.max   = max(typeanalysis.cable.cylindricaldiameter.values);
        typeanalysis.cable.cylindricaldiameter.min   = min(typeanalysis.cable.cylindricaldiameter.values);
        typeanalysis.cable.cylindricaldiameter.mean  = mean(typeanalysis.cable.cylindricaldiameter.values);
        typeanalysis.cable.cylindricaldiameter.std   = std(typeanalysis.cable.cylindricaldiameter.values);
        typeanalysis.cable.cylindricaldiameter.total = sum(typeanalysis.cable.cylindricaldiameter.values);
        typeanalysis.cable.cylindricaldiameter.skew  = skewness(typeanalysis.cable.cylindricaldiameter.values,0);
        typeanalysis.cable.cylindricaldiameter.kurt  = kurtosis(typeanalysis.cable.cylindricaldiameter.values,0);
        
        typeanalysis.cable.distaldiameter.max   = max(typeanalysis.cable.distaldiameter.values);
        typeanalysis.cable.distaldiameter.min   = min(typeanalysis.cable.distaldiameter.values);
        typeanalysis.cable.distaldiameter.mean  = mean(typeanalysis.cable.distaldiameter.values);
        typeanalysis.cable.distaldiameter.std   = std(typeanalysis.cable.distaldiameter.values);
        typeanalysis.cable.distaldiameter.total = sum(typeanalysis.cable.distaldiameter.values);
        typeanalysis.cable.distaldiameter.skew  = skewness(typeanalysis.cable.distaldiameter.values,0);
        typeanalysis.cable.distaldiameter.kurt  = kurtosis(typeanalysis.cable.distaldiameter.values,0);
        
        typeanalysis.cable.length.max   = max(typeanalysis.cable.length.values);
        typeanalysis.cable.length.min   = min(typeanalysis.cable.length.values);
        typeanalysis.cable.length.mean  = mean(typeanalysis.cable.length.values);
        typeanalysis.cable.length.std   = std(typeanalysis.cable.length.values);
        typeanalysis.cable.length.total = sum(typeanalysis.cable.length.values);
        typeanalysis.cable.length.skew  = skewness(typeanalysis.cable.length.values,0);
        typeanalysis.cable.length.kurt  = kurtosis(typeanalysis.cable.length.values,0);
        
        typeanalysis.cable.surfacearea.max   = max(typeanalysis.cable.surfacearea.values);
        typeanalysis.cable.surfacearea.min   = min(typeanalysis.cable.surfacearea.values);
        typeanalysis.cable.surfacearea.mean  = mean(typeanalysis.cable.surfacearea.values);
        typeanalysis.cable.surfacearea.std   = std(typeanalysis.cable.surfacearea.values);
        typeanalysis.cable.surfacearea.total = sum(typeanalysis.cable.surfacearea.values);
        typeanalysis.cable.surfacearea.skew  = skewness(typeanalysis.cable.surfacearea.values,0);
        typeanalysis.cable.surfacearea.kurt  = kurtosis(typeanalysis.cable.surfacearea.values,0);
        
        typeanalysis.cable.volume.max   = max(typeanalysis.cable.volume.values);
        typeanalysis.cable.volume.min   = min(typeanalysis.cable.volume.values);
        typeanalysis.cable.volume.mean  = mean(typeanalysis.cable.volume.values);
        typeanalysis.cable.volume.std   = std(typeanalysis.cable.volume.values);
        typeanalysis.cable.volume.total = sum(typeanalysis.cable.volume.values);
        typeanalysis.cable.volume.skew  = skewness(typeanalysis.cable.volume.values,0);
        typeanalysis.cable.volume.kurt  = kurtosis(typeanalysis.cable.volume.values,0);
        
        typeanalysis.cable.proximalxdirection.max   = max(typeanalysis.cable.proximalxdirection.values);
        typeanalysis.cable.proximalxdirection.min   = min(typeanalysis.cable.proximalxdirection.values);
        typeanalysis.cable.proximalxdirection.mean  = mean(typeanalysis.cable.proximalxdirection.values);
        typeanalysis.cable.proximalxdirection.std   = std(typeanalysis.cable.proximalxdirection.values);
        typeanalysis.cable.proximalxdirection.total = sum(typeanalysis.cable.proximalxdirection.values);
        typeanalysis.cable.proximalxdirection.skew  = skewness(typeanalysis.cable.proximalxdirection.values,0);
        typeanalysis.cable.proximalxdirection.kurt  = kurtosis(typeanalysis.cable.proximalxdirection.values,0);
        
        typeanalysis.cable.proximalydirection.max   = max(typeanalysis.cable.proximalydirection.values);
        typeanalysis.cable.proximalydirection.min   = min(typeanalysis.cable.proximalydirection.values);
        typeanalysis.cable.proximalydirection.mean  = mean(typeanalysis.cable.proximalydirection.values);
        typeanalysis.cable.proximalydirection.std   = std(typeanalysis.cable.proximalydirection.values);
        typeanalysis.cable.proximalydirection.total = sum(typeanalysis.cable.proximalydirection.values);
        typeanalysis.cable.proximalydirection.skew  = skewness(typeanalysis.cable.proximalydirection.values,0);
        typeanalysis.cable.proximalydirection.kurt  = kurtosis(typeanalysis.cable.proximalydirection.values,0);
        
        typeanalysis.cable.proximalzdirection.max   = max(typeanalysis.cable.proximalzdirection.values);
        typeanalysis.cable.proximalzdirection.min   = min(typeanalysis.cable.proximalzdirection.values);
        typeanalysis.cable.proximalzdirection.mean  = mean(typeanalysis.cable.proximalzdirection.values);
        typeanalysis.cable.proximalzdirection.std   = std(typeanalysis.cable.proximalzdirection.values);
        typeanalysis.cable.proximalzdirection.total = sum(typeanalysis.cable.proximalzdirection.values);
        typeanalysis.cable.proximalzdirection.skew  = skewness(typeanalysis.cable.proximalzdirection.values,0);
        typeanalysis.cable.proximalzdirection.kurt  = kurtosis(typeanalysis.cable.proximalzdirection.values,0);
        
        typeanalysis.cable.distalxdirection.max   = max(typeanalysis.cable.distalxdirection.values);
        typeanalysis.cable.distalxdirection.min   = min(typeanalysis.cable.distalxdirection.values);
        typeanalysis.cable.distalxdirection.mean  = mean(typeanalysis.cable.distalxdirection.values);
        typeanalysis.cable.distalxdirection.std   = std(typeanalysis.cable.distalxdirection.values);
        typeanalysis.cable.distalxdirection.total = sum(typeanalysis.cable.distalxdirection.values);
        typeanalysis.cable.distalxdirection.skew  = skewness(typeanalysis.cable.distalxdirection.values,0);
        typeanalysis.cable.distalxdirection.kurt  = kurtosis(typeanalysis.cable.distalxdirection.values,0);
        
        typeanalysis.cable.distalydirection.max   = max(typeanalysis.cable.distalydirection.values);
        typeanalysis.cable.distalydirection.min   = min(typeanalysis.cable.distalydirection.values);
        typeanalysis.cable.distalydirection.mean  = mean(typeanalysis.cable.distalydirection.values);
        typeanalysis.cable.distalydirection.std   = std(typeanalysis.cable.distalydirection.values);
        typeanalysis.cable.distalydirection.total = sum(typeanalysis.cable.distalydirection.values);
        typeanalysis.cable.distalydirection.skew  = skewness(typeanalysis.cable.distalydirection.values,0);
        typeanalysis.cable.distalydirection.kurt  = kurtosis(typeanalysis.cable.distalydirection.values,0);
        
        typeanalysis.cable.distalzdirection.max   = max(typeanalysis.cable.distalzdirection.values);
        typeanalysis.cable.distalzdirection.min   = min(typeanalysis.cable.distalzdirection.values);
        typeanalysis.cable.distalzdirection.mean  = mean(typeanalysis.cable.distalzdirection.values);
        typeanalysis.cable.distalzdirection.std   = std(typeanalysis.cable.distalzdirection.values);
        typeanalysis.cable.distalzdirection.total = sum(typeanalysis.cable.distalzdirection.values);
        typeanalysis.cable.distalzdirection.skew  = skewness(typeanalysis.cable.distalzdirection.values,0);
        typeanalysis.cable.distalzdirection.kurt  = kurtosis(typeanalysis.cable.distalzdirection.values,0);
        
        typeanalysis.cable.taperrate.max   = max(typeanalysis.cable.taperrate.values);
        typeanalysis.cable.taperrate.min   = min(typeanalysis.cable.taperrate.values);
        typeanalysis.cable.taperrate.mean  = mean(typeanalysis.cable.taperrate.values);
        typeanalysis.cable.taperrate.std   = std(typeanalysis.cable.taperrate.values);
        typeanalysis.cable.taperrate.total = sum(typeanalysis.cable.taperrate.values);
        typeanalysis.cable.taperrate.skew  = skewness(typeanalysis.cable.taperrate.values,0);
        typeanalysis.cable.taperrate.kurt  = kurtosis(typeanalysis.cable.taperrate.values,0);
        
        typeanalysis.cable.taperratio.max   = max(typeanalysis.cable.taperratio.values);
        typeanalysis.cable.taperratio.min   = min(typeanalysis.cable.taperratio.values);
        typeanalysis.cable.taperratio.mean  = mean(typeanalysis.cable.taperratio.values);
        typeanalysis.cable.taperratio.std   = std(typeanalysis.cable.taperratio.values);
        typeanalysis.cable.taperratio.total = sum(typeanalysis.cable.taperratio.values);
        typeanalysis.cable.taperratio.skew  = skewness(typeanalysis.cable.taperratio.values,0);
        typeanalysis.cable.taperratio.kurt  = kurtosis(typeanalysis.cable.taperratio.values,0);
        
        typeanalysis.cable.proximalpathlength.max   = max(typeanalysis.cable.proximalpathlength.values);
        typeanalysis.cable.proximalpathlength.min   = min(typeanalysis.cable.proximalpathlength.values);
        typeanalysis.cable.proximalpathlength.mean  = mean(typeanalysis.cable.proximalpathlength.values);
        typeanalysis.cable.proximalpathlength.std   = std(typeanalysis.cable.proximalpathlength.values);
        typeanalysis.cable.proximalpathlength.total = sum(typeanalysis.cable.proximalpathlength.values);
        typeanalysis.cable.proximalpathlength.skew  = skewness(typeanalysis.cable.proximalpathlength.values,0);
        typeanalysis.cable.proximalpathlength.kurt  = kurtosis(typeanalysis.cable.proximalpathlength.values,0);
        
        typeanalysis.cable.distalpathlength.max   = max(typeanalysis.cable.distalpathlength.values);
        typeanalysis.cable.distalpathlength.min   = min(typeanalysis.cable.distalpathlength.values);
        typeanalysis.cable.distalpathlength.mean  = mean(typeanalysis.cable.distalpathlength.values);
        typeanalysis.cable.distalpathlength.std   = std(typeanalysis.cable.distalpathlength.values);
        typeanalysis.cable.distalpathlength.total = sum(typeanalysis.cable.distalpathlength.values);
        typeanalysis.cable.distalpathlength.skew  = skewness(typeanalysis.cable.distalpathlength.values,0);
        typeanalysis.cable.distalpathlength.kurt  = kurtosis(typeanalysis.cable.distalpathlength.values,0);
        
        typeanalysis.cable.proximalradialdistance.max   = max(typeanalysis.cable.proximalradialdistance.values);
        typeanalysis.cable.proximalradialdistance.min   = min(typeanalysis.cable.proximalradialdistance.values);
        typeanalysis.cable.proximalradialdistance.mean  = mean(typeanalysis.cable.proximalradialdistance.values);
        typeanalysis.cable.proximalradialdistance.std   = std(typeanalysis.cable.proximalradialdistance.values);
        typeanalysis.cable.proximalradialdistance.total = sum(typeanalysis.cable.proximalradialdistance.values);
        typeanalysis.cable.proximalradialdistance.skew  = skewness(typeanalysis.cable.proximalradialdistance.values,0);
        typeanalysis.cable.proximalradialdistance.kurt  = kurtosis(typeanalysis.cable.proximalradialdistance.values,0);
        
        typeanalysis.cable.distalradialdistance.max   = max(typeanalysis.cable.distalradialdistance.values);
        typeanalysis.cable.distalradialdistance.min   = min(typeanalysis.cable.distalradialdistance.values);
        typeanalysis.cable.distalradialdistance.mean  = mean(typeanalysis.cable.distalradialdistance.values);
        typeanalysis.cable.distalradialdistance.std   = std(typeanalysis.cable.distalradialdistance.values);
        typeanalysis.cable.distalradialdistance.total = sum(typeanalysis.cable.distalradialdistance.values);
        typeanalysis.cable.distalradialdistance.skew  = skewness(typeanalysis.cable.distalradialdistance.values,0);
        typeanalysis.cable.distalradialdistance.kurt  = kurtosis(typeanalysis.cable.distalradialdistance.values,0);
        
        typeanalysis.cable.proximaltaperrate.max   = max(typeanalysis.cable.proximaltaperrate.values);
        typeanalysis.cable.proximaltaperrate.min   = min(typeanalysis.cable.proximaltaperrate.values);
        typeanalysis.cable.proximaltaperrate.mean  = mean(typeanalysis.cable.proximaltaperrate.values);
        typeanalysis.cable.proximaltaperrate.std   = std(typeanalysis.cable.proximaltaperrate.values);
        typeanalysis.cable.proximaltaperrate.total = sum(typeanalysis.cable.proximaltaperrate.values);
        typeanalysis.cable.proximaltaperrate.skew  = skewness(typeanalysis.cable.proximaltaperrate.values,0);
        typeanalysis.cable.proximaltaperrate.kurt  = kurtosis(typeanalysis.cable.proximaltaperrate.values,0);
        
        typeanalysis.cable.distaltaperrate.max   = max(typeanalysis.cable.distaltaperrate.values);
        typeanalysis.cable.distaltaperrate.min   = min(typeanalysis.cable.distaltaperrate.values);
        typeanalysis.cable.distaltaperrate.mean  = mean(typeanalysis.cable.distaltaperrate.values);
        typeanalysis.cable.distaltaperrate.std   = std(typeanalysis.cable.distaltaperrate.values);
        typeanalysis.cable.distaltaperrate.total = sum(typeanalysis.cable.distaltaperrate.values);
        typeanalysis.cable.distaltaperrate.skew  = skewness(typeanalysis.cable.distaltaperrate.values,0);
        typeanalysis.cable.distaltaperrate.kurt  = kurtosis(typeanalysis.cable.distaltaperrate.values,0);
        
        typeanalysis.cable.rallratio.values = typeanalysis.cable.rallratio.values(~isnan(typeanalysis.cable.rallratio.values));
        typeanalysis.cable.rallratio.max   = max(typeanalysis.cable.rallratio.values);
        typeanalysis.cable.rallratio.min   = min(typeanalysis.cable.rallratio.values);
        typeanalysis.cable.rallratio.mean  = mean(typeanalysis.cable.rallratio.values);
        typeanalysis.cable.rallratio.std   = std(typeanalysis.cable.rallratio.values);
        typeanalysis.cable.rallratio.total = sum(typeanalysis.cable.rallratio.values);
        typeanalysis.cable.rallratio.skew  = skewness(typeanalysis.cable.rallratio.values,0);
        typeanalysis.cable.rallratio.kurt  = kurtosis(typeanalysis.cable.rallratio.values,0);
        
        typeanalysis.cable.rallratio1.values = typeanalysis.cable.rallratio1.values(~isnan(typeanalysis.cable.rallratio1.values));
        typeanalysis.cable.rallratio1.max   = max(typeanalysis.cable.rallratio1.values);
        typeanalysis.cable.rallratio1.min   = min(typeanalysis.cable.rallratio1.values);
        typeanalysis.cable.rallratio1.mean  = mean(typeanalysis.cable.rallratio1.values);
        typeanalysis.cable.rallratio1.std   = std(typeanalysis.cable.rallratio1.values);
        typeanalysis.cable.rallratio1.total = sum(typeanalysis.cable.rallratio1.values);
        typeanalysis.cable.rallratio1.skew  = skewness(typeanalysis.cable.rallratio1.values,0);
        typeanalysis.cable.rallratio1.kurt  = kurtosis(typeanalysis.cable.rallratio1.values,0);
        
        typeanalysis.cable.rallratio2.values = typeanalysis.cable.rallratio2.values(~isnan(typeanalysis.cable.rallratio2.values));
        typeanalysis.cable.rallratio2.max   = max(typeanalysis.cable.rallratio2.values);
        typeanalysis.cable.rallratio2.min   = min(typeanalysis.cable.rallratio2.values);
        typeanalysis.cable.rallratio2.mean  = mean(typeanalysis.cable.rallratio2.values);
        typeanalysis.cable.rallratio2.std   = std(typeanalysis.cable.rallratio2.values);
        typeanalysis.cable.rallratio2.total = sum(typeanalysis.cable.rallratio2.values);
        typeanalysis.cable.rallratio2.skew  = skewness(typeanalysis.cable.rallratio2.values,0);
        typeanalysis.cable.rallratio2.kurt  = kurtosis(typeanalysis.cable.rallratio2.values,0);
        
        typeanalysis.cable.rallratio3.values = typeanalysis.cable.rallratio3.values(~isnan(typeanalysis.cable.rallratio3.values));
        typeanalysis.cable.rallratio3.max   = max(typeanalysis.cable.rallratio3.values);
        typeanalysis.cable.rallratio3.min   = min(typeanalysis.cable.rallratio3.values);
        typeanalysis.cable.rallratio3.mean  = mean(typeanalysis.cable.rallratio3.values);
        typeanalysis.cable.rallratio3.std   = std(typeanalysis.cable.rallratio3.values);
        typeanalysis.cable.rallratio3.total = sum(typeanalysis.cable.rallratio3.values);
        typeanalysis.cable.rallratio3.skew  = skewness(typeanalysis.cable.rallratio3.values,0);
        typeanalysis.cable.rallratio3.kurt  = kurtosis(typeanalysis.cable.rallratio3.values,0);
        
        typeanalysis.cable.daughter1diameter.values = typeanalysis.cable.daughter1diameter.values(~isnan(typeanalysis.cable.daughter1diameter.values));
        typeanalysis.cable.daughter1diameter.max   = max(typeanalysis.cable.daughter1diameter.values);
        typeanalysis.cable.daughter1diameter.min   = min(typeanalysis.cable.daughter1diameter.values);
        typeanalysis.cable.daughter1diameter.mean  = mean(typeanalysis.cable.daughter1diameter.values);
        typeanalysis.cable.daughter1diameter.std   = std(typeanalysis.cable.daughter1diameter.values);
        typeanalysis.cable.daughter1diameter.total = sum(typeanalysis.cable.daughter1diameter.values);
        typeanalysis.cable.daughter1diameter.skew  = skewness(typeanalysis.cable.daughter1diameter.values,0);
        typeanalysis.cable.daughter1diameter.kurt  = kurtosis(typeanalysis.cable.daughter1diameter.values,0);
        
        typeanalysis.cable.daughter2diameter.values = typeanalysis.cable.daughter2diameter.values(~isnan(typeanalysis.cable.daughter2diameter.values));
        typeanalysis.cable.daughter2diameter.max   = max(typeanalysis.cable.daughter2diameter.values);
        typeanalysis.cable.daughter2diameter.min   = min(typeanalysis.cable.daughter2diameter.values);
        typeanalysis.cable.daughter2diameter.mean  = mean(typeanalysis.cable.daughter2diameter.values);
        typeanalysis.cable.daughter2diameter.std   = std(typeanalysis.cable.daughter2diameter.values);
        typeanalysis.cable.daughter2diameter.total = sum(typeanalysis.cable.daughter2diameter.values);
        typeanalysis.cable.daughter2diameter.skew  = skewness(typeanalysis.cable.daughter2diameter.values,0);
        typeanalysis.cable.daughter2diameter.kurt  = kurtosis(typeanalysis.cable.daughter2diameter.values,0);
        
        typeanalysis.cable.daughterratio.values = typeanalysis.cable.daughterratio.values(~isnan(typeanalysis.cable.daughterratio.values));
        typeanalysis.cable.daughterratio.max   = max(typeanalysis.cable.daughterratio.values);
        typeanalysis.cable.daughterratio.min   = min(typeanalysis.cable.daughterratio.values);
        typeanalysis.cable.daughterratio.mean  = mean(typeanalysis.cable.daughterratio.values);
        typeanalysis.cable.daughterratio.std   = std(typeanalysis.cable.daughterratio.values);
        typeanalysis.cable.daughterratio.total = sum(typeanalysis.cable.daughterratio.values);
        typeanalysis.cable.daughterratio.skew  = skewness(typeanalysis.cable.daughterratio.values,0);
        typeanalysis.cable.daughterratio.kurt  = kurtosis(typeanalysis.cable.daughterratio.values,0);
        
        typeanalysis.cable.parentdaughterratio.values = typeanalysis.cable.parentdaughterratio.values(~isnan(typeanalysis.cable.parentdaughterratio.values));
        typeanalysis.cable.parentdaughterratio.max   = max(typeanalysis.cable.parentdaughterratio.values);
        typeanalysis.cable.parentdaughterratio.min   = min(typeanalysis.cable.parentdaughterratio.values);
        typeanalysis.cable.parentdaughterratio.mean  = mean(typeanalysis.cable.parentdaughterratio.values);
        typeanalysis.cable.parentdaughterratio.std   = std(typeanalysis.cable.parentdaughterratio.values);
        typeanalysis.cable.parentdaughterratio.total = sum(typeanalysis.cable.parentdaughterratio.values);
        typeanalysis.cable.parentdaughterratio.skew  = skewness(typeanalysis.cable.parentdaughterratio.values,0);
        typeanalysis.cable.parentdaughterratio.kurt  = kurtosis(typeanalysis.cable.parentdaughterratio.values,0);
        
        typeanalysis.cable.parentdaughter2ratio.values = typeanalysis.cable.parentdaughter2ratio.values(~isnan(typeanalysis.cable.parentdaughter2ratio.values));
        typeanalysis.cable.parentdaughter2ratio.max   = max(typeanalysis.cable.parentdaughter2ratio.values);
        typeanalysis.cable.parentdaughter2ratio.min   = min(typeanalysis.cable.parentdaughter2ratio.values);
        typeanalysis.cable.parentdaughter2ratio.mean  = mean(typeanalysis.cable.parentdaughter2ratio.values);
        typeanalysis.cable.parentdaughter2ratio.std   = std(typeanalysis.cable.parentdaughter2ratio.values);
        typeanalysis.cable.parentdaughter2ratio.total = sum(typeanalysis.cable.parentdaughter2ratio.values);
        typeanalysis.cable.parentdaughter2ratio.skew  = skewness(typeanalysis.cable.parentdaughter2ratio.values,0);
        typeanalysis.cable.parentdaughter2ratio.kurt  = kurtosis(typeanalysis.cable.parentdaughter2ratio.values,0);
        
        
        
        typeanalysis.bifurcation.cable.branchorder.max   = max(typeanalysis.bifurcation.cable.branchorder.values);
        typeanalysis.bifurcation.cable.branchorder.min   = min(typeanalysis.bifurcation.cable.branchorder.values);
        typeanalysis.bifurcation.cable.branchorder.mean  = mean(typeanalysis.bifurcation.cable.branchorder.values);
        typeanalysis.bifurcation.cable.branchorder.std   = std(typeanalysis.bifurcation.cable.branchorder.values);
        typeanalysis.bifurcation.cable.branchorder.total = sum(typeanalysis.bifurcation.cable.branchorder.values);
        typeanalysis.bifurcation.cable.branchorder.skew  = skewness(typeanalysis.bifurcation.cable.branchorder.values,0);
        typeanalysis.bifurcation.cable.branchorder.kurt  = kurtosis(typeanalysis.bifurcation.cable.branchorder.values,0);
        
        typeanalysis.bifurcation.cable.degree.max   = max(typeanalysis.bifurcation.cable.degree.values);
        typeanalysis.bifurcation.cable.degree.min   = min(typeanalysis.bifurcation.cable.degree.values);
        typeanalysis.bifurcation.cable.degree.mean  = mean(typeanalysis.bifurcation.cable.degree.values);
        typeanalysis.bifurcation.cable.degree.std   = std(typeanalysis.bifurcation.cable.degree.values);
        typeanalysis.bifurcation.cable.degree.total = sum(typeanalysis.bifurcation.cable.degree.values);
        typeanalysis.bifurcation.cable.degree.skew  = skewness(typeanalysis.bifurcation.cable.degree.values,0);
        typeanalysis.bifurcation.cable.degree.kurt  = kurtosis(typeanalysis.bifurcation.cable.degree.values,0);
        
        typeanalysis.bifurcation.cable.proximaldiameter.max   = max(typeanalysis.bifurcation.cable.proximaldiameter.values);
        typeanalysis.bifurcation.cable.proximaldiameter.min   = min(typeanalysis.bifurcation.cable.proximaldiameter.values);
        typeanalysis.bifurcation.cable.proximaldiameter.mean  = mean(typeanalysis.bifurcation.cable.proximaldiameter.values);
        typeanalysis.bifurcation.cable.proximaldiameter.std   = std(typeanalysis.bifurcation.cable.proximaldiameter.values);
        typeanalysis.bifurcation.cable.proximaldiameter.total = sum(typeanalysis.bifurcation.cable.proximaldiameter.values);
        typeanalysis.bifurcation.cable.proximaldiameter.skew  = skewness(typeanalysis.bifurcation.cable.proximaldiameter.values,0);
        typeanalysis.bifurcation.cable.proximaldiameter.kurt  = kurtosis(typeanalysis.bifurcation.cable.proximaldiameter.values,0);
        
        typeanalysis.bifurcation.cable.cylindricaldiameter.max   = max(typeanalysis.bifurcation.cable.cylindricaldiameter.values);
        typeanalysis.bifurcation.cable.cylindricaldiameter.min   = min(typeanalysis.bifurcation.cable.cylindricaldiameter.values);
        typeanalysis.bifurcation.cable.cylindricaldiameter.mean  = mean(typeanalysis.bifurcation.cable.cylindricaldiameter.values);
        typeanalysis.bifurcation.cable.cylindricaldiameter.std   = std(typeanalysis.bifurcation.cable.cylindricaldiameter.values);
        typeanalysis.bifurcation.cable.cylindricaldiameter.total = sum(typeanalysis.bifurcation.cable.cylindricaldiameter.values);
        typeanalysis.bifurcation.cable.cylindricaldiameter.skew  = skewness(typeanalysis.bifurcation.cable.cylindricaldiameter.values,0);
        typeanalysis.bifurcation.cable.cylindricaldiameter.kurt  = kurtosis(typeanalysis.bifurcation.cable.cylindricaldiameter.values,0);
        
        typeanalysis.bifurcation.cable.distaldiameter.max   = max(typeanalysis.bifurcation.cable.distaldiameter.values);
        typeanalysis.bifurcation.cable.distaldiameter.min   = min(typeanalysis.bifurcation.cable.distaldiameter.values);
        typeanalysis.bifurcation.cable.distaldiameter.mean  = mean(typeanalysis.bifurcation.cable.distaldiameter.values);
        typeanalysis.bifurcation.cable.distaldiameter.std   = std(typeanalysis.bifurcation.cable.distaldiameter.values);
        typeanalysis.bifurcation.cable.distaldiameter.total = sum(typeanalysis.bifurcation.cable.distaldiameter.values);
        typeanalysis.bifurcation.cable.distaldiameter.skew  = skewness(typeanalysis.bifurcation.cable.distaldiameter.values,0);
        typeanalysis.bifurcation.cable.distaldiameter.kurt  = kurtosis(typeanalysis.bifurcation.cable.distaldiameter.values,0);
        
        typeanalysis.bifurcation.cable.length.max   = max(typeanalysis.bifurcation.cable.length.values);
        typeanalysis.bifurcation.cable.length.min   = min(typeanalysis.bifurcation.cable.length.values);
        typeanalysis.bifurcation.cable.length.mean  = mean(typeanalysis.bifurcation.cable.length.values);
        typeanalysis.bifurcation.cable.length.std   = std(typeanalysis.bifurcation.cable.length.values);
        typeanalysis.bifurcation.cable.length.total = sum(typeanalysis.bifurcation.cable.length.values);
        typeanalysis.bifurcation.cable.length.skew  = skewness(typeanalysis.bifurcation.cable.length.values,0);
        typeanalysis.bifurcation.cable.length.kurt  = kurtosis(typeanalysis.bifurcation.cable.length.values,0);
        
        typeanalysis.bifurcation.cable.surfacearea.max   = max(typeanalysis.bifurcation.cable.surfacearea.values);
        typeanalysis.bifurcation.cable.surfacearea.min   = min(typeanalysis.bifurcation.cable.surfacearea.values);
        typeanalysis.bifurcation.cable.surfacearea.mean  = mean(typeanalysis.bifurcation.cable.surfacearea.values);
        typeanalysis.bifurcation.cable.surfacearea.std   = std(typeanalysis.bifurcation.cable.surfacearea.values);
        typeanalysis.bifurcation.cable.surfacearea.total = sum(typeanalysis.bifurcation.cable.surfacearea.values);
        typeanalysis.bifurcation.cable.surfacearea.skew  = skewness(typeanalysis.bifurcation.cable.surfacearea.values,0);
        typeanalysis.bifurcation.cable.surfacearea.kurt  = kurtosis(typeanalysis.bifurcation.cable.surfacearea.values,0);
        
        typeanalysis.bifurcation.cable.volume.max   = max(typeanalysis.bifurcation.cable.volume.values);
        typeanalysis.bifurcation.cable.volume.min   = min(typeanalysis.bifurcation.cable.volume.values);
        typeanalysis.bifurcation.cable.volume.mean  = mean(typeanalysis.bifurcation.cable.volume.values);
        typeanalysis.bifurcation.cable.volume.std   = std(typeanalysis.bifurcation.cable.volume.values);
        typeanalysis.bifurcation.cable.volume.total = sum(typeanalysis.bifurcation.cable.volume.values);
        typeanalysis.bifurcation.cable.volume.skew  = skewness(typeanalysis.bifurcation.cable.volume.values,0);
        typeanalysis.bifurcation.cable.volume.kurt  = kurtosis(typeanalysis.bifurcation.cable.volume.values,0);
        
        typeanalysis.bifurcation.cable.proximalxdirection.max   = max(typeanalysis.bifurcation.cable.proximalxdirection.values);
        typeanalysis.bifurcation.cable.proximalxdirection.min   = min(typeanalysis.bifurcation.cable.proximalxdirection.values);
        typeanalysis.bifurcation.cable.proximalxdirection.mean  = mean(typeanalysis.bifurcation.cable.proximalxdirection.values);
        typeanalysis.bifurcation.cable.proximalxdirection.std   = std(typeanalysis.bifurcation.cable.proximalxdirection.values);
        typeanalysis.bifurcation.cable.proximalxdirection.total = sum(typeanalysis.bifurcation.cable.proximalxdirection.values);
        typeanalysis.bifurcation.cable.proximalxdirection.skew  = skewness(typeanalysis.bifurcation.cable.proximalxdirection.values,0);
        typeanalysis.bifurcation.cable.proximalxdirection.kurt  = kurtosis(typeanalysis.bifurcation.cable.proximalxdirection.values,0);
        
        typeanalysis.bifurcation.cable.proximalydirection.max   = max(typeanalysis.bifurcation.cable.proximalydirection.values);
        typeanalysis.bifurcation.cable.proximalydirection.min   = min(typeanalysis.bifurcation.cable.proximalydirection.values);
        typeanalysis.bifurcation.cable.proximalydirection.mean  = mean(typeanalysis.bifurcation.cable.proximalydirection.values);
        typeanalysis.bifurcation.cable.proximalydirection.std   = std(typeanalysis.bifurcation.cable.proximalydirection.values);
        typeanalysis.bifurcation.cable.proximalydirection.total = sum(typeanalysis.bifurcation.cable.proximalydirection.values);
        typeanalysis.bifurcation.cable.proximalydirection.skew  = skewness(typeanalysis.bifurcation.cable.proximalydirection.values,0);
        typeanalysis.bifurcation.cable.proximalydirection.kurt  = kurtosis(typeanalysis.bifurcation.cable.proximalydirection.values,0);
        
        typeanalysis.bifurcation.cable.proximalzdirection.max   = max(typeanalysis.bifurcation.cable.proximalzdirection.values);
        typeanalysis.bifurcation.cable.proximalzdirection.min   = min(typeanalysis.bifurcation.cable.proximalzdirection.values);
        typeanalysis.bifurcation.cable.proximalzdirection.mean  = mean(typeanalysis.bifurcation.cable.proximalzdirection.values);
        typeanalysis.bifurcation.cable.proximalzdirection.std   = std(typeanalysis.bifurcation.cable.proximalzdirection.values);
        typeanalysis.bifurcation.cable.proximalzdirection.total = sum(typeanalysis.bifurcation.cable.proximalzdirection.values);
        typeanalysis.bifurcation.cable.proximalzdirection.skew  = skewness(typeanalysis.bifurcation.cable.proximalzdirection.values,0);
        typeanalysis.bifurcation.cable.proximalzdirection.kurt  = kurtosis(typeanalysis.bifurcation.cable.proximalzdirection.values,0);
        
        typeanalysis.bifurcation.cable.distalxdirection.max   = max(typeanalysis.bifurcation.cable.distalxdirection.values);
        typeanalysis.bifurcation.cable.distalxdirection.min   = min(typeanalysis.bifurcation.cable.distalxdirection.values);
        typeanalysis.bifurcation.cable.distalxdirection.mean  = mean(typeanalysis.bifurcation.cable.distalxdirection.values);
        typeanalysis.bifurcation.cable.distalxdirection.std   = std(typeanalysis.bifurcation.cable.distalxdirection.values);
        typeanalysis.bifurcation.cable.distalxdirection.total = sum(typeanalysis.bifurcation.cable.distalxdirection.values);
        typeanalysis.bifurcation.cable.distalxdirection.skew  = skewness(typeanalysis.bifurcation.cable.distalxdirection.values,0);
        typeanalysis.bifurcation.cable.distalxdirection.kurt  = kurtosis(typeanalysis.bifurcation.cable.distalxdirection.values,0);
        
        typeanalysis.bifurcation.cable.distalydirection.max   = max(typeanalysis.bifurcation.cable.distalydirection.values);
        typeanalysis.bifurcation.cable.distalydirection.min   = min(typeanalysis.bifurcation.cable.distalydirection.values);
        typeanalysis.bifurcation.cable.distalydirection.mean  = mean(typeanalysis.bifurcation.cable.distalydirection.values);
        typeanalysis.bifurcation.cable.distalydirection.std   = std(typeanalysis.bifurcation.cable.distalydirection.values);
        typeanalysis.bifurcation.cable.distalydirection.total = sum(typeanalysis.bifurcation.cable.distalydirection.values);
        typeanalysis.bifurcation.cable.distalydirection.skew  = skewness(typeanalysis.bifurcation.cable.distalydirection.values,0);
        typeanalysis.bifurcation.cable.distalydirection.kurt  = kurtosis(typeanalysis.bifurcation.cable.distalydirection.values,0);
        
        typeanalysis.bifurcation.cable.distalzdirection.max   = max(typeanalysis.bifurcation.cable.distalzdirection.values);
        typeanalysis.bifurcation.cable.distalzdirection.min   = min(typeanalysis.bifurcation.cable.distalzdirection.values);
        typeanalysis.bifurcation.cable.distalzdirection.mean  = mean(typeanalysis.bifurcation.cable.distalzdirection.values);
        typeanalysis.bifurcation.cable.distalzdirection.std   = std(typeanalysis.bifurcation.cable.distalzdirection.values);
        typeanalysis.bifurcation.cable.distalzdirection.total = sum(typeanalysis.bifurcation.cable.distalzdirection.values);
        typeanalysis.bifurcation.cable.distalzdirection.skew  = skewness(typeanalysis.bifurcation.cable.distalzdirection.values,0);
        typeanalysis.bifurcation.cable.distalzdirection.kurt  = kurtosis(typeanalysis.bifurcation.cable.distalzdirection.values,0);
        
        typeanalysis.bifurcation.cable.taperrate.max   = max(typeanalysis.bifurcation.cable.taperrate.values);
        typeanalysis.bifurcation.cable.taperrate.min   = min(typeanalysis.bifurcation.cable.taperrate.values);
        typeanalysis.bifurcation.cable.taperrate.mean  = mean(typeanalysis.bifurcation.cable.taperrate.values);
        typeanalysis.bifurcation.cable.taperrate.std   = std(typeanalysis.bifurcation.cable.taperrate.values);
        typeanalysis.bifurcation.cable.taperrate.total = sum(typeanalysis.bifurcation.cable.taperrate.values);
        typeanalysis.bifurcation.cable.taperrate.skew  = skewness(typeanalysis.bifurcation.cable.taperrate.values,0);
        typeanalysis.bifurcation.cable.taperrate.kurt  = kurtosis(typeanalysis.bifurcation.cable.taperrate.values,0);
        
        typeanalysis.bifurcation.cable.taperratio.max   = max(typeanalysis.bifurcation.cable.taperratio.values);
        typeanalysis.bifurcation.cable.taperratio.min   = min(typeanalysis.bifurcation.cable.taperratio.values);
        typeanalysis.bifurcation.cable.taperratio.mean  = mean(typeanalysis.bifurcation.cable.taperratio.values);
        typeanalysis.bifurcation.cable.taperratio.std   = std(typeanalysis.bifurcation.cable.taperratio.values);
        typeanalysis.bifurcation.cable.taperratio.total = sum(typeanalysis.bifurcation.cable.taperratio.values);
        typeanalysis.bifurcation.cable.taperratio.skew  = skewness(typeanalysis.bifurcation.cable.taperratio.values,0);
        typeanalysis.bifurcation.cable.taperratio.kurt  = kurtosis(typeanalysis.bifurcation.cable.taperratio.values,0);
        
        typeanalysis.bifurcation.cable.proximalpathlength.max   = max(typeanalysis.bifurcation.cable.proximalpathlength.values);
        typeanalysis.bifurcation.cable.proximalpathlength.min   = min(typeanalysis.bifurcation.cable.proximalpathlength.values);
        typeanalysis.bifurcation.cable.proximalpathlength.mean  = mean(typeanalysis.bifurcation.cable.proximalpathlength.values);
        typeanalysis.bifurcation.cable.proximalpathlength.std   = std(typeanalysis.bifurcation.cable.proximalpathlength.values);
        typeanalysis.bifurcation.cable.proximalpathlength.total = sum(typeanalysis.bifurcation.cable.proximalpathlength.values);
        typeanalysis.bifurcation.cable.proximalpathlength.skew  = skewness(typeanalysis.bifurcation.cable.proximalpathlength.values,0);
        typeanalysis.bifurcation.cable.proximalpathlength.kurt  = kurtosis(typeanalysis.bifurcation.cable.proximalpathlength.values,0);
        
        typeanalysis.bifurcation.cable.distalpathlength.max   = max(typeanalysis.bifurcation.cable.distalpathlength.values);
        typeanalysis.bifurcation.cable.distalpathlength.min   = min(typeanalysis.bifurcation.cable.distalpathlength.values);
        typeanalysis.bifurcation.cable.distalpathlength.mean  = mean(typeanalysis.bifurcation.cable.distalpathlength.values);
        typeanalysis.bifurcation.cable.distalpathlength.std   = std(typeanalysis.bifurcation.cable.distalpathlength.values);
        typeanalysis.bifurcation.cable.distalpathlength.total = sum(typeanalysis.bifurcation.cable.distalpathlength.values);
        typeanalysis.bifurcation.cable.distalpathlength.skew  = skewness(typeanalysis.bifurcation.cable.distalpathlength.values,0);
        typeanalysis.bifurcation.cable.distalpathlength.kurt  = kurtosis(typeanalysis.bifurcation.cable.distalpathlength.values,0);
        
        typeanalysis.bifurcation.cable.proximalradialdistance.max   = max(typeanalysis.bifurcation.cable.proximalradialdistance.values);
        typeanalysis.bifurcation.cable.proximalradialdistance.min   = min(typeanalysis.bifurcation.cable.proximalradialdistance.values);
        typeanalysis.bifurcation.cable.proximalradialdistance.mean  = mean(typeanalysis.bifurcation.cable.proximalradialdistance.values);
        typeanalysis.bifurcation.cable.proximalradialdistance.std   = std(typeanalysis.bifurcation.cable.proximalradialdistance.values);
        typeanalysis.bifurcation.cable.proximalradialdistance.total = sum(typeanalysis.bifurcation.cable.proximalradialdistance.values);
        typeanalysis.bifurcation.cable.proximalradialdistance.skew  = skewness(typeanalysis.bifurcation.cable.proximalradialdistance.values,0);
        typeanalysis.bifurcation.cable.proximalradialdistance.kurt  = kurtosis(typeanalysis.bifurcation.cable.proximalradialdistance.values,0);
        
        typeanalysis.bifurcation.cable.distalradialdistance.max   = max(typeanalysis.bifurcation.cable.distalradialdistance.values);
        typeanalysis.bifurcation.cable.distalradialdistance.min   = min(typeanalysis.bifurcation.cable.distalradialdistance.values);
        typeanalysis.bifurcation.cable.distalradialdistance.mean  = mean(typeanalysis.bifurcation.cable.distalradialdistance.values);
        typeanalysis.bifurcation.cable.distalradialdistance.std   = std(typeanalysis.bifurcation.cable.distalradialdistance.values);
        typeanalysis.bifurcation.cable.distalradialdistance.total = sum(typeanalysis.bifurcation.cable.distalradialdistance.values);
        typeanalysis.bifurcation.cable.distalradialdistance.skew  = skewness(typeanalysis.bifurcation.cable.distalradialdistance.values,0);
        typeanalysis.bifurcation.cable.distalradialdistance.kurt  = kurtosis(typeanalysis.bifurcation.cable.distalradialdistance.values,0);
        
        typeanalysis.bifurcation.cable.proximaltaperrate.max   = max(typeanalysis.bifurcation.cable.proximaltaperrate.values);
        typeanalysis.bifurcation.cable.proximaltaperrate.min   = min(typeanalysis.bifurcation.cable.proximaltaperrate.values);
        typeanalysis.bifurcation.cable.proximaltaperrate.mean  = mean(typeanalysis.bifurcation.cable.proximaltaperrate.values);
        typeanalysis.bifurcation.cable.proximaltaperrate.std   = std(typeanalysis.bifurcation.cable.proximaltaperrate.values);
        typeanalysis.bifurcation.cable.proximaltaperrate.total = sum(typeanalysis.bifurcation.cable.proximaltaperrate.values);
        typeanalysis.bifurcation.cable.proximaltaperrate.skew  = skewness(typeanalysis.bifurcation.cable.proximaltaperrate.values,0);
        typeanalysis.bifurcation.cable.proximaltaperrate.kurt  = kurtosis(typeanalysis.bifurcation.cable.proximaltaperrate.values,0);
        
        typeanalysis.bifurcation.cable.distaltaperrate.max   = max(typeanalysis.bifurcation.cable.distaltaperrate.values);
        typeanalysis.bifurcation.cable.distaltaperrate.min   = min(typeanalysis.bifurcation.cable.distaltaperrate.values);
        typeanalysis.bifurcation.cable.distaltaperrate.mean  = mean(typeanalysis.bifurcation.cable.distaltaperrate.values);
        typeanalysis.bifurcation.cable.distaltaperrate.std   = std(typeanalysis.bifurcation.cable.distaltaperrate.values);
        typeanalysis.bifurcation.cable.distaltaperrate.total = sum(typeanalysis.bifurcation.cable.distaltaperrate.values);
        typeanalysis.bifurcation.cable.distaltaperrate.skew  = skewness(typeanalysis.bifurcation.cable.distaltaperrate.values,0);
        typeanalysis.bifurcation.cable.distaltaperrate.kurt  = kurtosis(typeanalysis.bifurcation.cable.distaltaperrate.values,0);
        
        typeanalysis.bifurcation.cable.rallratio.values = typeanalysis.bifurcation.cable.rallratio.values(~isnan(typeanalysis.bifurcation.cable.rallratio.values));
        typeanalysis.bifurcation.cable.rallratio.max   = max(typeanalysis.bifurcation.cable.rallratio.values);
        typeanalysis.bifurcation.cable.rallratio.min   = min(typeanalysis.bifurcation.cable.rallratio.values);
        typeanalysis.bifurcation.cable.rallratio.mean  = mean(typeanalysis.bifurcation.cable.rallratio.values);
        typeanalysis.bifurcation.cable.rallratio.std   = std(typeanalysis.bifurcation.cable.rallratio.values);
        typeanalysis.bifurcation.cable.rallratio.total = sum(typeanalysis.bifurcation.cable.rallratio.values);
        typeanalysis.bifurcation.cable.rallratio.skew  = skewness(typeanalysis.bifurcation.cable.rallratio.values,0);
        typeanalysis.bifurcation.cable.rallratio.kurt  = kurtosis(typeanalysis.bifurcation.cable.rallratio.values,0);
        
        typeanalysis.bifurcation.cable.rallratio1.values = typeanalysis.bifurcation.cable.rallratio1.values(~isnan(typeanalysis.bifurcation.cable.rallratio1.values));
        typeanalysis.bifurcation.cable.rallratio1.max   = max(typeanalysis.bifurcation.cable.rallratio1.values);
        typeanalysis.bifurcation.cable.rallratio1.min   = min(typeanalysis.bifurcation.cable.rallratio1.values);
        typeanalysis.bifurcation.cable.rallratio1.mean  = mean(typeanalysis.bifurcation.cable.rallratio1.values);
        typeanalysis.bifurcation.cable.rallratio1.std   = std(typeanalysis.bifurcation.cable.rallratio1.values);
        typeanalysis.bifurcation.cable.rallratio1.total = sum(typeanalysis.bifurcation.cable.rallratio1.values);
        typeanalysis.bifurcation.cable.rallratio1.skew  = skewness(typeanalysis.bifurcation.cable.rallratio1.values,0);
        typeanalysis.bifurcation.cable.rallratio1.kurt  = kurtosis(typeanalysis.bifurcation.cable.rallratio1.values,0);
        
        typeanalysis.bifurcation.cable.rallratio2.values = typeanalysis.bifurcation.cable.rallratio2.values(~isnan(typeanalysis.bifurcation.cable.rallratio2.values));
        typeanalysis.bifurcation.cable.rallratio2.max   = max(typeanalysis.bifurcation.cable.rallratio2.values);
        typeanalysis.bifurcation.cable.rallratio2.min   = min(typeanalysis.bifurcation.cable.rallratio2.values);
        typeanalysis.bifurcation.cable.rallratio2.mean  = mean(typeanalysis.bifurcation.cable.rallratio2.values);
        typeanalysis.bifurcation.cable.rallratio2.std   = std(typeanalysis.bifurcation.cable.rallratio2.values);
        typeanalysis.bifurcation.cable.rallratio2.total = sum(typeanalysis.bifurcation.cable.rallratio2.values);
        typeanalysis.bifurcation.cable.rallratio2.skew  = skewness(typeanalysis.bifurcation.cable.rallratio2.values,0);
        typeanalysis.bifurcation.cable.rallratio2.kurt  = kurtosis(typeanalysis.bifurcation.cable.rallratio2.values,0);
        
        typeanalysis.bifurcation.cable.rallratio3.values = typeanalysis.bifurcation.cable.rallratio3.values(~isnan(typeanalysis.bifurcation.cable.rallratio3.values));
        typeanalysis.bifurcation.cable.rallratio3.max   = max(typeanalysis.bifurcation.cable.rallratio3.values);
        typeanalysis.bifurcation.cable.rallratio3.min   = min(typeanalysis.bifurcation.cable.rallratio3.values);
        typeanalysis.bifurcation.cable.rallratio3.mean  = mean(typeanalysis.bifurcation.cable.rallratio3.values);
        typeanalysis.bifurcation.cable.rallratio3.std   = std(typeanalysis.bifurcation.cable.rallratio3.values);
        typeanalysis.bifurcation.cable.rallratio3.total = sum(typeanalysis.bifurcation.cable.rallratio3.values);
        typeanalysis.bifurcation.cable.rallratio3.skew  = skewness(typeanalysis.bifurcation.cable.rallratio3.values,0);
        typeanalysis.bifurcation.cable.rallratio3.kurt  = kurtosis(typeanalysis.bifurcation.cable.rallratio3.values,0);
        
        typeanalysis.bifurcation.cable.daughter1diameter.values = typeanalysis.bifurcation.cable.daughter1diameter.values(~isnan(typeanalysis.bifurcation.cable.daughter1diameter.values));
        typeanalysis.bifurcation.cable.daughter1diameter.max   = max(typeanalysis.bifurcation.cable.daughter1diameter.values);
        typeanalysis.bifurcation.cable.daughter1diameter.min   = min(typeanalysis.bifurcation.cable.daughter1diameter.values);
        typeanalysis.bifurcation.cable.daughter1diameter.mean  = mean(typeanalysis.bifurcation.cable.daughter1diameter.values);
        typeanalysis.bifurcation.cable.daughter1diameter.std   = std(typeanalysis.bifurcation.cable.daughter1diameter.values);
        typeanalysis.bifurcation.cable.daughter1diameter.total = sum(typeanalysis.bifurcation.cable.daughter1diameter.values);
        typeanalysis.bifurcation.cable.daughter1diameter.skew  = skewness(typeanalysis.bifurcation.cable.daughter1diameter.values,0);
        typeanalysis.bifurcation.cable.daughter1diameter.kurt  = kurtosis(typeanalysis.bifurcation.cable.daughter1diameter.values,0);
        
        typeanalysis.bifurcation.cable.daughter2diameter.values = typeanalysis.bifurcation.cable.daughter2diameter.values(~isnan(typeanalysis.bifurcation.cable.daughter2diameter.values));
        typeanalysis.bifurcation.cable.daughter2diameter.max   = max(typeanalysis.bifurcation.cable.daughter2diameter.values);
        typeanalysis.bifurcation.cable.daughter2diameter.min   = min(typeanalysis.bifurcation.cable.daughter2diameter.values);
        typeanalysis.bifurcation.cable.daughter2diameter.mean  = mean(typeanalysis.bifurcation.cable.daughter2diameter.values);
        typeanalysis.bifurcation.cable.daughter2diameter.std   = std(typeanalysis.bifurcation.cable.daughter2diameter.values);
        typeanalysis.bifurcation.cable.daughter2diameter.total = sum(typeanalysis.bifurcation.cable.daughter2diameter.values);
        typeanalysis.bifurcation.cable.daughter2diameter.skew  = skewness(typeanalysis.bifurcation.cable.daughter2diameter.values,0);
        typeanalysis.bifurcation.cable.daughter2diameter.kurt  = kurtosis(typeanalysis.bifurcation.cable.daughter2diameter.values,0);
        
        typeanalysis.bifurcation.cable.daughterratio.values = typeanalysis.bifurcation.cable.daughterratio.values(~isnan(typeanalysis.bifurcation.cable.daughterratio.values));
        typeanalysis.bifurcation.cable.daughterratio.max   = max(typeanalysis.bifurcation.cable.daughterratio.values);
        typeanalysis.bifurcation.cable.daughterratio.min   = min(typeanalysis.bifurcation.cable.daughterratio.values);
        typeanalysis.bifurcation.cable.daughterratio.mean  = mean(typeanalysis.bifurcation.cable.daughterratio.values);
        typeanalysis.bifurcation.cable.daughterratio.std   = std(typeanalysis.bifurcation.cable.daughterratio.values);
        typeanalysis.bifurcation.cable.daughterratio.total = sum(typeanalysis.bifurcation.cable.daughterratio.values);
        typeanalysis.bifurcation.cable.daughterratio.skew  = skewness(typeanalysis.bifurcation.cable.daughterratio.values,0);
        typeanalysis.bifurcation.cable.daughterratio.kurt  = kurtosis(typeanalysis.bifurcation.cable.daughterratio.values,0);
        
        typeanalysis.bifurcation.cable.parentdaughterratio.values = typeanalysis.bifurcation.cable.parentdaughterratio.values(~isnan(typeanalysis.bifurcation.cable.parentdaughterratio.values));
        typeanalysis.bifurcation.cable.parentdaughterratio.max   = max(typeanalysis.bifurcation.cable.parentdaughterratio.values);
        typeanalysis.bifurcation.cable.parentdaughterratio.min   = min(typeanalysis.bifurcation.cable.parentdaughterratio.values);
        typeanalysis.bifurcation.cable.parentdaughterratio.mean  = mean(typeanalysis.bifurcation.cable.parentdaughterratio.values);
        typeanalysis.bifurcation.cable.parentdaughterratio.std   = std(typeanalysis.bifurcation.cable.parentdaughterratio.values);
        typeanalysis.bifurcation.cable.parentdaughterratio.total = sum(typeanalysis.bifurcation.cable.parentdaughterratio.values);
        typeanalysis.bifurcation.cable.parentdaughterratio.skew  = skewness(typeanalysis.bifurcation.cable.parentdaughterratio.values,0);
        typeanalysis.bifurcation.cable.parentdaughterratio.kurt  = kurtosis(typeanalysis.bifurcation.cable.parentdaughterratio.values,0);
        
        typeanalysis.bifurcation.cable.parentdaughter2ratio.values = typeanalysis.bifurcation.cable.parentdaughter2ratio.values(~isnan(typeanalysis.bifurcation.cable.parentdaughter2ratio.values));
        typeanalysis.bifurcation.cable.parentdaughter2ratio.max   = max(typeanalysis.bifurcation.cable.parentdaughter2ratio.values);
        typeanalysis.bifurcation.cable.parentdaughter2ratio.min   = min(typeanalysis.bifurcation.cable.parentdaughter2ratio.values);
        typeanalysis.bifurcation.cable.parentdaughter2ratio.mean  = mean(typeanalysis.bifurcation.cable.parentdaughter2ratio.values);
        typeanalysis.bifurcation.cable.parentdaughter2ratio.std   = std(typeanalysis.bifurcation.cable.parentdaughter2ratio.values);
        typeanalysis.bifurcation.cable.parentdaughter2ratio.total = sum(typeanalysis.bifurcation.cable.parentdaughter2ratio.values);
        typeanalysis.bifurcation.cable.parentdaughter2ratio.skew  = skewness(typeanalysis.bifurcation.cable.parentdaughter2ratio.values,0);
        typeanalysis.bifurcation.cable.parentdaughter2ratio.kurt  = kurtosis(typeanalysis.bifurcation.cable.parentdaughter2ratio.values,0);
        
        typeanalysis.bifurcation.cable.partitionasymmetry.max   = max(typeanalysis.bifurcation.cable.partitionasymmetry.values);
        typeanalysis.bifurcation.cable.partitionasymmetry.min   = min(typeanalysis.bifurcation.cable.partitionasymmetry.values);
        typeanalysis.bifurcation.cable.partitionasymmetry.mean  = mean(typeanalysis.bifurcation.cable.partitionasymmetry.values);
        typeanalysis.bifurcation.cable.partitionasymmetry.std   = std(typeanalysis.bifurcation.cable.partitionasymmetry.values);
        typeanalysis.bifurcation.cable.partitionasymmetry.total = sum(typeanalysis.bifurcation.cable.partitionasymmetry.values);
        typeanalysis.bifurcation.cable.partitionasymmetry.skew  = skewness(typeanalysis.bifurcation.cable.partitionasymmetry.values,0);
        typeanalysis.bifurcation.cable.partitionasymmetry.kurt  = kurtosis(typeanalysis.bifurcation.cable.partitionasymmetry.values,0);
        
        typeanalysis.bifurcation.cable.surfaceasymmetry.max   = max(typeanalysis.bifurcation.cable.surfaceasymmetry.values);
        typeanalysis.bifurcation.cable.surfaceasymmetry.min   = min(typeanalysis.bifurcation.cable.surfaceasymmetry.values);
        typeanalysis.bifurcation.cable.surfaceasymmetry.mean  = mean(typeanalysis.bifurcation.cable.surfaceasymmetry.values);
        typeanalysis.bifurcation.cable.surfaceasymmetry.std   = std(typeanalysis.bifurcation.cable.surfaceasymmetry.values);
        typeanalysis.bifurcation.cable.surfaceasymmetry.total = sum(typeanalysis.bifurcation.cable.surfaceasymmetry.values);
        typeanalysis.bifurcation.cable.surfaceasymmetry.skew  = skewness(typeanalysis.bifurcation.cable.surfaceasymmetry.values,0);
        typeanalysis.bifurcation.cable.surfaceasymmetry.kurt  = kurtosis(typeanalysis.bifurcation.cable.surfaceasymmetry.values,0);
        
        
        
        typeanalysis.termination.cable.branchorder.max   = max(typeanalysis.termination.cable.branchorder.values);
        typeanalysis.termination.cable.branchorder.min   = min(typeanalysis.termination.cable.branchorder.values);
        typeanalysis.termination.cable.branchorder.mean  = mean(typeanalysis.termination.cable.branchorder.values);
        typeanalysis.termination.cable.branchorder.std   = std(typeanalysis.termination.cable.branchorder.values);
        typeanalysis.termination.cable.branchorder.total = sum(typeanalysis.termination.cable.branchorder.values);
        typeanalysis.termination.cable.branchorder.skew  = skewness(typeanalysis.termination.cable.branchorder.values,0);
        typeanalysis.termination.cable.branchorder.kurt  = kurtosis(typeanalysis.termination.cable.branchorder.values,0);
        
        typeanalysis.termination.cable.degree.max   = max(typeanalysis.termination.cable.degree.values);
        typeanalysis.termination.cable.degree.min   = min(typeanalysis.termination.cable.degree.values);
        typeanalysis.termination.cable.degree.mean  = mean(typeanalysis.termination.cable.degree.values);
        typeanalysis.termination.cable.degree.std   = std(typeanalysis.termination.cable.degree.values);
        typeanalysis.termination.cable.degree.total = sum(typeanalysis.termination.cable.degree.values);
        typeanalysis.termination.cable.degree.skew  = skewness(typeanalysis.termination.cable.degree.values,0);
        typeanalysis.termination.cable.degree.kurt  = kurtosis(typeanalysis.termination.cable.degree.values,0);
        
        typeanalysis.termination.cable.proximaldiameter.max   = max(typeanalysis.termination.cable.proximaldiameter.values);
        typeanalysis.termination.cable.proximaldiameter.min   = min(typeanalysis.termination.cable.proximaldiameter.values);
        typeanalysis.termination.cable.proximaldiameter.mean  = mean(typeanalysis.termination.cable.proximaldiameter.values);
        typeanalysis.termination.cable.proximaldiameter.std   = std(typeanalysis.termination.cable.proximaldiameter.values);
        typeanalysis.termination.cable.proximaldiameter.total = sum(typeanalysis.termination.cable.proximaldiameter.values);
        typeanalysis.termination.cable.proximaldiameter.skew  = skewness(typeanalysis.termination.cable.proximaldiameter.values,0);
        typeanalysis.termination.cable.proximaldiameter.kurt  = kurtosis(typeanalysis.termination.cable.proximaldiameter.values,0);
        
        typeanalysis.termination.cable.cylindricaldiameter.max   = max(typeanalysis.termination.cable.cylindricaldiameter.values);
        typeanalysis.termination.cable.cylindricaldiameter.min   = min(typeanalysis.termination.cable.cylindricaldiameter.values);
        typeanalysis.termination.cable.cylindricaldiameter.mean  = mean(typeanalysis.termination.cable.cylindricaldiameter.values);
        typeanalysis.termination.cable.cylindricaldiameter.std   = std(typeanalysis.termination.cable.cylindricaldiameter.values);
        typeanalysis.termination.cable.cylindricaldiameter.total = sum(typeanalysis.termination.cable.cylindricaldiameter.values);
        typeanalysis.termination.cable.cylindricaldiameter.skew  = skewness(typeanalysis.termination.cable.cylindricaldiameter.values,0);
        typeanalysis.termination.cable.cylindricaldiameter.kurt  = kurtosis(typeanalysis.termination.cable.cylindricaldiameter.values,0);
        
        typeanalysis.termination.cable.distaldiameter.max   = max(typeanalysis.termination.cable.distaldiameter.values);
        typeanalysis.termination.cable.distaldiameter.min   = min(typeanalysis.termination.cable.distaldiameter.values);
        typeanalysis.termination.cable.distaldiameter.mean  = mean(typeanalysis.termination.cable.distaldiameter.values);
        typeanalysis.termination.cable.distaldiameter.std   = std(typeanalysis.termination.cable.distaldiameter.values);
        typeanalysis.termination.cable.distaldiameter.total = sum(typeanalysis.termination.cable.distaldiameter.values);
        typeanalysis.termination.cable.distaldiameter.skew  = skewness(typeanalysis.termination.cable.distaldiameter.values,0);
        typeanalysis.termination.cable.distaldiameter.kurt  = kurtosis(typeanalysis.termination.cable.distaldiameter.values,0);
        
        typeanalysis.termination.cable.length.max   = max(typeanalysis.termination.cable.length.values);
        typeanalysis.termination.cable.length.min   = min(typeanalysis.termination.cable.length.values);
        typeanalysis.termination.cable.length.mean  = mean(typeanalysis.termination.cable.length.values);
        typeanalysis.termination.cable.length.std   = std(typeanalysis.termination.cable.length.values);
        typeanalysis.termination.cable.length.total = sum(typeanalysis.termination.cable.length.values);
        typeanalysis.termination.cable.length.skew  = skewness(typeanalysis.termination.cable.length.values,0);
        typeanalysis.termination.cable.length.kurt  = kurtosis(typeanalysis.termination.cable.length.values,0);
        
        typeanalysis.termination.cable.surfacearea.max   = max(typeanalysis.termination.cable.surfacearea.values);
        typeanalysis.termination.cable.surfacearea.min   = min(typeanalysis.termination.cable.surfacearea.values);
        typeanalysis.termination.cable.surfacearea.mean  = mean(typeanalysis.termination.cable.surfacearea.values);
        typeanalysis.termination.cable.surfacearea.std   = std(typeanalysis.termination.cable.surfacearea.values);
        typeanalysis.termination.cable.surfacearea.total = sum(typeanalysis.termination.cable.surfacearea.values);
        typeanalysis.termination.cable.surfacearea.skew  = skewness(typeanalysis.termination.cable.surfacearea.values,0);
        typeanalysis.termination.cable.surfacearea.kurt  = kurtosis(typeanalysis.termination.cable.surfacearea.values,0);
        
        typeanalysis.termination.cable.volume.max   = max(typeanalysis.termination.cable.volume.values);
        typeanalysis.termination.cable.volume.min   = min(typeanalysis.termination.cable.volume.values);
        typeanalysis.termination.cable.volume.mean  = mean(typeanalysis.termination.cable.volume.values);
        typeanalysis.termination.cable.volume.std   = std(typeanalysis.termination.cable.volume.values);
        typeanalysis.termination.cable.volume.total = sum(typeanalysis.termination.cable.volume.values);
        typeanalysis.termination.cable.volume.skew  = skewness(typeanalysis.termination.cable.volume.values,0);
        typeanalysis.termination.cable.volume.kurt  = kurtosis(typeanalysis.termination.cable.volume.values,0);
        
        typeanalysis.termination.cable.proximalxdirection.max   = max(typeanalysis.termination.cable.proximalxdirection.values);
        typeanalysis.termination.cable.proximalxdirection.min   = min(typeanalysis.termination.cable.proximalxdirection.values);
        typeanalysis.termination.cable.proximalxdirection.mean  = mean(typeanalysis.termination.cable.proximalxdirection.values);
        typeanalysis.termination.cable.proximalxdirection.std   = std(typeanalysis.termination.cable.proximalxdirection.values);
        typeanalysis.termination.cable.proximalxdirection.total = sum(typeanalysis.termination.cable.proximalxdirection.values);
        typeanalysis.termination.cable.proximalxdirection.skew  = skewness(typeanalysis.termination.cable.proximalxdirection.values,0);
        typeanalysis.termination.cable.proximalxdirection.kurt  = kurtosis(typeanalysis.termination.cable.proximalxdirection.values,0);
        
        typeanalysis.termination.cable.proximalydirection.max   = max(typeanalysis.termination.cable.proximalydirection.values);
        typeanalysis.termination.cable.proximalydirection.min   = min(typeanalysis.termination.cable.proximalydirection.values);
        typeanalysis.termination.cable.proximalydirection.mean  = mean(typeanalysis.termination.cable.proximalydirection.values);
        typeanalysis.termination.cable.proximalydirection.std   = std(typeanalysis.termination.cable.proximalydirection.values);
        typeanalysis.termination.cable.proximalydirection.total = sum(typeanalysis.termination.cable.proximalydirection.values);
        typeanalysis.termination.cable.proximalydirection.skew  = skewness(typeanalysis.termination.cable.proximalydirection.values,0);
        typeanalysis.termination.cable.proximalydirection.kurt  = kurtosis(typeanalysis.termination.cable.proximalydirection.values,0);
        
        typeanalysis.termination.cable.proximalzdirection.max   = max(typeanalysis.termination.cable.proximalzdirection.values);
        typeanalysis.termination.cable.proximalzdirection.min   = min(typeanalysis.termination.cable.proximalzdirection.values);
        typeanalysis.termination.cable.proximalzdirection.mean  = mean(typeanalysis.termination.cable.proximalzdirection.values);
        typeanalysis.termination.cable.proximalzdirection.std   = std(typeanalysis.termination.cable.proximalzdirection.values);
        typeanalysis.termination.cable.proximalzdirection.total = sum(typeanalysis.termination.cable.proximalzdirection.values);
        typeanalysis.termination.cable.proximalzdirection.skew  = skewness(typeanalysis.termination.cable.proximalzdirection.values,0);
        typeanalysis.termination.cable.proximalzdirection.kurt  = kurtosis(typeanalysis.termination.cable.proximalzdirection.values,0);
        
        typeanalysis.termination.cable.distalxdirection.max   = max(typeanalysis.termination.cable.distalxdirection.values);
        typeanalysis.termination.cable.distalxdirection.min   = min(typeanalysis.termination.cable.distalxdirection.values);
        typeanalysis.termination.cable.distalxdirection.mean  = mean(typeanalysis.termination.cable.distalxdirection.values);
        typeanalysis.termination.cable.distalxdirection.std   = std(typeanalysis.termination.cable.distalxdirection.values);
        typeanalysis.termination.cable.distalxdirection.total = sum(typeanalysis.termination.cable.distalxdirection.values);
        typeanalysis.termination.cable.distalxdirection.skew  = skewness(typeanalysis.termination.cable.distalxdirection.values,0);
        typeanalysis.termination.cable.distalxdirection.kurt  = kurtosis(typeanalysis.termination.cable.distalxdirection.values,0);
        
        typeanalysis.termination.cable.distalydirection.max   = max(typeanalysis.termination.cable.distalydirection.values);
        typeanalysis.termination.cable.distalydirection.min   = min(typeanalysis.termination.cable.distalydirection.values);
        typeanalysis.termination.cable.distalydirection.mean  = mean(typeanalysis.termination.cable.distalydirection.values);
        typeanalysis.termination.cable.distalydirection.std   = std(typeanalysis.termination.cable.distalydirection.values);
        typeanalysis.termination.cable.distalydirection.total = sum(typeanalysis.termination.cable.distalydirection.values);
        typeanalysis.termination.cable.distalydirection.skew  = skewness(typeanalysis.termination.cable.distalydirection.values,0);
        typeanalysis.termination.cable.distalydirection.kurt  = kurtosis(typeanalysis.termination.cable.distalydirection.values,0);
        
        typeanalysis.termination.cable.distalzdirection.max   = max(typeanalysis.termination.cable.distalzdirection.values);
        typeanalysis.termination.cable.distalzdirection.min   = min(typeanalysis.termination.cable.distalzdirection.values);
        typeanalysis.termination.cable.distalzdirection.mean  = mean(typeanalysis.termination.cable.distalzdirection.values);
        typeanalysis.termination.cable.distalzdirection.std   = std(typeanalysis.termination.cable.distalzdirection.values);
        typeanalysis.termination.cable.distalzdirection.total = sum(typeanalysis.termination.cable.distalzdirection.values);
        typeanalysis.termination.cable.distalzdirection.skew  = skewness(typeanalysis.termination.cable.distalzdirection.values,0);
        typeanalysis.termination.cable.distalzdirection.kurt  = kurtosis(typeanalysis.termination.cable.distalzdirection.values,0);
        
        typeanalysis.termination.cable.taperrate.max   = max(typeanalysis.termination.cable.taperrate.values);
        typeanalysis.termination.cable.taperrate.min   = min(typeanalysis.termination.cable.taperrate.values);
        typeanalysis.termination.cable.taperrate.mean  = mean(typeanalysis.termination.cable.taperrate.values);
        typeanalysis.termination.cable.taperrate.std   = std(typeanalysis.termination.cable.taperrate.values);
        typeanalysis.termination.cable.taperrate.total = sum(typeanalysis.termination.cable.taperrate.values);
        typeanalysis.termination.cable.taperrate.skew  = skewness(typeanalysis.termination.cable.taperrate.values,0);
        typeanalysis.termination.cable.taperrate.kurt  = kurtosis(typeanalysis.termination.cable.taperrate.values,0);
        
        typeanalysis.termination.cable.taperratio.max   = max(typeanalysis.termination.cable.taperratio.values);
        typeanalysis.termination.cable.taperratio.min   = min(typeanalysis.termination.cable.taperratio.values);
        typeanalysis.termination.cable.taperratio.mean  = mean(typeanalysis.termination.cable.taperratio.values);
        typeanalysis.termination.cable.taperratio.std   = std(typeanalysis.termination.cable.taperratio.values);
        typeanalysis.termination.cable.taperratio.total = sum(typeanalysis.termination.cable.taperratio.values);
        typeanalysis.termination.cable.taperratio.skew  = skewness(typeanalysis.termination.cable.taperratio.values,0);
        typeanalysis.termination.cable.taperratio.kurt  = kurtosis(typeanalysis.termination.cable.taperratio.values,0);
        
        typeanalysis.termination.cable.proximalpathlength.max   = max(typeanalysis.termination.cable.proximalpathlength.values);
        typeanalysis.termination.cable.proximalpathlength.min   = min(typeanalysis.termination.cable.proximalpathlength.values);
        typeanalysis.termination.cable.proximalpathlength.mean  = mean(typeanalysis.termination.cable.proximalpathlength.values);
        typeanalysis.termination.cable.proximalpathlength.std   = std(typeanalysis.termination.cable.proximalpathlength.values);
        typeanalysis.termination.cable.proximalpathlength.total = sum(typeanalysis.termination.cable.proximalpathlength.values);
        typeanalysis.termination.cable.proximalpathlength.skew  = skewness(typeanalysis.termination.cable.proximalpathlength.values,0);
        typeanalysis.termination.cable.proximalpathlength.kurt  = kurtosis(typeanalysis.termination.cable.proximalpathlength.values,0);
        
        typeanalysis.termination.cable.distalpathlength.max   = max(typeanalysis.termination.cable.distalpathlength.values);
        typeanalysis.termination.cable.distalpathlength.min   = min(typeanalysis.termination.cable.distalpathlength.values);
        typeanalysis.termination.cable.distalpathlength.mean  = mean(typeanalysis.termination.cable.distalpathlength.values);
        typeanalysis.termination.cable.distalpathlength.std   = std(typeanalysis.termination.cable.distalpathlength.values);
        typeanalysis.termination.cable.distalpathlength.total = sum(typeanalysis.termination.cable.distalpathlength.values);
        typeanalysis.termination.cable.distalpathlength.skew  = skewness(typeanalysis.termination.cable.distalpathlength.values,0);
        typeanalysis.termination.cable.distalpathlength.kurt  = kurtosis(typeanalysis.termination.cable.distalpathlength.values,0);
        
        typeanalysis.termination.cable.proximalradialdistance.max   = max(typeanalysis.termination.cable.proximalradialdistance.values);
        typeanalysis.termination.cable.proximalradialdistance.min   = min(typeanalysis.termination.cable.proximalradialdistance.values);
        typeanalysis.termination.cable.proximalradialdistance.mean  = mean(typeanalysis.termination.cable.proximalradialdistance.values);
        typeanalysis.termination.cable.proximalradialdistance.std   = std(typeanalysis.termination.cable.proximalradialdistance.values);
        typeanalysis.termination.cable.proximalradialdistance.total = sum(typeanalysis.termination.cable.proximalradialdistance.values);
        typeanalysis.termination.cable.proximalradialdistance.skew  = skewness(typeanalysis.termination.cable.proximalradialdistance.values,0);
        typeanalysis.termination.cable.proximalradialdistance.kurt  = kurtosis(typeanalysis.termination.cable.proximalradialdistance.values,0);
        
        typeanalysis.termination.cable.distalradialdistance.max   = max(typeanalysis.termination.cable.distalradialdistance.values);
        typeanalysis.termination.cable.distalradialdistance.min   = min(typeanalysis.termination.cable.distalradialdistance.values);
        typeanalysis.termination.cable.distalradialdistance.mean  = mean(typeanalysis.termination.cable.distalradialdistance.values);
        typeanalysis.termination.cable.distalradialdistance.std   = std(typeanalysis.termination.cable.distalradialdistance.values);
        typeanalysis.termination.cable.distalradialdistance.total = sum(typeanalysis.termination.cable.distalradialdistance.values);
        typeanalysis.termination.cable.distalradialdistance.skew  = skewness(typeanalysis.termination.cable.distalradialdistance.values,0);
        typeanalysis.termination.cable.distalradialdistance.kurt  = kurtosis(typeanalysis.termination.cable.distalradialdistance.values,0);
        
        typeanalysis.termination.cable.proximaltaperrate.max   = max(typeanalysis.termination.cable.proximaltaperrate.values);
        typeanalysis.termination.cable.proximaltaperrate.min   = min(typeanalysis.termination.cable.proximaltaperrate.values);
        typeanalysis.termination.cable.proximaltaperrate.mean  = mean(typeanalysis.termination.cable.proximaltaperrate.values);
        typeanalysis.termination.cable.proximaltaperrate.std   = std(typeanalysis.termination.cable.proximaltaperrate.values);
        typeanalysis.termination.cable.proximaltaperrate.total = sum(typeanalysis.termination.cable.proximaltaperrate.values);
        typeanalysis.termination.cable.proximaltaperrate.skew  = skewness(typeanalysis.termination.cable.proximaltaperrate.values,0);
        typeanalysis.termination.cable.proximaltaperrate.kurt  = kurtosis(typeanalysis.termination.cable.proximaltaperrate.values,0);
        
        typeanalysis.termination.cable.distaltaperrate.max   = max(typeanalysis.termination.cable.distaltaperrate.values);
        typeanalysis.termination.cable.distaltaperrate.min   = min(typeanalysis.termination.cable.distaltaperrate.values);
        typeanalysis.termination.cable.distaltaperrate.mean  = mean(typeanalysis.termination.cable.distaltaperrate.values);
        typeanalysis.termination.cable.distaltaperrate.std   = std(typeanalysis.termination.cable.distaltaperrate.values);
        typeanalysis.termination.cable.distaltaperrate.total = sum(typeanalysis.termination.cable.distaltaperrate.values);
        typeanalysis.termination.cable.distaltaperrate.skew  = skewness(typeanalysis.termination.cable.distaltaperrate.values,0);
        typeanalysis.termination.cable.distaltaperrate.kurt  = kurtosis(typeanalysis.termination.cable.distaltaperrate.values,0);
        
        eval(['analysis.' currentpiecetype ' = typeanalysis;']);
        
    end
end

warning('on', 'MATLAB:divideByZero');
