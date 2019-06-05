function [data,analysis]   = doublebinanalyzer3(data,analysis)

disp('   Double bin analysis started.');

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
        
        eval(['maxdiameterbin   = length(data.individual(1).' currentpiecetype '.doublebins.diameterbins);']);
        eval(['maxbranchorderbin = length(data.individual(1).' currentpiecetype '.doublebins.diameterbins(1).branchorderbins);']);
        
        
        for i = 1:maxdiameterbin
            for j = 1:maxbranchorderbin
                popdata.doublebins.diameterbins(i).branchorderbins(j).rallratio.values            = [];
                popdata.doublebins.diameterbins(i).branchorderbins(j).rallratio1.values           = [];
                popdata.doublebins.diameterbins(i).branchorderbins(j).rallratio2.values           = [];
                popdata.doublebins.diameterbins(i).branchorderbins(j).rallratio3.values           = [];
                popdata.doublebins.diameterbins(i).branchorderbins(j).daughterratio.values        = [];
                popdata.doublebins.diameterbins(i).branchorderbins(j).parentdaughterratio.values  = [];
                popdata.doublebins.diameterbins(i).branchorderbins(j).parentdaughter2ratio.values = [];
                popdata.doublebins.diameterbins(i).branchorderbins(j).meandiameter.values         = [];
                popdata.doublebins.diameterbins(i).branchorderbins(j).taperrate.values            = [];
                popdata.doublebins.diameterbins(i).branchorderbins(j).piecelength.values          = [];
            end
        end
        
        
        for i = 1:length(data.individual)
            
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            
            for j = 1:length(inddata.doublebins.diameterbins)
                
                for k = 1:length(inddata.doublebins.diameterbins(j).branchorderbins)
                    
                    inddata.doublebins.diameterbins(j).branchorderbins(k).length                      = 0;
                    inddata.doublebins.diameterbins(j).branchorderbins(k).surfacearea                 = 0;
                    inddata.doublebins.diameterbins(j).branchorderbins(k).volume                      = 0;
                    inddata.doublebins.diameterbins(j).branchorderbins(k).numbersegments              = 0;
                    inddata.doublebins.diameterbins(j).branchorderbins(k).numberbifurcations          = 0;
                    inddata.doublebins.diameterbins(j).branchorderbins(k).numberterminations          = 0;
                    inddata.doublebins.diameterbins(j).branchorderbins(k).numberbifurcatingbranches   = 0;
                    inddata.doublebins.diameterbins(j).branchorderbins(k).numberterminatingbranches   = 0;
                    inddata.doublebins.diameterbins(j).branchorderbins(k).rallratio.values            = [];
                    inddata.doublebins.diameterbins(j).branchorderbins(k).rallratio1.values           = [];
                    inddata.doublebins.diameterbins(j).branchorderbins(k).rallratio2.values           = [];
                    inddata.doublebins.diameterbins(j).branchorderbins(k).rallratio3.values           = [];
                    inddata.doublebins.diameterbins(j).branchorderbins(k).daughterratio.values        = [];
                    inddata.doublebins.diameterbins(j).branchorderbins(k).parentdaughterratio.values  = [];
                    inddata.doublebins.diameterbins(j).branchorderbins(k).parentdaughter2ratio.values = [];
                    inddata.doublebins.diameterbins(j).branchorderbins(k).meandiameter.values         = [];
                    inddata.doublebins.diameterbins(j).branchorderbins(k).taperrate.values            = [];
                    inddata.doublebins.diameterbins(j).branchorderbins(k).piecelength.values          = [];
                    
                    
                    if isfield(inddata.doublebins.diameterbins(j).branchorderbins(k),'piece') == 1 && isfield(inddata.doublebins.diameterbins(j).branchorderbins(k).piece,'id')
                        
                        inddata.doublebins.diameterbins(j).branchorderbins(k).length                      = sum([inddata.doublebins.diameterbins(j).branchorderbins(k).piece.length]);
                        inddata.doublebins.diameterbins(j).branchorderbins(k).surfacearea                 = sum([inddata.doublebins.diameterbins(j).branchorderbins(k).piece.surfacearea]);
                        inddata.doublebins.diameterbins(j).branchorderbins(k).volume                      = sum([inddata.doublebins.diameterbins(j).branchorderbins(k).piece.volume]);
                        inddata.doublebins.diameterbins(j).branchorderbins(k).numbersegments              = length(unique([inddata.doublebins.diameterbins(j).branchorderbins(k).piece.cable]));
                        inddata.doublebins.diameterbins(j).branchorderbins(k).numberbifurcations          = 0;
                        inddata.doublebins.diameterbins(j).branchorderbins(k).numberterminations          = 0;
                        inddata.doublebins.diameterbins(j).branchorderbins(k).numberbifurcatingbranches   = 0;
                        inddata.doublebins.diameterbins(j).branchorderbins(k).numberterminatingbranches   = 0;
                        inddata.doublebins.diameterbins(j).branchorderbins(k).rallratio.values            = [inddata.doublebins.diameterbins(j).branchorderbins(k).piece.rallratio];
                        inddata.doublebins.diameterbins(j).branchorderbins(k).rallratio1.values           = [inddata.doublebins.diameterbins(j).branchorderbins(k).piece.rallratio1];
                        inddata.doublebins.diameterbins(j).branchorderbins(k).rallratio2.values           = [inddata.doublebins.diameterbins(j).branchorderbins(k).piece.rallratio2];
                        inddata.doublebins.diameterbins(j).branchorderbins(k).rallratio3.values           = [inddata.doublebins.diameterbins(j).branchorderbins(k).piece.rallratio3];
                        inddata.doublebins.diameterbins(j).branchorderbins(k).daughterratio.values        = [inddata.doublebins.diameterbins(j).branchorderbins(k).piece.daughterratio];
                        inddata.doublebins.diameterbins(j).branchorderbins(k).parentdaughterratio.values  = [inddata.doublebins.diameterbins(j).branchorderbins(k).piece.parentdaughterratio];
                        inddata.doublebins.diameterbins(j).branchorderbins(k).parentdaughter2ratio.values = [inddata.doublebins.diameterbins(j).branchorderbins(k).piece.parentdaughter2ratio];
                        inddata.doublebins.diameterbins(j).branchorderbins(k).meandiameter.values         = ([inddata.doublebins.diameterbins(j).branchorderbins(k).piece.proximaldiameter]+[inddata.doublebins.diameterbins(j).branchorderbins(k).piece.distaldiameter])/2;
                        inddata.doublebins.diameterbins(j).branchorderbins(k).taperrate.values            = [inddata.doublebins.diameterbins(j).branchorderbins(k).piece.taperrate];
                        inddata.doublebins.diameterbins(j).branchorderbins(k).piecelength.values          = [inddata.doublebins.diameterbins(j).branchorderbins(k).piece.length];
                        
                        for m = 1:length(inddata.doublebins.diameterbins(j).branchorderbins(k).piece)
                            if strcmp(inddata.doublebins.diameterbins(j).branchorderbins(k).piece(m).distaltype,'bifurcation')==1
                                inddata.doublebins.diameterbins(j).branchorderbins(k).numberbifurcations = 1 + inddata.doublebins.diameterbins(j).branchorderbins(k).numberbifurcations;
                            end
                            if strcmp(inddata.doublebins.diameterbins(j).branchorderbins(k).piece(m).distaltype,'m-furcation')==1
                                inddata.doublebins.diameterbins(j).branchorderbins(k).numberbifurcations = length(inddata.doublebins.diameterbins(j).branchorderbins(k).piece(m).daughters) - 1 + inddata.doublebins.diameterbins(j).branchorderbins(k).numberbifurcations;
                            end
                            if strcmp(inddata.doublebins.diameterbins(j).branchorderbins(k).piece(m).distaltype,'termination')==1
                                inddata.doublebins.diameterbins(j).branchorderbins(k).numberterminations = 1 + inddata.doublebins.diameterbins(j).branchorderbins(k).numberterminations;
                            end
                            if strcmp(inddata.doublebins.diameterbins(j).branchorderbins(k).piece(m).proximaltype,'primary    ')==1 || strcmp(inddata.doublebins.diameterbins(j).branchorderbins(k).piece(m).proximaltype,'daughter   ')==1 || strcmp(inddata.doublebins.diameterbins(j).branchorderbins(k).piece(m).proximaltype,'daughter1  ')==1 || strcmp(inddata.doublebins.diameterbins(j).branchorderbins(k).piece(m).proximaltype,'daughter2  ')==1
                                if strcmp(inddata.doublebins.diameterbins(j).branchorderbins(k).piece(m).branchtype,'b')==1
                                    inddata.doublebins.diameterbins(j).branchorderbins(k).numberbifurcatingbranches = 1 + inddata.doublebins.diameterbins(j).branchorderbins(k).numberbifurcatingbranches;
                                elseif strcmp(inddata.doublebins.diameterbins(j).branchorderbins(k).piece(m).branchtype,'t')==1
                                    inddata.doublebins.diameterbins(j).branchorderbins(k).numberterminatingbranches = 1 + inddata.doublebins.diameterbins(j).branchorderbins(k).numberterminatingbranches;
                                else disp('        Error in doublebinanalyzer: piece branch type not identified');
                                end
                            end
                        end
                    end
                    
                    if isfield(popdata.doublebins,'diameterbins') == 0; nextvalue = 1;
                    elseif j > length(popdata.doublebins.diameterbins); nextvalue = 1;
                    elseif isfield(popdata.doublebins.diameterbins(j).branchorderbins(k),'length') == 0; nextvalue = 1;
                    elseif isfield(popdata.doublebins.diameterbins(j).branchorderbins(k).length,'values') == 0; nextvalue = 1;
                    else nextvalue = 1 + length(popdata.doublebins.diameterbins(j).branchorderbins(k).length.values);
                    end
                    popdata.doublebins.diameterbins(j).branchorderbins(k).length.values(nextvalue)             = inddata.doublebins.diameterbins(j).branchorderbins(k).length;
                    popdata.doublebins.diameterbins(j).branchorderbins(k).surfacearea.values(nextvalue)        = inddata.doublebins.diameterbins(j).branchorderbins(k).surfacearea;
                    popdata.doublebins.diameterbins(j).branchorderbins(k).volume.values(nextvalue)             = inddata.doublebins.diameterbins(j).branchorderbins(k).volume;
                    popdata.doublebins.diameterbins(j).branchorderbins(k).numbersegments.values(nextvalue)     = inddata.doublebins.diameterbins(j).branchorderbins(k).numbersegments;
                    popdata.doublebins.diameterbins(j).branchorderbins(k).numberbifurcations.values(nextvalue) = inddata.doublebins.diameterbins(j).branchorderbins(k).numberbifurcations;
                    popdata.doublebins.diameterbins(j).branchorderbins(k).numberterminations.values(nextvalue) = inddata.doublebins.diameterbins(j).branchorderbins(k).numberterminations;
                    popdata.doublebins.diameterbins(j).branchorderbins(k).numberbifurcatingbranches.values(nextvalue) = inddata.doublebins.diameterbins(j).branchorderbins(k).numberbifurcatingbranches;
                    popdata.doublebins.diameterbins(j).branchorderbins(k).numberterminatingbranches.values(nextvalue) = inddata.doublebins.diameterbins(j).branchorderbins(k).numberterminatingbranches;
                    popdata.doublebins.diameterbins(j).branchorderbins(k).rallratio.values                     = [ [popdata.doublebins.diameterbins(j).branchorderbins(k).rallratio.values] [inddata.doublebins.diameterbins(j).branchorderbins(k).rallratio.values] ];
                    popdata.doublebins.diameterbins(j).branchorderbins(k).rallratio1.values                    = [ [popdata.doublebins.diameterbins(j).branchorderbins(k).rallratio1.values] [inddata.doublebins.diameterbins(j).branchorderbins(k).rallratio1.values] ];
                    popdata.doublebins.diameterbins(j).branchorderbins(k).rallratio2.values                    = [ [popdata.doublebins.diameterbins(j).branchorderbins(k).rallratio2.values] [inddata.doublebins.diameterbins(j).branchorderbins(k).rallratio2.values] ];
                    popdata.doublebins.diameterbins(j).branchorderbins(k).rallratio3.values                    = [ [popdata.doublebins.diameterbins(j).branchorderbins(k).rallratio3.values] [inddata.doublebins.diameterbins(j).branchorderbins(k).rallratio3.values] ];
                    popdata.doublebins.diameterbins(j).branchorderbins(k).daughterratio.values                 = [ [popdata.doublebins.diameterbins(j).branchorderbins(k).daughterratio.values] [inddata.doublebins.diameterbins(j).branchorderbins(k).daughterratio.values] ];
                    popdata.doublebins.diameterbins(j).branchorderbins(k).parentdaughterratio.values           = [ [popdata.doublebins.diameterbins(j).branchorderbins(k).parentdaughterratio.values] [inddata.doublebins.diameterbins(j).branchorderbins(k).parentdaughterratio.values] ];
                    popdata.doublebins.diameterbins(j).branchorderbins(k).parentdaughter2ratio.values          = [ [popdata.doublebins.diameterbins(j).branchorderbins(k).parentdaughter2ratio.values] [inddata.doublebins.diameterbins(j).branchorderbins(k).parentdaughter2ratio.values] ];
                    popdata.doublebins.diameterbins(j).branchorderbins(k).meandiameter.values                  = [ [popdata.doublebins.diameterbins(j).branchorderbins(k).meandiameter.values] [inddata.doublebins.diameterbins(j).branchorderbins(k).meandiameter.values] ];
                    popdata.doublebins.diameterbins(j).branchorderbins(k).taperrate.values                     = [ [popdata.doublebins.diameterbins(j).branchorderbins(k).taperrate.values] [inddata.doublebins.diameterbins(j).branchorderbins(k).taperrate.values] ];
                    popdata.doublebins.diameterbins(j).branchorderbins(k).piecelength.values                   = [ [popdata.doublebins.diameterbins(j).branchorderbins(k).piecelength.values] [inddata.doublebins.diameterbins(j).branchorderbins(k).piecelength.values] ];
                    clear nextvalue;
                    
                end
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        
        for i = 1:length(popdata.doublebins.diameterbins)
            
            for j = 1:length(popdata.doublebins.diameterbins(i).branchorderbins)
                
                typeanalysis.doublebin.diameterbranchorder.diameter(i,j)   = popdata.diameterbinmiddles(i);
                typeanalysis.doublebin.diameterbranchorder.branchorder(i,j) = j;
                
                if isfield(popdata.doublebins.diameterbins(i).branchorderbins(j).length,'values') == 1
                    
                    typeanalysis.doublebin.diameterbranchorder.length(i,j)      = sum([popdata.doublebins.diameterbins(i).branchorderbins(j).length.values]);
                    typeanalysis.doublebin.diameterbranchorder.surfacearea(i,j) = sum([popdata.doublebins.diameterbins(i).branchorderbins(j).surfacearea.values]);
                    typeanalysis.doublebin.diameterbranchorder.volume(i,j)      = sum([popdata.doublebins.diameterbins(i).branchorderbins(j).volume.values]);
                    
                    typeanalysis.doublebin.diameterbranchorder.numbersegments(i,j)     = sum([popdata.doublebins.diameterbins(i).branchorderbins(j).numbersegments.values]);
                    typeanalysis.doublebin.diameterbranchorder.numberbifurcations(i,j) = sum([popdata.doublebins.diameterbins(i).branchorderbins(j).numberbifurcations.values]);
                    typeanalysis.doublebin.diameterbranchorder.numberterminations(i,j) = sum([popdata.doublebins.diameterbins(i).branchorderbins(j).numberterminations.values]);
                    typeanalysis.doublebin.diameterbranchorder.numberbifurcatingbranches(i,j) = sum([popdata.doublebins.diameterbins(i).branchorderbins(j).numberbifurcatingbranches.values]);
                    typeanalysis.doublebin.diameterbranchorder.numberterminatingbranches(i,j) = sum([popdata.doublebins.diameterbins(i).branchorderbins(j).numberterminatingbranches.values]);
                    
                    typeanalysis.doublebin.diameterbranchorder.rallratio.mean(i,j) = mean([popdata.doublebins.diameterbins(i).branchorderbins(j).rallratio.values]);
                    typeanalysis.doublebin.diameterbranchorder.rallratio.std(i,j)  = std([popdata.doublebins.diameterbins(i).branchorderbins(j).rallratio.values]);
                    typeanalysis.doublebin.diameterbranchorder.rallratio.skew(i,j) = skewness([popdata.doublebins.diameterbins(i).branchorderbins(j).rallratio.values],0);
                    typeanalysis.doublebin.diameterbranchorder.rallratio.kurt(i,j) = kurtosis([popdata.doublebins.diameterbins(i).branchorderbins(j).rallratio.values],0);
                    
                    typeanalysis.doublebin.diameterbranchorder.rallratio1.mean(i,j) = mean([popdata.doublebins.diameterbins(i).branchorderbins(j).rallratio.values]);
                    typeanalysis.doublebin.diameterbranchorder.rallratio1.std(i,j)  = std([popdata.doublebins.diameterbins(i).branchorderbins(j).rallratio.values]);
                    typeanalysis.doublebin.diameterbranchorder.rallratio1.skew(i,j) = skewness([popdata.doublebins.diameterbins(i).branchorderbins(j).rallratio.values],0);
                    typeanalysis.doublebin.diameterbranchorder.rallratio1.kurt(i,j) = kurtosis([popdata.doublebins.diameterbins(i).branchorderbins(j).rallratio.values],0);
                    
                    typeanalysis.doublebin.diameterbranchorder.rallratio2.mean(i,j) = mean([popdata.doublebins.diameterbins(i).branchorderbins(j).rallratio2.values]);
                    typeanalysis.doublebin.diameterbranchorder.rallratio2.std(i,j)  = std([popdata.doublebins.diameterbins(i).branchorderbins(j).rallratio2.values]);
                    typeanalysis.doublebin.diameterbranchorder.rallratio2.skew(i,j) = skewness([popdata.doublebins.diameterbins(i).branchorderbins(j).rallratio2.values],0);
                    typeanalysis.doublebin.diameterbranchorder.rallratio2.kurt(i,j) = kurtosis([popdata.doublebins.diameterbins(i).branchorderbins(j).rallratio2.values],0);
                    
                    typeanalysis.doublebin.diameterbranchorder.rallratio3.mean(i,j) = mean([popdata.doublebins.diameterbins(i).branchorderbins(j).rallratio3.values]);
                    typeanalysis.doublebin.diameterbranchorder.rallratio3.std(i,j)  = std([popdata.doublebins.diameterbins(i).branchorderbins(j).rallratio3.values]);
                    typeanalysis.doublebin.diameterbranchorder.rallratio3.skew(i,j) = skewness([popdata.doublebins.diameterbins(i).branchorderbins(j).rallratio3.values],0);
                    typeanalysis.doublebin.diameterbranchorder.rallratio3.kurt(i,j) = kurtosis([popdata.doublebins.diameterbins(i).branchorderbins(j).rallratio3.values],0);
                    
                    typeanalysis.doublebin.diameterbranchorder.daughterratio.mean(i,j) = mean([popdata.doublebins.diameterbins(i).branchorderbins(j).daughterratio.values]);
                    typeanalysis.doublebin.diameterbranchorder.daughterratio.std(i,j)  = std([popdata.doublebins.diameterbins(i).branchorderbins(j).daughterratio.values]);
                    typeanalysis.doublebin.diameterbranchorder.daughterratio.skew(i,j) = skewness([popdata.doublebins.diameterbins(i).branchorderbins(j).daughterratio.values],0);
                    typeanalysis.doublebin.diameterbranchorder.daughterratio.kurt(i,j) = kurtosis([popdata.doublebins.diameterbins(i).branchorderbins(j).daughterratio.values],0);
                    
                    typeanalysis.doublebin.diameterbranchorder.parentdaughterratio.mean(i,j) = mean([popdata.doublebins.diameterbins(i).branchorderbins(j).parentdaughterratio.values]);
                    typeanalysis.doublebin.diameterbranchorder.parentdaughterratio.std(i,j)  = std([popdata.doublebins.diameterbins(i).branchorderbins(j).parentdaughterratio.values]);
                    typeanalysis.doublebin.diameterbranchorder.parentdaughterratio.skew(i,j) = skewness([popdata.doublebins.diameterbins(i).branchorderbins(j).parentdaughterratio.values],0);
                    typeanalysis.doublebin.diameterbranchorder.parentdaughterratio.kurt(i,j) = kurtosis([popdata.doublebins.diameterbins(i).branchorderbins(j).parentdaughterratio.values],0);
                    
                    typeanalysis.doublebin.diameterbranchorder.parentdaughter2ratio.mean(i,j) = mean([popdata.doublebins.diameterbins(i).branchorderbins(j).parentdaughter2ratio.values]);
                    typeanalysis.doublebin.diameterbranchorder.parentdaughter2ratio.std(i,j)  = std([popdata.doublebins.diameterbins(i).branchorderbins(j).parentdaughter2ratio.values]);
                    typeanalysis.doublebin.diameterbranchorder.parentdaughter2ratio.skew(i,j) = skewness([popdata.doublebins.diameterbins(i).branchorderbins(j).parentdaughter2ratio.values],0);
                    typeanalysis.doublebin.diameterbranchorder.parentdaughter2ratio.kurt(i,j) = kurtosis([popdata.doublebins.diameterbins(i).branchorderbins(j).parentdaughter2ratio.values],0);
                    
                    typeanalysis.doublebin.diameterbranchorder.taperrate.mean(i,j) = sum([popdata.doublebins.diameterbins(i).branchorderbins(j).taperrate.values].*[popdata.doublebins.diameterbins(i).branchorderbins(j).piecelength.values])/sum([popdata.doublebins.diameterbins(i).branchorderbins(j).piecelength.values]);
                    typeanalysis.doublebin.diameterbranchorder.taperrate.std(i,j)  = std([popdata.doublebins.diameterbins(i).branchorderbins(j).taperrate.values]);
                    typeanalysis.doublebin.diameterbranchorder.taperrate.skew(i,j) = skewness([popdata.doublebins.diameterbins(i).branchorderbins(j).taperrate.values],0);
                    typeanalysis.doublebin.diameterbranchorder.taperrate.kurt(i,j) = kurtosis([popdata.doublebins.diameterbins(i).branchorderbins(j).taperrate.values],0);
                    
                    
                    typeanalysis.doublebin.diameterbranchorder.bifurcationprobability.bylength(i,j) = typeanalysis.doublebin.diameterbranchorder.numberbifurcations(i,j) / typeanalysis.doublebin.diameterbranchorder.length(i,j);
                    typeanalysis.doublebin.diameterbranchorder.terminationprobability.bylength(i,j) = typeanalysis.doublebin.diameterbranchorder.numberterminations(i,j) / typeanalysis.doublebin.diameterbranchorder.length(i,j);
                    
                    typeanalysis.doublebin.diameterbranchorder.bifurcationprobability.bysurfacearea(i,j) = typeanalysis.doublebin.diameterbranchorder.numberbifurcations(i,j) / typeanalysis.doublebin.diameterbranchorder.surfacearea(i,j);
                    typeanalysis.doublebin.diameterbranchorder.terminationprobability.bysurfacearea(i,j) = typeanalysis.doublebin.diameterbranchorder.numberterminations(i,j) / typeanalysis.doublebin.diameterbranchorder.surfacearea(i,j);
                    
                    typeanalysis.doublebin.diameterbranchorder.bifurcationprobability.byvolume(i,j) = typeanalysis.doublebin.diameterbranchorder.numberbifurcations(i,j) / typeanalysis.doublebin.diameterbranchorder.volume(i,j);
                    typeanalysis.doublebin.diameterbranchorder.terminationprobability.byvolume(i,j) = typeanalysis.doublebin.diameterbranchorder.numberterminations(i,j) / typeanalysis.doublebin.diameterbranchorder.volume(i,j);
                    
                end
            end
        end
        
        typeanalysis.doublebin.diameterbranchorder.array.diameter      = reshape(typeanalysis.doublebin.diameterbranchorder.diameter,numel(typeanalysis.doublebin.diameterbranchorder.diameter),1);
        typeanalysis.doublebin.diameterbranchorder.array.branchorder    = reshape(typeanalysis.doublebin.diameterbranchorder.branchorder,numel(typeanalysis.doublebin.diameterbranchorder.branchorder),1);
        
        typeanalysis.doublebin.diameterbranchorder.array.diameter   = reshape(typeanalysis.doublebin.diameterbranchorder.diameter,numel(typeanalysis.doublebin.diameterbranchorder.diameter),1);
        typeanalysis.doublebin.diameterbranchorder.array.branchorder = reshape(typeanalysis.doublebin.diameterbranchorder.branchorder,numel(typeanalysis.doublebin.diameterbranchorder.branchorder),1);
        
        typeanalysis.doublebin.diameterbranchorder.array.length      = reshape(typeanalysis.doublebin.diameterbranchorder.length,numel(typeanalysis.doublebin.diameterbranchorder.length),1);
        typeanalysis.doublebin.diameterbranchorder.array.surfacearea = reshape(typeanalysis.doublebin.diameterbranchorder.surfacearea,numel(typeanalysis.doublebin.diameterbranchorder.surfacearea),1);
        typeanalysis.doublebin.diameterbranchorder.array.volume      = reshape(typeanalysis.doublebin.diameterbranchorder.volume,numel(typeanalysis.doublebin.diameterbranchorder.volume),1);
        
        typeanalysis.doublebin.diameterbranchorder.array.numbersegments     = reshape(typeanalysis.doublebin.diameterbranchorder.numbersegments,numel(typeanalysis.doublebin.diameterbranchorder.numbersegments),1);
        typeanalysis.doublebin.diameterbranchorder.array.numberbifurcations = reshape(typeanalysis.doublebin.diameterbranchorder.numberbifurcations,numel(typeanalysis.doublebin.diameterbranchorder.numberbifurcations),1);
        typeanalysis.doublebin.diameterbranchorder.array.numberterminations = reshape(typeanalysis.doublebin.diameterbranchorder.numberterminations,numel(typeanalysis.doublebin.diameterbranchorder.numberterminations),1);
        typeanalysis.doublebin.diameterbranchorder.array.numberbifurcatingbranches = reshape(typeanalysis.doublebin.diameterbranchorder.numberbifurcatingbranches,numel(typeanalysis.doublebin.diameterbranchorder.numberbifurcatingbranches),1);
        typeanalysis.doublebin.diameterbranchorder.array.numberterminatingbranches = reshape(typeanalysis.doublebin.diameterbranchorder.numberterminatingbranches,numel(typeanalysis.doublebin.diameterbranchorder.numberterminatingbranches),1);
        
        typeanalysis.doublebin.diameterbranchorder.array.rallratio.mean = reshape(typeanalysis.doublebin.diameterbranchorder.rallratio.mean,numel(typeanalysis.doublebin.diameterbranchorder.rallratio.mean),1);
        typeanalysis.doublebin.diameterbranchorder.array.rallratio.std  = reshape(typeanalysis.doublebin.diameterbranchorder.rallratio.std,numel(typeanalysis.doublebin.diameterbranchorder.rallratio.std),1);
        typeanalysis.doublebin.diameterbranchorder.array.rallratio.skew = reshape(typeanalysis.doublebin.diameterbranchorder.rallratio.skew,numel(typeanalysis.doublebin.diameterbranchorder.rallratio.skew),1);
        typeanalysis.doublebin.diameterbranchorder.array.rallratio.kurt = reshape(typeanalysis.doublebin.diameterbranchorder.rallratio.kurt,numel(typeanalysis.doublebin.diameterbranchorder.rallratio.kurt),1);
        
        typeanalysis.doublebin.diameterbranchorder.array.rallratio1.mean = reshape(typeanalysis.doublebin.diameterbranchorder.rallratio1.mean,numel(typeanalysis.doublebin.diameterbranchorder.rallratio1.mean),1);
        typeanalysis.doublebin.diameterbranchorder.array.rallratio1.std  = reshape(typeanalysis.doublebin.diameterbranchorder.rallratio1.std,numel(typeanalysis.doublebin.diameterbranchorder.rallratio1.std),1);
        typeanalysis.doublebin.diameterbranchorder.array.rallratio1.skew = reshape(typeanalysis.doublebin.diameterbranchorder.rallratio1.skew,numel(typeanalysis.doublebin.diameterbranchorder.rallratio1.skew),1);
        typeanalysis.doublebin.diameterbranchorder.array.rallratio1.kurt = reshape(typeanalysis.doublebin.diameterbranchorder.rallratio1.kurt,numel(typeanalysis.doublebin.diameterbranchorder.rallratio1.kurt),1);
        
        typeanalysis.doublebin.diameterbranchorder.array.rallratio2.mean = reshape(typeanalysis.doublebin.diameterbranchorder.rallratio2.mean,numel(typeanalysis.doublebin.diameterbranchorder.rallratio2.mean),1);
        typeanalysis.doublebin.diameterbranchorder.array.rallratio2.std  = reshape(typeanalysis.doublebin.diameterbranchorder.rallratio2.std,numel(typeanalysis.doublebin.diameterbranchorder.rallratio2.std),1);
        typeanalysis.doublebin.diameterbranchorder.array.rallratio2.skew = reshape(typeanalysis.doublebin.diameterbranchorder.rallratio2.skew,numel(typeanalysis.doublebin.diameterbranchorder.rallratio2.skew),1);
        typeanalysis.doublebin.diameterbranchorder.array.rallratio2.kurt = reshape(typeanalysis.doublebin.diameterbranchorder.rallratio2.kurt,numel(typeanalysis.doublebin.diameterbranchorder.rallratio2.kurt),1);
        
        typeanalysis.doublebin.diameterbranchorder.array.rallratio3.mean = reshape(typeanalysis.doublebin.diameterbranchorder.rallratio3.mean,numel(typeanalysis.doublebin.diameterbranchorder.rallratio3.mean),1);
        typeanalysis.doublebin.diameterbranchorder.array.rallratio3.std  = reshape(typeanalysis.doublebin.diameterbranchorder.rallratio3.std,numel(typeanalysis.doublebin.diameterbranchorder.rallratio3.std),1);
        typeanalysis.doublebin.diameterbranchorder.array.rallratio3.skew = reshape(typeanalysis.doublebin.diameterbranchorder.rallratio3.skew,numel(typeanalysis.doublebin.diameterbranchorder.rallratio3.skew),1);
        typeanalysis.doublebin.diameterbranchorder.array.rallratio3.kurt = reshape(typeanalysis.doublebin.diameterbranchorder.rallratio3.kurt,numel(typeanalysis.doublebin.diameterbranchorder.rallratio3.kurt),1);
        
        typeanalysis.doublebin.diameterbranchorder.array.daughterratio.mean = reshape(typeanalysis.doublebin.diameterbranchorder.daughterratio.mean,numel(typeanalysis.doublebin.diameterbranchorder.daughterratio.mean),1);
        typeanalysis.doublebin.diameterbranchorder.array.daughterratio.std  = reshape(typeanalysis.doublebin.diameterbranchorder.daughterratio.std,numel(typeanalysis.doublebin.diameterbranchorder.daughterratio.std),1);
        typeanalysis.doublebin.diameterbranchorder.array.daughterratio.skew = reshape(typeanalysis.doublebin.diameterbranchorder.daughterratio.skew,numel(typeanalysis.doublebin.diameterbranchorder.daughterratio.skew),1);
        typeanalysis.doublebin.diameterbranchorder.array.daughterratio.kurt = reshape(typeanalysis.doublebin.diameterbranchorder.daughterratio.kurt,numel(typeanalysis.doublebin.diameterbranchorder.daughterratio.kurt),1);
        
        typeanalysis.doublebin.diameterbranchorder.array.parentdaughterratio.mean = reshape(typeanalysis.doublebin.diameterbranchorder.parentdaughterratio.mean,numel(typeanalysis.doublebin.diameterbranchorder.parentdaughterratio.mean),1);
        typeanalysis.doublebin.diameterbranchorder.array.parentdaughterratio.std  = reshape(typeanalysis.doublebin.diameterbranchorder.parentdaughterratio.std,numel(typeanalysis.doublebin.diameterbranchorder.parentdaughterratio.std),1);
        typeanalysis.doublebin.diameterbranchorder.array.parentdaughterratio.skew = reshape(typeanalysis.doublebin.diameterbranchorder.parentdaughterratio.skew,numel(typeanalysis.doublebin.diameterbranchorder.parentdaughterratio.skew),1);
        typeanalysis.doublebin.diameterbranchorder.array.parentdaughterratio.kurt = reshape(typeanalysis.doublebin.diameterbranchorder.parentdaughterratio.kurt,numel(typeanalysis.doublebin.diameterbranchorder.parentdaughterratio.kurt),1);
        
        typeanalysis.doublebin.diameterbranchorder.array.parentdaughter2ratio.mean = reshape(typeanalysis.doublebin.diameterbranchorder.parentdaughter2ratio.mean,numel(typeanalysis.doublebin.diameterbranchorder.parentdaughter2ratio.mean),1);
        typeanalysis.doublebin.diameterbranchorder.array.parentdaughter2ratio.std  = reshape(typeanalysis.doublebin.diameterbranchorder.parentdaughter2ratio.std,numel(typeanalysis.doublebin.diameterbranchorder.parentdaughter2ratio.std),1);
        typeanalysis.doublebin.diameterbranchorder.array.parentdaughter2ratio.skew = reshape(typeanalysis.doublebin.diameterbranchorder.parentdaughter2ratio.skew,numel(typeanalysis.doublebin.diameterbranchorder.parentdaughter2ratio.skew),1);
        typeanalysis.doublebin.diameterbranchorder.array.parentdaughter2ratio.kurt = reshape(typeanalysis.doublebin.diameterbranchorder.parentdaughter2ratio.kurt,numel(typeanalysis.doublebin.diameterbranchorder.parentdaughter2ratio.kurt),1);
        
        typeanalysis.doublebin.diameterbranchorder.array.taperrate.mean = reshape(typeanalysis.doublebin.diameterbranchorder.taperrate.mean,numel(typeanalysis.doublebin.diameterbranchorder.taperrate.mean),1);
        typeanalysis.doublebin.diameterbranchorder.array.taperrate.std  = reshape(typeanalysis.doublebin.diameterbranchorder.taperrate.std,numel(typeanalysis.doublebin.diameterbranchorder.taperrate.std),1);
        typeanalysis.doublebin.diameterbranchorder.array.taperrate.skew = reshape(typeanalysis.doublebin.diameterbranchorder.taperrate.skew,numel(typeanalysis.doublebin.diameterbranchorder.taperrate.skew),1);
        typeanalysis.doublebin.diameterbranchorder.array.taperrate.kurt = reshape(typeanalysis.doublebin.diameterbranchorder.taperrate.kurt,numel(typeanalysis.doublebin.diameterbranchorder.taperrate.kurt),1);
        
        
        typeanalysis.doublebin.diameterbranchorder.array.bifurcationprobability.bylength      = reshape(typeanalysis.doublebin.diameterbranchorder.bifurcationprobability.bylength,numel(typeanalysis.doublebin.diameterbranchorder.bifurcationprobability.bylength),1);
        typeanalysis.doublebin.diameterbranchorder.array.bifurcationprobability.bysurfacearea = reshape(typeanalysis.doublebin.diameterbranchorder.bifurcationprobability.bysurfacearea,numel(typeanalysis.doublebin.diameterbranchorder.bifurcationprobability.bysurfacearea),1);
        typeanalysis.doublebin.diameterbranchorder.array.bifurcationprobability.byvolume      = reshape(typeanalysis.doublebin.diameterbranchorder.bifurcationprobability.byvolume,numel(typeanalysis.doublebin.diameterbranchorder.bifurcationprobability.byvolume),1);
        typeanalysis.doublebin.diameterbranchorder.array.bifurcationprobability.diameter    = reshape(typeanalysis.doublebin.diameterbranchorder.diameter,numel(typeanalysis.doublebin.diameterbranchorder.diameter),1);
        typeanalysis.doublebin.diameterbranchorder.array.bifurcationprobability.branchorder  = reshape(typeanalysis.doublebin.diameterbranchorder.branchorder,numel(typeanalysis.doublebin.diameterbranchorder.branchorder),1);
        
        typeanalysis.doublebin.diameterbranchorder.array.bifurcationprobability.branchorder  = typeanalysis.doublebin.diameterbranchorder.array.bifurcationprobability.branchorder(~isnan(typeanalysis.doublebin.diameterbranchorder.array.bifurcationprobability.bylength));
        typeanalysis.doublebin.diameterbranchorder.array.bifurcationprobability.diameter    = typeanalysis.doublebin.diameterbranchorder.array.bifurcationprobability.diameter(~isnan(typeanalysis.doublebin.diameterbranchorder.array.bifurcationprobability.bylength));
        typeanalysis.doublebin.diameterbranchorder.array.bifurcationprobability.byvolume      = typeanalysis.doublebin.diameterbranchorder.array.bifurcationprobability.byvolume(~isnan(typeanalysis.doublebin.diameterbranchorder.array.bifurcationprobability.bylength));
        typeanalysis.doublebin.diameterbranchorder.array.bifurcationprobability.bysurfacearea = typeanalysis.doublebin.diameterbranchorder.array.bifurcationprobability.bysurfacearea(~isnan(typeanalysis.doublebin.diameterbranchorder.array.bifurcationprobability.bylength));
        typeanalysis.doublebin.diameterbranchorder.array.bifurcationprobability.bylength      = typeanalysis.doublebin.diameterbranchorder.array.bifurcationprobability.bylength(~isnan(typeanalysis.doublebin.diameterbranchorder.array.bifurcationprobability.bylength));
        
        %typeanalysis.doublebin.diameterbranchorder.array.bifurcationprobability.zunzunlength = [typeanalysis.doublebin.diameterbranchorder.array.bifurcationprobability.diameter typeanalysis.doublebin.diameterbranchorder.array.bifurcationprobability.branchorder typeanalysis.doublebin.diameterbranchorder.array.bifurcationprobability.bylength];
        %typeanalysis.doublebin.diameterbranchorder.array.bifurcationprobability.zunzunsurfacearea = [typeanalysis.doublebin.diameterbranchorder.array.bifurcationprobability.diameter typeanalysis.doublebin.diameterbranchorder.array.bifurcationprobability.branchorder typeanalysis.doublebin.diameterbranchorder.array.bifurcationprobability.bysurfacearea];
        %typeanalysis.doublebin.diameterbranchorder.array.bifurcationprobability.zunzunvolume = [typeanalysis.doublebin.diameterbranchorder.array.bifurcationprobability.diameter typeanalysis.doublebin.diameterbranchorder.array.bifurcationprobability.branchorder typeanalysis.doublebin.diameterbranchorder.array.bifurcationprobability.byvolume];
        
        
        typeanalysis.doublebin.diameterbranchorder.array.terminationprobability.bylength      = reshape(typeanalysis.doublebin.diameterbranchorder.terminationprobability.bylength,numel(typeanalysis.doublebin.diameterbranchorder.terminationprobability.bylength),1);
        typeanalysis.doublebin.diameterbranchorder.array.terminationprobability.bysurfacearea = reshape(typeanalysis.doublebin.diameterbranchorder.terminationprobability.bysurfacearea,numel(typeanalysis.doublebin.diameterbranchorder.terminationprobability.bysurfacearea),1);
        typeanalysis.doublebin.diameterbranchorder.array.terminationprobability.byvolume      = reshape(typeanalysis.doublebin.diameterbranchorder.terminationprobability.byvolume,numel(typeanalysis.doublebin.diameterbranchorder.terminationprobability.byvolume),1);
        typeanalysis.doublebin.diameterbranchorder.array.terminationprobability.diameter    = reshape(typeanalysis.doublebin.diameterbranchorder.diameter,numel(typeanalysis.doublebin.diameterbranchorder.diameter),1);
        typeanalysis.doublebin.diameterbranchorder.array.terminationprobability.branchorder  = reshape(typeanalysis.doublebin.diameterbranchorder.branchorder,numel(typeanalysis.doublebin.diameterbranchorder.branchorder),1);
        
        typeanalysis.doublebin.diameterbranchorder.array.terminationprobability.branchorder  = typeanalysis.doublebin.diameterbranchorder.array.terminationprobability.branchorder(~isnan(typeanalysis.doublebin.diameterbranchorder.array.terminationprobability.bylength));
        typeanalysis.doublebin.diameterbranchorder.array.terminationprobability.diameter    = typeanalysis.doublebin.diameterbranchorder.array.terminationprobability.diameter(~isnan(typeanalysis.doublebin.diameterbranchorder.array.terminationprobability.bylength));
        typeanalysis.doublebin.diameterbranchorder.array.terminationprobability.byvolume      = typeanalysis.doublebin.diameterbranchorder.array.terminationprobability.byvolume(~isnan(typeanalysis.doublebin.diameterbranchorder.array.terminationprobability.bylength));
        typeanalysis.doublebin.diameterbranchorder.array.terminationprobability.bysurfacearea = typeanalysis.doublebin.diameterbranchorder.array.terminationprobability.bysurfacearea(~isnan(typeanalysis.doublebin.diameterbranchorder.array.terminationprobability.bylength));
        typeanalysis.doublebin.diameterbranchorder.array.terminationprobability.bylength      = typeanalysis.doublebin.diameterbranchorder.array.terminationprobability.bylength(~isnan(typeanalysis.doublebin.diameterbranchorder.array.terminationprobability.bylength));
        
        %typeanalysis.doublebin.diameterbranchorder.array.terminationprobability.zunzunlength = [typeanalysis.doublebin.diameterbranchorder.array.terminationprobability.diameter typeanalysis.doublebin.diameterbranchorder.array.terminationprobability.branchorder typeanalysis.doublebin.diameterbranchorder.array.terminationprobability.bylength];
        %typeanalysis.doublebin.diameterbranchorder.array.terminationprobability.zunzunsurfacearea = [typeanalysis.doublebin.diameterbranchorder.array.terminationprobability.diameter typeanalysis.doublebin.diameterbranchorder.array.terminationprobability.branchorder typeanalysis.doublebin.diameterbranchorder.array.terminationprobability.bysurfacearea];
        %typeanalysis.doublebin.diameterbranchorder.array.terminationprobability.zunzunvolume = [typeanalysis.doublebin.diameterbranchorder.array.terminationprobability.diameter typeanalysis.doublebin.diameterbranchorder.array.terminationprobability.branchorder typeanalysis.doublebin.diameterbranchorder.array.terminationprobability.byvolume];
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        % Begin bifurcation double bin analysis
        
        for i = 1:maxdiameterbin
            for j = 1:maxbranchorderbin
                popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).rallratio.values            = [];
                popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).rallratio1.values           = [];
                popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).rallratio2.values           = [];
                popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).rallratio3.values           = [];
                popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).daughterratio.values        = [];
                popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).parentdaughterratio.values  = [];
                popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).parentdaughter2ratio.values = [];
                popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).meandiameter.values         = [];
                popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).taperrate.values            = [];
                popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).piecelength.values          = [];
            end
        end
        
        
        for i = 1:length(data.individual)
            
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            
            for j = 1:length(inddata.bifurcation.doublebins.diameterbins)
                
                for k = 1:length(inddata.bifurcation.doublebins.diameterbins(j).branchorderbins)
                    
                    inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).length                      = 0;
                    inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).surfacearea                 = 0;
                    inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).volume                      = 0;
                    inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).numbersegments              = 0;
                    inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).numberbifurcations          = 0;
                    inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).numberterminations          = 0;
                    inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).rallratio.values            = [];
                    inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).rallratio1.values           = [];
                    inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).rallratio2.values           = [];
                    inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).rallratio3.values           = [];
                    inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).daughterratio.values        = [];
                    inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).parentdaughterratio.values  = [];
                    inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).parentdaughter2ratio.values = [];
                    inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).meandiameter.values         = [];
                    inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).taperrate.values            = [];
                    inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).piecelength.values          = [];
                    
                    
                    if isfield(inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k),'piece') == 1 && isfield(inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).piece,'id')
                        
                        inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).length                      = sum([inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).piece.length]);
                        inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).surfacearea                 = sum([inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).piece.surfacearea]);
                        inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).volume                      = sum([inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).piece.volume]);
                        inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).numbersegments              = length(unique([inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).piece.cable]));
                        inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).numberbifurcations          = 0;
                        inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).numberterminations          = 0;
                        inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).rallratio.values            = [inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).piece.rallratio];
                        inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).rallratio1.values           = [inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).piece.rallratio1];
                        inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).rallratio2.values           = [inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).piece.rallratio2];
                        inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).rallratio3.values           = [inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).piece.rallratio3];
                        inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).daughterratio.values        = [inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).piece.daughterratio];
                        inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).parentdaughterratio.values  = [inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).piece.parentdaughterratio];
                        inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).parentdaughter2ratio.values = [inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).piece.parentdaughter2ratio];
                        inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).meandiameter.values         = ([inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).piece.proximaldiameter]+[inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).piece.distaldiameter])/2;
                        inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).taperrate.values            = [inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).piece.taperrate];
                        inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).piecelength.values          = [inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).piece.length];
                        
                        for m = 1:length(inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).piece)
                            if strcmp(inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).piece(m).distaltype,'bifurcation')==1
                                inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).numberbifurcations = 1 + inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).numberbifurcations;
                            end
                            if strcmp(inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).piece(m).distaltype,'m-furcation')==1
                                inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).numberbifurcations = length(inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).piece(m).daughters) - 1 + inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).numberbifurcations;
                            end
                            if strcmp(inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).piece(m).distaltype,'termination')==1
                                inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).numberterminations = 1 + inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).numberterminations;
                            end
                        end
                    end
                    
                    if isfield(popdata.bifurcation.doublebins,'diameterbins') == 0; nextvalue = 1;
                    elseif j > length(popdata.bifurcation.doublebins.diameterbins); nextvalue = 1;
                    elseif isfield(popdata.bifurcation.doublebins.diameterbins(j).branchorderbins(k),'length') == 0; nextvalue = 1;
                    elseif isfield(popdata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).length,'values') == 0; nextvalue = 1;
                    else nextvalue = 1 + length(popdata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).length.values);
                    end
                    popdata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).length.values(nextvalue)             = inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).length;
                    popdata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).surfacearea.values(nextvalue)        = inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).surfacearea;
                    popdata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).volume.values(nextvalue)             = inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).volume;
                    popdata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).numbersegments.values(nextvalue)     = inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).numbersegments;
                    popdata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).numberbifurcations.values(nextvalue) = inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).numberbifurcations;
                    popdata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).numberterminations.values(nextvalue) = inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).numberterminations;
                    popdata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).rallratio.values                     = [ [popdata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).rallratio.values] [inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).rallratio.values] ];
                    popdata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).rallratio1.values                    = [ [popdata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).rallratio1.values] [inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).rallratio1.values] ];
                    popdata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).rallratio2.values                    = [ [popdata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).rallratio2.values] [inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).rallratio2.values] ];
                    popdata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).rallratio3.values                    = [ [popdata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).rallratio3.values] [inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).rallratio3.values] ];
                    popdata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).daughterratio.values                 = [ [popdata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).daughterratio.values] [inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).daughterratio.values] ];
                    popdata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).parentdaughterratio.values           = [ [popdata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).parentdaughterratio.values] [inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).parentdaughterratio.values] ];
                    popdata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).parentdaughter2ratio.values          = [ [popdata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).parentdaughter2ratio.values] [inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).parentdaughter2ratio.values] ];
                    popdata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).meandiameter.values                  = [ [popdata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).meandiameter.values] [inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).meandiameter.values] ];
                    popdata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).taperrate.values                     = [ [popdata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).taperrate.values] [inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).taperrate.values] ];
                    popdata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).piecelength.values                   = [ [popdata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).piecelength.values] [inddata.bifurcation.doublebins.diameterbins(j).branchorderbins(k).piecelength.values] ];
                    clear nextvalue;
                    
                end
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        
        for i = 1:length(popdata.bifurcation.doublebins.diameterbins)
            
            for j = 1:length(popdata.bifurcation.doublebins.diameterbins(i).branchorderbins)
                
                typeanalysis.bifurcation.doublebin.diameterbranchorder.diameter(i,j)   = popdata.diameterbinmiddles(i);
                typeanalysis.bifurcation.doublebin.diameterbranchorder.branchorder(i,j) = j;
                
                if isfield(popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).length,'values') == 1
                    
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.length(i,j)      = sum([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).length.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.surfacearea(i,j) = sum([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).surfacearea.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.volume(i,j)      = sum([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).volume.values]);
                    
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.numbersegments(i,j)     = sum([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).numbersegments.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.numberbifurcations(i,j) = sum([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).numberbifurcations.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.numberterminations(i,j) = sum([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).numberterminations.values]);
                    
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio.mean(i,j) = mean([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).rallratio.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio.std(i,j)  = std([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).rallratio.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio.skew(i,j) = skewness([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).rallratio.values],0);
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio.kurt(i,j) = kurtosis([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).rallratio.values],0);
                    
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio1.mean(i,j) = mean([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).rallratio1.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio1.std(i,j)  = std([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).rallratio1.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio1.skew(i,j) = skewness([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).rallratio1.values],0);
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio1.kurt(i,j) = kurtosis([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).rallratio1.values],0);
                    
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio2.mean(i,j) = mean([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).rallratio2.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio2.std(i,j)  = std([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).rallratio2.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio2.skew(i,j) = skewness([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).rallratio2.values],0);
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio2.kurt(i,j) = kurtosis([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).rallratio2.values],0);
                    
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio3.mean(i,j) = mean([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).rallratio3.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio3.std(i,j)  = std([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).rallratio3.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio3.skew(i,j) = skewness([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).rallratio3.values],0);
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio3.kurt(i,j) = kurtosis([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).rallratio3.values],0);
                    
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.daughterratio.mean(i,j) = mean([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).daughterratio.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.daughterratio.std(i,j)  = std([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).daughterratio.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.daughterratio.skew(i,j) = skewness([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).daughterratio.values],0);
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.daughterratio.kurt(i,j) = kurtosis([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).daughterratio.values],0);
                    
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.parentdaughterratio.mean(i,j) = mean([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).parentdaughterratio.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.parentdaughterratio.std(i,j)  = std([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).parentdaughterratio.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.parentdaughterratio.skew(i,j) = skewness([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).parentdaughterratio.values],0);
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.parentdaughterratio.kurt(i,j) = kurtosis([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).parentdaughterratio.values],0);
                    
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.parentdaughter2ratio.mean(i,j) = mean([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).parentdaughter2ratio.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.parentdaughter2ratio.std(i,j)  = std([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).parentdaughter2ratio.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.parentdaughter2ratio.skew(i,j) = skewness([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).parentdaughter2ratio.values],0);
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.parentdaughter2ratio.kurt(i,j) = kurtosis([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).parentdaughter2ratio.values],0);
                    
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.taperrate.mean(i,j) = sum([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).taperrate.values].*[popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).piecelength.values])/sum([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).piecelength.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.taperrate.std(i,j)  = std([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).taperrate.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.taperrate.skew(i,j) = skewness([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).taperrate.values],0);
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.taperrate.kurt(i,j) = kurtosis([popdata.bifurcation.doublebins.diameterbins(i).branchorderbins(j).taperrate.values],0);
                    
                    
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.bifurcationprobability.bylength(i,j) = typeanalysis.bifurcation.doublebin.diameterbranchorder.numberbifurcations(i,j) / typeanalysis.bifurcation.doublebin.diameterbranchorder.length(i,j);
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.terminationprobability.bylength(i,j) = typeanalysis.bifurcation.doublebin.diameterbranchorder.numberterminations(i,j) / typeanalysis.bifurcation.doublebin.diameterbranchorder.length(i,j);
                    
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.bifurcationprobability.bysurfacearea(i,j) = typeanalysis.bifurcation.doublebin.diameterbranchorder.numberbifurcations(i,j) / typeanalysis.bifurcation.doublebin.diameterbranchorder.surfacearea(i,j);
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.terminationprobability.bysurfacearea(i,j) = typeanalysis.bifurcation.doublebin.diameterbranchorder.numberterminations(i,j) / typeanalysis.bifurcation.doublebin.diameterbranchorder.surfacearea(i,j);
                    
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.bifurcationprobability.byvolume(i,j) = typeanalysis.bifurcation.doublebin.diameterbranchorder.numberbifurcations(i,j) / typeanalysis.bifurcation.doublebin.diameterbranchorder.volume(i,j);
                    typeanalysis.bifurcation.doublebin.diameterbranchorder.terminationprobability.byvolume(i,j) = typeanalysis.bifurcation.doublebin.diameterbranchorder.numberterminations(i,j) / typeanalysis.bifurcation.doublebin.diameterbranchorder.volume(i,j);
                    
                end
            end
        end
        
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.diameter      = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.diameter,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.diameter),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.branchorder    = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.branchorder,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.branchorder),1);
        
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.length      = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.length,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.length),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.surfacearea = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.surfacearea,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.surfacearea),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.volume      = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.volume,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.volume),1);
        
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.numbersegments     = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.numbersegments,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.numbersegments),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.numberbifurcations = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.numberbifurcations,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.numberbifurcations),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.numberterminations = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.numberterminations,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.numberterminations),1);
        
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.rallratio.mean = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio.mean,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio.mean),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.rallratio.std  = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio.std,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio.std),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.rallratio.skew = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio.skew,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio.skew),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.rallratio.kurt = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio.kurt,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio.kurt),1);
        
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.rallratio1.mean = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio1.mean,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio1.mean),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.rallratio1.std  = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio1.std,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio1.std),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.rallratio1.skew = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio1.skew,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio1.skew),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.rallratio1.kurt = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio1.kurt,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio1.kurt),1);
        
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.rallratio2.mean = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio2.mean,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio2.mean),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.rallratio2.std  = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio2.std,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio2.std),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.rallratio2.skew = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio2.skew,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio2.skew),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.rallratio2.kurt = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio2.kurt,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio2.kurt),1);
        
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.rallratio3.mean = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio3.mean,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio3.mean),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.rallratio3.std  = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio3.std,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio3.std),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.rallratio3.skew = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio3.skew,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio3.skew),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.rallratio3.kurt = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio3.kurt,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.rallratio3.kurt),1);
        
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.daughterratio.mean = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.daughterratio.mean,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.daughterratio.mean),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.daughterratio.std  = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.daughterratio.std,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.daughterratio.std),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.daughterratio.skew = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.daughterratio.skew,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.daughterratio.skew),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.daughterratio.kurt = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.daughterratio.kurt,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.daughterratio.kurt),1);
        
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.parentdaughterratio.mean = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.parentdaughterratio.mean,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.parentdaughterratio.mean),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.parentdaughterratio.std  = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.parentdaughterratio.std,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.parentdaughterratio.std),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.parentdaughterratio.skew = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.parentdaughterratio.skew,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.parentdaughterratio.skew),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.parentdaughterratio.kurt = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.parentdaughterratio.kurt,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.parentdaughterratio.kurt),1);
        
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.parentdaughter2ratio.mean = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.parentdaughter2ratio.mean,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.parentdaughter2ratio.mean),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.parentdaughter2ratio.std  = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.parentdaughter2ratio.std,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.parentdaughter2ratio.std),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.parentdaughter2ratio.skew = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.parentdaughter2ratio.skew,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.parentdaughter2ratio.skew),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.parentdaughter2ratio.kurt = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.parentdaughter2ratio.kurt,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.parentdaughter2ratio.kurt),1);
        
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.taperrate.mean = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.taperrate.mean,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.taperrate.mean),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.taperrate.std  = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.taperrate.std,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.taperrate.std),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.taperrate.skew = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.taperrate.skew,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.taperrate.skew),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.taperrate.kurt = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.taperrate.kurt,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.taperrate.kurt),1);
        
        
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.bifurcationprobability.bylength      = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.bifurcationprobability.bylength,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.bifurcationprobability.bylength),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.bifurcationprobability.bysurfacearea = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.bifurcationprobability.bysurfacearea,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.bifurcationprobability.bysurfacearea),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.bifurcationprobability.byvolume      = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.bifurcationprobability.byvolume,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.bifurcationprobability.byvolume),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.bifurcationprobability.diameter    = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.diameter,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.diameter),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.bifurcationprobability.branchorder  = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.branchorder,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.branchorder),1);
        
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.bifurcationprobability.branchorder  = typeanalysis.bifurcation.doublebin.diameterbranchorder.array.bifurcationprobability.branchorder(~isnan(typeanalysis.bifurcation.doublebin.diameterbranchorder.array.bifurcationprobability.bylength));
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.bifurcationprobability.diameter    = typeanalysis.bifurcation.doublebin.diameterbranchorder.array.bifurcationprobability.diameter(~isnan(typeanalysis.bifurcation.doublebin.diameterbranchorder.array.bifurcationprobability.bylength));
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.bifurcationprobability.byvolume      = typeanalysis.bifurcation.doublebin.diameterbranchorder.array.bifurcationprobability.byvolume(~isnan(typeanalysis.bifurcation.doublebin.diameterbranchorder.array.bifurcationprobability.bylength));
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.bifurcationprobability.bysurfacearea = typeanalysis.bifurcation.doublebin.diameterbranchorder.array.bifurcationprobability.bysurfacearea(~isnan(typeanalysis.bifurcation.doublebin.diameterbranchorder.array.bifurcationprobability.bylength));
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.bifurcationprobability.bylength      = typeanalysis.bifurcation.doublebin.diameterbranchorder.array.bifurcationprobability.bylength(~isnan(typeanalysis.bifurcation.doublebin.diameterbranchorder.array.bifurcationprobability.bylength));
        
        %typeanalysis.bifurcation.doublebin.diameterbranchorder.array.bifurcationprobability.zunzunlength = [typeanalysis.bifurcation.doublebin.diameterbranchorder.array.bifurcationprobability.diameter typeanalysis.bifurcation.doublebin.diameterbranchorder.array.bifurcationprobability.branchorder typeanalysis.bifurcation.doublebin.diameterbranchorder.array.bifurcationprobability.bylength];
        %typeanalysis.bifurcation.doublebin.diameterbranchorder.array.bifurcationprobability.zunzunsurfacearea = [typeanalysis.bifurcation.doublebin.diameterbranchorder.array.bifurcationprobability.diameter typeanalysis.bifurcation.doublebin.diameterbranchorder.array.bifurcationprobability.branchorder typeanalysis.bifurcation.doublebin.diameterbranchorder.array.bifurcationprobability.bysurfacearea];
        %typeanalysis.bifurcation.doublebin.diameterbranchorder.array.bifurcationprobability.zunzunvolume = [typeanalysis.bifurcation.doublebin.diameterbranchorder.array.bifurcationprobability.diameter typeanalysis.bifurcation.doublebin.diameterbranchorder.array.bifurcationprobability.branchorder typeanalysis.bifurcation.doublebin.diameterbranchorder.array.bifurcationprobability.byvolume];
        
        
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.terminationprobability.bylength      = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.terminationprobability.bylength,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.terminationprobability.bylength),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.terminationprobability.bysurfacearea = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.terminationprobability.bysurfacearea,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.terminationprobability.bysurfacearea),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.terminationprobability.byvolume      = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.terminationprobability.byvolume,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.terminationprobability.byvolume),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.terminationprobability.diameter    = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.diameter,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.diameter),1);
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.terminationprobability.branchorder  = reshape(typeanalysis.bifurcation.doublebin.diameterbranchorder.branchorder,numel(typeanalysis.bifurcation.doublebin.diameterbranchorder.branchorder),1);
        
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.terminationprobability.branchorder  = typeanalysis.bifurcation.doublebin.diameterbranchorder.array.terminationprobability.branchorder(~isnan(typeanalysis.bifurcation.doublebin.diameterbranchorder.array.terminationprobability.bylength));
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.terminationprobability.diameter    = typeanalysis.bifurcation.doublebin.diameterbranchorder.array.terminationprobability.diameter(~isnan(typeanalysis.bifurcation.doublebin.diameterbranchorder.array.terminationprobability.bylength));
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.terminationprobability.byvolume      = typeanalysis.bifurcation.doublebin.diameterbranchorder.array.terminationprobability.byvolume(~isnan(typeanalysis.bifurcation.doublebin.diameterbranchorder.array.terminationprobability.bylength));
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.terminationprobability.bysurfacearea = typeanalysis.bifurcation.doublebin.diameterbranchorder.array.terminationprobability.bysurfacearea(~isnan(typeanalysis.bifurcation.doublebin.diameterbranchorder.array.terminationprobability.bylength));
        typeanalysis.bifurcation.doublebin.diameterbranchorder.array.terminationprobability.bylength      = typeanalysis.bifurcation.doublebin.diameterbranchorder.array.terminationprobability.bylength(~isnan(typeanalysis.bifurcation.doublebin.diameterbranchorder.array.terminationprobability.bylength));
        
        %typeanalysis.bifurcation.doublebin.diameterbranchorder.array.terminationprobability.zunzunlength = [typeanalysis.bifurcation.doublebin.diameterbranchorder.array.terminationprobability.diameter typeanalysis.bifurcation.doublebin.diameterbranchorder.array.terminationprobability.branchorder typeanalysis.bifurcation.doublebin.diameterbranchorder.array.terminationprobability.bylength];
        %typeanalysis.bifurcation.doublebin.diameterbranchorder.array.terminationprobability.zunzunsurfacearea = [typeanalysis.bifurcation.doublebin.diameterbranchorder.array.terminationprobability.diameter typeanalysis.bifurcation.doublebin.diameterbranchorder.array.terminationprobability.branchorder typeanalysis.bifurcation.doublebin.diameterbranchorder.array.terminationprobability.bysurfacearea];
        %typeanalysis.bifurcation.doublebin.diameterbranchorder.array.terminationprobability.zunzunvolume = [typeanalysis.bifurcation.doublebin.diameterbranchorder.array.terminationprobability.diameter typeanalysis.bifurcation.doublebin.diameterbranchorder.array.terminationprobability.branchorder typeanalysis.bifurcation.doublebin.diameterbranchorder.array.terminationprobability.byvolume];
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        % Begin termination double bin analysis
        
        for i = 1:maxdiameterbin
            for j = 1:maxbranchorderbin
                popdata.termination.doublebins.diameterbins(i).branchorderbins(j).rallratio.values            = [];
                popdata.termination.doublebins.diameterbins(i).branchorderbins(j).rallratio1.values           = [];
                popdata.termination.doublebins.diameterbins(i).branchorderbins(j).rallratio2.values           = [];
                popdata.termination.doublebins.diameterbins(i).branchorderbins(j).rallratio3.values           = [];
                popdata.termination.doublebins.diameterbins(i).branchorderbins(j).daughterratio.values        = [];
                popdata.termination.doublebins.diameterbins(i).branchorderbins(j).parentdaughterratio.values  = [];
                popdata.termination.doublebins.diameterbins(i).branchorderbins(j).parentdaughter2ratio.values = [];
                popdata.termination.doublebins.diameterbins(i).branchorderbins(j).meandiameter.values         = [];
                popdata.termination.doublebins.diameterbins(i).branchorderbins(j).taperrate.values            = [];
                popdata.termination.doublebins.diameterbins(i).branchorderbins(j).piecelength.values          = [];
            end
        end
        
        
        for i = 1:length(data.individual)
            
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            
            for j = 1:length(inddata.termination.doublebins.diameterbins)
                
                for k = 1:length(inddata.termination.doublebins.diameterbins(j).branchorderbins)
                    
                    inddata.termination.doublebins.diameterbins(j).branchorderbins(k).length                      = 0;
                    inddata.termination.doublebins.diameterbins(j).branchorderbins(k).surfacearea                 = 0;
                    inddata.termination.doublebins.diameterbins(j).branchorderbins(k).volume                      = 0;
                    inddata.termination.doublebins.diameterbins(j).branchorderbins(k).numbersegments              = 0;
                    inddata.termination.doublebins.diameterbins(j).branchorderbins(k).numberbifurcations          = 0;
                    inddata.termination.doublebins.diameterbins(j).branchorderbins(k).numberterminations          = 0;
                    inddata.termination.doublebins.diameterbins(j).branchorderbins(k).rallratio.values            = [];
                    inddata.termination.doublebins.diameterbins(j).branchorderbins(k).rallratio1.values           = [];
                    inddata.termination.doublebins.diameterbins(j).branchorderbins(k).rallratio2.values           = [];
                    inddata.termination.doublebins.diameterbins(j).branchorderbins(k).rallratio3.values           = [];
                    inddata.termination.doublebins.diameterbins(j).branchorderbins(k).daughterratio.values        = [];
                    inddata.termination.doublebins.diameterbins(j).branchorderbins(k).parentdaughterratio.values  = [];
                    inddata.termination.doublebins.diameterbins(j).branchorderbins(k).parentdaughter2ratio.values = [];
                    inddata.termination.doublebins.diameterbins(j).branchorderbins(k).meandiameter.values         = [];
                    inddata.termination.doublebins.diameterbins(j).branchorderbins(k).taperrate.values            = [];
                    inddata.termination.doublebins.diameterbins(j).branchorderbins(k).piecelength.values          = [];
                    
                    
                    if isfield(inddata.termination.doublebins.diameterbins(j).branchorderbins(k),'piece') == 1 && isfield(inddata.termination.doublebins.diameterbins(j).branchorderbins(k).piece,'id')
                        
                        inddata.termination.doublebins.diameterbins(j).branchorderbins(k).length                      = sum([inddata.termination.doublebins.diameterbins(j).branchorderbins(k).piece.length]);
                        inddata.termination.doublebins.diameterbins(j).branchorderbins(k).surfacearea                 = sum([inddata.termination.doublebins.diameterbins(j).branchorderbins(k).piece.surfacearea]);
                        inddata.termination.doublebins.diameterbins(j).branchorderbins(k).volume                      = sum([inddata.termination.doublebins.diameterbins(j).branchorderbins(k).piece.volume]);
                        inddata.termination.doublebins.diameterbins(j).branchorderbins(k).numbersegments              = length(unique([inddata.termination.doublebins.diameterbins(j).branchorderbins(k).piece.cable]));
                        inddata.termination.doublebins.diameterbins(j).branchorderbins(k).numberbifurcations          = 0;
                        inddata.termination.doublebins.diameterbins(j).branchorderbins(k).numberterminations          = 0;
                        inddata.termination.doublebins.diameterbins(j).branchorderbins(k).rallratio.values            = [inddata.termination.doublebins.diameterbins(j).branchorderbins(k).piece.rallratio];
                        inddata.termination.doublebins.diameterbins(j).branchorderbins(k).rallratio1.values           = [inddata.termination.doublebins.diameterbins(j).branchorderbins(k).piece.rallratio1];
                        inddata.termination.doublebins.diameterbins(j).branchorderbins(k).rallratio2.values           = [inddata.termination.doublebins.diameterbins(j).branchorderbins(k).piece.rallratio2];
                        inddata.termination.doublebins.diameterbins(j).branchorderbins(k).rallratio3.values           = [inddata.termination.doublebins.diameterbins(j).branchorderbins(k).piece.rallratio3];
                        inddata.termination.doublebins.diameterbins(j).branchorderbins(k).daughterratio.values        = [inddata.termination.doublebins.diameterbins(j).branchorderbins(k).piece.daughterratio];
                        inddata.termination.doublebins.diameterbins(j).branchorderbins(k).parentdaughterratio.values  = [inddata.termination.doublebins.diameterbins(j).branchorderbins(k).piece.parentdaughterratio];
                        inddata.termination.doublebins.diameterbins(j).branchorderbins(k).parentdaughter2ratio.values = [inddata.termination.doublebins.diameterbins(j).branchorderbins(k).piece.parentdaughter2ratio];
                        inddata.termination.doublebins.diameterbins(j).branchorderbins(k).meandiameter.values         = ([inddata.termination.doublebins.diameterbins(j).branchorderbins(k).piece.proximaldiameter]+[inddata.termination.doublebins.diameterbins(j).branchorderbins(k).piece.distaldiameter])/2;
                        inddata.termination.doublebins.diameterbins(j).branchorderbins(k).taperrate.values            = [inddata.termination.doublebins.diameterbins(j).branchorderbins(k).piece.taperrate];
                        inddata.termination.doublebins.diameterbins(j).branchorderbins(k).piecelength.values          = [inddata.termination.doublebins.diameterbins(j).branchorderbins(k).piece.length];
                        
                        for m = 1:length(inddata.termination.doublebins.diameterbins(j).branchorderbins(k).piece)
                            if strcmp(inddata.termination.doublebins.diameterbins(j).branchorderbins(k).piece(m).distaltype,'bifurcation')==1
                                inddata.termination.doublebins.diameterbins(j).branchorderbins(k).numberbifurcations = 1 + inddata.termination.doublebins.diameterbins(j).branchorderbins(k).numberbifurcations;
                            end
                            if strcmp(inddata.termination.doublebins.diameterbins(j).branchorderbins(k).piece(m).distaltype,'m-furcation')==1
                                inddata.termination.doublebins.diameterbins(j).branchorderbins(k).numberbifurcations = length(inddata.termination.doublebins.diameterbins(j).branchorderbins(k).piece(m).daughters) - 1 + inddata.termination.doublebins.diameterbins(j).branchorderbins(k).numberbifurcations;
                            end
                            if strcmp(inddata.termination.doublebins.diameterbins(j).branchorderbins(k).piece(m).distaltype,'termination')==1
                                inddata.termination.doublebins.diameterbins(j).branchorderbins(k).numberterminations = 1 + inddata.termination.doublebins.diameterbins(j).branchorderbins(k).numberterminations;
                            end
                        end
                    end
                    
                    if isfield(popdata.termination.doublebins,'diameterbins') == 0; nextvalue = 1;
                    elseif j > length(popdata.termination.doublebins.diameterbins); nextvalue = 1;
                    elseif isfield(popdata.termination.doublebins.diameterbins(j).branchorderbins(k),'length') == 0; nextvalue = 1;
                    elseif isfield(popdata.termination.doublebins.diameterbins(j).branchorderbins(k).length,'values') == 0; nextvalue = 1;
                    else nextvalue = 1 + length(popdata.termination.doublebins.diameterbins(j).branchorderbins(k).length.values);
                    end
                    popdata.termination.doublebins.diameterbins(j).branchorderbins(k).length.values(nextvalue)             = inddata.termination.doublebins.diameterbins(j).branchorderbins(k).length;
                    popdata.termination.doublebins.diameterbins(j).branchorderbins(k).surfacearea.values(nextvalue)        = inddata.termination.doublebins.diameterbins(j).branchorderbins(k).surfacearea;
                    popdata.termination.doublebins.diameterbins(j).branchorderbins(k).volume.values(nextvalue)             = inddata.termination.doublebins.diameterbins(j).branchorderbins(k).volume;
                    popdata.termination.doublebins.diameterbins(j).branchorderbins(k).numbersegments.values(nextvalue)     = inddata.termination.doublebins.diameterbins(j).branchorderbins(k).numbersegments;
                    popdata.termination.doublebins.diameterbins(j).branchorderbins(k).numberbifurcations.values(nextvalue) = inddata.termination.doublebins.diameterbins(j).branchorderbins(k).numberbifurcations;
                    popdata.termination.doublebins.diameterbins(j).branchorderbins(k).numberterminations.values(nextvalue) = inddata.termination.doublebins.diameterbins(j).branchorderbins(k).numberterminations;
                    popdata.termination.doublebins.diameterbins(j).branchorderbins(k).rallratio.values                     = [ [popdata.termination.doublebins.diameterbins(j).branchorderbins(k).rallratio.values] [inddata.termination.doublebins.diameterbins(j).branchorderbins(k).rallratio.values] ];
                    popdata.termination.doublebins.diameterbins(j).branchorderbins(k).rallratio1.values                    = [ [popdata.termination.doublebins.diameterbins(j).branchorderbins(k).rallratio1.values] [inddata.termination.doublebins.diameterbins(j).branchorderbins(k).rallratio1.values] ];
                    popdata.termination.doublebins.diameterbins(j).branchorderbins(k).rallratio2.values                    = [ [popdata.termination.doublebins.diameterbins(j).branchorderbins(k).rallratio2.values] [inddata.termination.doublebins.diameterbins(j).branchorderbins(k).rallratio2.values] ];
                    popdata.termination.doublebins.diameterbins(j).branchorderbins(k).rallratio3.values                    = [ [popdata.termination.doublebins.diameterbins(j).branchorderbins(k).rallratio3.values] [inddata.termination.doublebins.diameterbins(j).branchorderbins(k).rallratio3.values] ];
                    popdata.termination.doublebins.diameterbins(j).branchorderbins(k).daughterratio.values                 = [ [popdata.termination.doublebins.diameterbins(j).branchorderbins(k).daughterratio.values] [inddata.termination.doublebins.diameterbins(j).branchorderbins(k).daughterratio.values] ];
                    popdata.termination.doublebins.diameterbins(j).branchorderbins(k).parentdaughterratio.values           = [ [popdata.termination.doublebins.diameterbins(j).branchorderbins(k).parentdaughterratio.values] [inddata.termination.doublebins.diameterbins(j).branchorderbins(k).parentdaughterratio.values] ];
                    popdata.termination.doublebins.diameterbins(j).branchorderbins(k).parentdaughter2ratio.values          = [ [popdata.termination.doublebins.diameterbins(j).branchorderbins(k).parentdaughter2ratio.values] [inddata.termination.doublebins.diameterbins(j).branchorderbins(k).parentdaughter2ratio.values] ];
                    popdata.termination.doublebins.diameterbins(j).branchorderbins(k).meandiameter.values                  = [ [popdata.termination.doublebins.diameterbins(j).branchorderbins(k).meandiameter.values] [inddata.termination.doublebins.diameterbins(j).branchorderbins(k).meandiameter.values] ];
                    popdata.termination.doublebins.diameterbins(j).branchorderbins(k).taperrate.values                     = [ [popdata.termination.doublebins.diameterbins(j).branchorderbins(k).taperrate.values] [inddata.termination.doublebins.diameterbins(j).branchorderbins(k).taperrate.values] ];
                    popdata.termination.doublebins.diameterbins(j).branchorderbins(k).piecelength.values                   = [ [popdata.termination.doublebins.diameterbins(j).branchorderbins(k).piecelength.values] [inddata.termination.doublebins.diameterbins(j).branchorderbins(k).piecelength.values] ];
                    clear nextvalue;
                    
                end
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        
        for i = 1:length(popdata.termination.doublebins.diameterbins)
            
            for j = 1:length(popdata.termination.doublebins.diameterbins(i).branchorderbins)
                
                typeanalysis.termination.doublebin.diameterbranchorder.diameter(i,j)   = popdata.diameterbinmiddles(i);
                typeanalysis.termination.doublebin.diameterbranchorder.branchorder(i,j) = j;
                
                if isfield(popdata.termination.doublebins.diameterbins(i).branchorderbins(j).length,'values') == 1
                    
                    typeanalysis.termination.doublebin.diameterbranchorder.length(i,j)      = sum([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).length.values]);
                    typeanalysis.termination.doublebin.diameterbranchorder.surfacearea(i,j) = sum([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).surfacearea.values]);
                    typeanalysis.termination.doublebin.diameterbranchorder.volume(i,j)      = sum([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).volume.values]);
                    
                    typeanalysis.termination.doublebin.diameterbranchorder.numbersegments(i,j)     = sum([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).numbersegments.values]);
                    typeanalysis.termination.doublebin.diameterbranchorder.numberbifurcations(i,j) = sum([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).numberbifurcations.values]);
                    typeanalysis.termination.doublebin.diameterbranchorder.numberterminations(i,j) = sum([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).numberterminations.values]);
                    
                    typeanalysis.termination.doublebin.diameterbranchorder.rallratio.mean(i,j) = mean([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).rallratio.values]);
                    typeanalysis.termination.doublebin.diameterbranchorder.rallratio.std(i,j)  = std([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).rallratio.values]);
                    typeanalysis.termination.doublebin.diameterbranchorder.rallratio.skew(i,j) = skewness([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).rallratio.values],0);
                    typeanalysis.termination.doublebin.diameterbranchorder.rallratio.kurt(i,j) = kurtosis([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).rallratio.values],0);
                    
                    typeanalysis.termination.doublebin.diameterbranchorder.rallratio1.mean(i,j) = mean([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).rallratio1.values]);
                    typeanalysis.termination.doublebin.diameterbranchorder.rallratio1.std(i,j)  = std([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).rallratio1.values]);
                    typeanalysis.termination.doublebin.diameterbranchorder.rallratio1.skew(i,j) = skewness([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).rallratio1.values],0);
                    typeanalysis.termination.doublebin.diameterbranchorder.rallratio1.kurt(i,j) = kurtosis([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).rallratio1.values],0);
                    
                    typeanalysis.termination.doublebin.diameterbranchorder.rallratio2.mean(i,j) = mean([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).rallratio2.values]);
                    typeanalysis.termination.doublebin.diameterbranchorder.rallratio2.std(i,j)  = std([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).rallratio2.values]);
                    typeanalysis.termination.doublebin.diameterbranchorder.rallratio2.skew(i,j) = skewness([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).rallratio2.values],0);
                    typeanalysis.termination.doublebin.diameterbranchorder.rallratio2.kurt(i,j) = kurtosis([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).rallratio2.values],0);
                    
                    typeanalysis.termination.doublebin.diameterbranchorder.rallratio3.mean(i,j) = mean([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).rallratio3.values]);
                    typeanalysis.termination.doublebin.diameterbranchorder.rallratio3.std(i,j)  = std([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).rallratio3.values]);
                    typeanalysis.termination.doublebin.diameterbranchorder.rallratio3.skew(i,j) = skewness([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).rallratio3.values],0);
                    typeanalysis.termination.doublebin.diameterbranchorder.rallratio3.kurt(i,j) = kurtosis([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).rallratio3.values],0);
                    
                    typeanalysis.termination.doublebin.diameterbranchorder.daughterratio.mean(i,j) = mean([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).daughterratio.values]);
                    typeanalysis.termination.doublebin.diameterbranchorder.daughterratio.std(i,j)  = std([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).daughterratio.values]);
                    typeanalysis.termination.doublebin.diameterbranchorder.daughterratio.skew(i,j) = skewness([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).daughterratio.values],0);
                    typeanalysis.termination.doublebin.diameterbranchorder.daughterratio.kurt(i,j) = kurtosis([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).daughterratio.values],0);
                    
                    typeanalysis.termination.doublebin.diameterbranchorder.parentdaughterratio.mean(i,j) = mean([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).parentdaughterratio.values]);
                    typeanalysis.termination.doublebin.diameterbranchorder.parentdaughterratio.std(i,j)  = std([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).parentdaughterratio.values]);
                    typeanalysis.termination.doublebin.diameterbranchorder.parentdaughterratio.skew(i,j) = skewness([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).parentdaughterratio.values],0);
                    typeanalysis.termination.doublebin.diameterbranchorder.parentdaughterratio.kurt(i,j) = kurtosis([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).parentdaughterratio.values],0);
                    
                    typeanalysis.termination.doublebin.diameterbranchorder.parentdaughter2ratio.mean(i,j) = mean([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).parentdaughter2ratio.values]);
                    typeanalysis.termination.doublebin.diameterbranchorder.parentdaughter2ratio.std(i,j)  = std([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).parentdaughter2ratio.values]);
                    typeanalysis.termination.doublebin.diameterbranchorder.parentdaughter2ratio.skew(i,j) = skewness([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).parentdaughter2ratio.values],0);
                    typeanalysis.termination.doublebin.diameterbranchorder.parentdaughter2ratio.kurt(i,j) = kurtosis([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).parentdaughter2ratio.values],0);
                    
                    typeanalysis.termination.doublebin.diameterbranchorder.taperrate.mean(i,j) = sum([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).taperrate.values].*[popdata.termination.doublebins.diameterbins(i).branchorderbins(j).piecelength.values])/sum([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).piecelength.values]);
                    typeanalysis.termination.doublebin.diameterbranchorder.taperrate.std(i,j)  = std([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).taperrate.values]);
                    typeanalysis.termination.doublebin.diameterbranchorder.taperrate.skew(i,j) = skewness([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).taperrate.values],0);
                    typeanalysis.termination.doublebin.diameterbranchorder.taperrate.kurt(i,j) = kurtosis([popdata.termination.doublebins.diameterbins(i).branchorderbins(j).taperrate.values],0);
                    
                    
                    typeanalysis.termination.doublebin.diameterbranchorder.bifurcationprobability.bylength(i,j) = typeanalysis.termination.doublebin.diameterbranchorder.numberbifurcations(i,j) / typeanalysis.termination.doublebin.diameterbranchorder.length(i,j);
                    typeanalysis.termination.doublebin.diameterbranchorder.terminationprobability.bylength(i,j) = typeanalysis.termination.doublebin.diameterbranchorder.numberterminations(i,j) / typeanalysis.termination.doublebin.diameterbranchorder.length(i,j);
                    
                    typeanalysis.termination.doublebin.diameterbranchorder.bifurcationprobability.bysurfacearea(i,j) = typeanalysis.termination.doublebin.diameterbranchorder.numberbifurcations(i,j) / typeanalysis.termination.doublebin.diameterbranchorder.surfacearea(i,j);
                    typeanalysis.termination.doublebin.diameterbranchorder.terminationprobability.bysurfacearea(i,j) = typeanalysis.termination.doublebin.diameterbranchorder.numberterminations(i,j) / typeanalysis.termination.doublebin.diameterbranchorder.surfacearea(i,j);
                    
                    typeanalysis.termination.doublebin.diameterbranchorder.bifurcationprobability.byvolume(i,j) = typeanalysis.termination.doublebin.diameterbranchorder.numberbifurcations(i,j) / typeanalysis.termination.doublebin.diameterbranchorder.volume(i,j);
                    typeanalysis.termination.doublebin.diameterbranchorder.terminationprobability.byvolume(i,j) = typeanalysis.termination.doublebin.diameterbranchorder.numberterminations(i,j) / typeanalysis.termination.doublebin.diameterbranchorder.volume(i,j);
                    
                end
            end
        end
        
        typeanalysis.termination.doublebin.diameterbranchorder.array.diameter      = reshape(typeanalysis.termination.doublebin.diameterbranchorder.diameter,numel(typeanalysis.termination.doublebin.diameterbranchorder.diameter),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.branchorder    = reshape(typeanalysis.termination.doublebin.diameterbranchorder.branchorder,numel(typeanalysis.termination.doublebin.diameterbranchorder.branchorder),1);
        
        typeanalysis.termination.doublebin.diameterbranchorder.array.length      = reshape(typeanalysis.termination.doublebin.diameterbranchorder.length,numel(typeanalysis.termination.doublebin.diameterbranchorder.length),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.surfacearea = reshape(typeanalysis.termination.doublebin.diameterbranchorder.surfacearea,numel(typeanalysis.termination.doublebin.diameterbranchorder.surfacearea),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.volume      = reshape(typeanalysis.termination.doublebin.diameterbranchorder.volume,numel(typeanalysis.termination.doublebin.diameterbranchorder.volume),1);
        
        typeanalysis.termination.doublebin.diameterbranchorder.array.numbersegments     = reshape(typeanalysis.termination.doublebin.diameterbranchorder.numbersegments,numel(typeanalysis.termination.doublebin.diameterbranchorder.numbersegments),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.numberbifurcations = reshape(typeanalysis.termination.doublebin.diameterbranchorder.numberbifurcations,numel(typeanalysis.termination.doublebin.diameterbranchorder.numberbifurcations),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.numberterminations = reshape(typeanalysis.termination.doublebin.diameterbranchorder.numberterminations,numel(typeanalysis.termination.doublebin.diameterbranchorder.numberterminations),1);
        
        typeanalysis.termination.doublebin.diameterbranchorder.array.rallratio.mean = reshape(typeanalysis.termination.doublebin.diameterbranchorder.rallratio.mean,numel(typeanalysis.termination.doublebin.diameterbranchorder.rallratio.mean),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.rallratio.std  = reshape(typeanalysis.termination.doublebin.diameterbranchorder.rallratio.std,numel(typeanalysis.termination.doublebin.diameterbranchorder.rallratio.std),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.rallratio.skew = reshape(typeanalysis.termination.doublebin.diameterbranchorder.rallratio.skew,numel(typeanalysis.termination.doublebin.diameterbranchorder.rallratio.skew),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.rallratio.kurt = reshape(typeanalysis.termination.doublebin.diameterbranchorder.rallratio.kurt,numel(typeanalysis.termination.doublebin.diameterbranchorder.rallratio.kurt),1);
        
        typeanalysis.termination.doublebin.diameterbranchorder.array.rallratio1.mean = reshape(typeanalysis.termination.doublebin.diameterbranchorder.rallratio1.mean,numel(typeanalysis.termination.doublebin.diameterbranchorder.rallratio1.mean),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.rallratio1.std  = reshape(typeanalysis.termination.doublebin.diameterbranchorder.rallratio1.std,numel(typeanalysis.termination.doublebin.diameterbranchorder.rallratio1.std),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.rallratio1.skew = reshape(typeanalysis.termination.doublebin.diameterbranchorder.rallratio1.skew,numel(typeanalysis.termination.doublebin.diameterbranchorder.rallratio1.skew),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.rallratio1.kurt = reshape(typeanalysis.termination.doublebin.diameterbranchorder.rallratio1.kurt,numel(typeanalysis.termination.doublebin.diameterbranchorder.rallratio1.kurt),1);
        
        typeanalysis.termination.doublebin.diameterbranchorder.array.rallratio2.mean = reshape(typeanalysis.termination.doublebin.diameterbranchorder.rallratio2.mean,numel(typeanalysis.termination.doublebin.diameterbranchorder.rallratio2.mean),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.rallratio2.std  = reshape(typeanalysis.termination.doublebin.diameterbranchorder.rallratio2.std,numel(typeanalysis.termination.doublebin.diameterbranchorder.rallratio2.std),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.rallratio2.skew = reshape(typeanalysis.termination.doublebin.diameterbranchorder.rallratio2.skew,numel(typeanalysis.termination.doublebin.diameterbranchorder.rallratio2.skew),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.rallratio2.kurt = reshape(typeanalysis.termination.doublebin.diameterbranchorder.rallratio2.kurt,numel(typeanalysis.termination.doublebin.diameterbranchorder.rallratio2.kurt),1);
        
        typeanalysis.termination.doublebin.diameterbranchorder.array.rallratio3.mean = reshape(typeanalysis.termination.doublebin.diameterbranchorder.rallratio3.mean,numel(typeanalysis.termination.doublebin.diameterbranchorder.rallratio3.mean),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.rallratio3.std  = reshape(typeanalysis.termination.doublebin.diameterbranchorder.rallratio3.std,numel(typeanalysis.termination.doublebin.diameterbranchorder.rallratio3.std),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.rallratio3.skew = reshape(typeanalysis.termination.doublebin.diameterbranchorder.rallratio3.skew,numel(typeanalysis.termination.doublebin.diameterbranchorder.rallratio3.skew),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.rallratio3.kurt = reshape(typeanalysis.termination.doublebin.diameterbranchorder.rallratio3.kurt,numel(typeanalysis.termination.doublebin.diameterbranchorder.rallratio3.kurt),1);
        
        typeanalysis.termination.doublebin.diameterbranchorder.array.daughterratio.mean = reshape(typeanalysis.termination.doublebin.diameterbranchorder.daughterratio.mean,numel(typeanalysis.termination.doublebin.diameterbranchorder.daughterratio.mean),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.daughterratio.std  = reshape(typeanalysis.termination.doublebin.diameterbranchorder.daughterratio.std,numel(typeanalysis.termination.doublebin.diameterbranchorder.daughterratio.std),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.daughterratio.skew = reshape(typeanalysis.termination.doublebin.diameterbranchorder.daughterratio.skew,numel(typeanalysis.termination.doublebin.diameterbranchorder.daughterratio.skew),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.daughterratio.kurt = reshape(typeanalysis.termination.doublebin.diameterbranchorder.daughterratio.kurt,numel(typeanalysis.termination.doublebin.diameterbranchorder.daughterratio.kurt),1);
        
        typeanalysis.termination.doublebin.diameterbranchorder.array.parentdaughterratio.mean = reshape(typeanalysis.termination.doublebin.diameterbranchorder.parentdaughterratio.mean,numel(typeanalysis.termination.doublebin.diameterbranchorder.parentdaughterratio.mean),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.parentdaughterratio.std  = reshape(typeanalysis.termination.doublebin.diameterbranchorder.parentdaughterratio.std,numel(typeanalysis.termination.doublebin.diameterbranchorder.parentdaughterratio.std),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.parentdaughterratio.skew = reshape(typeanalysis.termination.doublebin.diameterbranchorder.parentdaughterratio.skew,numel(typeanalysis.termination.doublebin.diameterbranchorder.parentdaughterratio.skew),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.parentdaughterratio.kurt = reshape(typeanalysis.termination.doublebin.diameterbranchorder.parentdaughterratio.kurt,numel(typeanalysis.termination.doublebin.diameterbranchorder.parentdaughterratio.kurt),1);
        
        typeanalysis.termination.doublebin.diameterbranchorder.array.parentdaughter2ratio.mean = reshape(typeanalysis.termination.doublebin.diameterbranchorder.parentdaughter2ratio.mean,numel(typeanalysis.termination.doublebin.diameterbranchorder.parentdaughter2ratio.mean),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.parentdaughter2ratio.std  = reshape(typeanalysis.termination.doublebin.diameterbranchorder.parentdaughter2ratio.std,numel(typeanalysis.termination.doublebin.diameterbranchorder.parentdaughter2ratio.std),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.parentdaughter2ratio.skew = reshape(typeanalysis.termination.doublebin.diameterbranchorder.parentdaughter2ratio.skew,numel(typeanalysis.termination.doublebin.diameterbranchorder.parentdaughter2ratio.skew),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.parentdaughter2ratio.kurt = reshape(typeanalysis.termination.doublebin.diameterbranchorder.parentdaughter2ratio.kurt,numel(typeanalysis.termination.doublebin.diameterbranchorder.parentdaughter2ratio.kurt),1);
        
        typeanalysis.termination.doublebin.diameterbranchorder.array.taperrate.mean = reshape(typeanalysis.termination.doublebin.diameterbranchorder.taperrate.mean,numel(typeanalysis.termination.doublebin.diameterbranchorder.taperrate.mean),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.taperrate.std  = reshape(typeanalysis.termination.doublebin.diameterbranchorder.taperrate.std,numel(typeanalysis.termination.doublebin.diameterbranchorder.taperrate.std),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.taperrate.skew = reshape(typeanalysis.termination.doublebin.diameterbranchorder.taperrate.skew,numel(typeanalysis.termination.doublebin.diameterbranchorder.taperrate.skew),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.taperrate.kurt = reshape(typeanalysis.termination.doublebin.diameterbranchorder.taperrate.kurt,numel(typeanalysis.termination.doublebin.diameterbranchorder.taperrate.kurt),1);
        
        
        typeanalysis.termination.doublebin.diameterbranchorder.array.bifurcationprobability.bylength      = reshape(typeanalysis.termination.doublebin.diameterbranchorder.bifurcationprobability.bylength,numel(typeanalysis.termination.doublebin.diameterbranchorder.bifurcationprobability.bylength),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.bifurcationprobability.bysurfacearea = reshape(typeanalysis.termination.doublebin.diameterbranchorder.bifurcationprobability.bysurfacearea,numel(typeanalysis.termination.doublebin.diameterbranchorder.bifurcationprobability.bysurfacearea),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.bifurcationprobability.byvolume      = reshape(typeanalysis.termination.doublebin.diameterbranchorder.bifurcationprobability.byvolume,numel(typeanalysis.termination.doublebin.diameterbranchorder.bifurcationprobability.byvolume),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.bifurcationprobability.diameter    = reshape(typeanalysis.termination.doublebin.diameterbranchorder.diameter,numel(typeanalysis.termination.doublebin.diameterbranchorder.diameter),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.bifurcationprobability.branchorder  = reshape(typeanalysis.termination.doublebin.diameterbranchorder.branchorder,numel(typeanalysis.termination.doublebin.diameterbranchorder.branchorder),1);
        
        typeanalysis.termination.doublebin.diameterbranchorder.array.bifurcationprobability.branchorder  = typeanalysis.termination.doublebin.diameterbranchorder.array.bifurcationprobability.branchorder(~isnan(typeanalysis.termination.doublebin.diameterbranchorder.array.bifurcationprobability.bylength));
        typeanalysis.termination.doublebin.diameterbranchorder.array.bifurcationprobability.diameter    = typeanalysis.termination.doublebin.diameterbranchorder.array.bifurcationprobability.diameter(~isnan(typeanalysis.termination.doublebin.diameterbranchorder.array.bifurcationprobability.bylength));
        typeanalysis.termination.doublebin.diameterbranchorder.array.bifurcationprobability.byvolume      = typeanalysis.termination.doublebin.diameterbranchorder.array.bifurcationprobability.byvolume(~isnan(typeanalysis.termination.doublebin.diameterbranchorder.array.bifurcationprobability.bylength));
        typeanalysis.termination.doublebin.diameterbranchorder.array.bifurcationprobability.bysurfacearea = typeanalysis.termination.doublebin.diameterbranchorder.array.bifurcationprobability.bysurfacearea(~isnan(typeanalysis.termination.doublebin.diameterbranchorder.array.bifurcationprobability.bylength));
        typeanalysis.termination.doublebin.diameterbranchorder.array.bifurcationprobability.bylength      = typeanalysis.termination.doublebin.diameterbranchorder.array.bifurcationprobability.bylength(~isnan(typeanalysis.termination.doublebin.diameterbranchorder.array.bifurcationprobability.bylength));
        
        %typeanalysis.termination.doublebin.diameterbranchorder.array.bifurcationprobability.zunzunlength = [typeanalysis.termination.doublebin.diameterbranchorder.array.bifurcationprobability.diameter typeanalysis.termination.doublebin.diameterbranchorder.array.bifurcationprobability.branchorder typeanalysis.termination.doublebin.diameterbranchorder.array.bifurcationprobability.bylength];
        %typeanalysis.termination.doublebin.diameterbranchorder.array.bifurcationprobability.zunzunsurfacearea = [typeanalysis.termination.doublebin.diameterbranchorder.array.bifurcationprobability.diameter typeanalysis.termination.doublebin.diameterbranchorder.array.bifurcationprobability.branchorder typeanalysis.termination.doublebin.diameterbranchorder.array.bifurcationprobability.bysurfacearea];
        %typeanalysis.termination.doublebin.diameterbranchorder.array.bifurcationprobability.zunzunvolume = [typeanalysis.termination.doublebin.diameterbranchorder.array.bifurcationprobability.diameter typeanalysis.termination.doublebin.diameterbranchorder.array.bifurcationprobability.branchorder typeanalysis.termination.doublebin.diameterbranchorder.array.bifurcationprobability.byvolume];
        
        
        typeanalysis.termination.doublebin.diameterbranchorder.array.terminationprobability.bylength      = reshape(typeanalysis.termination.doublebin.diameterbranchorder.terminationprobability.bylength,numel(typeanalysis.termination.doublebin.diameterbranchorder.terminationprobability.bylength),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.terminationprobability.bysurfacearea = reshape(typeanalysis.termination.doublebin.diameterbranchorder.terminationprobability.bysurfacearea,numel(typeanalysis.termination.doublebin.diameterbranchorder.terminationprobability.bysurfacearea),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.terminationprobability.byvolume      = reshape(typeanalysis.termination.doublebin.diameterbranchorder.terminationprobability.byvolume,numel(typeanalysis.termination.doublebin.diameterbranchorder.terminationprobability.byvolume),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.terminationprobability.diameter    = reshape(typeanalysis.termination.doublebin.diameterbranchorder.diameter,numel(typeanalysis.termination.doublebin.diameterbranchorder.diameter),1);
        typeanalysis.termination.doublebin.diameterbranchorder.array.terminationprobability.branchorder  = reshape(typeanalysis.termination.doublebin.diameterbranchorder.branchorder,numel(typeanalysis.termination.doublebin.diameterbranchorder.branchorder),1);
        
        typeanalysis.termination.doublebin.diameterbranchorder.array.terminationprobability.branchorder  = typeanalysis.termination.doublebin.diameterbranchorder.array.terminationprobability.branchorder(~isnan(typeanalysis.termination.doublebin.diameterbranchorder.array.terminationprobability.bylength));
        typeanalysis.termination.doublebin.diameterbranchorder.array.terminationprobability.diameter    = typeanalysis.termination.doublebin.diameterbranchorder.array.terminationprobability.diameter(~isnan(typeanalysis.termination.doublebin.diameterbranchorder.array.terminationprobability.bylength));
        typeanalysis.termination.doublebin.diameterbranchorder.array.terminationprobability.byvolume      = typeanalysis.termination.doublebin.diameterbranchorder.array.terminationprobability.byvolume(~isnan(typeanalysis.termination.doublebin.diameterbranchorder.array.terminationprobability.bylength));
        typeanalysis.termination.doublebin.diameterbranchorder.array.terminationprobability.bysurfacearea = typeanalysis.termination.doublebin.diameterbranchorder.array.terminationprobability.bysurfacearea(~isnan(typeanalysis.termination.doublebin.diameterbranchorder.array.terminationprobability.bylength));
        typeanalysis.termination.doublebin.diameterbranchorder.array.terminationprobability.bylength      = typeanalysis.termination.doublebin.diameterbranchorder.array.terminationprobability.bylength(~isnan(typeanalysis.termination.doublebin.diameterbranchorder.array.terminationprobability.bylength));
        
        %typeanalysis.termination.doublebin.diameterbranchorder.array.terminationprobability.zunzunlength = [typeanalysis.termination.doublebin.diameterbranchorder.array.terminationprobability.diameter typeanalysis.termination.doublebin.diameterbranchorder.array.terminationprobability.branchorder typeanalysis.termination.doublebin.diameterbranchorder.array.terminationprobability.bylength];
        %typeanalysis.termination.doublebin.diameterbranchorder.array.terminationprobability.zunzunsurfacearea = [typeanalysis.termination.doublebin.diameterbranchorder.array.terminationprobability.diameter typeanalysis.termination.doublebin.diameterbranchorder.array.terminationprobability.branchorder typeanalysis.termination.doublebin.diameterbranchorder.array.terminationprobability.bysurfacearea];
        %typeanalysis.termination.doublebin.diameterbranchorder.array.terminationprobability.zunzunvolume = [typeanalysis.termination.doublebin.diameterbranchorder.array.terminationprobability.diameter typeanalysis.termination.doublebin.diameterbranchorder.array.terminationprobability.branchorder typeanalysis.termination.doublebin.diameterbranchorder.array.terminationprobability.byvolume];
        
        
        
        
        eval(['analysis.' currentpiecetype ' = typeanalysis;']);
        eval(['data.population.' currentpiecetype ' = popdata;']);
        
    end
end





warning('on', 'MATLAB:divideByZero');