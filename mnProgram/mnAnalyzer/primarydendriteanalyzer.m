function [data,analysis] = primarydendriteanalyzer(data,analysis)

disp('   Primary dendrite analysis started.');

warning('off', 'MATLAB:divideByZero');

for i = 1:length(data.individual)
    
    for j = 1:length(data.individual(i).primarydendritebins)
        
        if strcmp(data.individual(i).primarydendritebins(j).cable(1).proximaltype,'primary    ') == 1

            data.individual(i).primarydendritebins(j).motoneuron      = i;
            data.individual(i).primarydendritebins(j).primarydendrite = j;
            
            data.individual(i).primarydendritebins(j).proximaldiameter    = data.individual(i).primarydendritebins(j).cable(1).proximaldiameter;
            data.individual(i).primarydendritebins(j).cylindricaldiameter = data.individual(i).primarydendritebins(j).cable(1).cylindricaldiameter;
            data.individual(i).primarydendritebins(j).distaldiameter      = data.individual(i).primarydendritebins(j).cable(1).distaldiameter;
            
            data.individual(i).primarydendritebins(j).maxbranchorder  = 0;
            data.individual(i).primarydendritebins(j).minbranchorder  = inf;

            data.individual(i).primarydendritebins(j).length      = data.individual(i).primarydendritebins(j).cable(1).length;
            data.individual(i).primarydendritebins(j).surfacearea = data.individual(i).primarydendritebins(j).cable(1).surfacearea;
            data.individual(i).primarydendritebins(j).volume      = data.individual(i).primarydendritebins(j).cable(1).volume;

            data.individual(i).primarydendritebins(j).totallength      = 0;
            data.individual(i).primarydendritebins(j).totalsurfacearea = 0;
            data.individual(i).primarydendritebins(j).totalvolume      = 0;

            data.individual(i).primarydendritebins(j).numbersegments     = length(data.individual(i).primarydendritebins(j).cable);
            data.individual(i).primarydendritebins(j).numberbifurcations = 0;
            data.individual(i).primarydendritebins(j).numberterminations = 0;

            data.individual(i).primarydendritebins(j).proximalxdirection = data.individual(i).primarydendritebins(j).cable(1).proximalxdirection;
            data.individual(i).primarydendritebins(j).proximalydirection = data.individual(i).primarydendritebins(j).cable(1).proximalydirection;
            data.individual(i).primarydendritebins(j).proximalzdirection = data.individual(i).primarydendritebins(j).cable(1).proximalzdirection;
            data.individual(i).primarydendritebins(j).distalxdirection   = data.individual(i).primarydendritebins(j).cable(1).distalxdirection;
            data.individual(i).primarydendritebins(j).distalydirection   = data.individual(i).primarydendritebins(j).cable(1).distalydirection;
            data.individual(i).primarydendritebins(j).distalzdirection   = data.individual(i).primarydendritebins(j).cable(1).distalzdirection;

            data.individual(i).primarydendritebins(j).proximalelevation = data.individual(i).primarydendritebins(j).cable(1).piece(1).elevation;
            data.individual(i).primarydendritebins(j).proximalazimuth   = data.individual(i).primarydendritebins(j).cable(1).piece(1).azimuth;

        else
            disp('Error in individual primarydendriteanalyzer analysis.')
            keyboard;
        end
        
        for k = 1:length(data.individual(i).primarydendritebins(j).cable)            
            if data.individual(i).primarydendritebins(j).cable(k).branchorder > data.individual(i).primarydendritebins(j).maxbranchorder
                data.individual(i).primarydendritebins(j).maxbranchorder = data.individual(i).primarydendritebins(j).cable(k).branchorder;
            end
            data.individual(i).primarydendritebins(j).totallength      = data.individual(i).primarydendritebins(j).totallength + data.individual(i).primarydendritebins(j).length;
            data.individual(i).primarydendritebins(j).totalsurfacearea = data.individual(i).primarydendritebins(j).totallength + data.individual(i).primarydendritebins(j).surfacearea;
            data.individual(i).primarydendritebins(j).totalvolume      = data.individual(i).primarydendritebins(j).totallength + data.individual(i).primarydendritebins(j).volume;
        
            if strcmp(data.individual(i).primarydendritebins(j).cable(k).distaltype,'bifurcation')==1
                data.individual(i).primarydendritebins(j).numberbifurcations = 1 + data.individual(i).primarydendritebins(j).numberbifurcations;
            end
            if strcmp(data.individual(i).primarydendritebins(j).cable(k).distaltype,'termination')==1
                data.individual(i).primarydendritebins(j).numberterminations = 1 + data.individual(i).primarydendritebins(j).numberterminations;
                if data.individual(i).primarydendritebins(j).cable(k).branchorder < data.individual(i).primarydendritebins(j).minbranchorder
                    data.individual(i).primarydendritebins(j).minbranchorder = data.individual(i).primarydendritebins(j).cable(k).branchorder;
                end
            end
        end        
    end
end

anglecount = 0;
for i = 1:length(data.individual)    
    for j = 1:length(data.individual(i).primarydendritebins)        
        data.individual(i).primarydendrite.proximaldiameter.values(j)     = data.individual(i).primarydendritebins(j).proximaldiameter;
        data.individual(i).primarydendrite.cylindricaldiameter.values(j)  = data.individual(i).primarydendritebins(j).cylindricaldiameter;
        data.individual(i).primarydendrite.distaldiameter.values(j)       = data.individual(i).primarydendritebins(j).distaldiameter;
        data.individual(i).primarydendrite.length.values(j)               = data.individual(i).primarydendritebins(j).length;
        data.individual(i).primarydendrite.surfacearea.values(j)          = data.individual(i).primarydendritebins(j).surfacearea;
        data.individual(i).primarydendrite.volume.values(j)               = data.individual(i).primarydendritebins(j).volume;
        data.individual(i).primarydendrite.minbranchorder.values(j)       = data.individual(i).primarydendritebins(j).minbranchorder;
        data.individual(i).primarydendrite.maxbranchorder.values(j)       = data.individual(i).primarydendritebins(j).maxbranchorder;
        data.individual(i).primarydendrite.totallength.values(j)          = data.individual(i).primarydendritebins(j).totallength;
        data.individual(i).primarydendrite.totalsurfacearea.values(j)     = data.individual(i).primarydendritebins(j).totalsurfacearea;
        data.individual(i).primarydendrite.totalvolume.values(j)          = data.individual(i).primarydendritebins(j).totalvolume;
        data.individual(i).primarydendrite.numbersegments.values(j)       = data.individual(i).primarydendritebins(j).numbersegments;
        data.individual(i).primarydendrite.numberbifurcations.values(j)   = data.individual(i).primarydendritebins(j).numberbifurcations;
        data.individual(i).primarydendrite.numberterminations.values(j)   = data.individual(i).primarydendritebins(j).numberterminations;
        data.individual(i).primarydendrite.proximalxdirection.values(j,:) = data.individual(i).primarydendritebins(j).proximalxdirection;
        data.individual(i).primarydendrite.proximalydirection.values(j,:) = data.individual(i).primarydendritebins(j).proximalydirection;
        data.individual(i).primarydendrite.proximalzdirection.values(j,:) = data.individual(i).primarydendritebins(j).proximalzdirection;
        data.individual(i).primarydendrite.distalxdirection.values(j,:)   = data.individual(i).primarydendritebins(j).distalxdirection;
        data.individual(i).primarydendrite.distalydirection.values(j,:)   = data.individual(i).primarydendritebins(j).distalydirection;
        data.individual(i).primarydendrite.distalzdirection.values(j,:)   = data.individual(i).primarydendritebins(j).distalzdirection;
        data.individual(i).primarydendrite.proximalelevation.values(j)    = data.individual(i).primarydendritebins(j).proximalelevation;
        data.individual(i).primarydendrite.proximalazimuth.values(j)      = data.individual(i).primarydendritebins(j).proximalazimuth;
    end
end

for i = 1:length(data.individual)
    if data.individual(i).numberprimarydendrites > 1
        clear combos;
        combos = nchoosek(1:data.individual(i).numberprimarydendrites,2);
        for j = 1:size(combos,1)
            data.individual(i).primarydendrite.intertrunkangle.values(j) = acosd((data.individual(i).primarydendrite.proximalxdirection.values(combos(j,1))*data.individual(i).primarydendrite.proximalxdirection.values(combos(j,2)))+(data.individual(i).primarydendrite.proximalydirection.values(combos(j,1))*data.individual(i).primarydendrite.proximalydirection.values(combos(j,2)))+(data.individual(i).primarydendrite.proximalzdirection.values(combos(j,1))*data.individual(i).primarydendrite.proximalzdirection.values(combos(j,2))));              
            anglecount = anglecount + 1;
            analysis.primarydendrite.intertrunkangle.values(anglecount) = data.individual(i).primarydendrite.intertrunkangle.values(j);
        end
    end
end

for i = 1:length(data.individual)
    
    analysis.primarydendrite.meanproximaldiameter.values(i)    = mean(data.individual(i).primarydendrite.proximaldiameter.values);
    analysis.primarydendrite.meancylindricaldiameter.values(i) = mean(data.individual(i).primarydendrite.cylindricaldiameter.values);
    analysis.primarydendrite.meandistaldiameter.values(i)      = mean(data.individual(i).primarydendrite.distaldiameter.values);
    
    data.individual(i).primarydendrite.proximaldiameter.max   = max(data.individual(i).primarydendrite.proximaldiameter.values);
    data.individual(i).primarydendrite.proximaldiameter.mean  = mean(data.individual(i).primarydendrite.proximaldiameter.values);
    data.individual(i).primarydendrite.proximaldiameter.min   = min(data.individual(i).primarydendrite.proximaldiameter.values);
    data.individual(i).primarydendrite.proximaldiameter.std   = std(data.individual(i).primarydendrite.proximaldiameter.values);
    data.individual(i).primarydendrite.proximaldiameter.total = sum(data.individual(i).primarydendrite.proximaldiameter.values);
    data.individual(i).primarydendrite.proximaldiameter.skew  = skewness(data.individual(i).primarydendrite.proximaldiameter.values,0);
    data.individual(i).primarydendrite.proximaldiameter.kurt  = kurtosis(data.individual(i).primarydendrite.proximaldiameter.values,0);
    
    data.individual(i).primarydendrite.cylindricaldiameter.max   = max(data.individual(i).primarydendrite.cylindricaldiameter.values);
    data.individual(i).primarydendrite.cylindricaldiameter.mean  = mean(data.individual(i).primarydendrite.cylindricaldiameter.values);
    data.individual(i).primarydendrite.cylindricaldiameter.min   = min(data.individual(i).primarydendrite.cylindricaldiameter.values);
    data.individual(i).primarydendrite.cylindricaldiameter.std   = std(data.individual(i).primarydendrite.cylindricaldiameter.values);
    data.individual(i).primarydendrite.cylindricaldiameter.total = sum(data.individual(i).primarydendrite.cylindricaldiameter.values);
    data.individual(i).primarydendrite.cylindricaldiameter.skew  = skewness(data.individual(i).primarydendrite.cylindricaldiameter.values,0);
    data.individual(i).primarydendrite.cylindricaldiameter.kurt  = kurtosis(data.individual(i).primarydendrite.cylindricaldiameter.values,0);
    
    data.individual(i).primarydendrite.distaldiameter.max   = max(data.individual(i).primarydendrite.distaldiameter.values);
    data.individual(i).primarydendrite.distaldiameter.mean  = mean(data.individual(i).primarydendrite.distaldiameter.values);
    data.individual(i).primarydendrite.distaldiameter.min   = min(data.individual(i).primarydendrite.distaldiameter.values);
    data.individual(i).primarydendrite.distaldiameter.std   = std(data.individual(i).primarydendrite.distaldiameter.values);
    data.individual(i).primarydendrite.distaldiameter.total = sum(data.individual(i).primarydendrite.distaldiameter.values);
    data.individual(i).primarydendrite.distaldiameter.skew  = skewness(data.individual(i).primarydendrite.distaldiameter.values,0);
    data.individual(i).primarydendrite.distaldiameter.kurt  = kurtosis(data.individual(i).primarydendrite.distaldiameter.values,0);
    
    data.individual(i).primarydendrite.length.max   = max(data.individual(i).primarydendrite.length.values);
    data.individual(i).primarydendrite.length.mean  = mean(data.individual(i).primarydendrite.length.values);
    data.individual(i).primarydendrite.length.min   = min(data.individual(i).primarydendrite.length.values);
    data.individual(i).primarydendrite.length.std   = std(data.individual(i).primarydendrite.length.values);
    data.individual(i).primarydendrite.length.total = sum(data.individual(i).primarydendrite.length.values);
    data.individual(i).primarydendrite.length.skew  = skewness(data.individual(i).primarydendrite.length.values,0);
    data.individual(i).primarydendrite.length.kurt  = kurtosis(data.individual(i).primarydendrite.length.values,0);
    
    data.individual(i).primarydendrite.surfacearea.max   = max(data.individual(i).primarydendrite.surfacearea.values);
    data.individual(i).primarydendrite.surfacearea.mean  = mean(data.individual(i).primarydendrite.surfacearea.values);
    data.individual(i).primarydendrite.surfacearea.min   = min(data.individual(i).primarydendrite.surfacearea.values);
    data.individual(i).primarydendrite.surfacearea.std   = std(data.individual(i).primarydendrite.surfacearea.values);
    data.individual(i).primarydendrite.surfacearea.total = sum(data.individual(i).primarydendrite.surfacearea.values);
    data.individual(i).primarydendrite.surfacearea.skew  = skewness(data.individual(i).primarydendrite.surfacearea.values,0);
    data.individual(i).primarydendrite.surfacearea.kurt  = kurtosis(data.individual(i).primarydendrite.surfacearea.values,0);
    
    data.individual(i).primarydendrite.volume.max   = max(data.individual(i).primarydendrite.volume.values);
    data.individual(i).primarydendrite.volume.mean  = mean(data.individual(i).primarydendrite.volume.values);
    data.individual(i).primarydendrite.volume.min   = min(data.individual(i).primarydendrite.volume.values);
    data.individual(i).primarydendrite.volume.std   = std(data.individual(i).primarydendrite.volume.values);
    data.individual(i).primarydendrite.volume.total = sum(data.individual(i).primarydendrite.volume.values);
    data.individual(i).primarydendrite.volume.skew  = skewness(data.individual(i).primarydendrite.volume.values,0);
    data.individual(i).primarydendrite.volume.kurt  = kurtosis(data.individual(i).primarydendrite.volume.values,0);
    
    data.individual(i).primarydendrite.minbranchorder.max   = max(data.individual(i).primarydendrite.minbranchorder.values);
    data.individual(i).primarydendrite.minbranchorder.mean  = mean(data.individual(i).primarydendrite.minbranchorder.values);
    data.individual(i).primarydendrite.minbranchorder.min   = min(data.individual(i).primarydendrite.minbranchorder.values);
    data.individual(i).primarydendrite.minbranchorder.std   = std(data.individual(i).primarydendrite.minbranchorder.values);
    data.individual(i).primarydendrite.minbranchorder.total = sum(data.individual(i).primarydendrite.minbranchorder.values);
    data.individual(i).primarydendrite.minbranchorder.skew  = skewness(data.individual(i).primarydendrite.minbranchorder.values,0);
    data.individual(i).primarydendrite.minbranchorder.kurt  = kurtosis(data.individual(i).primarydendrite.minbranchorder.values,0);
    
    data.individual(i).primarydendrite.maxbranchorder.max   = max(data.individual(i).primarydendrite.maxbranchorder.values);
    data.individual(i).primarydendrite.maxbranchorder.mean  = mean(data.individual(i).primarydendrite.maxbranchorder.values);
    data.individual(i).primarydendrite.maxbranchorder.min   = min(data.individual(i).primarydendrite.maxbranchorder.values);
    data.individual(i).primarydendrite.maxbranchorder.std   = std(data.individual(i).primarydendrite.maxbranchorder.values);
    data.individual(i).primarydendrite.maxbranchorder.total = sum(data.individual(i).primarydendrite.maxbranchorder.values);
    data.individual(i).primarydendrite.maxbranchorder.skew  = skewness(data.individual(i).primarydendrite.maxbranchorder.values,0);
    data.individual(i).primarydendrite.maxbranchorder.kurt  = kurtosis(data.individual(i).primarydendrite.maxbranchorder.values,0);
    
    data.individual(i).primarydendrite.totallength.max   = max(data.individual(i).primarydendrite.totallength.values);
    data.individual(i).primarydendrite.totallength.mean  = mean(data.individual(i).primarydendrite.totallength.values);
    data.individual(i).primarydendrite.totallength.min   = min(data.individual(i).primarydendrite.totallength.values);
    data.individual(i).primarydendrite.totallength.std   = std(data.individual(i).primarydendrite.totallength.values);
    data.individual(i).primarydendrite.totallength.total = sum(data.individual(i).primarydendrite.totallength.values);
    data.individual(i).primarydendrite.totallength.skew  = skewness(data.individual(i).primarydendrite.totallength.values,0);
    data.individual(i).primarydendrite.totallength.kurt  = kurtosis(data.individual(i).primarydendrite.totallength.values,0);
    
    data.individual(i).primarydendrite.totalsurfacearea.max   = max(data.individual(i).primarydendrite.totalsurfacearea.values);
    data.individual(i).primarydendrite.totalsurfacearea.mean  = mean(data.individual(i).primarydendrite.totalsurfacearea.values);
    data.individual(i).primarydendrite.totalsurfacearea.min   = min(data.individual(i).primarydendrite.totalsurfacearea.values);
    data.individual(i).primarydendrite.totalsurfacearea.std   = std(data.individual(i).primarydendrite.totalsurfacearea.values);
    data.individual(i).primarydendrite.totalsurfacearea.total = sum(data.individual(i).primarydendrite.totalsurfacearea.values);
    data.individual(i).primarydendrite.totalsurfacearea.skew  = skewness(data.individual(i).primarydendrite.totalsurfacearea.values,0);
    data.individual(i).primarydendrite.totalsurfacearea.kurt  = kurtosis(data.individual(i).primarydendrite.totalsurfacearea.values,0);
    
    data.individual(i).primarydendrite.totalvolume.max   = max(data.individual(i).primarydendrite.totalvolume.values);
    data.individual(i).primarydendrite.totalvolume.mean  = mean(data.individual(i).primarydendrite.totalvolume.values);
    data.individual(i).primarydendrite.totalvolume.min   = min(data.individual(i).primarydendrite.totalvolume.values);
    data.individual(i).primarydendrite.totalvolume.std   = std(data.individual(i).primarydendrite.totalvolume.values);
    data.individual(i).primarydendrite.totalvolume.total = sum(data.individual(i).primarydendrite.totalvolume.values);
    data.individual(i).primarydendrite.totalvolume.skew  = skewness(data.individual(i).primarydendrite.totalvolume.values,0);
    data.individual(i).primarydendrite.totalvolume.kurt  = kurtosis(data.individual(i).primarydendrite.totalvolume.values,0);
    
    data.individual(i).primarydendrite.numbersegments.max   = max(data.individual(i).primarydendrite.numbersegments.values);
    data.individual(i).primarydendrite.numbersegments.mean  = mean(data.individual(i).primarydendrite.numbersegments.values);
    data.individual(i).primarydendrite.numbersegments.min   = min(data.individual(i).primarydendrite.numbersegments.values);
    data.individual(i).primarydendrite.numbersegments.std   = std(data.individual(i).primarydendrite.numbersegments.values);
    data.individual(i).primarydendrite.numbersegments.total = sum(data.individual(i).primarydendrite.numbersegments.values);
    data.individual(i).primarydendrite.numbersegments.skew  = skewness(data.individual(i).primarydendrite.numbersegments.values,0);
    data.individual(i).primarydendrite.numbersegments.kurt  = kurtosis(data.individual(i).primarydendrite.numbersegments.values,0);
    
    data.individual(i).primarydendrite.numberbifurcations.max   = max(data.individual(i).primarydendrite.numberbifurcations.values);
    data.individual(i).primarydendrite.numberbifurcations.mean  = mean(data.individual(i).primarydendrite.numberbifurcations.values);
    data.individual(i).primarydendrite.numberbifurcations.min   = min(data.individual(i).primarydendrite.numberbifurcations.values);
    data.individual(i).primarydendrite.numberbifurcations.std   = std(data.individual(i).primarydendrite.numberbifurcations.values);
    data.individual(i).primarydendrite.numberbifurcations.total = sum(data.individual(i).primarydendrite.numberbifurcations.values);
    data.individual(i).primarydendrite.numberbifurcations.skew  = skewness(data.individual(i).primarydendrite.numberbifurcations.values,0);
    data.individual(i).primarydendrite.numberbifurcations.kurt  = kurtosis(data.individual(i).primarydendrite.numberbifurcations.values,0);
    
    data.individual(i).primarydendrite.numberterminations.max   = max(data.individual(i).primarydendrite.numberterminations.values);
    data.individual(i).primarydendrite.numberterminations.mean  = mean(data.individual(i).primarydendrite.numberterminations.values);
    data.individual(i).primarydendrite.numberterminations.min   = min(data.individual(i).primarydendrite.numberterminations.values);
    data.individual(i).primarydendrite.numberterminations.std   = std(data.individual(i).primarydendrite.numberterminations.values);
    data.individual(i).primarydendrite.numberterminations.total = sum(data.individual(i).primarydendrite.numberterminations.values);
    data.individual(i).primarydendrite.numberterminations.skew  = skewness(data.individual(i).primarydendrite.numberterminations.values,0);
    data.individual(i).primarydendrite.numberterminations.kurt  = kurtosis(data.individual(i).primarydendrite.numberterminations.values,0);
end
    
for i = 1:length(data.population.primarydendritebins)
    
    if strcmp(data.population.primarydendritebins(i).cable(1).proximaltype,'primary    ') == 1

        data.population.primarydendritebins(i).motoneuron      = data.population.primarydendritebins(i).cable(1).motoneuron;
        data.population.primarydendritebins(i).primarydendrite = data.population.primarydendritebins(i).cable(1).primarydendrite;
        
        data.population.primarydendritebins(i).proximaldiameter    = data.population.primarydendritebins(i).cable(1).proximaldiameter;
        data.population.primarydendritebins(i).cylindricaldiameter = data.population.primarydendritebins(i).cable(1).cylindricaldiameter;
        data.population.primarydendritebins(i).distaldiameter      = data.population.primarydendritebins(i).cable(1).distaldiameter;
        
        data.population.primarydendritebins(i).maxbranchorder  = 0;
        data.population.primarydendritebins(i).minbranchorder  = inf;

        data.population.primarydendritebins(i).length      = data.population.primarydendritebins(i).cable(1).length;
        data.population.primarydendritebins(i).surfacearea = data.population.primarydendritebins(i).cable(1).surfacearea;
        data.population.primarydendritebins(i).volume      = data.population.primarydendritebins(i).cable(1).volume;

        data.population.primarydendritebins(i).totallength      = 0;
        data.population.primarydendritebins(i).totalsurfacearea = 0;
        data.population.primarydendritebins(i).totalvolume      = 0;

        data.population.primarydendritebins(i).numbersegments     = length(data.population.primarydendritebins(i).cable);
        data.population.primarydendritebins(i).numberbifurcations = 0;
        data.population.primarydendritebins(i).numberterminations = 0;
       
        data.population.primarydendritebins(i).proximalxdirection = data.population.primarydendritebins(i).cable(1).proximalxdirection;
        data.population.primarydendritebins(i).proximalydirection = data.population.primarydendritebins(i).cable(1).proximalydirection;
        data.population.primarydendritebins(i).proximalzdirection = data.population.primarydendritebins(i).cable(1).proximalzdirection;
        data.population.primarydendritebins(i).distalxdirection   = data.population.primarydendritebins(i).cable(1).distalxdirection;
        data.population.primarydendritebins(i).distalydirection   = data.population.primarydendritebins(i).cable(1).distalydirection;
        data.population.primarydendritebins(i).distalzdirection   = data.population.primarydendritebins(i).cable(1).distalzdirection;

        data.population.primarydendritebins(i).proximalelevation = data.population.primarydendritebins(i).cable(1).piece(1).elevation;
        data.population.primarydendritebins(i).proximalazimuth   = data.population.primarydendritebins(i).cable(1).piece(1).azimuth;

    else
        disp('Error in population primarydendriteanalyzer analysis.')
        keyboard;
    end

    for j = 1:length(data.population.primarydendritebins(i).cable)
        if data.population.primarydendritebins(i).cable(j).branchorder > data.population.primarydendritebins(i).maxbranchorder
            data.population.primarydendritebins(i).maxbranchorder = data.population.primarydendritebins(i).cable(j).branchorder;
        end
        data.population.primarydendritebins(i).totallength      = data.population.primarydendritebins(i).totallength + data.population.primarydendritebins(i).length;
        data.population.primarydendritebins(i).totalsurfacearea = data.population.primarydendritebins(i).totallength + data.population.primarydendritebins(i).surfacearea;
        data.population.primarydendritebins(i).totalvolume      = data.population.primarydendritebins(i).totallength + data.population.primarydendritebins(i).volume;

        if strcmp(data.population.primarydendritebins(i).cable(j).distaltype,'bifurcation')==1
            data.population.primarydendritebins(i).numberbifurcations = 1 + data.population.primarydendritebins(i).numberbifurcations;
        end
        if strcmp(data.population.primarydendritebins(i).cable(j).distaltype,'termination')==1
            data.population.primarydendritebins(i).numberterminations = 1 + data.population.primarydendritebins(i).numberterminations;
            if data.population.primarydendritebins(i).cable(j).branchorder < data.population.primarydendritebins(i).minbranchorder
                data.population.primarydendritebins(i).minbranchorder = data.population.primarydendritebins(i).cable(j).branchorder;
            end
        end
    end
end

for i = 1:length(data.population.primarydendritebins)
    analysis.primarydendrite.proximaldiameter.values(i)     = data.population.primarydendritebins(i).proximaldiameter;
    analysis.primarydendrite.cylindricaldiameter.values(i)  = data.population.primarydendritebins(i).cylindricaldiameter;
    analysis.primarydendrite.distaldiameter.values(i)       = data.population.primarydendritebins(i).distaldiameter;
    analysis.primarydendrite.length.values(i)               = data.population.primarydendritebins(i).length;
    analysis.primarydendrite.surfacearea.values(i)          = data.population.primarydendritebins(i).surfacearea;
    analysis.primarydendrite.volume.values(i)               = data.population.primarydendritebins(i).volume;
    analysis.primarydendrite.minbranchorder.values(i)       = data.population.primarydendritebins(i).minbranchorder;
    analysis.primarydendrite.maxbranchorder.values(i)       = data.population.primarydendritebins(i).maxbranchorder;
    analysis.primarydendrite.totallength.values(i)          = data.population.primarydendritebins(i).totallength;
    analysis.primarydendrite.totalsurfacearea.values(i)     = data.population.primarydendritebins(i).totalsurfacearea;
    analysis.primarydendrite.totalvolume.values(i)          = data.population.primarydendritebins(i).totalvolume;
    analysis.primarydendrite.numbersegments.values(i)       = data.population.primarydendritebins(i).numbersegments;
    analysis.primarydendrite.numberbifurcations.values(i)   = data.population.primarydendritebins(i).numberbifurcations;
    analysis.primarydendrite.numberterminations.values(i)   = data.population.primarydendritebins(i).numberterminations;
    analysis.primarydendrite.proximalxdirection.values(i,:) = data.population.primarydendritebins(i).proximalxdirection;
    analysis.primarydendrite.proximalydirection.values(i,:) = data.population.primarydendritebins(i).proximalydirection;
    analysis.primarydendrite.proximalzdirection.values(i,:) = data.population.primarydendritebins(i).proximalzdirection;
    analysis.primarydendrite.distalxdirection.values(i,:)   = data.population.primarydendritebins(i).distalxdirection;
    analysis.primarydendrite.distalydirection.values(i,:)   = data.population.primarydendritebins(i).distalydirection;
    analysis.primarydendrite.distalzdirection.values(i,:)   = data.population.primarydendritebins(i).distalzdirection;
    analysis.primarydendrite.proximalelevation.values(i)    = data.population.primarydendritebins(i).proximalelevation;
    analysis.primarydendrite.proximalazimuth.values(i)      = data.population.primarydendritebins(i).proximalazimuth;
end

analysis.primarydendrite.proximaldiameter.max   = max(analysis.primarydendrite.proximaldiameter.values);
analysis.primarydendrite.proximaldiameter.mean  = mean(analysis.primarydendrite.proximaldiameter.values);
analysis.primarydendrite.proximaldiameter.min   = min(analysis.primarydendrite.proximaldiameter.values);
analysis.primarydendrite.proximaldiameter.std   = std(analysis.primarydendrite.proximaldiameter.values);
analysis.primarydendrite.proximaldiameter.total = sum(analysis.primarydendrite.proximaldiameter.values);
analysis.primarydendrite.proximaldiameter.skew  = skewness(analysis.primarydendrite.proximaldiameter.values,0);
analysis.primarydendrite.proximaldiameter.kurt  = kurtosis(analysis.primarydendrite.proximaldiameter.values,0);

analysis.primarydendrite.cylindricaldiameter.max   = max(analysis.primarydendrite.cylindricaldiameter.values);
analysis.primarydendrite.cylindricaldiameter.mean  = mean(analysis.primarydendrite.cylindricaldiameter.values);
analysis.primarydendrite.cylindricaldiameter.min   = min(analysis.primarydendrite.cylindricaldiameter.values);
analysis.primarydendrite.cylindricaldiameter.std   = std(analysis.primarydendrite.cylindricaldiameter.values);
analysis.primarydendrite.cylindricaldiameter.total = sum(analysis.primarydendrite.cylindricaldiameter.values);
analysis.primarydendrite.cylindricaldiameter.skew  = skewness(analysis.primarydendrite.cylindricaldiameter.values,0);
analysis.primarydendrite.cylindricaldiameter.kurt  = kurtosis(analysis.primarydendrite.cylindricaldiameter.values,0);

analysis.primarydendrite.distaldiameter.max   = max(analysis.primarydendrite.distaldiameter.values);
analysis.primarydendrite.distaldiameter.mean  = mean(analysis.primarydendrite.distaldiameter.values);
analysis.primarydendrite.distaldiameter.min   = min(analysis.primarydendrite.distaldiameter.values);
analysis.primarydendrite.distaldiameter.std   = std(analysis.primarydendrite.distaldiameter.values);
analysis.primarydendrite.distaldiameter.total = sum(analysis.primarydendrite.distaldiameter.values);
analysis.primarydendrite.distaldiameter.skew  = skewness(analysis.primarydendrite.distaldiameter.values,0);
analysis.primarydendrite.distaldiameter.kurt  = kurtosis(analysis.primarydendrite.distaldiameter.values,0);

analysis.primarydendrite.length.max   = max(analysis.primarydendrite.length.values);
analysis.primarydendrite.length.mean  = mean(analysis.primarydendrite.length.values);
analysis.primarydendrite.length.min   = min(analysis.primarydendrite.length.values);
analysis.primarydendrite.length.std   = std(analysis.primarydendrite.length.values);
analysis.primarydendrite.length.total = sum(analysis.primarydendrite.length.values);
analysis.primarydendrite.length.skew  = skewness(analysis.primarydendrite.length.values,0);
analysis.primarydendrite.length.kurt  = kurtosis(analysis.primarydendrite.length.values,0);

analysis.primarydendrite.surfacearea.max   = max(analysis.primarydendrite.surfacearea.values);
analysis.primarydendrite.surfacearea.mean  = mean(analysis.primarydendrite.surfacearea.values);
analysis.primarydendrite.surfacearea.min   = min(analysis.primarydendrite.surfacearea.values);
analysis.primarydendrite.surfacearea.std   = std(analysis.primarydendrite.surfacearea.values);
analysis.primarydendrite.surfacearea.total = sum(analysis.primarydendrite.surfacearea.values);
analysis.primarydendrite.surfacearea.skew  = skewness(analysis.primarydendrite.surfacearea.values,0);
analysis.primarydendrite.surfacearea.kurt  = kurtosis(analysis.primarydendrite.surfacearea.values,0);

analysis.primarydendrite.volume.max   = max(analysis.primarydendrite.volume.values);
analysis.primarydendrite.volume.mean  = mean(analysis.primarydendrite.volume.values);
analysis.primarydendrite.volume.min   = min(analysis.primarydendrite.volume.values);
analysis.primarydendrite.volume.std   = std(analysis.primarydendrite.volume.values);
analysis.primarydendrite.volume.total = sum(analysis.primarydendrite.volume.values);
analysis.primarydendrite.volume.skew  = skewness(analysis.primarydendrite.volume.values,0);
analysis.primarydendrite.volume.kurt  = kurtosis(analysis.primarydendrite.volume.values,0);

analysis.primarydendrite.minbranchorder.max   = max(analysis.primarydendrite.minbranchorder.values);
analysis.primarydendrite.minbranchorder.mean  = mean(analysis.primarydendrite.minbranchorder.values);
analysis.primarydendrite.minbranchorder.min   = min(analysis.primarydendrite.minbranchorder.values);
analysis.primarydendrite.minbranchorder.std   = std(analysis.primarydendrite.minbranchorder.values);
analysis.primarydendrite.minbranchorder.total = sum(analysis.primarydendrite.minbranchorder.values);
analysis.primarydendrite.minbranchorder.skew  = skewness(analysis.primarydendrite.minbranchorder.values,0);
analysis.primarydendrite.minbranchorder.kurt  = kurtosis(analysis.primarydendrite.minbranchorder.values,0);

analysis.primarydendrite.maxbranchorder.max   = max(analysis.primarydendrite.maxbranchorder.values);
analysis.primarydendrite.maxbranchorder.mean  = mean(analysis.primarydendrite.maxbranchorder.values);
analysis.primarydendrite.maxbranchorder.min   = min(analysis.primarydendrite.maxbranchorder.values);
analysis.primarydendrite.maxbranchorder.std   = std(analysis.primarydendrite.maxbranchorder.values);
analysis.primarydendrite.maxbranchorder.total = sum(analysis.primarydendrite.maxbranchorder.values);
analysis.primarydendrite.maxbranchorder.skew  = skewness(analysis.primarydendrite.maxbranchorder.values,0);
analysis.primarydendrite.maxbranchorder.kurt  = kurtosis(analysis.primarydendrite.maxbranchorder.values,0);

analysis.primarydendrite.totallength.max   = max(analysis.primarydendrite.totallength.values);
analysis.primarydendrite.totallength.mean  = mean(analysis.primarydendrite.totallength.values);
analysis.primarydendrite.totallength.min   = min(analysis.primarydendrite.totallength.values);
analysis.primarydendrite.totallength.std   = std(analysis.primarydendrite.totallength.values);
analysis.primarydendrite.totallength.total = sum(analysis.primarydendrite.totallength.values);
analysis.primarydendrite.totallength.skew  = skewness(analysis.primarydendrite.totallength.values,0);
analysis.primarydendrite.totallength.kurt  = kurtosis(analysis.primarydendrite.totallength.values,0);

analysis.primarydendrite.totalsurfacearea.max   = max(analysis.primarydendrite.totalsurfacearea.values);
analysis.primarydendrite.totalsurfacearea.mean  = mean(analysis.primarydendrite.totalsurfacearea.values);
analysis.primarydendrite.totalsurfacearea.min   = min(analysis.primarydendrite.totalsurfacearea.values);
analysis.primarydendrite.totalsurfacearea.std   = std(analysis.primarydendrite.totalsurfacearea.values);
analysis.primarydendrite.totalsurfacearea.total = sum(analysis.primarydendrite.totalsurfacearea.values);
analysis.primarydendrite.totalsurfacearea.skew  = skewness(analysis.primarydendrite.totalsurfacearea.values,0);
analysis.primarydendrite.totalsurfacearea.kurt  = kurtosis(analysis.primarydendrite.totalsurfacearea.values,0);

analysis.primarydendrite.totalvolume.max   = max(analysis.primarydendrite.totalvolume.values);
analysis.primarydendrite.totalvolume.mean  = mean(analysis.primarydendrite.totalvolume.values);
analysis.primarydendrite.totalvolume.min   = min(analysis.primarydendrite.totalvolume.values);
analysis.primarydendrite.totalvolume.std   = std(analysis.primarydendrite.totalvolume.values);
analysis.primarydendrite.totalvolume.total = sum(analysis.primarydendrite.totalvolume.values);
analysis.primarydendrite.totalvolume.skew  = skewness(analysis.primarydendrite.totalvolume.values,0);
analysis.primarydendrite.totalvolume.kurt  = kurtosis(analysis.primarydendrite.totalvolume.values,0);

analysis.primarydendrite.numbersegments.max   = max(analysis.primarydendrite.numbersegments.values);
analysis.primarydendrite.numbersegments.mean  = mean(analysis.primarydendrite.numbersegments.values);
analysis.primarydendrite.numbersegments.min   = min(analysis.primarydendrite.numbersegments.values);
analysis.primarydendrite.numbersegments.std   = std(analysis.primarydendrite.numbersegments.values);
analysis.primarydendrite.numbersegments.total = sum(analysis.primarydendrite.numbersegments.values);
analysis.primarydendrite.numbersegments.skew  = skewness(analysis.primarydendrite.numbersegments.values,0);
analysis.primarydendrite.numbersegments.kurt  = kurtosis(analysis.primarydendrite.numbersegments.values,0);

analysis.primarydendrite.numberbifurcations.max   = max(analysis.primarydendrite.numberbifurcations.values);
analysis.primarydendrite.numberbifurcations.mean  = mean(analysis.primarydendrite.numberbifurcations.values);
analysis.primarydendrite.numberbifurcations.min   = min(analysis.primarydendrite.numberbifurcations.values);
analysis.primarydendrite.numberbifurcations.std   = std(analysis.primarydendrite.numberbifurcations.values);
analysis.primarydendrite.numberbifurcations.total = sum(analysis.primarydendrite.numberbifurcations.values);
analysis.primarydendrite.numberbifurcations.skew  = skewness(analysis.primarydendrite.numberbifurcations.values,0);
analysis.primarydendrite.numberbifurcations.kurt  = kurtosis(analysis.primarydendrite.numberbifurcations.values,0);

analysis.primarydendrite.numberterminations.max   = max(analysis.primarydendrite.numberterminations.values);
analysis.primarydendrite.numberterminations.mean  = mean(analysis.primarydendrite.numberterminations.values);
analysis.primarydendrite.numberterminations.min   = min(analysis.primarydendrite.numberterminations.values);
analysis.primarydendrite.numberterminations.std   = std(analysis.primarydendrite.numberterminations.values);
analysis.primarydendrite.numberterminations.total = sum(analysis.primarydendrite.numberterminations.values);
analysis.primarydendrite.numberterminations.skew  = skewness(analysis.primarydendrite.numberterminations.values,0);
analysis.primarydendrite.numberterminations.kurt  = kurtosis(analysis.primarydendrite.numberterminations.values,0);

analysis.primarydendrite.meanproximaldiameter.max   = max(analysis.primarydendrite.meanproximaldiameter.values);
analysis.primarydendrite.meanproximaldiameter.mean  = mean(analysis.primarydendrite.meanproximaldiameter.values);
analysis.primarydendrite.meanproximaldiameter.min   = min(analysis.primarydendrite.meanproximaldiameter.values);
analysis.primarydendrite.meanproximaldiameter.std   = std(analysis.primarydendrite.meanproximaldiameter.values);
analysis.primarydendrite.meanproximaldiameter.total = sum(analysis.primarydendrite.meanproximaldiameter.values);
analysis.primarydendrite.meanproximaldiameter.skew  = skewness(analysis.primarydendrite.meanproximaldiameter.values,0);
analysis.primarydendrite.meanproximaldiameter.kurt  = kurtosis(analysis.primarydendrite.meanproximaldiameter.values,0);

analysis.primarydendrite.meancylindricaldiameter.max   = max(analysis.primarydendrite.meancylindricaldiameter.values);
analysis.primarydendrite.meancylindricaldiameter.mean  = mean(analysis.primarydendrite.meancylindricaldiameter.values);
analysis.primarydendrite.meancylindricaldiameter.min   = min(analysis.primarydendrite.meancylindricaldiameter.values);
analysis.primarydendrite.meancylindricaldiameter.std   = std(analysis.primarydendrite.meancylindricaldiameter.values);
analysis.primarydendrite.meancylindricaldiameter.total = sum(analysis.primarydendrite.meancylindricaldiameter.values);
analysis.primarydendrite.meancylindricaldiameter.skew  = skewness(analysis.primarydendrite.meancylindricaldiameter.values,0);
analysis.primarydendrite.meancylindricaldiameter.kurt  = kurtosis(analysis.primarydendrite.meancylindricaldiameter.values,0);

analysis.primarydendrite.meandistaldiameter.max   = max(analysis.primarydendrite.meandistaldiameter.values);
analysis.primarydendrite.meandistaldiameter.mean  = mean(analysis.primarydendrite.meandistaldiameter.values);
analysis.primarydendrite.meandistaldiameter.min   = min(analysis.primarydendrite.meandistaldiameter.values);
analysis.primarydendrite.meandistaldiameter.std   = std(analysis.primarydendrite.meandistaldiameter.values);
analysis.primarydendrite.meandistaldiameter.total = sum(analysis.primarydendrite.meandistaldiameter.values);
analysis.primarydendrite.meandistaldiameter.skew  = skewness(analysis.primarydendrite.meandistaldiameter.values,0);
analysis.primarydendrite.meandistaldiameter.kurt  = kurtosis(analysis.primarydendrite.meandistaldiameter.values,0);

analysis.primarydendrite.proximalxdirection.max   = max(analysis.primarydendrite.proximalxdirection.values);
analysis.primarydendrite.proximalxdirection.mean  = mean(analysis.primarydendrite.proximalxdirection.values);
analysis.primarydendrite.proximalxdirection.min   = min(analysis.primarydendrite.proximalxdirection.values);
analysis.primarydendrite.proximalxdirection.std   = std(analysis.primarydendrite.proximalxdirection.values);
analysis.primarydendrite.proximalxdirection.total = sum(analysis.primarydendrite.proximalxdirection.values);
analysis.primarydendrite.proximalxdirection.skew  = skewness(analysis.primarydendrite.proximalxdirection.values);
analysis.primarydendrite.proximalxdirection.kurt  = kurtosis(analysis.primarydendrite.proximalxdirection.values);

analysis.primarydendrite.proximalydirection.max   = max(analysis.primarydendrite.proximalydirection.values);
analysis.primarydendrite.proximalydirection.mean  = mean(analysis.primarydendrite.proximalydirection.values);
analysis.primarydendrite.proximalydirection.min   = min(analysis.primarydendrite.proximalydirection.values);
analysis.primarydendrite.proximalydirection.std   = std(analysis.primarydendrite.proximalydirection.values);
analysis.primarydendrite.proximalydirection.total = sum(analysis.primarydendrite.proximalydirection.values);
analysis.primarydendrite.proximalydirection.skew  = skewness(analysis.primarydendrite.proximalydirection.values);
analysis.primarydendrite.proximalydirection.kurt  = kurtosis(analysis.primarydendrite.proximalydirection.values);

analysis.primarydendrite.proximalzdirection.max   = max(analysis.primarydendrite.proximalzdirection.values);
analysis.primarydendrite.proximalzdirection.mean  = mean(analysis.primarydendrite.proximalzdirection.values);
analysis.primarydendrite.proximalzdirection.min   = min(analysis.primarydendrite.proximalzdirection.values);
analysis.primarydendrite.proximalzdirection.std   = std(analysis.primarydendrite.proximalzdirection.values);
analysis.primarydendrite.proximalzdirection.total = sum(analysis.primarydendrite.proximalzdirection.values);
analysis.primarydendrite.proximalzdirection.skew  = skewness(analysis.primarydendrite.proximalzdirection.values);
analysis.primarydendrite.proximalzdirection.kurt  = kurtosis(analysis.primarydendrite.proximalzdirection.values);

analysis.primarydendrite.proximalelevation.max   = max(analysis.primarydendrite.proximalelevation.values);
analysis.primarydendrite.proximalelevation.mean  = mean(analysis.primarydendrite.proximalelevation.values);
analysis.primarydendrite.proximalelevation.min   = min(analysis.primarydendrite.proximalelevation.values);
analysis.primarydendrite.proximalelevation.std   = std(analysis.primarydendrite.proximalelevation.values);
analysis.primarydendrite.proximalelevation.total = sum(analysis.primarydendrite.proximalelevation.values);
analysis.primarydendrite.proximalelevation.skew  = skewness(analysis.primarydendrite.proximalelevation.values);
analysis.primarydendrite.proximalelevation.kurt  = kurtosis(analysis.primarydendrite.proximalelevation.values);

analysis.primarydendrite.proximalazimuth.max   = max(analysis.primarydendrite.proximalazimuth.values);
analysis.primarydendrite.proximalazimuth.mean  = mean(analysis.primarydendrite.proximalazimuth.values);
analysis.primarydendrite.proximalazimuth.min   = min(analysis.primarydendrite.proximalazimuth.values);
analysis.primarydendrite.proximalazimuth.std   = std(analysis.primarydendrite.proximalazimuth.values);
analysis.primarydendrite.proximalazimuth.total = sum(analysis.primarydendrite.proximalazimuth.values);
analysis.primarydendrite.proximalazimuth.skew  = skewness(analysis.primarydendrite.proximalazimuth.values);
analysis.primarydendrite.proximalazimuth.kurt  = kurtosis(analysis.primarydendrite.proximalazimuth.values);

% analysis.primarydendrite.intertrunkangle.max   = max(analysis.primarydendrite.intertrunkangle.values);
% analysis.primarydendrite.intertrunkangle.mean  = mean(analysis.primarydendrite.intertrunkangle.values);
% analysis.primarydendrite.intertrunkangle.min   = min(analysis.primarydendrite.intertrunkangle.values);
% analysis.primarydendrite.intertrunkangle.std   = std(analysis.primarydendrite.intertrunkangle.values);
% analysis.primarydendrite.intertrunkangle.total = sum(analysis.primarydendrite.intertrunkangle.values);
% analysis.primarydendrite.intertrunkangle.skew  = skewness(analysis.primarydendrite.intertrunkangle.values);
% analysis.primarydendrite.intertrunkangle.kurt  = kurtosis(analysis.primarydendrite.intertrunkangle.values);


warning('on', 'MATLAB:divideByZero');
