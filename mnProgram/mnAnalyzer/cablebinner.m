function [data,analysis] = cablebinner(data,analysis)

disp('   Cable binning started.');

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
        
        currentpopulationtrunkbin = 0;
        
        for i = 1:length(data.individual)
            
            %analysis.somadiameter.values(i)           = data.individual(i).somadiameter;
            analysis.xposition.values(i,:)            = data.individual(i).xposition;
            analysis.yposition.values(i,:)            = data.individual(i).yposition;
            analysis.zposition.values(i,:)            = data.individual(i).zposition;
            
            if isfield(data.individual(i),piecetypes{piecetype})
                
                currentindividualtrunkbin = 0;
                clear inddata;
                eval(['inddata = data.individual(i).' currentpiecetype ';']);
                
                typeanalysis.numbertrunks.values(i)           = inddata.numbertrunks;
                typeanalysis.numbersegments.values(i)         = inddata.numbersegments;
                typeanalysis.maxbranchorder.values(i)         = inddata.maxbranchorder;
                typeanalysis.minbranchorder.values(i)         = inddata.minbranchorder;
                typeanalysis.maxdegree.values(i)              = inddata.maxdegree;
                typeanalysis.maxdiameter.values(i)            = inddata.maxdiameter;
                typeanalysis.mindiameter.values(i)            = inddata.mindiameter;
                typeanalysis.totallength.values(i)            = inddata.totallength;
                typeanalysis.totalsurfacearea.values(i)       = inddata.totalsurfacearea;
                typeanalysis.totalvolume.values(i)            = inddata.totalvolume;
                typeanalysis.numberbifurcations.values(i)     = inddata.numberbifurcations;
                typeanalysis.numberterminations.values(i)     = inddata.numberterminations;
                
                currentbifurcation = 0;
                currenttermination = 0;
                
                for j = 1:length(inddata.cablebins)
                    
                    if strcmp(inddata.cablebins(j).distaltype,'bifurcation')==1 || strcmp(inddata.cablebins(j).distaltype,'m-furcation')==1
                        currentbifurcation = currentbifurcation + 1;
                        inddata.bifurcation.cable(currentbifurcation)=inddata.cablebins(j);
                    end
                    
                    if strcmp(inddata.cablebins(j).distaltype,'termination')==1
                        currenttermination = currenttermination + 1;
                        inddata.termination.cable(currenttermination)=inddata.cablebins(j);
                    end
                    
                    if inddata.cablebins(j).trunk ~= currentindividualtrunkbin
                        currentpopulationtrunkbin = currentpopulationtrunkbin + 1;
                    end
                    
                    currentindividualtrunkbin                  = inddata.cablebins(j).trunk;
                    currentindividualbranchorderbin            = inddata.cablebins(j).branchorder;
                    currentpopulationdegreebin                 = inddata.cablebins(j).degree;
                    currentindividualdegreebin                 = inddata.cablebins(j).degree;
                    
                    % Put the cable into the appropriate population primary dendrite bin
                    if isfield(popdata,'trunkbins') == 0; nextcable = 1;
                    elseif currentpopulationtrunkbin > length(popdata.trunkbins); nextcable = 1;
                    elseif isfield(popdata.trunkbins(currentpopulationtrunkbin),'cable') == 0; nextcable = 1;
                    else nextcable = 1 + length(popdata.trunkbins(currentpopulationtrunkbin).cable);
                    end;
                    popdata.trunkbins(currentpopulationtrunkbin).cable(nextcable) = inddata.cablebins(j); clear nextcable;
                    
                    % Put the cable into the appropriate population branch order bin
                    if isfield(popdata,'branchorderbins') == 0; nextcable = 1;
                    elseif currentindividualbranchorderbin > length(popdata.branchorderbins); nextcable = 1;
                    elseif isfield(popdata.branchorderbins(currentindividualbranchorderbin),'cable') == 0; nextcable = 1;
                    else nextcable = 1 + length(popdata.branchorderbins(currentindividualbranchorderbin).cable);
                    end;
                    popdata.branchorderbins(currentindividualbranchorderbin).cable(nextcable) = inddata.cablebins(j); clear nextcable;
                    
                    % Put the cable into the appropriate population degree bin
                    if isfield(popdata,'degreebins') == 0; nextcable = 1;
                    elseif currentindividualdegreebin > length(popdata.degreebins); nextcable = 1;
                    elseif isfield(popdata.degreebins(currentindividualdegreebin),'cable') == 0; nextcable = 1;
                    else nextcable = 1 + length(popdata.degreebins(currentindividualdegreebin).cable);
                    end;
                    popdata.degreebins(currentindividualdegreebin).cable(nextcable) = inddata.cablebins(j); clear nextcable;
                    
                    % Put the cable into the appropriate population bifurcation branch order bin
                    if strcmp(inddata.cablebins(j).distaltype,'bifurcation')==1 || strcmp(inddata.cablebins(j).distaltype,'m-furcation')==1
                        if     isfield(popdata,'bifurcation') == 0; nextcable = 1;
                        elseif isfield(popdata.bifurcation,'branchorderbins') == 0; nextcable = 1;
                        elseif currentindividualbranchorderbin > length(popdata.bifurcation.branchorderbins); nextcable = 1;
                        elseif isfield(popdata.bifurcation.branchorderbins(currentindividualbranchorderbin),'cable') == 0; nextcable = 1;
                        else nextcable = 1 + length(popdata.bifurcation.branchorderbins(currentindividualbranchorderbin).cable);
                        end;
                        popdata.bifurcation.branchorderbins(currentindividualbranchorderbin).cable(nextcable) = inddata.cablebins(j); clear nextcable;
                    end
                    
                    % Put the cable into the appropriate population bifurcation degree bin
                    if strcmp(inddata.cablebins(j).distaltype,'bifurcation')==1 || strcmp(inddata.cablebins(j).distaltype,'m-furcation')==1
                        if     isfield(popdata,'bifurcation') == 0; nextcable = 1;
                        elseif isfield(popdata.bifurcation,'degreebins') == 0; nextcable = 1;
                        elseif currentindividualdegreebin > length(popdata.bifurcation.degreebins); nextcable = 1;
                        elseif isfield(popdata.bifurcation.degreebins(currentindividualdegreebin),'cable') == 0; nextcable = 1;
                        else nextcable = 1 + length(popdata.bifurcation.degreebins(currentindividualdegreebin).cable);
                        end;
                        popdata.bifurcation.degreebins(currentindividualdegreebin).cable(nextcable) = inddata.cablebins(j); clear nextcable;
                    end
                    
                    % Put the cable into the appropriate population termination branch order bin
                    if strcmp(inddata.cablebins(j).distaltype,'termination')==1
                        if     isfield(popdata,'termination') == 0; nextcable = 1;
                        elseif isfield(popdata.termination,'branchorderbins') == 0; nextcable = 1;
                        elseif currentindividualbranchorderbin > length(popdata.termination.branchorderbins); nextcable = 1;
                        elseif isfield(popdata.termination.branchorderbins(currentindividualbranchorderbin),'cable') == 0; nextcable = 1;
                        else nextcable = 1 + length(popdata.termination.branchorderbins(currentindividualbranchorderbin).cable);
                        end;
                        popdata.termination.branchorderbins(currentindividualbranchorderbin).cable(nextcable) = inddata.cablebins(j); clear nextcable;
                    end
                    
                    % Put the cable into the appropriate population termination degree bin
                    if strcmp(inddata.cablebins(j).distaltype,'termination')==1
                        if     isfield(popdata,'termination') == 0; nextcable = 1;
                        elseif isfield(popdata.termination,'degreebins') == 0; nextcable = 1;
                        elseif currentindividualdegreebin > length(popdata.termination.degreebins); nextcable = 1;
                        elseif isfield(popdata.termination.degreebins(currentindividualdegreebin),'cable') == 0; nextcable = 1;
                        else nextcable = 1 + length(popdata.termination.degreebins(currentindividualdegreebin).cable);
                        end;
                        popdata.termination.degreebins(currentindividualdegreebin).cable(nextcable) = inddata.cablebins(j); clear nextcable;
                    end
                    
                    % Put the cable into the appropriate individual primary dendrite bin
                    if     isfield(inddata,'trunkbins')==0; nextcable = 1;
                    elseif isfield(inddata.trunkbins,'cable')==0; nextcable = 1;
                    elseif currentindividualtrunkbin > length(inddata.trunkbins); nextcable = 1;
                    elseif isfield(inddata.trunkbins(currentindividualtrunkbin),'cable')==0; nextcable = 1;
                    else nextcable = 1 + length(inddata.trunkbins(currentindividualtrunkbin).cable);
                    end;
                    inddata.trunkbins(currentindividualtrunkbin).cable(nextcable) = inddata.cablebins(j); clear nextcable;
                    
                    % Put the cable into the appropriate individual branch order bin
                    if isfield(inddata,'branchorderbins')==0; nextcable = 1;
                    elseif isfield(inddata.branchorderbins,'cable')==0; nextcable = 1;
                    elseif currentindividualbranchorderbin > length(inddata.branchorderbins); nextcable = 1;
                    elseif isfield(inddata.branchorderbins(currentindividualbranchorderbin),'cable')==0; nextcable = 1;
                    else nextcable = 1 + length(inddata.branchorderbins(currentindividualbranchorderbin).cable);
                    end;
                    inddata.branchorderbins(currentindividualbranchorderbin).cable(nextcable) = inddata.cablebins(j); clear nextcable;
                    
                    % Put the cable into the appropriate individual degree bin
                    if isfield(inddata,'degreebins')==0; nextcable = 1;
                    elseif isfield(inddata.degreebins,'cable')==0; nextcable = 1;
                    elseif currentindividualdegreebin > length(inddata.degreebins); nextcable = 1;
                    elseif isfield(inddata.degreebins(currentindividualdegreebin),'cable')==0; nextcable = 1;
                    else nextcable = 1 + length(inddata.degreebins(currentindividualdegreebin).cable);
                    end;
                    inddata.degreebins(currentindividualdegreebin).cable(nextcable) = inddata.cablebins(j); clear nextcable;
                    
                    % Put the cable into the appropriate individual bifurcation branch order bin
                    if strcmp(inddata.cablebins(j).distaltype,'bifurcation')==1 || strcmp(inddata.cablebins(j).distaltype,'m-furcation')==1
                        if     isfield(inddata,'bifurcation')==0; nextcable = 1;
                        elseif isfield(inddata.bifurcation,'branchorderbins')==0; nextcable = 1;
                        elseif currentindividualbranchorderbin > length(inddata.bifurcation.branchorderbins); nextcable = 1;
                        elseif isfield(inddata.bifurcation.branchorderbins(currentindividualbranchorderbin),'cable')==0; nextcable = 1;
                        else nextcable = 1 + length(inddata.bifurcation.branchorderbins(currentindividualbranchorderbin).cable);
                        end;
                        inddata.bifurcation.branchorderbins(currentindividualbranchorderbin).cable(nextcable) = inddata.cablebins(j); clear nextcable;
                    end
                    
                    % Put the cable into the appropriate individual bifurcation degree bin
                    if strcmp(inddata.cablebins(j).distaltype,'bifurcation')==1 || strcmp(inddata.cablebins(j).distaltype,'m-furcation')==1
                        if     isfield(inddata,'bifurcation')==0; nextcable = 1;
                        elseif isfield(inddata.bifurcation,'degreebins')==0; nextcable = 1;
                        elseif currentindividualdegreebin > length(inddata.bifurcation.degreebins); nextcable = 1;
                        elseif isfield(inddata.bifurcation.degreebins(currentindividualdegreebin),'cable')==0; nextcable = 1;
                        else nextcable = 1 + length(inddata.bifurcation.degreebins(currentindividualdegreebin).cable);
                        end;
                        inddata.bifurcation.degreebins(currentindividualdegreebin).cable(nextcable) = inddata.cablebins(j); clear nextcable;
                    end
                    
                    % Put the cable into the appropriate individual termination branch order bin
                    if strcmp(inddata.cablebins(j).distaltype,'termination')==1
                        if     isfield(inddata,'termination')==0; nextcable = 1;
                        elseif isfield(inddata.termination,'branchorderbins')==0; nextcable = 1;
                        elseif currentindividualbranchorderbin > length(inddata.termination.branchorderbins); nextcable = 1;
                        elseif isfield(inddata.termination.branchorderbins(currentindividualbranchorderbin),'cable')==0; nextcable = 1;
                        else nextcable = 1 + length(inddata.termination.branchorderbins(currentindividualbranchorderbin).cable);
                        end;
                        inddata.termination.branchorderbins(currentindividualbranchorderbin).cable(nextcable) = inddata.cablebins(j); clear nextcable;
                    end
                    
                    % Put the cable into the appropriate individual termination degree bin
                    if strcmp(inddata.cablebins(j).distaltype,'termination')==1
                        if     isfield(inddata,'termination')==0; nextcable = 1;
                        elseif isfield(inddata.termination,'degreebins')==0; nextcable = 1;
                        elseif currentindividualdegreebin > length(inddata.termination.degreebins); nextcable = 1;
                        elseif isfield(inddata.termination.degreebins(currentindividualdegreebin),'cable')==0; nextcable = 1;
                        else nextcable = 1 + length(inddata.termination.degreebins(currentindividualdegreebin).cable);
                        end;
                        inddata.termination.degreebins(currentindividualdegreebin).cable(nextcable) = inddata.cablebins(j); clear nextcable;
                    end
                    
                end
                eval(['data.individual(i).' currentpiecetype ' = inddata;']);
            end
        end
        
%         analysis.somadiameter.max   = max(analysis.somadiameter.values);
%         analysis.somadiameter.mean  = mean(analysis.somadiameter.values);
%         analysis.somadiameter.min   = min(analysis.somadiameter.values);
%         analysis.somadiameter.std   = std(analysis.somadiameter.values);
%         analysis.somadiameter.total = sum(analysis.somadiameter.values);
%         analysis.somadiameter.skew  = skewness(analysis.somadiameter.values,0);
%         analysis.somadiameter.kurt  = kurtosis(analysis.somadiameter.values,0);
        
        typeanalysis.numbertrunks.max   = max(typeanalysis.numbertrunks.values);
        typeanalysis.numbertrunks.mean  = mean(typeanalysis.numbertrunks.values);
        typeanalysis.numbertrunks.min   = min(typeanalysis.numbertrunks.values);
        typeanalysis.numbertrunks.std   = std(typeanalysis.numbertrunks.values);
        typeanalysis.numbertrunks.total = sum(typeanalysis.numbertrunks.values);
        typeanalysis.numbertrunks.skew  = skewness(typeanalysis.numbertrunks.values,0);
        typeanalysis.numbertrunks.kurt  = kurtosis(typeanalysis.numbertrunks.values,0);
        
        typeanalysis.numbersegments.max   = max(typeanalysis.numbersegments.values);
        typeanalysis.numbersegments.mean  = mean(typeanalysis.numbersegments.values);
        typeanalysis.numbersegments.min   = min(typeanalysis.numbersegments.values);
        typeanalysis.numbersegments.std   = std(typeanalysis.numbersegments.values);
        typeanalysis.numbersegments.total = sum(typeanalysis.numbersegments.values);
        typeanalysis.numbersegments.skew  = skewness(typeanalysis.numbersegments.values,0);
        typeanalysis.numbersegments.kurt  = kurtosis(typeanalysis.numbersegments.values,0);
        
        typeanalysis.maxbranchorder.max   = max(typeanalysis.maxbranchorder.values);
        typeanalysis.maxbranchorder.mean  = mean(typeanalysis.maxbranchorder.values);
        typeanalysis.maxbranchorder.min   = min(typeanalysis.maxbranchorder.values);
        typeanalysis.maxbranchorder.std   = std(typeanalysis.maxbranchorder.values);
        typeanalysis.maxbranchorder.total = sum(typeanalysis.maxbranchorder.values);
        typeanalysis.maxbranchorder.skew  = skewness(typeanalysis.maxbranchorder.values,0);
        typeanalysis.maxbranchorder.kurt  = kurtosis(typeanalysis.maxbranchorder.values,0);
        
        typeanalysis.maxdegree.max   = max(typeanalysis.maxdegree.values);
        typeanalysis.maxdegree.mean  = mean(typeanalysis.maxdegree.values);
        typeanalysis.maxdegree.min   = min(typeanalysis.maxdegree.values);
        typeanalysis.maxdegree.std   = std(typeanalysis.maxdegree.values);
        typeanalysis.maxdegree.total = sum(typeanalysis.maxdegree.values);
        typeanalysis.maxdegree.skew  = skewness(typeanalysis.maxdegree.values,0);
        typeanalysis.maxdegree.kurt  = kurtosis(typeanalysis.maxdegree.values,0);
        
        typeanalysis.minbranchorder.max   = max(typeanalysis.minbranchorder.values);
        typeanalysis.minbranchorder.mean  = mean(typeanalysis.minbranchorder.values);
        typeanalysis.minbranchorder.min   = min(typeanalysis.minbranchorder.values);
        typeanalysis.minbranchorder.std   = std(typeanalysis.minbranchorder.values);
        typeanalysis.minbranchorder.total = sum(typeanalysis.minbranchorder.values);
        typeanalysis.minbranchorder.skew  = skewness(typeanalysis.minbranchorder.values,0);
        typeanalysis.minbranchorder.kurt  = kurtosis(typeanalysis.minbranchorder.values,0);
        
        typeanalysis.maxdiameter.max   = max(typeanalysis.maxdiameter.values);
        typeanalysis.maxdiameter.mean  = mean(typeanalysis.maxdiameter.values);
        typeanalysis.maxdiameter.min   = min(typeanalysis.maxdiameter.values);
        typeanalysis.maxdiameter.std   = std(typeanalysis.maxdiameter.values);
        typeanalysis.maxdiameter.total = sum(typeanalysis.maxdiameter.values);
        typeanalysis.maxdiameter.skew  = skewness(typeanalysis.maxdiameter.values,0);
        typeanalysis.maxdiameter.kurt  = kurtosis(typeanalysis.maxdiameter.values,0);
        
        typeanalysis.mindiameter.max   = max(typeanalysis.mindiameter.values);
        typeanalysis.mindiameter.mean  = mean(typeanalysis.mindiameter.values);
        typeanalysis.mindiameter.min   = min(typeanalysis.mindiameter.values);
        typeanalysis.mindiameter.std   = std(typeanalysis.mindiameter.values);
        typeanalysis.mindiameter.total = sum(typeanalysis.mindiameter.values);
        typeanalysis.mindiameter.skew  = skewness(typeanalysis.mindiameter.values,0);
        typeanalysis.mindiameter.kurt  = kurtosis(typeanalysis.mindiameter.values,0);
        
        typeanalysis.totallength.max   = max(typeanalysis.totallength.values);
        typeanalysis.totallength.mean  = mean(typeanalysis.totallength.values);
        typeanalysis.totallength.min   = min(typeanalysis.totallength.values);
        typeanalysis.totallength.std   = std(typeanalysis.totallength.values);
        typeanalysis.totallength.total = sum(typeanalysis.totallength.values);
        typeanalysis.totallength.skew  = skewness(typeanalysis.totallength.values,0);
        typeanalysis.totallength.kurt  = kurtosis(typeanalysis.totallength.values,0);
        
        typeanalysis.totalsurfacearea.max   = max(typeanalysis.totalsurfacearea.values);
        typeanalysis.totalsurfacearea.mean  = mean(typeanalysis.totalsurfacearea.values);
        typeanalysis.totalsurfacearea.min   = min(typeanalysis.totalsurfacearea.values);
        typeanalysis.totalsurfacearea.std   = std(typeanalysis.totalsurfacearea.values);
        typeanalysis.totalsurfacearea.total = sum(typeanalysis.totalsurfacearea.values);
        typeanalysis.totalsurfacearea.skew  = skewness(typeanalysis.totalsurfacearea.values,0);
        typeanalysis.totalsurfacearea.kurt  = kurtosis(typeanalysis.totalsurfacearea.values,0);
        
        typeanalysis.totalvolume.max   = max(typeanalysis.totalvolume.values);
        typeanalysis.totalvolume.mean  = mean(typeanalysis.totalvolume.values);
        typeanalysis.totalvolume.min   = min(typeanalysis.totalvolume.values);
        typeanalysis.totalvolume.std   = std(typeanalysis.totalvolume.values);
        typeanalysis.totalvolume.total = sum(typeanalysis.totalvolume.values);
        typeanalysis.totalvolume.skew  = skewness(typeanalysis.totalvolume.values,0);
        typeanalysis.totalvolume.kurt  = kurtosis(typeanalysis.totalvolume.values,0);
        
        typeanalysis.numberterminations.max   = max(typeanalysis.numberterminations.values);
        typeanalysis.numberterminations.mean  = mean(typeanalysis.numberterminations.values);
        typeanalysis.numberterminations.min   = min(typeanalysis.numberterminations.values);
        typeanalysis.numberterminations.std   = std(typeanalysis.numberterminations.values);
        typeanalysis.numberterminations.total = sum(typeanalysis.numberterminations.values);
        typeanalysis.numberterminations.skew  = skewness(typeanalysis.numberterminations.values,0);
        typeanalysis.numberterminations.kurt  = kurtosis(typeanalysis.numberterminations.values,0);
        
        typeanalysis.numberbifurcations.max   = max(typeanalysis.numberbifurcations.values);
        typeanalysis.numberbifurcations.mean  = mean(typeanalysis.numberbifurcations.values);
        typeanalysis.numberbifurcations.min   = min(typeanalysis.numberbifurcations.values);
        typeanalysis.numberbifurcations.std   = std(typeanalysis.numberbifurcations.values);
        typeanalysis.numberbifurcations.total = sum(typeanalysis.numberbifurcations.values);
        typeanalysis.numberbifurcations.skew  = skewness(typeanalysis.numberbifurcations.values,0);
        typeanalysis.numberbifurcations.kurt  = kurtosis(typeanalysis.numberbifurcations.values,0);
        
        eval(['analysis.' currentpiecetype ' = typeanalysis;']);
        eval(['data.population.' currentpiecetype ' = popdata;']);
        
    end
end


warning('on', 'MATLAB:divideByZero');