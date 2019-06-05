function [data,analysis]   = doublebinanalyzer1(data,analysis)

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
        
        for ind = 1:length(data.individual)
            eval(['diameterbinlength(ind)   = length(data.individual(ind).' currentpiecetype '.doublebins.diameterbins);']);
            clear pathlengthdiameterbinlength;
            for dbin = 1:diameterbinlength(ind)
                   eval(['pathlengthdiameterbinlength(dbin) = length(data.individual(ind).' currentpiecetype '.doublebins.diameterbins(dbin).pathlengthbins);']);   
            end
            pathlengthbinlength(ind) = max(pathlengthdiameterbinlength); 
        end
        maxdiameterbin = max(diameterbinlength);
        maxpathlengthbin = max(pathlengthbinlength);
        
        %eval(['maxdiameterbin   = length(data.individual(1).' currentpiecetype '.doublebins.diameterbins);']);
        %eval(['maxpathlengthbin = length(data.individual(1).' currentpiecetype '.doublebins.diameterbins(1).pathlengthbins);']);
        eval(['distancebinwidth = option.' currentpiecetype '.distancebinwidth;']);        
        
        
        for i = 1:maxdiameterbin
            for j = 1:maxpathlengthbin
                popdata.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values            = [];
                popdata.doublebins.diameterbins(i).pathlengthbins(j).rallratio1.values           = [];
                popdata.doublebins.diameterbins(i).pathlengthbins(j).rallratio2.values           = [];
                popdata.doublebins.diameterbins(i).pathlengthbins(j).rallratio3.values           = [];
                popdata.doublebins.diameterbins(i).pathlengthbins(j).daughterratio.values        = [];
                popdata.doublebins.diameterbins(i).pathlengthbins(j).parentdaughterratio.values  = [];
                popdata.doublebins.diameterbins(i).pathlengthbins(j).parentdaughter2ratio.values = [];
                popdata.doublebins.diameterbins(i).pathlengthbins(j).meandiameter.values         = [];
                popdata.doublebins.diameterbins(i).pathlengthbins(j).taperrate.values            = [];
                popdata.doublebins.diameterbins(i).pathlengthbins(j).piecelength.values          = [];
            end
        end
        
        
        for i = 1:length(data.individual)
            
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            
            for j = 1:length(inddata.doublebins.diameterbins)
                
                for k = 1:length(inddata.doublebins.diameterbins(j).pathlengthbins)
                    
                    inddata.doublebins.diameterbins(j).pathlengthbins(k).length                      = 0;
                    inddata.doublebins.diameterbins(j).pathlengthbins(k).surfacearea                 = 0;
                    inddata.doublebins.diameterbins(j).pathlengthbins(k).volume                      = 0;
                    inddata.doublebins.diameterbins(j).pathlengthbins(k).numbersegments              = 0;
                    inddata.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations          = 0;
                    inddata.doublebins.diameterbins(j).pathlengthbins(k).numberterminations          = 0;
                    inddata.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcatingbranches   = 0;
                    inddata.doublebins.diameterbins(j).pathlengthbins(k).numberterminatingbranches   = 0;
                    inddata.doublebins.diameterbins(j).pathlengthbins(k).rallratio.values            = [];
                    inddata.doublebins.diameterbins(j).pathlengthbins(k).rallratio1.values           = [];
                    inddata.doublebins.diameterbins(j).pathlengthbins(k).rallratio2.values           = [];
                    inddata.doublebins.diameterbins(j).pathlengthbins(k).rallratio3.values           = [];
                    inddata.doublebins.diameterbins(j).pathlengthbins(k).daughterratio.values        = [];
                    inddata.doublebins.diameterbins(j).pathlengthbins(k).parentdaughterratio.values  = [];
                    inddata.doublebins.diameterbins(j).pathlengthbins(k).parentdaughter2ratio.values = [];
                    inddata.doublebins.diameterbins(j).pathlengthbins(k).meandiameter.values         = [];
                    inddata.doublebins.diameterbins(j).pathlengthbins(k).taperrate.values            = [];
                    inddata.doublebins.diameterbins(j).pathlengthbins(k).piecelength.values          = [];
                    
                    
                    if isfield(inddata.doublebins.diameterbins(j).pathlengthbins(k),'piece') == 1 && isfield(inddata.doublebins.diameterbins(j).pathlengthbins(k).piece,'id')
                        
                        inddata.doublebins.diameterbins(j).pathlengthbins(k).length                      = sum([inddata.doublebins.diameterbins(j).pathlengthbins(k).piece.length]);
                        inddata.doublebins.diameterbins(j).pathlengthbins(k).surfacearea                 = sum([inddata.doublebins.diameterbins(j).pathlengthbins(k).piece.surfacearea]);
                        inddata.doublebins.diameterbins(j).pathlengthbins(k).volume                      = sum([inddata.doublebins.diameterbins(j).pathlengthbins(k).piece.volume]);
                        inddata.doublebins.diameterbins(j).pathlengthbins(k).numbersegments              = length(unique([inddata.doublebins.diameterbins(j).pathlengthbins(k).piece.cable]));
                        inddata.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations          = 0;
                        inddata.doublebins.diameterbins(j).pathlengthbins(k).numberterminations          = 0;
                        inddata.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcatingbranches   = 0;
                        inddata.doublebins.diameterbins(j).pathlengthbins(k).numberterminatingbranches   = 0;
                        inddata.doublebins.diameterbins(j).pathlengthbins(k).rallratio.values            = [inddata.doublebins.diameterbins(j).pathlengthbins(k).piece.rallratio];
                        inddata.doublebins.diameterbins(j).pathlengthbins(k).rallratio1.values           = [inddata.doublebins.diameterbins(j).pathlengthbins(k).piece.rallratio1];
                        inddata.doublebins.diameterbins(j).pathlengthbins(k).rallratio2.values           = [inddata.doublebins.diameterbins(j).pathlengthbins(k).piece.rallratio2];
                        inddata.doublebins.diameterbins(j).pathlengthbins(k).rallratio3.values           = [inddata.doublebins.diameterbins(j).pathlengthbins(k).piece.rallratio3];
                        inddata.doublebins.diameterbins(j).pathlengthbins(k).daughterratio.values        = [inddata.doublebins.diameterbins(j).pathlengthbins(k).piece.daughterratio];
                        inddata.doublebins.diameterbins(j).pathlengthbins(k).parentdaughterratio.values  = [inddata.doublebins.diameterbins(j).pathlengthbins(k).piece.parentdaughterratio];
                        inddata.doublebins.diameterbins(j).pathlengthbins(k).parentdaughter2ratio.values = [inddata.doublebins.diameterbins(j).pathlengthbins(k).piece.parentdaughter2ratio];
                        inddata.doublebins.diameterbins(j).pathlengthbins(k).meandiameter.values         = ([inddata.doublebins.diameterbins(j).pathlengthbins(k).piece.proximaldiameter]+[inddata.doublebins.diameterbins(j).pathlengthbins(k).piece.distaldiameter])/2;
                        inddata.doublebins.diameterbins(j).pathlengthbins(k).taperrate.values            = [inddata.doublebins.diameterbins(j).pathlengthbins(k).piece.taperrate];
                        inddata.doublebins.diameterbins(j).pathlengthbins(k).piecelength.values          = [inddata.doublebins.diameterbins(j).pathlengthbins(k).piece.length];
                        
                        for m = 1:length(inddata.doublebins.diameterbins(j).pathlengthbins(k).piece)
                            if strcmp(inddata.doublebins.diameterbins(j).pathlengthbins(k).piece(m).distaltype,'bifurcation')==1
                                inddata.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations = 1 + inddata.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations;
                            end
                            if strcmp(inddata.doublebins.diameterbins(j).pathlengthbins(k).piece(m).distaltype,'m-furcation')==1
                                inddata.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations = length(inddata.doublebins.diameterbins(j).pathlengthbins(k).piece(m).daughters) - 1 + inddata.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations;
                            end
                            if strcmp(inddata.doublebins.diameterbins(j).pathlengthbins(k).piece(m).distaltype,'termination')==1
                                inddata.doublebins.diameterbins(j).pathlengthbins(k).numberterminations = 1 + inddata.doublebins.diameterbins(j).pathlengthbins(k).numberterminations;
                            end
                            if strcmp(inddata.doublebins.diameterbins(j).pathlengthbins(k).piece(m).proximaltype,'primary    ')==1 || strcmp(inddata.doublebins.diameterbins(j).pathlengthbins(k).piece(m).proximaltype,'daughter   ')==1 || strcmp(inddata.doublebins.diameterbins(j).pathlengthbins(k).piece(m).proximaltype,'daughter1  ')==1 || strcmp(inddata.doublebins.diameterbins(j).pathlengthbins(k).piece(m).proximaltype,'daughter2  ')==1
                                if strcmp(inddata.doublebins.diameterbins(j).pathlengthbins(k).piece(m).branchtype,'b')==1
                                    inddata.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcatingbranches = 1 + inddata.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcatingbranches;
                                elseif strcmp(inddata.doublebins.diameterbins(j).pathlengthbins(k).piece(m).branchtype,'t')==1
                                    inddata.doublebins.diameterbins(j).pathlengthbins(k).numberterminatingbranches = 1 + inddata.doublebins.diameterbins(j).pathlengthbins(k).numberterminatingbranches;
                                else disp('        Error in doublebinanalyzer: piece branch type not identified');
                                end
                            end
                        end
                    end
                    
                    if isfield(popdata.doublebins,'diameterbins') == 0; nextvalue = 1;
                    elseif j > length(popdata.doublebins.diameterbins); nextvalue = 1;
                    elseif isfield(popdata.doublebins.diameterbins(j).pathlengthbins(k),'length') == 0; nextvalue = 1;
                    elseif isfield(popdata.doublebins.diameterbins(j).pathlengthbins(k).length,'values') == 0; nextvalue = 1;
                    else nextvalue = 1 + length(popdata.doublebins.diameterbins(j).pathlengthbins(k).length.values);
                    end
                    popdata.doublebins.diameterbins(j).pathlengthbins(k).length.values(nextvalue)             = inddata.doublebins.diameterbins(j).pathlengthbins(k).length;
                    popdata.doublebins.diameterbins(j).pathlengthbins(k).surfacearea.values(nextvalue)        = inddata.doublebins.diameterbins(j).pathlengthbins(k).surfacearea;
                    popdata.doublebins.diameterbins(j).pathlengthbins(k).volume.values(nextvalue)             = inddata.doublebins.diameterbins(j).pathlengthbins(k).volume;
                    popdata.doublebins.diameterbins(j).pathlengthbins(k).numbersegments.values(nextvalue)     = inddata.doublebins.diameterbins(j).pathlengthbins(k).numbersegments;
                    popdata.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations.values(nextvalue) = inddata.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations;
                    popdata.doublebins.diameterbins(j).pathlengthbins(k).numberterminations.values(nextvalue) = inddata.doublebins.diameterbins(j).pathlengthbins(k).numberterminations;
                    popdata.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcatingbranches.values(nextvalue) = inddata.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcatingbranches;
                    popdata.doublebins.diameterbins(j).pathlengthbins(k).numberterminatingbranches.values(nextvalue) = inddata.doublebins.diameterbins(j).pathlengthbins(k).numberterminatingbranches;
                    popdata.doublebins.diameterbins(j).pathlengthbins(k).rallratio.values                     = [ [popdata.doublebins.diameterbins(j).pathlengthbins(k).rallratio.values] [inddata.doublebins.diameterbins(j).pathlengthbins(k).rallratio.values] ];
                    popdata.doublebins.diameterbins(j).pathlengthbins(k).rallratio1.values                    = [ [popdata.doublebins.diameterbins(j).pathlengthbins(k).rallratio1.values] [inddata.doublebins.diameterbins(j).pathlengthbins(k).rallratio1.values] ];
                    popdata.doublebins.diameterbins(j).pathlengthbins(k).rallratio2.values                    = [ [popdata.doublebins.diameterbins(j).pathlengthbins(k).rallratio2.values] [inddata.doublebins.diameterbins(j).pathlengthbins(k).rallratio2.values] ];
                    popdata.doublebins.diameterbins(j).pathlengthbins(k).rallratio3.values                    = [ [popdata.doublebins.diameterbins(j).pathlengthbins(k).rallratio3.values] [inddata.doublebins.diameterbins(j).pathlengthbins(k).rallratio3.values] ];
                    popdata.doublebins.diameterbins(j).pathlengthbins(k).daughterratio.values                 = [ [popdata.doublebins.diameterbins(j).pathlengthbins(k).daughterratio.values] [inddata.doublebins.diameterbins(j).pathlengthbins(k).daughterratio.values] ];
                    popdata.doublebins.diameterbins(j).pathlengthbins(k).parentdaughterratio.values           = [ [popdata.doublebins.diameterbins(j).pathlengthbins(k).parentdaughterratio.values] [inddata.doublebins.diameterbins(j).pathlengthbins(k).parentdaughterratio.values] ];
                    popdata.doublebins.diameterbins(j).pathlengthbins(k).parentdaughter2ratio.values          = [ [popdata.doublebins.diameterbins(j).pathlengthbins(k).parentdaughter2ratio.values] [inddata.doublebins.diameterbins(j).pathlengthbins(k).parentdaughter2ratio.values] ];
                    popdata.doublebins.diameterbins(j).pathlengthbins(k).meandiameter.values                  = [ [popdata.doublebins.diameterbins(j).pathlengthbins(k).meandiameter.values] [inddata.doublebins.diameterbins(j).pathlengthbins(k).meandiameter.values] ];
                    popdata.doublebins.diameterbins(j).pathlengthbins(k).taperrate.values                     = [ [popdata.doublebins.diameterbins(j).pathlengthbins(k).taperrate.values] [inddata.doublebins.diameterbins(j).pathlengthbins(k).taperrate.values] ];
                    popdata.doublebins.diameterbins(j).pathlengthbins(k).piecelength.values                   = [ [popdata.doublebins.diameterbins(j).pathlengthbins(k).piecelength.values] [inddata.doublebins.diameterbins(j).pathlengthbins(k).piecelength.values] ];
                    clear nextvalue;
                    
                end
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        
        for i = 1:length(popdata.doublebins.diameterbins)
            
            for j = 1:length(popdata.doublebins.diameterbins(i).pathlengthbins)
                
                typeanalysis.doublebin.diameterpathlength.diameter(i,j)   = popdata.diameterbinmiddles(i);
                typeanalysis.doublebin.diameterpathlength.pathlength(i,j) = (distancebinwidth * j) - (distancebinwidth / 2);
                                
                if isfield(popdata.doublebins.diameterbins(i).pathlengthbins(j).length,'values') == 1
                    
                    typeanalysis.doublebin.diameterpathlength.length(i,j)      = sum([popdata.doublebins.diameterbins(i).pathlengthbins(j).length.values]);
                    typeanalysis.doublebin.diameterpathlength.surfacearea(i,j) = sum([popdata.doublebins.diameterbins(i).pathlengthbins(j).surfacearea.values]);
                    typeanalysis.doublebin.diameterpathlength.volume(i,j)      = sum([popdata.doublebins.diameterbins(i).pathlengthbins(j).volume.values]);
                    
                    typeanalysis.doublebin.diameterpathlength.numbersegments(i,j)     = sum([popdata.doublebins.diameterbins(i).pathlengthbins(j).numbersegments.values]);
                    typeanalysis.doublebin.diameterpathlength.numberbifurcations(i,j) = sum([popdata.doublebins.diameterbins(i).pathlengthbins(j).numberbifurcations.values]);
                    typeanalysis.doublebin.diameterpathlength.numberterminations(i,j) = sum([popdata.doublebins.diameterbins(i).pathlengthbins(j).numberterminations.values]);
                    typeanalysis.doublebin.diameterpathlength.numberbifurcatingbranches(i,j) = sum([popdata.doublebins.diameterbins(i).pathlengthbins(j).numberbifurcatingbranches.values]);
                    typeanalysis.doublebin.diameterpathlength.numberterminatingbranches(i,j) = sum([popdata.doublebins.diameterbins(i).pathlengthbins(j).numberterminatingbranches.values]);
                    
                    typeanalysis.doublebin.diameterpathlength.rallratio.mean(i,j) = mean([popdata.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values]);
                    typeanalysis.doublebin.diameterpathlength.rallratio.std(i,j)  = std([popdata.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values]);
                    typeanalysis.doublebin.diameterpathlength.rallratio.skew(i,j) = skewness([popdata.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values],0);
                    typeanalysis.doublebin.diameterpathlength.rallratio.kurt(i,j) = kurtosis([popdata.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values],0);
                    
                    typeanalysis.doublebin.diameterpathlength.rallratio1.mean(i,j) = mean([popdata.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values]);
                    typeanalysis.doublebin.diameterpathlength.rallratio1.std(i,j)  = std([popdata.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values]);
                    typeanalysis.doublebin.diameterpathlength.rallratio1.skew(i,j) = skewness([popdata.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values],0);
                    typeanalysis.doublebin.diameterpathlength.rallratio1.kurt(i,j) = kurtosis([popdata.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values],0);
                    
                    typeanalysis.doublebin.diameterpathlength.rallratio2.mean(i,j) = mean([popdata.doublebins.diameterbins(i).pathlengthbins(j).rallratio2.values]);
                    typeanalysis.doublebin.diameterpathlength.rallratio2.std(i,j)  = std([popdata.doublebins.diameterbins(i).pathlengthbins(j).rallratio2.values]);
                    typeanalysis.doublebin.diameterpathlength.rallratio2.skew(i,j) = skewness([popdata.doublebins.diameterbins(i).pathlengthbins(j).rallratio2.values],0);
                    typeanalysis.doublebin.diameterpathlength.rallratio2.kurt(i,j) = kurtosis([popdata.doublebins.diameterbins(i).pathlengthbins(j).rallratio2.values],0);
                    
                    typeanalysis.doublebin.diameterpathlength.rallratio3.mean(i,j) = mean([popdata.doublebins.diameterbins(i).pathlengthbins(j).rallratio3.values]);
                    typeanalysis.doublebin.diameterpathlength.rallratio3.std(i,j)  = std([popdata.doublebins.diameterbins(i).pathlengthbins(j).rallratio3.values]);
                    typeanalysis.doublebin.diameterpathlength.rallratio3.skew(i,j) = skewness([popdata.doublebins.diameterbins(i).pathlengthbins(j).rallratio3.values],0);
                    typeanalysis.doublebin.diameterpathlength.rallratio3.kurt(i,j) = kurtosis([popdata.doublebins.diameterbins(i).pathlengthbins(j).rallratio3.values],0);
                    
                    typeanalysis.doublebin.diameterpathlength.daughterratio.mean(i,j) = mean([popdata.doublebins.diameterbins(i).pathlengthbins(j).daughterratio.values]);
                    typeanalysis.doublebin.diameterpathlength.daughterratio.std(i,j)  = std([popdata.doublebins.diameterbins(i).pathlengthbins(j).daughterratio.values]);
                    typeanalysis.doublebin.diameterpathlength.daughterratio.skew(i,j) = skewness([popdata.doublebins.diameterbins(i).pathlengthbins(j).daughterratio.values],0);
                    typeanalysis.doublebin.diameterpathlength.daughterratio.kurt(i,j) = kurtosis([popdata.doublebins.diameterbins(i).pathlengthbins(j).daughterratio.values],0);
                    
                    typeanalysis.doublebin.diameterpathlength.parentdaughterratio.mean(i,j) = mean([popdata.doublebins.diameterbins(i).pathlengthbins(j).parentdaughterratio.values]);
                    typeanalysis.doublebin.diameterpathlength.parentdaughterratio.std(i,j)  = std([popdata.doublebins.diameterbins(i).pathlengthbins(j).parentdaughterratio.values]);
                    typeanalysis.doublebin.diameterpathlength.parentdaughterratio.skew(i,j) = skewness([popdata.doublebins.diameterbins(i).pathlengthbins(j).parentdaughterratio.values],0);
                    typeanalysis.doublebin.diameterpathlength.parentdaughterratio.kurt(i,j) = kurtosis([popdata.doublebins.diameterbins(i).pathlengthbins(j).parentdaughterratio.values],0);
                    
                    typeanalysis.doublebin.diameterpathlength.parentdaughter2ratio.mean(i,j) = mean([popdata.doublebins.diameterbins(i).pathlengthbins(j).parentdaughter2ratio.values]);
                    typeanalysis.doublebin.diameterpathlength.parentdaughter2ratio.std(i,j)  = std([popdata.doublebins.diameterbins(i).pathlengthbins(j).parentdaughter2ratio.values]);
                    typeanalysis.doublebin.diameterpathlength.parentdaughter2ratio.skew(i,j) = skewness([popdata.doublebins.diameterbins(i).pathlengthbins(j).parentdaughter2ratio.values],0);
                    typeanalysis.doublebin.diameterpathlength.parentdaughter2ratio.kurt(i,j) = kurtosis([popdata.doublebins.diameterbins(i).pathlengthbins(j).parentdaughter2ratio.values],0);
                    
                    typeanalysis.doublebin.diameterpathlength.taperrate.mean(i,j) = sum([popdata.doublebins.diameterbins(i).pathlengthbins(j).taperrate.values].*[popdata.doublebins.diameterbins(i).pathlengthbins(j).piecelength.values])/sum([popdata.doublebins.diameterbins(i).pathlengthbins(j).piecelength.values]);
                    typeanalysis.doublebin.diameterpathlength.taperrate.std(i,j)  = std([popdata.doublebins.diameterbins(i).pathlengthbins(j).taperrate.values]);
                    typeanalysis.doublebin.diameterpathlength.taperrate.skew(i,j) = skewness([popdata.doublebins.diameterbins(i).pathlengthbins(j).taperrate.values],0);
                    typeanalysis.doublebin.diameterpathlength.taperrate.kurt(i,j) = kurtosis([popdata.doublebins.diameterbins(i).pathlengthbins(j).taperrate.values],0);
                    
                    
                    typeanalysis.doublebin.diameterpathlength.bifurcationprobability.bylength(i,j) = typeanalysis.doublebin.diameterpathlength.numberbifurcations(i,j) / typeanalysis.doublebin.diameterpathlength.length(i,j);
                    typeanalysis.doublebin.diameterpathlength.terminationprobability.bylength(i,j) = typeanalysis.doublebin.diameterpathlength.numberterminations(i,j) / typeanalysis.doublebin.diameterpathlength.length(i,j);
                    
                    typeanalysis.doublebin.diameterpathlength.bifurcationprobability.bysurfacearea(i,j) = typeanalysis.doublebin.diameterpathlength.numberbifurcations(i,j) / typeanalysis.doublebin.diameterpathlength.surfacearea(i,j);
                    typeanalysis.doublebin.diameterpathlength.terminationprobability.bysurfacearea(i,j) = typeanalysis.doublebin.diameterpathlength.numberterminations(i,j) / typeanalysis.doublebin.diameterpathlength.surfacearea(i,j);
                    
                    typeanalysis.doublebin.diameterpathlength.bifurcationprobability.byvolume(i,j) = typeanalysis.doublebin.diameterpathlength.numberbifurcations(i,j) / typeanalysis.doublebin.diameterpathlength.volume(i,j);
                    typeanalysis.doublebin.diameterpathlength.terminationprobability.byvolume(i,j) = typeanalysis.doublebin.diameterpathlength.numberterminations(i,j) / typeanalysis.doublebin.diameterpathlength.volume(i,j);
                    
                end
            end
        end
        
        typeanalysis.doublebin.diameterpathlength.array.diameter      = reshape(typeanalysis.doublebin.diameterpathlength.diameter,numel(typeanalysis.doublebin.diameterpathlength.diameter),1);
        typeanalysis.doublebin.diameterpathlength.array.pathlength    = reshape(typeanalysis.doublebin.diameterpathlength.pathlength,numel(typeanalysis.doublebin.diameterpathlength.pathlength),1);
        
        typeanalysis.doublebin.diameterpathlength.array.diameter   = reshape(typeanalysis.doublebin.diameterpathlength.diameter,numel(typeanalysis.doublebin.diameterpathlength.diameter),1);
        typeanalysis.doublebin.diameterpathlength.array.pathlength = reshape(typeanalysis.doublebin.diameterpathlength.pathlength,numel(typeanalysis.doublebin.diameterpathlength.pathlength),1);
        
        typeanalysis.doublebin.diameterpathlength.array.length      = reshape(typeanalysis.doublebin.diameterpathlength.length,numel(typeanalysis.doublebin.diameterpathlength.length),1);
        typeanalysis.doublebin.diameterpathlength.array.surfacearea = reshape(typeanalysis.doublebin.diameterpathlength.surfacearea,numel(typeanalysis.doublebin.diameterpathlength.surfacearea),1);
        typeanalysis.doublebin.diameterpathlength.array.volume      = reshape(typeanalysis.doublebin.diameterpathlength.volume,numel(typeanalysis.doublebin.diameterpathlength.volume),1);
        
        typeanalysis.doublebin.diameterpathlength.array.numbersegments     = reshape(typeanalysis.doublebin.diameterpathlength.numbersegments,numel(typeanalysis.doublebin.diameterpathlength.numbersegments),1);
        typeanalysis.doublebin.diameterpathlength.array.numberbifurcations = reshape(typeanalysis.doublebin.diameterpathlength.numberbifurcations,numel(typeanalysis.doublebin.diameterpathlength.numberbifurcations),1);
        typeanalysis.doublebin.diameterpathlength.array.numberterminations = reshape(typeanalysis.doublebin.diameterpathlength.numberterminations,numel(typeanalysis.doublebin.diameterpathlength.numberterminations),1);
        typeanalysis.doublebin.diameterpathlength.array.numberbifurcatingbranches = reshape(typeanalysis.doublebin.diameterpathlength.numberbifurcatingbranches,numel(typeanalysis.doublebin.diameterpathlength.numberbifurcatingbranches),1);
        typeanalysis.doublebin.diameterpathlength.array.numberterminatingbranches = reshape(typeanalysis.doublebin.diameterpathlength.numberterminatingbranches,numel(typeanalysis.doublebin.diameterpathlength.numberterminatingbranches),1);
        
        typeanalysis.doublebin.diameterpathlength.array.rallratio.mean = reshape(typeanalysis.doublebin.diameterpathlength.rallratio.mean,numel(typeanalysis.doublebin.diameterpathlength.rallratio.mean),1);
        typeanalysis.doublebin.diameterpathlength.array.rallratio.std  = reshape(typeanalysis.doublebin.diameterpathlength.rallratio.std,numel(typeanalysis.doublebin.diameterpathlength.rallratio.std),1);
        typeanalysis.doublebin.diameterpathlength.array.rallratio.skew = reshape(typeanalysis.doublebin.diameterpathlength.rallratio.skew,numel(typeanalysis.doublebin.diameterpathlength.rallratio.skew),1);
        typeanalysis.doublebin.diameterpathlength.array.rallratio.kurt = reshape(typeanalysis.doublebin.diameterpathlength.rallratio.kurt,numel(typeanalysis.doublebin.diameterpathlength.rallratio.kurt),1);
        
        typeanalysis.doublebin.diameterpathlength.array.rallratio1.mean = reshape(typeanalysis.doublebin.diameterpathlength.rallratio1.mean,numel(typeanalysis.doublebin.diameterpathlength.rallratio1.mean),1);
        typeanalysis.doublebin.diameterpathlength.array.rallratio1.std  = reshape(typeanalysis.doublebin.diameterpathlength.rallratio1.std,numel(typeanalysis.doublebin.diameterpathlength.rallratio1.std),1);
        typeanalysis.doublebin.diameterpathlength.array.rallratio1.skew = reshape(typeanalysis.doublebin.diameterpathlength.rallratio1.skew,numel(typeanalysis.doublebin.diameterpathlength.rallratio1.skew),1);
        typeanalysis.doublebin.diameterpathlength.array.rallratio1.kurt = reshape(typeanalysis.doublebin.diameterpathlength.rallratio1.kurt,numel(typeanalysis.doublebin.diameterpathlength.rallratio1.kurt),1);
        
        typeanalysis.doublebin.diameterpathlength.array.rallratio2.mean = reshape(typeanalysis.doublebin.diameterpathlength.rallratio2.mean,numel(typeanalysis.doublebin.diameterpathlength.rallratio2.mean),1);
        typeanalysis.doublebin.diameterpathlength.array.rallratio2.std  = reshape(typeanalysis.doublebin.diameterpathlength.rallratio2.std,numel(typeanalysis.doublebin.diameterpathlength.rallratio2.std),1);
        typeanalysis.doublebin.diameterpathlength.array.rallratio2.skew = reshape(typeanalysis.doublebin.diameterpathlength.rallratio2.skew,numel(typeanalysis.doublebin.diameterpathlength.rallratio2.skew),1);
        typeanalysis.doublebin.diameterpathlength.array.rallratio2.kurt = reshape(typeanalysis.doublebin.diameterpathlength.rallratio2.kurt,numel(typeanalysis.doublebin.diameterpathlength.rallratio2.kurt),1);
        
        typeanalysis.doublebin.diameterpathlength.array.rallratio3.mean = reshape(typeanalysis.doublebin.diameterpathlength.rallratio3.mean,numel(typeanalysis.doublebin.diameterpathlength.rallratio3.mean),1);
        typeanalysis.doublebin.diameterpathlength.array.rallratio3.std  = reshape(typeanalysis.doublebin.diameterpathlength.rallratio3.std,numel(typeanalysis.doublebin.diameterpathlength.rallratio3.std),1);
        typeanalysis.doublebin.diameterpathlength.array.rallratio3.skew = reshape(typeanalysis.doublebin.diameterpathlength.rallratio3.skew,numel(typeanalysis.doublebin.diameterpathlength.rallratio3.skew),1);
        typeanalysis.doublebin.diameterpathlength.array.rallratio3.kurt = reshape(typeanalysis.doublebin.diameterpathlength.rallratio3.kurt,numel(typeanalysis.doublebin.diameterpathlength.rallratio3.kurt),1);
        
        typeanalysis.doublebin.diameterpathlength.array.daughterratio.mean = reshape(typeanalysis.doublebin.diameterpathlength.daughterratio.mean,numel(typeanalysis.doublebin.diameterpathlength.daughterratio.mean),1);
        typeanalysis.doublebin.diameterpathlength.array.daughterratio.std  = reshape(typeanalysis.doublebin.diameterpathlength.daughterratio.std,numel(typeanalysis.doublebin.diameterpathlength.daughterratio.std),1);
        typeanalysis.doublebin.diameterpathlength.array.daughterratio.skew = reshape(typeanalysis.doublebin.diameterpathlength.daughterratio.skew,numel(typeanalysis.doublebin.diameterpathlength.daughterratio.skew),1);
        typeanalysis.doublebin.diameterpathlength.array.daughterratio.kurt = reshape(typeanalysis.doublebin.diameterpathlength.daughterratio.kurt,numel(typeanalysis.doublebin.diameterpathlength.daughterratio.kurt),1);
        
        typeanalysis.doublebin.diameterpathlength.array.parentdaughterratio.mean = reshape(typeanalysis.doublebin.diameterpathlength.parentdaughterratio.mean,numel(typeanalysis.doublebin.diameterpathlength.parentdaughterratio.mean),1);
        typeanalysis.doublebin.diameterpathlength.array.parentdaughterratio.std  = reshape(typeanalysis.doublebin.diameterpathlength.parentdaughterratio.std,numel(typeanalysis.doublebin.diameterpathlength.parentdaughterratio.std),1);
        typeanalysis.doublebin.diameterpathlength.array.parentdaughterratio.skew = reshape(typeanalysis.doublebin.diameterpathlength.parentdaughterratio.skew,numel(typeanalysis.doublebin.diameterpathlength.parentdaughterratio.skew),1);
        typeanalysis.doublebin.diameterpathlength.array.parentdaughterratio.kurt = reshape(typeanalysis.doublebin.diameterpathlength.parentdaughterratio.kurt,numel(typeanalysis.doublebin.diameterpathlength.parentdaughterratio.kurt),1);
        
        typeanalysis.doublebin.diameterpathlength.array.parentdaughter2ratio.mean = reshape(typeanalysis.doublebin.diameterpathlength.parentdaughter2ratio.mean,numel(typeanalysis.doublebin.diameterpathlength.parentdaughter2ratio.mean),1);
        typeanalysis.doublebin.diameterpathlength.array.parentdaughter2ratio.std  = reshape(typeanalysis.doublebin.diameterpathlength.parentdaughter2ratio.std,numel(typeanalysis.doublebin.diameterpathlength.parentdaughter2ratio.std),1);
        typeanalysis.doublebin.diameterpathlength.array.parentdaughter2ratio.skew = reshape(typeanalysis.doublebin.diameterpathlength.parentdaughter2ratio.skew,numel(typeanalysis.doublebin.diameterpathlength.parentdaughter2ratio.skew),1);
        typeanalysis.doublebin.diameterpathlength.array.parentdaughter2ratio.kurt = reshape(typeanalysis.doublebin.diameterpathlength.parentdaughter2ratio.kurt,numel(typeanalysis.doublebin.diameterpathlength.parentdaughter2ratio.kurt),1);
        
        typeanalysis.doublebin.diameterpathlength.array.taperrate.mean = reshape(typeanalysis.doublebin.diameterpathlength.taperrate.mean,numel(typeanalysis.doublebin.diameterpathlength.taperrate.mean),1);
        typeanalysis.doublebin.diameterpathlength.array.taperrate.std  = reshape(typeanalysis.doublebin.diameterpathlength.taperrate.std,numel(typeanalysis.doublebin.diameterpathlength.taperrate.std),1);
        typeanalysis.doublebin.diameterpathlength.array.taperrate.skew = reshape(typeanalysis.doublebin.diameterpathlength.taperrate.skew,numel(typeanalysis.doublebin.diameterpathlength.taperrate.skew),1);
        typeanalysis.doublebin.diameterpathlength.array.taperrate.kurt = reshape(typeanalysis.doublebin.diameterpathlength.taperrate.kurt,numel(typeanalysis.doublebin.diameterpathlength.taperrate.kurt),1);
        
        
        typeanalysis.doublebin.diameterpathlength.array.bifurcationprobability.bylength      = reshape(typeanalysis.doublebin.diameterpathlength.bifurcationprobability.bylength,numel(typeanalysis.doublebin.diameterpathlength.bifurcationprobability.bylength),1);
        typeanalysis.doublebin.diameterpathlength.array.bifurcationprobability.bysurfacearea = reshape(typeanalysis.doublebin.diameterpathlength.bifurcationprobability.bysurfacearea,numel(typeanalysis.doublebin.diameterpathlength.bifurcationprobability.bysurfacearea),1);
        typeanalysis.doublebin.diameterpathlength.array.bifurcationprobability.byvolume      = reshape(typeanalysis.doublebin.diameterpathlength.bifurcationprobability.byvolume,numel(typeanalysis.doublebin.diameterpathlength.bifurcationprobability.byvolume),1);
        typeanalysis.doublebin.diameterpathlength.array.bifurcationprobability.diameter    = reshape(typeanalysis.doublebin.diameterpathlength.diameter,numel(typeanalysis.doublebin.diameterpathlength.diameter),1);
        typeanalysis.doublebin.diameterpathlength.array.bifurcationprobability.pathlength  = reshape(typeanalysis.doublebin.diameterpathlength.pathlength,numel(typeanalysis.doublebin.diameterpathlength.pathlength),1);
        
        typeanalysis.doublebin.diameterpathlength.array.bifurcationprobability.pathlength  = typeanalysis.doublebin.diameterpathlength.array.bifurcationprobability.pathlength(~isnan(typeanalysis.doublebin.diameterpathlength.array.bifurcationprobability.bylength));
        typeanalysis.doublebin.diameterpathlength.array.bifurcationprobability.diameter    = typeanalysis.doublebin.diameterpathlength.array.bifurcationprobability.diameter(~isnan(typeanalysis.doublebin.diameterpathlength.array.bifurcationprobability.bylength));
        typeanalysis.doublebin.diameterpathlength.array.bifurcationprobability.byvolume      = typeanalysis.doublebin.diameterpathlength.array.bifurcationprobability.byvolume(~isnan(typeanalysis.doublebin.diameterpathlength.array.bifurcationprobability.bylength));
        typeanalysis.doublebin.diameterpathlength.array.bifurcationprobability.bysurfacearea = typeanalysis.doublebin.diameterpathlength.array.bifurcationprobability.bysurfacearea(~isnan(typeanalysis.doublebin.diameterpathlength.array.bifurcationprobability.bylength));
        typeanalysis.doublebin.diameterpathlength.array.bifurcationprobability.bylength      = typeanalysis.doublebin.diameterpathlength.array.bifurcationprobability.bylength(~isnan(typeanalysis.doublebin.diameterpathlength.array.bifurcationprobability.bylength));
        
        %typeanalysis.doublebin.diameterpathlength.array.bifurcationprobability.zunzunlength = [typeanalysis.doublebin.diameterpathlength.array.bifurcationprobability.diameter typeanalysis.doublebin.diameterpathlength.array.bifurcationprobability.pathlength typeanalysis.doublebin.diameterpathlength.array.bifurcationprobability.bylength];
        %typeanalysis.doublebin.diameterpathlength.array.bifurcationprobability.zunzunsurfacearea = [typeanalysis.doublebin.diameterpathlength.array.bifurcationprobability.diameter typeanalysis.doublebin.diameterpathlength.array.bifurcationprobability.pathlength typeanalysis.doublebin.diameterpathlength.array.bifurcationprobability.bysurfacearea];
        %typeanalysis.doublebin.diameterpathlength.array.bifurcationprobability.zunzunvolume = [typeanalysis.doublebin.diameterpathlength.array.bifurcationprobability.diameter typeanalysis.doublebin.diameterpathlength.array.bifurcationprobability.pathlength typeanalysis.doublebin.diameterpathlength.array.bifurcationprobability.byvolume];
        
        
        typeanalysis.doublebin.diameterpathlength.array.terminationprobability.bylength      = reshape(typeanalysis.doublebin.diameterpathlength.terminationprobability.bylength,numel(typeanalysis.doublebin.diameterpathlength.terminationprobability.bylength),1);
        typeanalysis.doublebin.diameterpathlength.array.terminationprobability.bysurfacearea = reshape(typeanalysis.doublebin.diameterpathlength.terminationprobability.bysurfacearea,numel(typeanalysis.doublebin.diameterpathlength.terminationprobability.bysurfacearea),1);
        typeanalysis.doublebin.diameterpathlength.array.terminationprobability.byvolume      = reshape(typeanalysis.doublebin.diameterpathlength.terminationprobability.byvolume,numel(typeanalysis.doublebin.diameterpathlength.terminationprobability.byvolume),1);
        typeanalysis.doublebin.diameterpathlength.array.terminationprobability.diameter    = reshape(typeanalysis.doublebin.diameterpathlength.diameter,numel(typeanalysis.doublebin.diameterpathlength.diameter),1);
        typeanalysis.doublebin.diameterpathlength.array.terminationprobability.pathlength  = reshape(typeanalysis.doublebin.diameterpathlength.pathlength,numel(typeanalysis.doublebin.diameterpathlength.pathlength),1);
        
        typeanalysis.doublebin.diameterpathlength.array.terminationprobability.pathlength  = typeanalysis.doublebin.diameterpathlength.array.terminationprobability.pathlength(~isnan(typeanalysis.doublebin.diameterpathlength.array.terminationprobability.bylength));
        typeanalysis.doublebin.diameterpathlength.array.terminationprobability.diameter    = typeanalysis.doublebin.diameterpathlength.array.terminationprobability.diameter(~isnan(typeanalysis.doublebin.diameterpathlength.array.terminationprobability.bylength));
        typeanalysis.doublebin.diameterpathlength.array.terminationprobability.byvolume      = typeanalysis.doublebin.diameterpathlength.array.terminationprobability.byvolume(~isnan(typeanalysis.doublebin.diameterpathlength.array.terminationprobability.bylength));
        typeanalysis.doublebin.diameterpathlength.array.terminationprobability.bysurfacearea = typeanalysis.doublebin.diameterpathlength.array.terminationprobability.bysurfacearea(~isnan(typeanalysis.doublebin.diameterpathlength.array.terminationprobability.bylength));
        typeanalysis.doublebin.diameterpathlength.array.terminationprobability.bylength      = typeanalysis.doublebin.diameterpathlength.array.terminationprobability.bylength(~isnan(typeanalysis.doublebin.diameterpathlength.array.terminationprobability.bylength));
        
        %typeanalysis.doublebin.diameterpathlength.array.terminationprobability.zunzunlength = [typeanalysis.doublebin.diameterpathlength.array.terminationprobability.diameter typeanalysis.doublebin.diameterpathlength.array.terminationprobability.pathlength typeanalysis.doublebin.diameterpathlength.array.terminationprobability.bylength];
        %typeanalysis.doublebin.diameterpathlength.array.terminationprobability.zunzunsurfacearea = [typeanalysis.doublebin.diameterpathlength.array.terminationprobability.diameter typeanalysis.doublebin.diameterpathlength.array.terminationprobability.pathlength typeanalysis.doublebin.diameterpathlength.array.terminationprobability.bysurfacearea];
        %typeanalysis.doublebin.diameterpathlength.array.terminationprobability.zunzunvolume = [typeanalysis.doublebin.diameterpathlength.array.terminationprobability.diameter typeanalysis.doublebin.diameterpathlength.array.terminationprobability.pathlength typeanalysis.doublebin.diameterpathlength.array.terminationprobability.byvolume];
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        % Begin bifurcation double bin analysis
        
        for i = 1:maxdiameterbin
            for j = 1:maxpathlengthbin
                popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values            = [];
                popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio1.values           = [];
                popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio2.values           = [];
                popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio3.values           = [];
                popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).daughterratio.values        = [];
                popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).parentdaughterratio.values  = [];
                popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).parentdaughter2ratio.values = [];
                popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).meandiameter.values         = [];
                popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).taperrate.values            = [];
                popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).piecelength.values          = [];
            end
        end
        
        
        for i = 1:length(data.individual)
            
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            
            for j = 1:length(inddata.bifurcation.doublebins.diameterbins)
                
                for k = 1:length(inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins)
                    
                    inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).length                      = 0;
                    inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).surfacearea                 = 0;
                    inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).volume                      = 0;
                    inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numbersegments              = 0;
                    inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations          = 0;
                    inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numberterminations          = 0;
                    inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio.values            = [];
                    inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio1.values           = [];
                    inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio2.values           = [];
                    inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio3.values           = [];
                    inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).daughterratio.values        = [];
                    inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).parentdaughterratio.values  = [];
                    inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).parentdaughter2ratio.values = [];
                    inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).meandiameter.values         = [];
                    inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).taperrate.values            = [];
                    inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piecelength.values          = [];
                    
                    
                    if isfield(inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k),'piece') == 1 && isfield(inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece,'id')
                        
                        inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).length                      = sum([inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece.length]);
                        inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).surfacearea                 = sum([inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece.surfacearea]);
                        inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).volume                      = sum([inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece.volume]);
                        inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numbersegments              = length(unique([inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece.cable]));
                        inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations          = 0;
                        inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numberterminations          = 0;
                        inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio.values            = [inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece.rallratio];
                        inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio1.values           = [inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece.rallratio1];
                        inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio2.values           = [inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece.rallratio2];
                        inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio3.values           = [inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece.rallratio3];
                        inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).daughterratio.values        = [inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece.daughterratio];
                        inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).parentdaughterratio.values  = [inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece.parentdaughterratio];
                        inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).parentdaughter2ratio.values = [inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece.parentdaughter2ratio];
                        inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).meandiameter.values         = ([inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece.proximaldiameter]+[inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece.distaldiameter])/2;
                        inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).taperrate.values            = [inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece.taperrate];
                        inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piecelength.values          = [inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece.length];
                        
                        for m = 1:length(inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece)
                            if strcmp(inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece(m).distaltype,'bifurcation')==1
                                inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations = 1 + inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations;
                            end
                            if strcmp(inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece(m).distaltype,'m-furcation')==1
                                inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations = length(inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece(m).daughters) - 1 + inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations;
                            end
                            if strcmp(inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece(m).distaltype,'termination')==1
                                inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numberterminations = 1 + inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numberterminations;
                            end
                        end
                    end
                    
                    if isfield(popdata.bifurcation.doublebins,'diameterbins') == 0; nextvalue = 1;
                    elseif j > length(popdata.bifurcation.doublebins.diameterbins); nextvalue = 1;
                    elseif isfield(popdata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k),'length') == 0; nextvalue = 1;
                    elseif isfield(popdata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).length,'values') == 0; nextvalue = 1;
                    else nextvalue = 1 + length(popdata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).length.values);
                    end
                    popdata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).length.values(nextvalue)             = inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).length;
                    popdata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).surfacearea.values(nextvalue)        = inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).surfacearea;
                    popdata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).volume.values(nextvalue)             = inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).volume;
                    popdata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numbersegments.values(nextvalue)     = inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numbersegments;
                    popdata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations.values(nextvalue) = inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations;
                    popdata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numberterminations.values(nextvalue) = inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numberterminations;
                    popdata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio.values                     = [ [popdata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio.values] [inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio.values] ];
                    popdata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio1.values                    = [ [popdata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio1.values] [inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio1.values] ];
                    popdata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio2.values                    = [ [popdata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio2.values] [inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio2.values] ];
                    popdata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio3.values                    = [ [popdata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio3.values] [inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio3.values] ];
                    popdata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).daughterratio.values                 = [ [popdata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).daughterratio.values] [inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).daughterratio.values] ];
                    popdata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).parentdaughterratio.values           = [ [popdata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).parentdaughterratio.values] [inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).parentdaughterratio.values] ];
                    popdata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).parentdaughter2ratio.values          = [ [popdata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).parentdaughter2ratio.values] [inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).parentdaughter2ratio.values] ];
                    popdata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).meandiameter.values                  = [ [popdata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).meandiameter.values] [inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).meandiameter.values] ];
                    popdata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).taperrate.values                     = [ [popdata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).taperrate.values] [inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).taperrate.values] ];
                    popdata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piecelength.values                   = [ [popdata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piecelength.values] [inddata.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piecelength.values] ];
                    clear nextvalue;
                    
                end
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        
        for i = 1:length(popdata.bifurcation.doublebins.diameterbins)
            
            for j = 1:length(popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins)
                
                typeanalysis.bifurcation.doublebin.diameterpathlength.diameter(i,j)   = popdata.diameterbinmiddles(i);
                typeanalysis.bifurcation.doublebin.diameterpathlength.pathlength(i,j) = (distancebinwidth * j) - (distancebinwidth / 2);
                
                if isfield(popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).length,'values') == 1
                    
                    typeanalysis.bifurcation.doublebin.diameterpathlength.length(i,j)      = sum([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).length.values]);
                    typeanalysis.bifurcation.doublebin.diameterpathlength.surfacearea(i,j) = sum([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).surfacearea.values]);
                    typeanalysis.bifurcation.doublebin.diameterpathlength.volume(i,j)      = sum([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).volume.values]);
                    
                    typeanalysis.bifurcation.doublebin.diameterpathlength.numbersegments(i,j)     = sum([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).numbersegments.values]);
                    typeanalysis.bifurcation.doublebin.diameterpathlength.numberbifurcations(i,j) = sum([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).numberbifurcations.values]);
                    typeanalysis.bifurcation.doublebin.diameterpathlength.numberterminations(i,j) = sum([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).numberterminations.values]);
                    
                    typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio.mean(i,j) = mean([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values]);
                    typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio.std(i,j)  = std([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values]);
                    typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio.skew(i,j) = skewness([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values],0);
                    typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio.kurt(i,j) = kurtosis([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values],0);
                    
                    typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio1.mean(i,j) = mean([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio1.values]);
                    typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio1.std(i,j)  = std([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio1.values]);
                    typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio1.skew(i,j) = skewness([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio1.values],0);
                    typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio1.kurt(i,j) = kurtosis([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio1.values],0);
                    
                    typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio2.mean(i,j) = mean([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio2.values]);
                    typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio2.std(i,j)  = std([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio2.values]);
                    typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio2.skew(i,j) = skewness([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio2.values],0);
                    typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio2.kurt(i,j) = kurtosis([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio2.values],0);
                    
                    typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio3.mean(i,j) = mean([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio3.values]);
                    typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio3.std(i,j)  = std([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio3.values]);
                    typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio3.skew(i,j) = skewness([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio3.values],0);
                    typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio3.kurt(i,j) = kurtosis([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio3.values],0);
                    
                    typeanalysis.bifurcation.doublebin.diameterpathlength.daughterratio.mean(i,j) = mean([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).daughterratio.values]);
                    typeanalysis.bifurcation.doublebin.diameterpathlength.daughterratio.std(i,j)  = std([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).daughterratio.values]);
                    typeanalysis.bifurcation.doublebin.diameterpathlength.daughterratio.skew(i,j) = skewness([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).daughterratio.values],0);
                    typeanalysis.bifurcation.doublebin.diameterpathlength.daughterratio.kurt(i,j) = kurtosis([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).daughterratio.values],0);
                    
                    typeanalysis.bifurcation.doublebin.diameterpathlength.parentdaughterratio.mean(i,j) = mean([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).parentdaughterratio.values]);
                    typeanalysis.bifurcation.doublebin.diameterpathlength.parentdaughterratio.std(i,j)  = std([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).parentdaughterratio.values]);
                    typeanalysis.bifurcation.doublebin.diameterpathlength.parentdaughterratio.skew(i,j) = skewness([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).parentdaughterratio.values],0);
                    typeanalysis.bifurcation.doublebin.diameterpathlength.parentdaughterratio.kurt(i,j) = kurtosis([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).parentdaughterratio.values],0);
                    
                    typeanalysis.bifurcation.doublebin.diameterpathlength.parentdaughter2ratio.mean(i,j) = mean([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).parentdaughter2ratio.values]);
                    typeanalysis.bifurcation.doublebin.diameterpathlength.parentdaughter2ratio.std(i,j)  = std([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).parentdaughter2ratio.values]);
                    typeanalysis.bifurcation.doublebin.diameterpathlength.parentdaughter2ratio.skew(i,j) = skewness([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).parentdaughter2ratio.values],0);
                    typeanalysis.bifurcation.doublebin.diameterpathlength.parentdaughter2ratio.kurt(i,j) = kurtosis([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).parentdaughter2ratio.values],0);
                    
                    typeanalysis.bifurcation.doublebin.diameterpathlength.taperrate.mean(i,j) = sum([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).taperrate.values].*[popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).piecelength.values])/sum([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).piecelength.values]);
                    typeanalysis.bifurcation.doublebin.diameterpathlength.taperrate.std(i,j)  = std([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).taperrate.values]);
                    typeanalysis.bifurcation.doublebin.diameterpathlength.taperrate.skew(i,j) = skewness([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).taperrate.values],0);
                    typeanalysis.bifurcation.doublebin.diameterpathlength.taperrate.kurt(i,j) = kurtosis([popdata.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).taperrate.values],0);
                    
                    
                    typeanalysis.bifurcation.doublebin.diameterpathlength.bifurcationprobability.bylength(i,j) = typeanalysis.bifurcation.doublebin.diameterpathlength.numberbifurcations(i,j) / typeanalysis.bifurcation.doublebin.diameterpathlength.length(i,j);
                    typeanalysis.bifurcation.doublebin.diameterpathlength.terminationprobability.bylength(i,j) = typeanalysis.bifurcation.doublebin.diameterpathlength.numberterminations(i,j) / typeanalysis.bifurcation.doublebin.diameterpathlength.length(i,j);
                    
                    typeanalysis.bifurcation.doublebin.diameterpathlength.bifurcationprobability.bysurfacearea(i,j) = typeanalysis.bifurcation.doublebin.diameterpathlength.numberbifurcations(i,j) / typeanalysis.bifurcation.doublebin.diameterpathlength.surfacearea(i,j);
                    typeanalysis.bifurcation.doublebin.diameterpathlength.terminationprobability.bysurfacearea(i,j) = typeanalysis.bifurcation.doublebin.diameterpathlength.numberterminations(i,j) / typeanalysis.bifurcation.doublebin.diameterpathlength.surfacearea(i,j);
                    
                    typeanalysis.bifurcation.doublebin.diameterpathlength.bifurcationprobability.byvolume(i,j) = typeanalysis.bifurcation.doublebin.diameterpathlength.numberbifurcations(i,j) / typeanalysis.bifurcation.doublebin.diameterpathlength.volume(i,j);
                    typeanalysis.bifurcation.doublebin.diameterpathlength.terminationprobability.byvolume(i,j) = typeanalysis.bifurcation.doublebin.diameterpathlength.numberterminations(i,j) / typeanalysis.bifurcation.doublebin.diameterpathlength.volume(i,j);
                    
                end
            end
        end
        
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.diameter      = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.diameter,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.diameter),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.pathlength    = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.pathlength,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.pathlength),1);
        
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.length      = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.length,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.length),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.surfacearea = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.surfacearea,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.surfacearea),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.volume      = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.volume,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.volume),1);
        
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.numbersegments     = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.numbersegments,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.numbersegments),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.numberbifurcations = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.numberbifurcations,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.numberbifurcations),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.numberterminations = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.numberterminations,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.numberterminations),1);
        
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.rallratio.mean = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio.mean,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio.mean),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.rallratio.std  = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio.std,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio.std),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.rallratio.skew = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio.skew,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio.skew),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.rallratio.kurt = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio.kurt,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio.kurt),1);
        
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.rallratio1.mean = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio1.mean,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio1.mean),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.rallratio1.std  = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio1.std,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio1.std),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.rallratio1.skew = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio1.skew,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio1.skew),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.rallratio1.kurt = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio1.kurt,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio1.kurt),1);
        
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.rallratio2.mean = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio2.mean,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio2.mean),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.rallratio2.std  = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio2.std,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio2.std),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.rallratio2.skew = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio2.skew,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio2.skew),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.rallratio2.kurt = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio2.kurt,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio2.kurt),1);
        
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.rallratio3.mean = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio3.mean,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio3.mean),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.rallratio3.std  = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio3.std,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio3.std),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.rallratio3.skew = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio3.skew,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio3.skew),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.rallratio3.kurt = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio3.kurt,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.rallratio3.kurt),1);
        
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.daughterratio.mean = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.daughterratio.mean,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.daughterratio.mean),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.daughterratio.std  = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.daughterratio.std,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.daughterratio.std),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.daughterratio.skew = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.daughterratio.skew,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.daughterratio.skew),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.daughterratio.kurt = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.daughterratio.kurt,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.daughterratio.kurt),1);
        
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.parentdaughterratio.mean = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.parentdaughterratio.mean,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.parentdaughterratio.mean),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.parentdaughterratio.std  = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.parentdaughterratio.std,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.parentdaughterratio.std),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.parentdaughterratio.skew = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.parentdaughterratio.skew,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.parentdaughterratio.skew),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.parentdaughterratio.kurt = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.parentdaughterratio.kurt,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.parentdaughterratio.kurt),1);
        
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.parentdaughter2ratio.mean = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.parentdaughter2ratio.mean,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.parentdaughter2ratio.mean),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.parentdaughter2ratio.std  = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.parentdaughter2ratio.std,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.parentdaughter2ratio.std),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.parentdaughter2ratio.skew = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.parentdaughter2ratio.skew,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.parentdaughter2ratio.skew),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.parentdaughter2ratio.kurt = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.parentdaughter2ratio.kurt,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.parentdaughter2ratio.kurt),1);
        
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.taperrate.mean = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.taperrate.mean,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.taperrate.mean),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.taperrate.std  = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.taperrate.std,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.taperrate.std),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.taperrate.skew = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.taperrate.skew,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.taperrate.skew),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.taperrate.kurt = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.taperrate.kurt,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.taperrate.kurt),1);
        
        
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.bifurcationprobability.bylength      = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.bifurcationprobability.bylength,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.bifurcationprobability.bylength),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.bifurcationprobability.bysurfacearea = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.bifurcationprobability.bysurfacearea,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.bifurcationprobability.bysurfacearea),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.bifurcationprobability.byvolume      = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.bifurcationprobability.byvolume,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.bifurcationprobability.byvolume),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.bifurcationprobability.diameter    = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.diameter,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.diameter),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.bifurcationprobability.pathlength  = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.pathlength,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.pathlength),1);
        
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.bifurcationprobability.pathlength  = typeanalysis.bifurcation.doublebin.diameterpathlength.array.bifurcationprobability.pathlength(~isnan(typeanalysis.bifurcation.doublebin.diameterpathlength.array.bifurcationprobability.bylength));
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.bifurcationprobability.diameter    = typeanalysis.bifurcation.doublebin.diameterpathlength.array.bifurcationprobability.diameter(~isnan(typeanalysis.bifurcation.doublebin.diameterpathlength.array.bifurcationprobability.bylength));
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.bifurcationprobability.byvolume      = typeanalysis.bifurcation.doublebin.diameterpathlength.array.bifurcationprobability.byvolume(~isnan(typeanalysis.bifurcation.doublebin.diameterpathlength.array.bifurcationprobability.bylength));
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.bifurcationprobability.bysurfacearea = typeanalysis.bifurcation.doublebin.diameterpathlength.array.bifurcationprobability.bysurfacearea(~isnan(typeanalysis.bifurcation.doublebin.diameterpathlength.array.bifurcationprobability.bylength));
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.bifurcationprobability.bylength      = typeanalysis.bifurcation.doublebin.diameterpathlength.array.bifurcationprobability.bylength(~isnan(typeanalysis.bifurcation.doublebin.diameterpathlength.array.bifurcationprobability.bylength));
        
        %typeanalysis.bifurcation.doublebin.diameterpathlength.array.bifurcationprobability.zunzunlength = [typeanalysis.bifurcation.doublebin.diameterpathlength.array.bifurcationprobability.diameter typeanalysis.bifurcation.doublebin.diameterpathlength.array.bifurcationprobability.pathlength typeanalysis.bifurcation.doublebin.diameterpathlength.array.bifurcationprobability.bylength];
        %typeanalysis.bifurcation.doublebin.diameterpathlength.array.bifurcationprobability.zunzunsurfacearea = [typeanalysis.bifurcation.doublebin.diameterpathlength.array.bifurcationprobability.diameter typeanalysis.bifurcation.doublebin.diameterpathlength.array.bifurcationprobability.pathlength typeanalysis.bifurcation.doublebin.diameterpathlength.array.bifurcationprobability.bysurfacearea];
        %typeanalysis.bifurcation.doublebin.diameterpathlength.array.bifurcationprobability.zunzunvolume = [typeanalysis.bifurcation.doublebin.diameterpathlength.array.bifurcationprobability.diameter typeanalysis.bifurcation.doublebin.diameterpathlength.array.bifurcationprobability.pathlength typeanalysis.bifurcation.doublebin.diameterpathlength.array.bifurcationprobability.byvolume];
        
        
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.terminationprobability.bylength      = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.terminationprobability.bylength,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.terminationprobability.bylength),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.terminationprobability.bysurfacearea = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.terminationprobability.bysurfacearea,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.terminationprobability.bysurfacearea),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.terminationprobability.byvolume      = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.terminationprobability.byvolume,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.terminationprobability.byvolume),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.terminationprobability.diameter    = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.diameter,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.diameter),1);
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.terminationprobability.pathlength  = reshape(typeanalysis.bifurcation.doublebin.diameterpathlength.pathlength,numel(typeanalysis.bifurcation.doublebin.diameterpathlength.pathlength),1);
        
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.terminationprobability.pathlength  = typeanalysis.bifurcation.doublebin.diameterpathlength.array.terminationprobability.pathlength(~isnan(typeanalysis.bifurcation.doublebin.diameterpathlength.array.terminationprobability.bylength));
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.terminationprobability.diameter    = typeanalysis.bifurcation.doublebin.diameterpathlength.array.terminationprobability.diameter(~isnan(typeanalysis.bifurcation.doublebin.diameterpathlength.array.terminationprobability.bylength));
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.terminationprobability.byvolume      = typeanalysis.bifurcation.doublebin.diameterpathlength.array.terminationprobability.byvolume(~isnan(typeanalysis.bifurcation.doublebin.diameterpathlength.array.terminationprobability.bylength));
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.terminationprobability.bysurfacearea = typeanalysis.bifurcation.doublebin.diameterpathlength.array.terminationprobability.bysurfacearea(~isnan(typeanalysis.bifurcation.doublebin.diameterpathlength.array.terminationprobability.bylength));
        typeanalysis.bifurcation.doublebin.diameterpathlength.array.terminationprobability.bylength      = typeanalysis.bifurcation.doublebin.diameterpathlength.array.terminationprobability.bylength(~isnan(typeanalysis.bifurcation.doublebin.diameterpathlength.array.terminationprobability.bylength));
        
        %typeanalysis.bifurcation.doublebin.diameterpathlength.array.terminationprobability.zunzunlength = [typeanalysis.bifurcation.doublebin.diameterpathlength.array.terminationprobability.diameter typeanalysis.bifurcation.doublebin.diameterpathlength.array.terminationprobability.pathlength typeanalysis.bifurcation.doublebin.diameterpathlength.array.terminationprobability.bylength];
        %typeanalysis.bifurcation.doublebin.diameterpathlength.array.terminationprobability.zunzunsurfacearea = [typeanalysis.bifurcation.doublebin.diameterpathlength.array.terminationprobability.diameter typeanalysis.bifurcation.doublebin.diameterpathlength.array.terminationprobability.pathlength typeanalysis.bifurcation.doublebin.diameterpathlength.array.terminationprobability.bysurfacearea];
        %typeanalysis.bifurcation.doublebin.diameterpathlength.array.terminationprobability.zunzunvolume = [typeanalysis.bifurcation.doublebin.diameterpathlength.array.terminationprobability.diameter typeanalysis.bifurcation.doublebin.diameterpathlength.array.terminationprobability.pathlength typeanalysis.bifurcation.doublebin.diameterpathlength.array.terminationprobability.byvolume];
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        % Begin termination double bin analysis
        
        for i = 1:maxdiameterbin
            for j = 1:maxpathlengthbin
                popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values            = [];
                popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio1.values           = [];
                popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio2.values           = [];
                popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio3.values           = [];
                popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).daughterratio.values        = [];
                popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).parentdaughterratio.values  = [];
                popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).parentdaughter2ratio.values = [];
                popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).meandiameter.values         = [];
                popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).taperrate.values            = [];
                popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).piecelength.values          = [];
            end
        end
        
        
        for i = 1:length(data.individual)
            
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            
            for j = 1:length(inddata.termination.doublebins.diameterbins)
                
                for k = 1:length(inddata.termination.doublebins.diameterbins(j).pathlengthbins)
                    
                    inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).length                      = 0;
                    inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).surfacearea                 = 0;
                    inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).volume                      = 0;
                    inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).numbersegments              = 0;
                    inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations          = 0;
                    inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).numberterminations          = 0;
                    inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio.values            = [];
                    inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio1.values           = [];
                    inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio2.values           = [];
                    inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio3.values           = [];
                    inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).daughterratio.values        = [];
                    inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).parentdaughterratio.values  = [];
                    inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).parentdaughter2ratio.values = [];
                    inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).meandiameter.values         = [];
                    inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).taperrate.values            = [];
                    inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).piecelength.values          = [];
                    
                    
                    if isfield(inddata.termination.doublebins.diameterbins(j).pathlengthbins(k),'piece') == 1 && isfield(inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).piece,'id')
                        
                        inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).length                      = sum([inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).piece.length]);
                        inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).surfacearea                 = sum([inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).piece.surfacearea]);
                        inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).volume                      = sum([inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).piece.volume]);
                        inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).numbersegments              = length(unique([inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).piece.cable]));
                        inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations          = 0;
                        inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).numberterminations          = 0;
                        inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio.values            = [inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).piece.rallratio];
                        inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio1.values           = [inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).piece.rallratio1];
                        inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio2.values           = [inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).piece.rallratio2];
                        inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio3.values           = [inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).piece.rallratio3];
                        inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).daughterratio.values        = [inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).piece.daughterratio];
                        inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).parentdaughterratio.values  = [inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).piece.parentdaughterratio];
                        inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).parentdaughter2ratio.values = [inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).piece.parentdaughter2ratio];
                        inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).meandiameter.values         = ([inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).piece.proximaldiameter]+[inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).piece.distaldiameter])/2;
                        inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).taperrate.values            = [inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).piece.taperrate];
                        inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).piecelength.values          = [inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).piece.length];
                        
                        for m = 1:length(inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).piece)
                            if strcmp(inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).piece(m).distaltype,'bifurcation')==1
                                inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations = 1 + inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations;
                            end
                            if strcmp(inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).piece(m).distaltype,'m-furcation')==1
                                inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations = length(inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).piece(m).daughters) - 1 + inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations;
                            end
                            if strcmp(inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).piece(m).distaltype,'termination')==1
                                inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).numberterminations = 1 + inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).numberterminations;
                            end
                        end
                    end
                    
                    if isfield(popdata.termination.doublebins,'diameterbins') == 0; nextvalue = 1;
                    elseif j > length(popdata.termination.doublebins.diameterbins); nextvalue = 1;
                    elseif isfield(popdata.termination.doublebins.diameterbins(j).pathlengthbins(k),'length') == 0; nextvalue = 1;
                    elseif isfield(popdata.termination.doublebins.diameterbins(j).pathlengthbins(k).length,'values') == 0; nextvalue = 1;
                    else nextvalue = 1 + length(popdata.termination.doublebins.diameterbins(j).pathlengthbins(k).length.values);
                    end
                    popdata.termination.doublebins.diameterbins(j).pathlengthbins(k).length.values(nextvalue)             = inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).length;
                    popdata.termination.doublebins.diameterbins(j).pathlengthbins(k).surfacearea.values(nextvalue)        = inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).surfacearea;
                    popdata.termination.doublebins.diameterbins(j).pathlengthbins(k).volume.values(nextvalue)             = inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).volume;
                    popdata.termination.doublebins.diameterbins(j).pathlengthbins(k).numbersegments.values(nextvalue)     = inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).numbersegments;
                    popdata.termination.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations.values(nextvalue) = inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations;
                    popdata.termination.doublebins.diameterbins(j).pathlengthbins(k).numberterminations.values(nextvalue) = inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).numberterminations;
                    popdata.termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio.values                     = [ [popdata.termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio.values] [inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio.values] ];
                    popdata.termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio1.values                    = [ [popdata.termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio1.values] [inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio1.values] ];
                    popdata.termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio2.values                    = [ [popdata.termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio2.values] [inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio2.values] ];
                    popdata.termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio3.values                    = [ [popdata.termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio3.values] [inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio3.values] ];
                    popdata.termination.doublebins.diameterbins(j).pathlengthbins(k).daughterratio.values                 = [ [popdata.termination.doublebins.diameterbins(j).pathlengthbins(k).daughterratio.values] [inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).daughterratio.values] ];
                    popdata.termination.doublebins.diameterbins(j).pathlengthbins(k).parentdaughterratio.values           = [ [popdata.termination.doublebins.diameterbins(j).pathlengthbins(k).parentdaughterratio.values] [inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).parentdaughterratio.values] ];
                    popdata.termination.doublebins.diameterbins(j).pathlengthbins(k).parentdaughter2ratio.values          = [ [popdata.termination.doublebins.diameterbins(j).pathlengthbins(k).parentdaughter2ratio.values] [inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).parentdaughter2ratio.values] ];
                    popdata.termination.doublebins.diameterbins(j).pathlengthbins(k).meandiameter.values                  = [ [popdata.termination.doublebins.diameterbins(j).pathlengthbins(k).meandiameter.values] [inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).meandiameter.values] ];
                    popdata.termination.doublebins.diameterbins(j).pathlengthbins(k).taperrate.values                     = [ [popdata.termination.doublebins.diameterbins(j).pathlengthbins(k).taperrate.values] [inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).taperrate.values] ];
                    popdata.termination.doublebins.diameterbins(j).pathlengthbins(k).piecelength.values                   = [ [popdata.termination.doublebins.diameterbins(j).pathlengthbins(k).piecelength.values] [inddata.termination.doublebins.diameterbins(j).pathlengthbins(k).piecelength.values] ];
                    clear nextvalue;
                    
                end
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        
        for i = 1:length(popdata.termination.doublebins.diameterbins)
            
            for j = 1:length(popdata.termination.doublebins.diameterbins(i).pathlengthbins)
                
                typeanalysis.termination.doublebin.diameterpathlength.diameter(i,j)   = popdata.diameterbinmiddles(i);
                typeanalysis.termination.doublebin.diameterpathlength.pathlength(i,j) = (distancebinwidth * j) - (distancebinwidth / 2);
                
                if isfield(popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).length,'values') == 1
                    
                    typeanalysis.termination.doublebin.diameterpathlength.length(i,j)      = sum([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).length.values]);
                    typeanalysis.termination.doublebin.diameterpathlength.surfacearea(i,j) = sum([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).surfacearea.values]);
                    typeanalysis.termination.doublebin.diameterpathlength.volume(i,j)      = sum([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).volume.values]);
                    
                    typeanalysis.termination.doublebin.diameterpathlength.numbersegments(i,j)     = sum([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).numbersegments.values]);
                    typeanalysis.termination.doublebin.diameterpathlength.numberbifurcations(i,j) = sum([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).numberbifurcations.values]);
                    typeanalysis.termination.doublebin.diameterpathlength.numberterminations(i,j) = sum([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).numberterminations.values]);
                    
                    typeanalysis.termination.doublebin.diameterpathlength.rallratio.mean(i,j) = mean([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values]);
                    typeanalysis.termination.doublebin.diameterpathlength.rallratio.std(i,j)  = std([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values]);
                    typeanalysis.termination.doublebin.diameterpathlength.rallratio.skew(i,j) = skewness([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values],0);
                    typeanalysis.termination.doublebin.diameterpathlength.rallratio.kurt(i,j) = kurtosis([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values],0);
                    
                    typeanalysis.termination.doublebin.diameterpathlength.rallratio1.mean(i,j) = mean([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio1.values]);
                    typeanalysis.termination.doublebin.diameterpathlength.rallratio1.std(i,j)  = std([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio1.values]);
                    typeanalysis.termination.doublebin.diameterpathlength.rallratio1.skew(i,j) = skewness([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio1.values],0);
                    typeanalysis.termination.doublebin.diameterpathlength.rallratio1.kurt(i,j) = kurtosis([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio1.values],0);
                    
                    typeanalysis.termination.doublebin.diameterpathlength.rallratio2.mean(i,j) = mean([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio2.values]);
                    typeanalysis.termination.doublebin.diameterpathlength.rallratio2.std(i,j)  = std([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio2.values]);
                    typeanalysis.termination.doublebin.diameterpathlength.rallratio2.skew(i,j) = skewness([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio2.values],0);
                    typeanalysis.termination.doublebin.diameterpathlength.rallratio2.kurt(i,j) = kurtosis([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio2.values],0);
                    
                    typeanalysis.termination.doublebin.diameterpathlength.rallratio3.mean(i,j) = mean([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio3.values]);
                    typeanalysis.termination.doublebin.diameterpathlength.rallratio3.std(i,j)  = std([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio3.values]);
                    typeanalysis.termination.doublebin.diameterpathlength.rallratio3.skew(i,j) = skewness([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio3.values],0);
                    typeanalysis.termination.doublebin.diameterpathlength.rallratio3.kurt(i,j) = kurtosis([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio3.values],0);
                    
                    typeanalysis.termination.doublebin.diameterpathlength.daughterratio.mean(i,j) = mean([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).daughterratio.values]);
                    typeanalysis.termination.doublebin.diameterpathlength.daughterratio.std(i,j)  = std([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).daughterratio.values]);
                    typeanalysis.termination.doublebin.diameterpathlength.daughterratio.skew(i,j) = skewness([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).daughterratio.values],0);
                    typeanalysis.termination.doublebin.diameterpathlength.daughterratio.kurt(i,j) = kurtosis([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).daughterratio.values],0);
                    
                    typeanalysis.termination.doublebin.diameterpathlength.parentdaughterratio.mean(i,j) = mean([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).parentdaughterratio.values]);
                    typeanalysis.termination.doublebin.diameterpathlength.parentdaughterratio.std(i,j)  = std([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).parentdaughterratio.values]);
                    typeanalysis.termination.doublebin.diameterpathlength.parentdaughterratio.skew(i,j) = skewness([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).parentdaughterratio.values],0);
                    typeanalysis.termination.doublebin.diameterpathlength.parentdaughterratio.kurt(i,j) = kurtosis([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).parentdaughterratio.values],0);
                    
                    typeanalysis.termination.doublebin.diameterpathlength.parentdaughter2ratio.mean(i,j) = mean([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).parentdaughter2ratio.values]);
                    typeanalysis.termination.doublebin.diameterpathlength.parentdaughter2ratio.std(i,j)  = std([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).parentdaughter2ratio.values]);
                    typeanalysis.termination.doublebin.diameterpathlength.parentdaughter2ratio.skew(i,j) = skewness([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).parentdaughter2ratio.values],0);
                    typeanalysis.termination.doublebin.diameterpathlength.parentdaughter2ratio.kurt(i,j) = kurtosis([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).parentdaughter2ratio.values],0);
                    
                    typeanalysis.termination.doublebin.diameterpathlength.taperrate.mean(i,j) = sum([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).taperrate.values].*[popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).piecelength.values])/sum([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).piecelength.values]);
                    typeanalysis.termination.doublebin.diameterpathlength.taperrate.std(i,j)  = std([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).taperrate.values]);
                    typeanalysis.termination.doublebin.diameterpathlength.taperrate.skew(i,j) = skewness([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).taperrate.values],0);
                    typeanalysis.termination.doublebin.diameterpathlength.taperrate.kurt(i,j) = kurtosis([popdata.termination.doublebins.diameterbins(i).pathlengthbins(j).taperrate.values],0);
                    
                    
                    typeanalysis.termination.doublebin.diameterpathlength.bifurcationprobability.bylength(i,j) = typeanalysis.termination.doublebin.diameterpathlength.numberbifurcations(i,j) / typeanalysis.termination.doublebin.diameterpathlength.length(i,j);
                    typeanalysis.termination.doublebin.diameterpathlength.terminationprobability.bylength(i,j) = typeanalysis.termination.doublebin.diameterpathlength.numberterminations(i,j) / typeanalysis.termination.doublebin.diameterpathlength.length(i,j);
                    
                    typeanalysis.termination.doublebin.diameterpathlength.bifurcationprobability.bysurfacearea(i,j) = typeanalysis.termination.doublebin.diameterpathlength.numberbifurcations(i,j) / typeanalysis.termination.doublebin.diameterpathlength.surfacearea(i,j);
                    typeanalysis.termination.doublebin.diameterpathlength.terminationprobability.bysurfacearea(i,j) = typeanalysis.termination.doublebin.diameterpathlength.numberterminations(i,j) / typeanalysis.termination.doublebin.diameterpathlength.surfacearea(i,j);
                    
                    typeanalysis.termination.doublebin.diameterpathlength.bifurcationprobability.byvolume(i,j) = typeanalysis.termination.doublebin.diameterpathlength.numberbifurcations(i,j) / typeanalysis.termination.doublebin.diameterpathlength.volume(i,j);
                    typeanalysis.termination.doublebin.diameterpathlength.terminationprobability.byvolume(i,j) = typeanalysis.termination.doublebin.diameterpathlength.numberterminations(i,j) / typeanalysis.termination.doublebin.diameterpathlength.volume(i,j);
                    
                end
            end
        end
        
        typeanalysis.termination.doublebin.diameterpathlength.array.diameter      = reshape(typeanalysis.termination.doublebin.diameterpathlength.diameter,numel(typeanalysis.termination.doublebin.diameterpathlength.diameter),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.pathlength    = reshape(typeanalysis.termination.doublebin.diameterpathlength.pathlength,numel(typeanalysis.termination.doublebin.diameterpathlength.pathlength),1);
        
        typeanalysis.termination.doublebin.diameterpathlength.array.length      = reshape(typeanalysis.termination.doublebin.diameterpathlength.length,numel(typeanalysis.termination.doublebin.diameterpathlength.length),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.surfacearea = reshape(typeanalysis.termination.doublebin.diameterpathlength.surfacearea,numel(typeanalysis.termination.doublebin.diameterpathlength.surfacearea),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.volume      = reshape(typeanalysis.termination.doublebin.diameterpathlength.volume,numel(typeanalysis.termination.doublebin.diameterpathlength.volume),1);
        
        typeanalysis.termination.doublebin.diameterpathlength.array.numbersegments     = reshape(typeanalysis.termination.doublebin.diameterpathlength.numbersegments,numel(typeanalysis.termination.doublebin.diameterpathlength.numbersegments),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.numberbifurcations = reshape(typeanalysis.termination.doublebin.diameterpathlength.numberbifurcations,numel(typeanalysis.termination.doublebin.diameterpathlength.numberbifurcations),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.numberterminations = reshape(typeanalysis.termination.doublebin.diameterpathlength.numberterminations,numel(typeanalysis.termination.doublebin.diameterpathlength.numberterminations),1);
        
        typeanalysis.termination.doublebin.diameterpathlength.array.rallratio.mean = reshape(typeanalysis.termination.doublebin.diameterpathlength.rallratio.mean,numel(typeanalysis.termination.doublebin.diameterpathlength.rallratio.mean),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.rallratio.std  = reshape(typeanalysis.termination.doublebin.diameterpathlength.rallratio.std,numel(typeanalysis.termination.doublebin.diameterpathlength.rallratio.std),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.rallratio.skew = reshape(typeanalysis.termination.doublebin.diameterpathlength.rallratio.skew,numel(typeanalysis.termination.doublebin.diameterpathlength.rallratio.skew),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.rallratio.kurt = reshape(typeanalysis.termination.doublebin.diameterpathlength.rallratio.kurt,numel(typeanalysis.termination.doublebin.diameterpathlength.rallratio.kurt),1);
        
        typeanalysis.termination.doublebin.diameterpathlength.array.rallratio1.mean = reshape(typeanalysis.termination.doublebin.diameterpathlength.rallratio1.mean,numel(typeanalysis.termination.doublebin.diameterpathlength.rallratio1.mean),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.rallratio1.std  = reshape(typeanalysis.termination.doublebin.diameterpathlength.rallratio1.std,numel(typeanalysis.termination.doublebin.diameterpathlength.rallratio1.std),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.rallratio1.skew = reshape(typeanalysis.termination.doublebin.diameterpathlength.rallratio1.skew,numel(typeanalysis.termination.doublebin.diameterpathlength.rallratio1.skew),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.rallratio1.kurt = reshape(typeanalysis.termination.doublebin.diameterpathlength.rallratio1.kurt,numel(typeanalysis.termination.doublebin.diameterpathlength.rallratio1.kurt),1);
        
        typeanalysis.termination.doublebin.diameterpathlength.array.rallratio2.mean = reshape(typeanalysis.termination.doublebin.diameterpathlength.rallratio2.mean,numel(typeanalysis.termination.doublebin.diameterpathlength.rallratio2.mean),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.rallratio2.std  = reshape(typeanalysis.termination.doublebin.diameterpathlength.rallratio2.std,numel(typeanalysis.termination.doublebin.diameterpathlength.rallratio2.std),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.rallratio2.skew = reshape(typeanalysis.termination.doublebin.diameterpathlength.rallratio2.skew,numel(typeanalysis.termination.doublebin.diameterpathlength.rallratio2.skew),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.rallratio2.kurt = reshape(typeanalysis.termination.doublebin.diameterpathlength.rallratio2.kurt,numel(typeanalysis.termination.doublebin.diameterpathlength.rallratio2.kurt),1);
        
        typeanalysis.termination.doublebin.diameterpathlength.array.rallratio3.mean = reshape(typeanalysis.termination.doublebin.diameterpathlength.rallratio3.mean,numel(typeanalysis.termination.doublebin.diameterpathlength.rallratio3.mean),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.rallratio3.std  = reshape(typeanalysis.termination.doublebin.diameterpathlength.rallratio3.std,numel(typeanalysis.termination.doublebin.diameterpathlength.rallratio3.std),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.rallratio3.skew = reshape(typeanalysis.termination.doublebin.diameterpathlength.rallratio3.skew,numel(typeanalysis.termination.doublebin.diameterpathlength.rallratio3.skew),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.rallratio3.kurt = reshape(typeanalysis.termination.doublebin.diameterpathlength.rallratio3.kurt,numel(typeanalysis.termination.doublebin.diameterpathlength.rallratio3.kurt),1);
        
        typeanalysis.termination.doublebin.diameterpathlength.array.daughterratio.mean = reshape(typeanalysis.termination.doublebin.diameterpathlength.daughterratio.mean,numel(typeanalysis.termination.doublebin.diameterpathlength.daughterratio.mean),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.daughterratio.std  = reshape(typeanalysis.termination.doublebin.diameterpathlength.daughterratio.std,numel(typeanalysis.termination.doublebin.diameterpathlength.daughterratio.std),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.daughterratio.skew = reshape(typeanalysis.termination.doublebin.diameterpathlength.daughterratio.skew,numel(typeanalysis.termination.doublebin.diameterpathlength.daughterratio.skew),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.daughterratio.kurt = reshape(typeanalysis.termination.doublebin.diameterpathlength.daughterratio.kurt,numel(typeanalysis.termination.doublebin.diameterpathlength.daughterratio.kurt),1);
        
        typeanalysis.termination.doublebin.diameterpathlength.array.parentdaughterratio.mean = reshape(typeanalysis.termination.doublebin.diameterpathlength.parentdaughterratio.mean,numel(typeanalysis.termination.doublebin.diameterpathlength.parentdaughterratio.mean),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.parentdaughterratio.std  = reshape(typeanalysis.termination.doublebin.diameterpathlength.parentdaughterratio.std,numel(typeanalysis.termination.doublebin.diameterpathlength.parentdaughterratio.std),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.parentdaughterratio.skew = reshape(typeanalysis.termination.doublebin.diameterpathlength.parentdaughterratio.skew,numel(typeanalysis.termination.doublebin.diameterpathlength.parentdaughterratio.skew),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.parentdaughterratio.kurt = reshape(typeanalysis.termination.doublebin.diameterpathlength.parentdaughterratio.kurt,numel(typeanalysis.termination.doublebin.diameterpathlength.parentdaughterratio.kurt),1);
        
        typeanalysis.termination.doublebin.diameterpathlength.array.parentdaughter2ratio.mean = reshape(typeanalysis.termination.doublebin.diameterpathlength.parentdaughter2ratio.mean,numel(typeanalysis.termination.doublebin.diameterpathlength.parentdaughter2ratio.mean),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.parentdaughter2ratio.std  = reshape(typeanalysis.termination.doublebin.diameterpathlength.parentdaughter2ratio.std,numel(typeanalysis.termination.doublebin.diameterpathlength.parentdaughter2ratio.std),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.parentdaughter2ratio.skew = reshape(typeanalysis.termination.doublebin.diameterpathlength.parentdaughter2ratio.skew,numel(typeanalysis.termination.doublebin.diameterpathlength.parentdaughter2ratio.skew),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.parentdaughter2ratio.kurt = reshape(typeanalysis.termination.doublebin.diameterpathlength.parentdaughter2ratio.kurt,numel(typeanalysis.termination.doublebin.diameterpathlength.parentdaughter2ratio.kurt),1);
        
        typeanalysis.termination.doublebin.diameterpathlength.array.taperrate.mean = reshape(typeanalysis.termination.doublebin.diameterpathlength.taperrate.mean,numel(typeanalysis.termination.doublebin.diameterpathlength.taperrate.mean),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.taperrate.std  = reshape(typeanalysis.termination.doublebin.diameterpathlength.taperrate.std,numel(typeanalysis.termination.doublebin.diameterpathlength.taperrate.std),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.taperrate.skew = reshape(typeanalysis.termination.doublebin.diameterpathlength.taperrate.skew,numel(typeanalysis.termination.doublebin.diameterpathlength.taperrate.skew),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.taperrate.kurt = reshape(typeanalysis.termination.doublebin.diameterpathlength.taperrate.kurt,numel(typeanalysis.termination.doublebin.diameterpathlength.taperrate.kurt),1);
        
        
        typeanalysis.termination.doublebin.diameterpathlength.array.bifurcationprobability.bylength      = reshape(typeanalysis.termination.doublebin.diameterpathlength.bifurcationprobability.bylength,numel(typeanalysis.termination.doublebin.diameterpathlength.bifurcationprobability.bylength),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.bifurcationprobability.bysurfacearea = reshape(typeanalysis.termination.doublebin.diameterpathlength.bifurcationprobability.bysurfacearea,numel(typeanalysis.termination.doublebin.diameterpathlength.bifurcationprobability.bysurfacearea),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.bifurcationprobability.byvolume      = reshape(typeanalysis.termination.doublebin.diameterpathlength.bifurcationprobability.byvolume,numel(typeanalysis.termination.doublebin.diameterpathlength.bifurcationprobability.byvolume),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.bifurcationprobability.diameter    = reshape(typeanalysis.termination.doublebin.diameterpathlength.diameter,numel(typeanalysis.termination.doublebin.diameterpathlength.diameter),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.bifurcationprobability.pathlength  = reshape(typeanalysis.termination.doublebin.diameterpathlength.pathlength,numel(typeanalysis.termination.doublebin.diameterpathlength.pathlength),1);
        
        typeanalysis.termination.doublebin.diameterpathlength.array.bifurcationprobability.pathlength  = typeanalysis.termination.doublebin.diameterpathlength.array.bifurcationprobability.pathlength(~isnan(typeanalysis.termination.doublebin.diameterpathlength.array.bifurcationprobability.bylength));
        typeanalysis.termination.doublebin.diameterpathlength.array.bifurcationprobability.diameter    = typeanalysis.termination.doublebin.diameterpathlength.array.bifurcationprobability.diameter(~isnan(typeanalysis.termination.doublebin.diameterpathlength.array.bifurcationprobability.bylength));
        typeanalysis.termination.doublebin.diameterpathlength.array.bifurcationprobability.byvolume      = typeanalysis.termination.doublebin.diameterpathlength.array.bifurcationprobability.byvolume(~isnan(typeanalysis.termination.doublebin.diameterpathlength.array.bifurcationprobability.bylength));
        typeanalysis.termination.doublebin.diameterpathlength.array.bifurcationprobability.bysurfacearea = typeanalysis.termination.doublebin.diameterpathlength.array.bifurcationprobability.bysurfacearea(~isnan(typeanalysis.termination.doublebin.diameterpathlength.array.bifurcationprobability.bylength));
        typeanalysis.termination.doublebin.diameterpathlength.array.bifurcationprobability.bylength      = typeanalysis.termination.doublebin.diameterpathlength.array.bifurcationprobability.bylength(~isnan(typeanalysis.termination.doublebin.diameterpathlength.array.bifurcationprobability.bylength));
        
        %typeanalysis.termination.doublebin.diameterpathlength.array.bifurcationprobability.zunzunlength = [typeanalysis.termination.doublebin.diameterpathlength.array.bifurcationprobability.diameter typeanalysis.termination.doublebin.diameterpathlength.array.bifurcationprobability.pathlength typeanalysis.termination.doublebin.diameterpathlength.array.bifurcationprobability.bylength];
        %typeanalysis.termination.doublebin.diameterpathlength.array.bifurcationprobability.zunzunsurfacearea = [typeanalysis.termination.doublebin.diameterpathlength.array.bifurcationprobability.diameter typeanalysis.termination.doublebin.diameterpathlength.array.bifurcationprobability.pathlength typeanalysis.termination.doublebin.diameterpathlength.array.bifurcationprobability.bysurfacearea];
        %typeanalysis.termination.doublebin.diameterpathlength.array.bifurcationprobability.zunzunvolume = [typeanalysis.termination.doublebin.diameterpathlength.array.bifurcationprobability.diameter typeanalysis.termination.doublebin.diameterpathlength.array.bifurcationprobability.pathlength typeanalysis.termination.doublebin.diameterpathlength.array.bifurcationprobability.byvolume];
        
        
        typeanalysis.termination.doublebin.diameterpathlength.array.terminationprobability.bylength      = reshape(typeanalysis.termination.doublebin.diameterpathlength.terminationprobability.bylength,numel(typeanalysis.termination.doublebin.diameterpathlength.terminationprobability.bylength),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.terminationprobability.bysurfacearea = reshape(typeanalysis.termination.doublebin.diameterpathlength.terminationprobability.bysurfacearea,numel(typeanalysis.termination.doublebin.diameterpathlength.terminationprobability.bysurfacearea),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.terminationprobability.byvolume      = reshape(typeanalysis.termination.doublebin.diameterpathlength.terminationprobability.byvolume,numel(typeanalysis.termination.doublebin.diameterpathlength.terminationprobability.byvolume),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.terminationprobability.diameter    = reshape(typeanalysis.termination.doublebin.diameterpathlength.diameter,numel(typeanalysis.termination.doublebin.diameterpathlength.diameter),1);
        typeanalysis.termination.doublebin.diameterpathlength.array.terminationprobability.pathlength  = reshape(typeanalysis.termination.doublebin.diameterpathlength.pathlength,numel(typeanalysis.termination.doublebin.diameterpathlength.pathlength),1);
        
        typeanalysis.termination.doublebin.diameterpathlength.array.terminationprobability.pathlength  = typeanalysis.termination.doublebin.diameterpathlength.array.terminationprobability.pathlength(~isnan(typeanalysis.termination.doublebin.diameterpathlength.array.terminationprobability.bylength));
        typeanalysis.termination.doublebin.diameterpathlength.array.terminationprobability.diameter    = typeanalysis.termination.doublebin.diameterpathlength.array.terminationprobability.diameter(~isnan(typeanalysis.termination.doublebin.diameterpathlength.array.terminationprobability.bylength));
        typeanalysis.termination.doublebin.diameterpathlength.array.terminationprobability.byvolume      = typeanalysis.termination.doublebin.diameterpathlength.array.terminationprobability.byvolume(~isnan(typeanalysis.termination.doublebin.diameterpathlength.array.terminationprobability.bylength));
        typeanalysis.termination.doublebin.diameterpathlength.array.terminationprobability.bysurfacearea = typeanalysis.termination.doublebin.diameterpathlength.array.terminationprobability.bysurfacearea(~isnan(typeanalysis.termination.doublebin.diameterpathlength.array.terminationprobability.bylength));
        typeanalysis.termination.doublebin.diameterpathlength.array.terminationprobability.bylength      = typeanalysis.termination.doublebin.diameterpathlength.array.terminationprobability.bylength(~isnan(typeanalysis.termination.doublebin.diameterpathlength.array.terminationprobability.bylength));
        
        %typeanalysis.termination.doublebin.diameterpathlength.array.terminationprobability.zunzunlength = [typeanalysis.termination.doublebin.diameterpathlength.array.terminationprobability.diameter typeanalysis.termination.doublebin.diameterpathlength.array.terminationprobability.pathlength typeanalysis.termination.doublebin.diameterpathlength.array.terminationprobability.bylength];
        %typeanalysis.termination.doublebin.diameterpathlength.array.terminationprobability.zunzunsurfacearea = [typeanalysis.termination.doublebin.diameterpathlength.array.terminationprobability.diameter typeanalysis.termination.doublebin.diameterpathlength.array.terminationprobability.pathlength typeanalysis.termination.doublebin.diameterpathlength.array.terminationprobability.bysurfacearea];
        %typeanalysis.termination.doublebin.diameterpathlength.array.terminationprobability.zunzunvolume = [typeanalysis.termination.doublebin.diameterpathlength.array.terminationprobability.diameter typeanalysis.termination.doublebin.diameterpathlength.array.terminationprobability.pathlength typeanalysis.termination.doublebin.diameterpathlength.array.terminationprobability.byvolume];
        
        eval(['analysis.' currentpiecetype ' = typeanalysis;']);
        eval(['data.population.' currentpiecetype ' = popdata;']);
        
    end
end








warning('on', 'MATLAB:divideByZero');