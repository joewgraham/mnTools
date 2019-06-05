% function [data,analysis] = somaanalyzer(mnpop,data,analysis)
%
% disp('   Soma analysis started.');
%
% warning('off', 'MATLAB:divideByZero');
%
% mnoptions;
%
% piecetypes{1} = 'soma';
% piecetypes{2} = 'axon';
% piecetypes{3} = 'dendrite';
% piecetypes{4} = 'apical';
%
% for i = 1:length(data.individual)

function somaanalyzer_test(mnpop)


i = 1;

somapoints = mnpop.mn(i).soma.points;
data.individual(i).soma.points = somapoints;

if size(somapoints,1) > 2
    
    x = somapoints(:,1);
    y = somapoints(:,2);
    z = somapoints(:,3);
    data.individual(i).soma.center = [((min(x)+max(x))/2) ((min(y)+max(y))/2) ((min(z)+max(z))/2)];
    
    A2 = x(1:end-1).*y(2:end)-x(2:end).*y(1:end-1);
    A2s = sum(A2)/2;
    x_bar = (sum((x(2:end)+x(1:end-1)).*A2)*1/6)/A2s;
    y_bar = (sum((y(2:end)+y(1:end-1)).*A2)*1/6)/A2s;
    data.individual(i).soma.centroid = [x_bar y_bar ((min(z)+max(z))/2)];
    
    data.individual(i).soma.csa = polyarea(x,y);
    
    xc = x - x_bar;
    yc = y - y_bar;
    xc = [xc; xc(1)];
    yc = [yc; yc(1)];
    step = (max(yc)-min(yc)) / 20;
    cylindercenters = [min(yc)+step/2:step:max(yc)-step/2];
    somavolume = 0;
    for cyl = 1:length(cylindercenters)
        linex = [-1000; 1000];
        liney = [cylindercenters(cyl); cylindercenters(cyl)];
        [xint,yint] = polyxpoly(linex,liney,xc,yc);
        rad = range(xint)/2;
        cylindervolume = pi()*rad*rad*step;
        somavolume = somavolume + cylindervolume; 
    end
    
    data.individual(i).soma.volume = polyarea(x,y);
    
end

keyboard

% end
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
% for piecetype = 2:4
%
%     if isfield(data.population,piecetypes{piecetype})
%
%         currentpiecetype = piecetypes{piecetype};
%         clear typeanalysis;
%         clear popdata;
%         eval(['typeanalysis = analysis.' currentpiecetype ';']);
%         eval(['popdata = data.population.' currentpiecetype ';']);
%
%         for i = 1:length(data.individual)
%
%             clear inddata;
%             eval(['inddata = data.individual(i).' currentpiecetype ';']);
%
%
%             for j = 1:length(inddata.trunkbins)
%
%                 if strcmp(inddata.trunkbins(j).cable(1).proximaltype,'primary    ') == 1
%
%                     inddata.trunkbins(j).motoneuron      = i;
%                     inddata.trunkbins(j).trunk = j;
%
%                     inddata.trunkbins(j).proximaldiameter    = inddata.trunkbins(j).cable(1).proximaldiameter;
%                     inddata.trunkbins(j).cylindricaldiameter = inddata.trunkbins(j).cable(1).cylindricaldiameter;
%                     inddata.trunkbins(j).distaldiameter      = inddata.trunkbins(j).cable(1).distaldiameter;
%
%                     inddata.trunkbins(j).maxbranchorder  = 0;
%                     inddata.trunkbins(j).minbranchorder  = inf;
%
%                     inddata.trunkbins(j).length      = inddata.trunkbins(j).cable(1).length;
%                     inddata.trunkbins(j).surfacearea = inddata.trunkbins(j).cable(1).surfacearea;
%                     inddata.trunkbins(j).volume      = inddata.trunkbins(j).cable(1).volume;
%
%                     inddata.trunkbins(j).totallength      = 0;
%                     inddata.trunkbins(j).totalsurfacearea = 0;
%                     inddata.trunkbins(j).totalvolume      = 0;
%
%                     inddata.trunkbins(j).numbersegments     = length(inddata.trunkbins(j).cable);
%                     inddata.trunkbins(j).numberbifurcations = 0;
%                     inddata.trunkbins(j).numberterminations = 0;
%
%                     inddata.trunkbins(j).proximalxposition = inddata.trunkbins(j).cable(1).piece(1).proximalxposition;
%                     inddata.trunkbins(j).proximalyposition = inddata.trunkbins(j).cable(1).piece(1).proximalyposition;
%                     inddata.trunkbins(j).proximalzposition = inddata.trunkbins(j).cable(1).piece(1).proximalzposition;
%
%                     inddata.trunkbins(j).proximalxdirection = inddata.trunkbins(j).cable(1).proximalxdirection;
%                     inddata.trunkbins(j).proximalydirection = inddata.trunkbins(j).cable(1).proximalydirection;
%                     inddata.trunkbins(j).proximalzdirection = inddata.trunkbins(j).cable(1).proximalzdirection;
%                     inddata.trunkbins(j).distalxdirection   = inddata.trunkbins(j).cable(1).distalxdirection;
%                     inddata.trunkbins(j).distalydirection   = inddata.trunkbins(j).cable(1).distalydirection;
%                     inddata.trunkbins(j).distalzdirection   = inddata.trunkbins(j).cable(1).distalzdirection;
%
%                     inddata.trunkbins(j).proximalelevation = inddata.trunkbins(j).cable(1).piece(1).elevation;
%                     inddata.trunkbins(j).proximalazimuth   = inddata.trunkbins(j).cable(1).piece(1).azimuth;
%
%                 else
%                     disp('Error in individual trunkanalyzer analysis.')
%                     keyboard;
%                 end
%
%                 for k = 1:length(inddata.trunkbins(j).cable)
%                     if inddata.trunkbins(j).cable(k).branchorder > inddata.trunkbins(j).maxbranchorder
%                         inddata.trunkbins(j).maxbranchorder = inddata.trunkbins(j).cable(k).branchorder;
%                     end
%                     inddata.trunkbins(j).totallength      = inddata.trunkbins(j).totallength + inddata.trunkbins(j).length;
%                     inddata.trunkbins(j).totalsurfacearea = inddata.trunkbins(j).totallength + inddata.trunkbins(j).surfacearea;
%                     inddata.trunkbins(j).totalvolume      = inddata.trunkbins(j).totallength + inddata.trunkbins(j).volume;
%
%                     if strcmp(inddata.trunkbins(j).cable(k).distaltype,'bifurcation')==1
%                         inddata.trunkbins(j).numberbifurcations = 1 + inddata.trunkbins(j).numberbifurcations;
%                     end
%                     if strcmp(inddata.trunkbins(j).cable(k).distaltype,'termination')==1
%                         inddata.trunkbins(j).numberterminations = 1 + inddata.trunkbins(j).numberterminations;
%                         if inddata.trunkbins(j).cable(k).branchorder < inddata.trunkbins(j).minbranchorder
%                             inddata.trunkbins(j).minbranchorder = inddata.trunkbins(j).cable(k).branchorder;
%                         end
%                     end
%                 end
%             end
%             eval(['data.individual(i).' currentpiecetype ' = inddata;']);
%         end
%
%         anglecount = 0;
%         for i = 1:length(data.individual)
%             eval(['inddata = data.individual(i).' currentpiecetype ';']);
%             for j = 1:length(inddata.trunkbins)
%                 inddata.trunk.proximaldiameter.values(j)     = inddata.trunkbins(j).proximaldiameter;
%                 inddata.trunk.cylindricaldiameter.values(j)  = inddata.trunkbins(j).cylindricaldiameter;
%                 inddata.trunk.distaldiameter.values(j)       = inddata.trunkbins(j).distaldiameter;
%                 inddata.trunk.length.values(j)               = inddata.trunkbins(j).length;
%                 inddata.trunk.surfacearea.values(j)          = inddata.trunkbins(j).surfacearea;
%                 inddata.trunk.volume.values(j)               = inddata.trunkbins(j).volume;
%                 inddata.trunk.minbranchorder.values(j)       = inddata.trunkbins(j).minbranchorder;
%                 inddata.trunk.maxbranchorder.values(j)       = inddata.trunkbins(j).maxbranchorder;
%                 inddata.trunk.totallength.values(j)          = inddata.trunkbins(j).totallength;
%                 inddata.trunk.totalsurfacearea.values(j)     = inddata.trunkbins(j).totalsurfacearea;
%                 inddata.trunk.totalvolume.values(j)          = inddata.trunkbins(j).totalvolume;
%                 inddata.trunk.numbersegments.values(j)       = inddata.trunkbins(j).numbersegments;
%                 inddata.trunk.numberbifurcations.values(j)   = inddata.trunkbins(j).numberbifurcations;
%                 inddata.trunk.numberterminations.values(j)   = inddata.trunkbins(j).numberterminations;
%                 inddata.trunk.proximalxposition.values(j,:) = inddata.trunkbins(j).proximalxposition;
%                 inddata.trunk.proximalyposition.values(j,:) = inddata.trunkbins(j).proximalyposition;
%                 inddata.trunk.proximalzposition.values(j,:) = inddata.trunkbins(j).proximalzposition;
%                 inddata.trunk.proximalxdirection.values(j,:) = inddata.trunkbins(j).proximalxdirection;
%                 inddata.trunk.proximalydirection.values(j,:) = inddata.trunkbins(j).proximalydirection;
%                 inddata.trunk.proximalzdirection.values(j,:) = inddata.trunkbins(j).proximalzdirection;
%                 inddata.trunk.distalxdirection.values(j,:)   = inddata.trunkbins(j).distalxdirection;
%                 inddata.trunk.distalydirection.values(j,:)   = inddata.trunkbins(j).distalydirection;
%                 inddata.trunk.distalzdirection.values(j,:)   = inddata.trunkbins(j).distalzdirection;
%                 inddata.trunk.proximalelevation.values(j)    = inddata.trunkbins(j).proximalelevation;
%                 inddata.trunk.proximalazimuth.values(j)      = inddata.trunkbins(j).proximalazimuth;
%             end
%             eval(['data.individual(i).' currentpiecetype ' = inddata;']);
%         end
%
%         for i = 1:length(data.individual)
%             eval(['inddata = data.individual(i).' currentpiecetype ';']);
%             if inddata.numbertrunks > 1
%                 clear combos;
%                 combos = nchoosek(1:inddata.numbertrunks,2);
%                 for j = 1:size(combos,1)
%                     inddata.trunk.intertrunkangle.values(j) = acosd((inddata.trunk.proximalxdirection.values(combos(j,1))*inddata.trunk.proximalxdirection.values(combos(j,2)))+(inddata.trunk.proximalydirection.values(combos(j,1))*inddata.trunk.proximalydirection.values(combos(j,2)))+(inddata.trunk.proximalzdirection.values(combos(j,1))*inddata.trunk.proximalzdirection.values(combos(j,2))));
%                     anglecount = anglecount + 1;
%                     typeanalysis.trunk.intertrunkangle.values(anglecount) = inddata.trunk.intertrunkangle.values(j);
%                 end
%             end
%             eval(['data.individual(i).' currentpiecetype ' = inddata;']);
%         end
%
%         for i = 1:length(data.individual)
%
%             eval(['inddata = data.individual(i).' currentpiecetype ';']);
%
%             typeanalysis.trunk.meanproximaldiameter.values(i)    = mean(inddata.trunk.proximaldiameter.values);
%             typeanalysis.trunk.meancylindricaldiameter.values(i) = mean(inddata.trunk.cylindricaldiameter.values);
%             typeanalysis.trunk.meandistaldiameter.values(i)      = mean(inddata.trunk.distaldiameter.values);
%
%             inddata.trunk.proximaldiameter.max   = max(inddata.trunk.proximaldiameter.values);
%             inddata.trunk.proximaldiameter.mean  = mean(inddata.trunk.proximaldiameter.values);
%             inddata.trunk.proximaldiameter.min   = min(inddata.trunk.proximaldiameter.values);
%             inddata.trunk.proximaldiameter.std   = std(inddata.trunk.proximaldiameter.values);
%             inddata.trunk.proximaldiameter.total = sum(inddata.trunk.proximaldiameter.values);
%             inddata.trunk.proximaldiameter.skew  = skewness(inddata.trunk.proximaldiameter.values,0);
%             inddata.trunk.proximaldiameter.kurt  = kurtosis(inddata.trunk.proximaldiameter.values,0);
%
%             inddata.trunk.cylindricaldiameter.max   = max(inddata.trunk.cylindricaldiameter.values);
%             inddata.trunk.cylindricaldiameter.mean  = mean(inddata.trunk.cylindricaldiameter.values);
%             inddata.trunk.cylindricaldiameter.min   = min(inddata.trunk.cylindricaldiameter.values);
%             inddata.trunk.cylindricaldiameter.std   = std(inddata.trunk.cylindricaldiameter.values);
%             inddata.trunk.cylindricaldiameter.total = sum(inddata.trunk.cylindricaldiameter.values);
%             inddata.trunk.cylindricaldiameter.skew  = skewness(inddata.trunk.cylindricaldiameter.values,0);
%             inddata.trunk.cylindricaldiameter.kurt  = kurtosis(inddata.trunk.cylindricaldiameter.values,0);
%
%             inddata.trunk.distaldiameter.max   = max(inddata.trunk.distaldiameter.values);
%             inddata.trunk.distaldiameter.mean  = mean(inddata.trunk.distaldiameter.values);
%             inddata.trunk.distaldiameter.min   = min(inddata.trunk.distaldiameter.values);
%             inddata.trunk.distaldiameter.std   = std(inddata.trunk.distaldiameter.values);
%             inddata.trunk.distaldiameter.total = sum(inddata.trunk.distaldiameter.values);
%             inddata.trunk.distaldiameter.skew  = skewness(inddata.trunk.distaldiameter.values,0);
%             inddata.trunk.distaldiameter.kurt  = kurtosis(inddata.trunk.distaldiameter.values,0);
%
%             inddata.trunk.length.max   = max(inddata.trunk.length.values);
%             inddata.trunk.length.mean  = mean(inddata.trunk.length.values);
%             inddata.trunk.length.min   = min(inddata.trunk.length.values);
%             inddata.trunk.length.std   = std(inddata.trunk.length.values);
%             inddata.trunk.length.total = sum(inddata.trunk.length.values);
%             inddata.trunk.length.skew  = skewness(inddata.trunk.length.values,0);
%             inddata.trunk.length.kurt  = kurtosis(inddata.trunk.length.values,0);
%
%             inddata.trunk.surfacearea.max   = max(inddata.trunk.surfacearea.values);
%             inddata.trunk.surfacearea.mean  = mean(inddata.trunk.surfacearea.values);
%             inddata.trunk.surfacearea.min   = min(inddata.trunk.surfacearea.values);
%             inddata.trunk.surfacearea.std   = std(inddata.trunk.surfacearea.values);
%             inddata.trunk.surfacearea.total = sum(inddata.trunk.surfacearea.values);
%             inddata.trunk.surfacearea.skew  = skewness(inddata.trunk.surfacearea.values,0);
%             inddata.trunk.surfacearea.kurt  = kurtosis(inddata.trunk.surfacearea.values,0);
%
%             inddata.trunk.volume.max   = max(inddata.trunk.volume.values);
%             inddata.trunk.volume.mean  = mean(inddata.trunk.volume.values);
%             inddata.trunk.volume.min   = min(inddata.trunk.volume.values);
%             inddata.trunk.volume.std   = std(inddata.trunk.volume.values);
%             inddata.trunk.volume.total = sum(inddata.trunk.volume.values);
%             inddata.trunk.volume.skew  = skewness(inddata.trunk.volume.values,0);
%             inddata.trunk.volume.kurt  = kurtosis(inddata.trunk.volume.values,0);
%
%             inddata.trunk.minbranchorder.max   = max(inddata.trunk.minbranchorder.values);
%             inddata.trunk.minbranchorder.mean  = mean(inddata.trunk.minbranchorder.values);
%             inddata.trunk.minbranchorder.min   = min(inddata.trunk.minbranchorder.values);
%             inddata.trunk.minbranchorder.std   = std(inddata.trunk.minbranchorder.values);
%             inddata.trunk.minbranchorder.total = sum(inddata.trunk.minbranchorder.values);
%             inddata.trunk.minbranchorder.skew  = skewness(inddata.trunk.minbranchorder.values,0);
%             inddata.trunk.minbranchorder.kurt  = kurtosis(inddata.trunk.minbranchorder.values,0);
%
%             inddata.trunk.maxbranchorder.max   = max(inddata.trunk.maxbranchorder.values);
%             inddata.trunk.maxbranchorder.mean  = mean(inddata.trunk.maxbranchorder.values);
%             inddata.trunk.maxbranchorder.min   = min(inddata.trunk.maxbranchorder.values);
%             inddata.trunk.maxbranchorder.std   = std(inddata.trunk.maxbranchorder.values);
%             inddata.trunk.maxbranchorder.total = sum(inddata.trunk.maxbranchorder.values);
%             inddata.trunk.maxbranchorder.skew  = skewness(inddata.trunk.maxbranchorder.values,0);
%             inddata.trunk.maxbranchorder.kurt  = kurtosis(inddata.trunk.maxbranchorder.values,0);
%
%             inddata.trunk.totallength.max   = max(inddata.trunk.totallength.values);
%             inddata.trunk.totallength.mean  = mean(inddata.trunk.totallength.values);
%             inddata.trunk.totallength.min   = min(inddata.trunk.totallength.values);
%             inddata.trunk.totallength.std   = std(inddata.trunk.totallength.values);
%             inddata.trunk.totallength.total = sum(inddata.trunk.totallength.values);
%             inddata.trunk.totallength.skew  = skewness(inddata.trunk.totallength.values,0);
%             inddata.trunk.totallength.kurt  = kurtosis(inddata.trunk.totallength.values,0);
%
%             inddata.trunk.totalsurfacearea.max   = max(inddata.trunk.totalsurfacearea.values);
%             inddata.trunk.totalsurfacearea.mean  = mean(inddata.trunk.totalsurfacearea.values);
%             inddata.trunk.totalsurfacearea.min   = min(inddata.trunk.totalsurfacearea.values);
%             inddata.trunk.totalsurfacearea.std   = std(inddata.trunk.totalsurfacearea.values);
%             inddata.trunk.totalsurfacearea.total = sum(inddata.trunk.totalsurfacearea.values);
%             inddata.trunk.totalsurfacearea.skew  = skewness(inddata.trunk.totalsurfacearea.values,0);
%             inddata.trunk.totalsurfacearea.kurt  = kurtosis(inddata.trunk.totalsurfacearea.values,0);
%
%             inddata.trunk.totalvolume.max   = max(inddata.trunk.totalvolume.values);
%             inddata.trunk.totalvolume.mean  = mean(inddata.trunk.totalvolume.values);
%             inddata.trunk.totalvolume.min   = min(inddata.trunk.totalvolume.values);
%             inddata.trunk.totalvolume.std   = std(inddata.trunk.totalvolume.values);
%             inddata.trunk.totalvolume.total = sum(inddata.trunk.totalvolume.values);
%             inddata.trunk.totalvolume.skew  = skewness(inddata.trunk.totalvolume.values,0);
%             inddata.trunk.totalvolume.kurt  = kurtosis(inddata.trunk.totalvolume.values,0);
%
%             inddata.trunk.numbersegments.max   = max(inddata.trunk.numbersegments.values);
%             inddata.trunk.numbersegments.mean  = mean(inddata.trunk.numbersegments.values);
%             inddata.trunk.numbersegments.min   = min(inddata.trunk.numbersegments.values);
%             inddata.trunk.numbersegments.std   = std(inddata.trunk.numbersegments.values);
%             inddata.trunk.numbersegments.total = sum(inddata.trunk.numbersegments.values);
%             inddata.trunk.numbersegments.skew  = skewness(inddata.trunk.numbersegments.values,0);
%             inddata.trunk.numbersegments.kurt  = kurtosis(inddata.trunk.numbersegments.values,0);
%
%             inddata.trunk.numberbifurcations.max   = max(inddata.trunk.numberbifurcations.values);
%             inddata.trunk.numberbifurcations.mean  = mean(inddata.trunk.numberbifurcations.values);
%             inddata.trunk.numberbifurcations.min   = min(inddata.trunk.numberbifurcations.values);
%             inddata.trunk.numberbifurcations.std   = std(inddata.trunk.numberbifurcations.values);
%             inddata.trunk.numberbifurcations.total = sum(inddata.trunk.numberbifurcations.values);
%             inddata.trunk.numberbifurcations.skew  = skewness(inddata.trunk.numberbifurcations.values,0);
%             inddata.trunk.numberbifurcations.kurt  = kurtosis(inddata.trunk.numberbifurcations.values,0);
%
%             inddata.trunk.numberterminations.max   = max(inddata.trunk.numberterminations.values);
%             inddata.trunk.numberterminations.mean  = mean(inddata.trunk.numberterminations.values);
%             inddata.trunk.numberterminations.min   = min(inddata.trunk.numberterminations.values);
%             inddata.trunk.numberterminations.std   = std(inddata.trunk.numberterminations.values);
%             inddata.trunk.numberterminations.total = sum(inddata.trunk.numberterminations.values);
%             inddata.trunk.numberterminations.skew  = skewness(inddata.trunk.numberterminations.values,0);
%             inddata.trunk.numberterminations.kurt  = kurtosis(inddata.trunk.numberterminations.values,0);
%
%             eval(['data.individual(i).' currentpiecetype ' = inddata;']);
%         end
%
%         for i = 1:length(popdata.trunkbins)
%
%             if strcmp(popdata.trunkbins(i).cable(1).proximaltype,'primary    ') == 1
%
%                 popdata.trunkbins(i).motoneuron      = popdata.trunkbins(i).cable(1).motoneuron;
%                 popdata.trunkbins(i).trunk = popdata.trunkbins(i).cable(1).trunk;
%
%                 popdata.trunkbins(i).proximaldiameter    = popdata.trunkbins(i).cable(1).proximaldiameter;
%                 popdata.trunkbins(i).cylindricaldiameter = popdata.trunkbins(i).cable(1).cylindricaldiameter;
%                 popdata.trunkbins(i).distaldiameter      = popdata.trunkbins(i).cable(1).distaldiameter;
%
%                 popdata.trunkbins(i).maxbranchorder  = 0;
%                 popdata.trunkbins(i).minbranchorder  = inf;
%
%                 popdata.trunkbins(i).length      = popdata.trunkbins(i).cable(1).length;
%                 popdata.trunkbins(i).surfacearea = popdata.trunkbins(i).cable(1).surfacearea;
%                 popdata.trunkbins(i).volume      = popdata.trunkbins(i).cable(1).volume;
%
%                 popdata.trunkbins(i).totallength      = 0;
%                 popdata.trunkbins(i).totalsurfacearea = 0;
%                 popdata.trunkbins(i).totalvolume      = 0;
%
%                 popdata.trunkbins(i).numbersegments     = length(popdata.trunkbins(i).cable);
%                 popdata.trunkbins(i).numberbifurcations = 0;
%                 popdata.trunkbins(i).numberterminations = 0;
%
%                 popdata.trunkbins(i).proximalxposition = popdata.trunkbins(i).cable(1).piece(1).proximalxposition;
%                 popdata.trunkbins(i).proximalyposition = popdata.trunkbins(i).cable(1).piece(1).proximalyposition;
%                 popdata.trunkbins(i).proximalzposition = popdata.trunkbins(i).cable(1).piece(1).proximalzposition;
%
%                 popdata.trunkbins(i).proximalxdirection = popdata.trunkbins(i).cable(1).proximalxdirection;
%                 popdata.trunkbins(i).proximalydirection = popdata.trunkbins(i).cable(1).proximalydirection;
%                 popdata.trunkbins(i).proximalzdirection = popdata.trunkbins(i).cable(1).proximalzdirection;
%                 popdata.trunkbins(i).distalxdirection   = popdata.trunkbins(i).cable(1).distalxdirection;
%                 popdata.trunkbins(i).distalydirection   = popdata.trunkbins(i).cable(1).distalydirection;
%                 popdata.trunkbins(i).distalzdirection   = popdata.trunkbins(i).cable(1).distalzdirection;
%
%                 popdata.trunkbins(i).proximalelevation = popdata.trunkbins(i).cable(1).piece(1).elevation;
%                 popdata.trunkbins(i).proximalazimuth   = popdata.trunkbins(i).cable(1).piece(1).azimuth;
%
%             else
%                 disp('Error in population trunkanalyzer analysis.')
%                 keyboard;
%             end
%
%             for j = 1:length(popdata.trunkbins(i).cable)
%                 if popdata.trunkbins(i).cable(j).branchorder > popdata.trunkbins(i).maxbranchorder
%                     popdata.trunkbins(i).maxbranchorder = popdata.trunkbins(i).cable(j).branchorder;
%                 end
%                 popdata.trunkbins(i).totallength      = popdata.trunkbins(i).totallength + popdata.trunkbins(i).length;
%                 popdata.trunkbins(i).totalsurfacearea = popdata.trunkbins(i).totallength + popdata.trunkbins(i).surfacearea;
%                 popdata.trunkbins(i).totalvolume      = popdata.trunkbins(i).totallength + popdata.trunkbins(i).volume;
%
%                 if strcmp(popdata.trunkbins(i).cable(j).distaltype,'bifurcation')==1
%                     popdata.trunkbins(i).numberbifurcations = 1 + popdata.trunkbins(i).numberbifurcations;
%                 end
%                 if strcmp(popdata.trunkbins(i).cable(j).distaltype,'termination')==1
%                     popdata.trunkbins(i).numberterminations = 1 + popdata.trunkbins(i).numberterminations;
%                     if popdata.trunkbins(i).cable(j).branchorder < popdata.trunkbins(i).minbranchorder
%                         popdata.trunkbins(i).minbranchorder = popdata.trunkbins(i).cable(j).branchorder;
%                     end
%                 end
%             end
%         end
%
%         for i = 1:length(popdata.trunkbins)
%             typeanalysis.trunk.proximaldiameter.values(i)     = popdata.trunkbins(i).proximaldiameter;
%             typeanalysis.trunk.cylindricaldiameter.values(i)  = popdata.trunkbins(i).cylindricaldiameter;
%             typeanalysis.trunk.distaldiameter.values(i)       = popdata.trunkbins(i).distaldiameter;
%             typeanalysis.trunk.length.values(i)               = popdata.trunkbins(i).length;
%             typeanalysis.trunk.surfacearea.values(i)          = popdata.trunkbins(i).surfacearea;
%             typeanalysis.trunk.volume.values(i)               = popdata.trunkbins(i).volume;
%             typeanalysis.trunk.minbranchorder.values(i)       = popdata.trunkbins(i).minbranchorder;
%             typeanalysis.trunk.maxbranchorder.values(i)       = popdata.trunkbins(i).maxbranchorder;
%             typeanalysis.trunk.totallength.values(i)          = popdata.trunkbins(i).totallength;
%             typeanalysis.trunk.totalsurfacearea.values(i)     = popdata.trunkbins(i).totalsurfacearea;
%             typeanalysis.trunk.totalvolume.values(i)          = popdata.trunkbins(i).totalvolume;
%             typeanalysis.trunk.numbersegments.values(i)       = popdata.trunkbins(i).numbersegments;
%             typeanalysis.trunk.numberbifurcations.values(i)   = popdata.trunkbins(i).numberbifurcations;
%             typeanalysis.trunk.numberterminations.values(i)   = popdata.trunkbins(i).numberterminations;
%             typeanalysis.trunk.proximalxposition.values(i,:) = popdata.trunkbins(i).proximalxposition;
%             typeanalysis.trunk.proximalyposition.values(i,:) = popdata.trunkbins(i).proximalyposition;
%             typeanalysis.trunk.proximalzposition.values(i,:) = popdata.trunkbins(i).proximalzposition;
%             typeanalysis.trunk.proximalxdirection.values(i,:) = popdata.trunkbins(i).proximalxdirection;
%             typeanalysis.trunk.proximalydirection.values(i,:) = popdata.trunkbins(i).proximalydirection;
%             typeanalysis.trunk.proximalzdirection.values(i,:) = popdata.trunkbins(i).proximalzdirection;
%             typeanalysis.trunk.distalxdirection.values(i,:)   = popdata.trunkbins(i).distalxdirection;
%             typeanalysis.trunk.distalydirection.values(i,:)   = popdata.trunkbins(i).distalydirection;
%             typeanalysis.trunk.distalzdirection.values(i,:)   = popdata.trunkbins(i).distalzdirection;
%             typeanalysis.trunk.proximalelevation.values(i)    = popdata.trunkbins(i).proximalelevation;
%             typeanalysis.trunk.proximalazimuth.values(i)      = popdata.trunkbins(i).proximalazimuth;
%         end
%
%         typeanalysis.trunk.proximaldiameter.max   = max(typeanalysis.trunk.proximaldiameter.values);
%         typeanalysis.trunk.proximaldiameter.mean  = mean(typeanalysis.trunk.proximaldiameter.values);
%         typeanalysis.trunk.proximaldiameter.min   = min(typeanalysis.trunk.proximaldiameter.values);
%         typeanalysis.trunk.proximaldiameter.std   = std(typeanalysis.trunk.proximaldiameter.values);
%         typeanalysis.trunk.proximaldiameter.total = sum(typeanalysis.trunk.proximaldiameter.values);
%         typeanalysis.trunk.proximaldiameter.skew  = skewness(typeanalysis.trunk.proximaldiameter.values,0);
%         typeanalysis.trunk.proximaldiameter.kurt  = kurtosis(typeanalysis.trunk.proximaldiameter.values,0);
%
%         typeanalysis.trunk.cylindricaldiameter.max   = max(typeanalysis.trunk.cylindricaldiameter.values);
%         typeanalysis.trunk.cylindricaldiameter.mean  = mean(typeanalysis.trunk.cylindricaldiameter.values);
%         typeanalysis.trunk.cylindricaldiameter.min   = min(typeanalysis.trunk.cylindricaldiameter.values);
%         typeanalysis.trunk.cylindricaldiameter.std   = std(typeanalysis.trunk.cylindricaldiameter.values);
%         typeanalysis.trunk.cylindricaldiameter.total = sum(typeanalysis.trunk.cylindricaldiameter.values);
%         typeanalysis.trunk.cylindricaldiameter.skew  = skewness(typeanalysis.trunk.cylindricaldiameter.values,0);
%         typeanalysis.trunk.cylindricaldiameter.kurt  = kurtosis(typeanalysis.trunk.cylindricaldiameter.values,0);
%
%         typeanalysis.trunk.distaldiameter.max   = max(typeanalysis.trunk.distaldiameter.values);
%         typeanalysis.trunk.distaldiameter.mean  = mean(typeanalysis.trunk.distaldiameter.values);
%         typeanalysis.trunk.distaldiameter.min   = min(typeanalysis.trunk.distaldiameter.values);
%         typeanalysis.trunk.distaldiameter.std   = std(typeanalysis.trunk.distaldiameter.values);
%         typeanalysis.trunk.distaldiameter.total = sum(typeanalysis.trunk.distaldiameter.values);
%         typeanalysis.trunk.distaldiameter.skew  = skewness(typeanalysis.trunk.distaldiameter.values,0);
%         typeanalysis.trunk.distaldiameter.kurt  = kurtosis(typeanalysis.trunk.distaldiameter.values,0);
%
%         typeanalysis.trunk.length.max   = max(typeanalysis.trunk.length.values);
%         typeanalysis.trunk.length.mean  = mean(typeanalysis.trunk.length.values);
%         typeanalysis.trunk.length.min   = min(typeanalysis.trunk.length.values);
%         typeanalysis.trunk.length.std   = std(typeanalysis.trunk.length.values);
%         typeanalysis.trunk.length.total = sum(typeanalysis.trunk.length.values);
%         typeanalysis.trunk.length.skew  = skewness(typeanalysis.trunk.length.values,0);
%         typeanalysis.trunk.length.kurt  = kurtosis(typeanalysis.trunk.length.values,0);
%
%         typeanalysis.trunk.surfacearea.max   = max(typeanalysis.trunk.surfacearea.values);
%         typeanalysis.trunk.surfacearea.mean  = mean(typeanalysis.trunk.surfacearea.values);
%         typeanalysis.trunk.surfacearea.min   = min(typeanalysis.trunk.surfacearea.values);
%         typeanalysis.trunk.surfacearea.std   = std(typeanalysis.trunk.surfacearea.values);
%         typeanalysis.trunk.surfacearea.total = sum(typeanalysis.trunk.surfacearea.values);
%         typeanalysis.trunk.surfacearea.skew  = skewness(typeanalysis.trunk.surfacearea.values,0);
%         typeanalysis.trunk.surfacearea.kurt  = kurtosis(typeanalysis.trunk.surfacearea.values,0);
%
%         typeanalysis.trunk.volume.max   = max(typeanalysis.trunk.volume.values);
%         typeanalysis.trunk.volume.mean  = mean(typeanalysis.trunk.volume.values);
%         typeanalysis.trunk.volume.min   = min(typeanalysis.trunk.volume.values);
%         typeanalysis.trunk.volume.std   = std(typeanalysis.trunk.volume.values);
%         typeanalysis.trunk.volume.total = sum(typeanalysis.trunk.volume.values);
%         typeanalysis.trunk.volume.skew  = skewness(typeanalysis.trunk.volume.values,0);
%         typeanalysis.trunk.volume.kurt  = kurtosis(typeanalysis.trunk.volume.values,0);
%
%         typeanalysis.trunk.minbranchorder.max   = max(typeanalysis.trunk.minbranchorder.values);
%         typeanalysis.trunk.minbranchorder.mean  = mean(typeanalysis.trunk.minbranchorder.values);
%         typeanalysis.trunk.minbranchorder.min   = min(typeanalysis.trunk.minbranchorder.values);
%         typeanalysis.trunk.minbranchorder.std   = std(typeanalysis.trunk.minbranchorder.values);
%         typeanalysis.trunk.minbranchorder.total = sum(typeanalysis.trunk.minbranchorder.values);
%         typeanalysis.trunk.minbranchorder.skew  = skewness(typeanalysis.trunk.minbranchorder.values,0);
%         typeanalysis.trunk.minbranchorder.kurt  = kurtosis(typeanalysis.trunk.minbranchorder.values,0);
%
%         typeanalysis.trunk.maxbranchorder.max   = max(typeanalysis.trunk.maxbranchorder.values);
%         typeanalysis.trunk.maxbranchorder.mean  = mean(typeanalysis.trunk.maxbranchorder.values);
%         typeanalysis.trunk.maxbranchorder.min   = min(typeanalysis.trunk.maxbranchorder.values);
%         typeanalysis.trunk.maxbranchorder.std   = std(typeanalysis.trunk.maxbranchorder.values);
%         typeanalysis.trunk.maxbranchorder.total = sum(typeanalysis.trunk.maxbranchorder.values);
%         typeanalysis.trunk.maxbranchorder.skew  = skewness(typeanalysis.trunk.maxbranchorder.values,0);
%         typeanalysis.trunk.maxbranchorder.kurt  = kurtosis(typeanalysis.trunk.maxbranchorder.values,0);
%
%         typeanalysis.trunk.totallength.max   = max(typeanalysis.trunk.totallength.values);
%         typeanalysis.trunk.totallength.mean  = mean(typeanalysis.trunk.totallength.values);
%         typeanalysis.trunk.totallength.min   = min(typeanalysis.trunk.totallength.values);
%         typeanalysis.trunk.totallength.std   = std(typeanalysis.trunk.totallength.values);
%         typeanalysis.trunk.totallength.total = sum(typeanalysis.trunk.totallength.values);
%         typeanalysis.trunk.totallength.skew  = skewness(typeanalysis.trunk.totallength.values,0);
%         typeanalysis.trunk.totallength.kurt  = kurtosis(typeanalysis.trunk.totallength.values,0);
%
%         typeanalysis.trunk.totalsurfacearea.max   = max(typeanalysis.trunk.totalsurfacearea.values);
%         typeanalysis.trunk.totalsurfacearea.mean  = mean(typeanalysis.trunk.totalsurfacearea.values);
%         typeanalysis.trunk.totalsurfacearea.min   = min(typeanalysis.trunk.totalsurfacearea.values);
%         typeanalysis.trunk.totalsurfacearea.std   = std(typeanalysis.trunk.totalsurfacearea.values);
%         typeanalysis.trunk.totalsurfacearea.total = sum(typeanalysis.trunk.totalsurfacearea.values);
%         typeanalysis.trunk.totalsurfacearea.skew  = skewness(typeanalysis.trunk.totalsurfacearea.values,0);
%         typeanalysis.trunk.totalsurfacearea.kurt  = kurtosis(typeanalysis.trunk.totalsurfacearea.values,0);
%
%         typeanalysis.trunk.totalvolume.max   = max(typeanalysis.trunk.totalvolume.values);
%         typeanalysis.trunk.totalvolume.mean  = mean(typeanalysis.trunk.totalvolume.values);
%         typeanalysis.trunk.totalvolume.min   = min(typeanalysis.trunk.totalvolume.values);
%         typeanalysis.trunk.totalvolume.std   = std(typeanalysis.trunk.totalvolume.values);
%         typeanalysis.trunk.totalvolume.total = sum(typeanalysis.trunk.totalvolume.values);
%         typeanalysis.trunk.totalvolume.skew  = skewness(typeanalysis.trunk.totalvolume.values,0);
%         typeanalysis.trunk.totalvolume.kurt  = kurtosis(typeanalysis.trunk.totalvolume.values,0);
%
%         typeanalysis.trunk.numbersegments.max   = max(typeanalysis.trunk.numbersegments.values);
%         typeanalysis.trunk.numbersegments.mean  = mean(typeanalysis.trunk.numbersegments.values);
%         typeanalysis.trunk.numbersegments.min   = min(typeanalysis.trunk.numbersegments.values);
%         typeanalysis.trunk.numbersegments.std   = std(typeanalysis.trunk.numbersegments.values);
%         typeanalysis.trunk.numbersegments.total = sum(typeanalysis.trunk.numbersegments.values);
%         typeanalysis.trunk.numbersegments.skew  = skewness(typeanalysis.trunk.numbersegments.values,0);
%         typeanalysis.trunk.numbersegments.kurt  = kurtosis(typeanalysis.trunk.numbersegments.values,0);
%
%         typeanalysis.trunk.numberbifurcations.max   = max(typeanalysis.trunk.numberbifurcations.values);
%         typeanalysis.trunk.numberbifurcations.mean  = mean(typeanalysis.trunk.numberbifurcations.values);
%         typeanalysis.trunk.numberbifurcations.min   = min(typeanalysis.trunk.numberbifurcations.values);
%         typeanalysis.trunk.numberbifurcations.std   = std(typeanalysis.trunk.numberbifurcations.values);
%         typeanalysis.trunk.numberbifurcations.total = sum(typeanalysis.trunk.numberbifurcations.values);
%         typeanalysis.trunk.numberbifurcations.skew  = skewness(typeanalysis.trunk.numberbifurcations.values,0);
%         typeanalysis.trunk.numberbifurcations.kurt  = kurtosis(typeanalysis.trunk.numberbifurcations.values,0);
%
%         typeanalysis.trunk.numberterminations.max   = max(typeanalysis.trunk.numberterminations.values);
%         typeanalysis.trunk.numberterminations.mean  = mean(typeanalysis.trunk.numberterminations.values);
%         typeanalysis.trunk.numberterminations.min   = min(typeanalysis.trunk.numberterminations.values);
%         typeanalysis.trunk.numberterminations.std   = std(typeanalysis.trunk.numberterminations.values);
%         typeanalysis.trunk.numberterminations.total = sum(typeanalysis.trunk.numberterminations.values);
%         typeanalysis.trunk.numberterminations.skew  = skewness(typeanalysis.trunk.numberterminations.values,0);
%         typeanalysis.trunk.numberterminations.kurt  = kurtosis(typeanalysis.trunk.numberterminations.values,0);
%
%         typeanalysis.trunk.meanproximaldiameter.max   = max(typeanalysis.trunk.meanproximaldiameter.values);
%         typeanalysis.trunk.meanproximaldiameter.mean  = mean(typeanalysis.trunk.meanproximaldiameter.values);
%         typeanalysis.trunk.meanproximaldiameter.min   = min(typeanalysis.trunk.meanproximaldiameter.values);
%         typeanalysis.trunk.meanproximaldiameter.std   = std(typeanalysis.trunk.meanproximaldiameter.values);
%         typeanalysis.trunk.meanproximaldiameter.total = sum(typeanalysis.trunk.meanproximaldiameter.values);
%         typeanalysis.trunk.meanproximaldiameter.skew  = skewness(typeanalysis.trunk.meanproximaldiameter.values,0);
%         typeanalysis.trunk.meanproximaldiameter.kurt  = kurtosis(typeanalysis.trunk.meanproximaldiameter.values,0);
%
%         typeanalysis.trunk.meancylindricaldiameter.max   = max(typeanalysis.trunk.meancylindricaldiameter.values);
%         typeanalysis.trunk.meancylindricaldiameter.mean  = mean(typeanalysis.trunk.meancylindricaldiameter.values);
%         typeanalysis.trunk.meancylindricaldiameter.min   = min(typeanalysis.trunk.meancylindricaldiameter.values);
%         typeanalysis.trunk.meancylindricaldiameter.std   = std(typeanalysis.trunk.meancylindricaldiameter.values);
%         typeanalysis.trunk.meancylindricaldiameter.total = sum(typeanalysis.trunk.meancylindricaldiameter.values);
%         typeanalysis.trunk.meancylindricaldiameter.skew  = skewness(typeanalysis.trunk.meancylindricaldiameter.values,0);
%         typeanalysis.trunk.meancylindricaldiameter.kurt  = kurtosis(typeanalysis.trunk.meancylindricaldiameter.values,0);
%
%         typeanalysis.trunk.meandistaldiameter.max   = max(typeanalysis.trunk.meandistaldiameter.values);
%         typeanalysis.trunk.meandistaldiameter.mean  = mean(typeanalysis.trunk.meandistaldiameter.values);
%         typeanalysis.trunk.meandistaldiameter.min   = min(typeanalysis.trunk.meandistaldiameter.values);
%         typeanalysis.trunk.meandistaldiameter.std   = std(typeanalysis.trunk.meandistaldiameter.values);
%         typeanalysis.trunk.meandistaldiameter.total = sum(typeanalysis.trunk.meandistaldiameter.values);
%         typeanalysis.trunk.meandistaldiameter.skew  = skewness(typeanalysis.trunk.meandistaldiameter.values,0);
%         typeanalysis.trunk.meandistaldiameter.kurt  = kurtosis(typeanalysis.trunk.meandistaldiameter.values,0);
%
%         typeanalysis.trunk.proximalxposition.max   = max(typeanalysis.trunk.proximalxposition.values);
%         typeanalysis.trunk.proximalxposition.mean  = mean(typeanalysis.trunk.proximalxposition.values);
%         typeanalysis.trunk.proximalxposition.min   = min(typeanalysis.trunk.proximalxposition.values);
%         typeanalysis.trunk.proximalxposition.std   = std(typeanalysis.trunk.proximalxposition.values);
%         typeanalysis.trunk.proximalxposition.total = sum(typeanalysis.trunk.proximalxposition.values);
%         typeanalysis.trunk.proximalxposition.skew  = skewness(typeanalysis.trunk.proximalxposition.values);
%         typeanalysis.trunk.proximalxposition.kurt  = kurtosis(typeanalysis.trunk.proximalxposition.values);
%
%         typeanalysis.trunk.proximalyposition.max   = max(typeanalysis.trunk.proximalyposition.values);
%         typeanalysis.trunk.proximalyposition.mean  = mean(typeanalysis.trunk.proximalyposition.values);
%         typeanalysis.trunk.proximalyposition.min   = min(typeanalysis.trunk.proximalyposition.values);
%         typeanalysis.trunk.proximalyposition.std   = std(typeanalysis.trunk.proximalyposition.values);
%         typeanalysis.trunk.proximalyposition.total = sum(typeanalysis.trunk.proximalyposition.values);
%         typeanalysis.trunk.proximalyposition.skew  = skewness(typeanalysis.trunk.proximalyposition.values);
%         typeanalysis.trunk.proximalyposition.kurt  = kurtosis(typeanalysis.trunk.proximalyposition.values);
%
%         typeanalysis.trunk.proximalzposition.max   = max(typeanalysis.trunk.proximalzposition.values);
%         typeanalysis.trunk.proximalzposition.mean  = mean(typeanalysis.trunk.proximalzposition.values);
%         typeanalysis.trunk.proximalzposition.min   = min(typeanalysis.trunk.proximalzposition.values);
%         typeanalysis.trunk.proximalzposition.std   = std(typeanalysis.trunk.proximalzposition.values);
%         typeanalysis.trunk.proximalzposition.total = sum(typeanalysis.trunk.proximalzposition.values);
%         typeanalysis.trunk.proximalzposition.skew  = skewness(typeanalysis.trunk.proximalzposition.values);
%         typeanalysis.trunk.proximalzposition.kurt  = kurtosis(typeanalysis.trunk.proximalzposition.values);
%
%         typeanalysis.trunk.proximalxdirection.max   = max(typeanalysis.trunk.proximalxdirection.values);
%         typeanalysis.trunk.proximalxdirection.mean  = mean(typeanalysis.trunk.proximalxdirection.values);
%         typeanalysis.trunk.proximalxdirection.min   = min(typeanalysis.trunk.proximalxdirection.values);
%         typeanalysis.trunk.proximalxdirection.std   = std(typeanalysis.trunk.proximalxdirection.values);
%         typeanalysis.trunk.proximalxdirection.total = sum(typeanalysis.trunk.proximalxdirection.values);
%         typeanalysis.trunk.proximalxdirection.skew  = skewness(typeanalysis.trunk.proximalxdirection.values);
%         typeanalysis.trunk.proximalxdirection.kurt  = kurtosis(typeanalysis.trunk.proximalxdirection.values);
%
%         typeanalysis.trunk.proximalydirection.max   = max(typeanalysis.trunk.proximalydirection.values);
%         typeanalysis.trunk.proximalydirection.mean  = mean(typeanalysis.trunk.proximalydirection.values);
%         typeanalysis.trunk.proximalydirection.min   = min(typeanalysis.trunk.proximalydirection.values);
%         typeanalysis.trunk.proximalydirection.std   = std(typeanalysis.trunk.proximalydirection.values);
%         typeanalysis.trunk.proximalydirection.total = sum(typeanalysis.trunk.proximalydirection.values);
%         typeanalysis.trunk.proximalydirection.skew  = skewness(typeanalysis.trunk.proximalydirection.values);
%         typeanalysis.trunk.proximalydirection.kurt  = kurtosis(typeanalysis.trunk.proximalydirection.values);
%
%         typeanalysis.trunk.proximalzdirection.max   = max(typeanalysis.trunk.proximalzdirection.values);
%         typeanalysis.trunk.proximalzdirection.mean  = mean(typeanalysis.trunk.proximalzdirection.values);
%         typeanalysis.trunk.proximalzdirection.min   = min(typeanalysis.trunk.proximalzdirection.values);
%         typeanalysis.trunk.proximalzdirection.std   = std(typeanalysis.trunk.proximalzdirection.values);
%         typeanalysis.trunk.proximalzdirection.total = sum(typeanalysis.trunk.proximalzdirection.values);
%         typeanalysis.trunk.proximalzdirection.skew  = skewness(typeanalysis.trunk.proximalzdirection.values);
%         typeanalysis.trunk.proximalzdirection.kurt  = kurtosis(typeanalysis.trunk.proximalzdirection.values);
%
%         typeanalysis.trunk.proximalelevation.max   = max(typeanalysis.trunk.proximalelevation.values);
%         typeanalysis.trunk.proximalelevation.mean  = mean(typeanalysis.trunk.proximalelevation.values);
%         typeanalysis.trunk.proximalelevation.min   = min(typeanalysis.trunk.proximalelevation.values);
%         typeanalysis.trunk.proximalelevation.std   = std(typeanalysis.trunk.proximalelevation.values);
%         typeanalysis.trunk.proximalelevation.total = sum(typeanalysis.trunk.proximalelevation.values);
%         typeanalysis.trunk.proximalelevation.skew  = skewness(typeanalysis.trunk.proximalelevation.values);
%         typeanalysis.trunk.proximalelevation.kurt  = kurtosis(typeanalysis.trunk.proximalelevation.values);
%
%         typeanalysis.trunk.proximalazimuth.max   = max(typeanalysis.trunk.proximalazimuth.values);
%         typeanalysis.trunk.proximalazimuth.mean  = mean(typeanalysis.trunk.proximalazimuth.values);
%         typeanalysis.trunk.proximalazimuth.min   = min(typeanalysis.trunk.proximalazimuth.values);
%         typeanalysis.trunk.proximalazimuth.std   = std(typeanalysis.trunk.proximalazimuth.values);
%         typeanalysis.trunk.proximalazimuth.total = sum(typeanalysis.trunk.proximalazimuth.values);
%         typeanalysis.trunk.proximalazimuth.skew  = skewness(typeanalysis.trunk.proximalazimuth.values);
%         typeanalysis.trunk.proximalazimuth.kurt  = kurtosis(typeanalysis.trunk.proximalazimuth.values);
%
%         % typeanalysis.trunk.intertrunkangle.max   = max(typeanalysis.trunk.intertrunkangle.values);
%         % typeanalysis.trunk.intertrunkangle.mean  = mean(typeanalysis.trunk.intertrunkangle.values);
%         % typeanalysis.trunk.intertrunkangle.min   = min(typeanalysis.trunk.intertrunkangle.values);
%         % typeanalysis.trunk.intertrunkangle.std   = std(typeanalysis.trunk.intertrunkangle.values);
%         % typeanalysis.trunk.intertrunkangle.total = sum(typeanalysis.trunk.intertrunkangle.values);
%         % typeanalysis.trunk.intertrunkangle.skew  = skewness(typeanalysis.trunk.intertrunkangle.values);
%         % typeanalysis.trunk.intertrunkangle.kurt  = kurtosis(typeanalysis.trunk.intertrunkangle.values);
%
%         eval(['analysis.' currentpiecetype ' = typeanalysis;']);
%         eval(['data.population.' currentpiecetype ' = popdata;']);
%
%     end
% end
%
% warning('on', 'MATLAB:divideByZero');
