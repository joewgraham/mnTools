function [data,analysis]   = doublebinanalyzer2(data,analysis)

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
            clear branchlengthdiameterbinlength;
            for dbin = 1:diameterbinlength(ind)
                   eval(['branchlengthdiameterbinlength(dbin) = length(data.individual(ind).' currentpiecetype '.doublebins.diameterbins(dbin).branchlengthbins);']);   
            end
            branchlengthbinlength(ind) = max(branchlengthdiameterbinlength); 
        end
        %old way
        %for ind = 1:length(data.individual)
        %    eval(['diameterbinlength(ind)   = length(data.individual(ind).' currentpiecetype '.doublebins.diameterbins);']);
        %    eval(['branchlengthbinlength(ind,dbin) = length(data.individual(ind).' currentpiecetype '.doublebins.diameterbins(1).branchlengthbins);']);   
        %end
        %end old way
        maxdiameterbin = max(diameterbinlength);
        maxbranchlengthbin = max(branchlengthbinlength);
        eval(['branchlengthbinwidth = option.' currentpiecetype '.branchlengthbinwidth;']);
        
        for i = 1:maxdiameterbin
            for j = 1:maxbranchlengthbin
                popdata.doublebins.diameterbins(i).branchlengthbins(j).rallratio.values            = [];
                popdata.doublebins.diameterbins(i).branchlengthbins(j).rallratio1.values           = [];
                popdata.doublebins.diameterbins(i).branchlengthbins(j).rallratio2.values           = [];
                popdata.doublebins.diameterbins(i).branchlengthbins(j).rallratio3.values           = [];
                popdata.doublebins.diameterbins(i).branchlengthbins(j).daughterratio.values        = [];
                popdata.doublebins.diameterbins(i).branchlengthbins(j).parentdaughterratio.values  = [];
                popdata.doublebins.diameterbins(i).branchlengthbins(j).parentdaughter2ratio.values = [];
                popdata.doublebins.diameterbins(i).branchlengthbins(j).meandiameter.values         = [];
                popdata.doublebins.diameterbins(i).branchlengthbins(j).taperrate.values            = [];
                popdata.doublebins.diameterbins(i).branchlengthbins(j).piecelength.values          = [];
            end
        end
        
        
        for i = 1:length(data.individual)
            
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            
            for j = 1:length(inddata.doublebins.diameterbins)
                
                for k = 1:length(inddata.doublebins.diameterbins(j).branchlengthbins)
                    
                    inddata.doublebins.diameterbins(j).branchlengthbins(k).length                      = 0;
                    inddata.doublebins.diameterbins(j).branchlengthbins(k).surfacearea                 = 0;
                    inddata.doublebins.diameterbins(j).branchlengthbins(k).volume                      = 0;
                    inddata.doublebins.diameterbins(j).branchlengthbins(k).numbersegments              = 0;
                    inddata.doublebins.diameterbins(j).branchlengthbins(k).numberbifurcations          = 0;
                    inddata.doublebins.diameterbins(j).branchlengthbins(k).numberterminations          = 0;
                    inddata.doublebins.diameterbins(j).branchlengthbins(k).numberbifurcatingbranches   = 0;
                    inddata.doublebins.diameterbins(j).branchlengthbins(k).numberterminatingbranches   = 0;
                    inddata.doublebins.diameterbins(j).branchlengthbins(k).rallratio.values            = [];
                    inddata.doublebins.diameterbins(j).branchlengthbins(k).rallratio1.values           = [];
                    inddata.doublebins.diameterbins(j).branchlengthbins(k).rallratio2.values           = [];
                    inddata.doublebins.diameterbins(j).branchlengthbins(k).rallratio3.values           = [];
                    inddata.doublebins.diameterbins(j).branchlengthbins(k).daughterratio.values        = [];
                    inddata.doublebins.diameterbins(j).branchlengthbins(k).parentdaughterratio.values  = [];
                    inddata.doublebins.diameterbins(j).branchlengthbins(k).parentdaughter2ratio.values = [];
                    inddata.doublebins.diameterbins(j).branchlengthbins(k).meandiameter.values         = [];
                    inddata.doublebins.diameterbins(j).branchlengthbins(k).taperrate.values            = [];
                    inddata.doublebins.diameterbins(j).branchlengthbins(k).piecelength.values          = [];
                    
                    
                    if isfield(inddata.doublebins.diameterbins(j).branchlengthbins(k),'piece') == 1 && isfield(inddata.doublebins.diameterbins(j).branchlengthbins(k).piece,'id')
                        
                        inddata.doublebins.diameterbins(j).branchlengthbins(k).length                      = sum([inddata.doublebins.diameterbins(j).branchlengthbins(k).piece.length]);
                        inddata.doublebins.diameterbins(j).branchlengthbins(k).surfacearea                 = sum([inddata.doublebins.diameterbins(j).branchlengthbins(k).piece.surfacearea]);
                        inddata.doublebins.diameterbins(j).branchlengthbins(k).volume                      = sum([inddata.doublebins.diameterbins(j).branchlengthbins(k).piece.volume]);
                        inddata.doublebins.diameterbins(j).branchlengthbins(k).numbersegments              = length(unique([inddata.doublebins.diameterbins(j).branchlengthbins(k).piece.cable]));
                        inddata.doublebins.diameterbins(j).branchlengthbins(k).numberbifurcations          = 0;
                        inddata.doublebins.diameterbins(j).branchlengthbins(k).numberterminations          = 0;
                        inddata.doublebins.diameterbins(j).branchlengthbins(k).numberbifurcatingbranches   = 0;
                        inddata.doublebins.diameterbins(j).branchlengthbins(k).numberterminatingbranches   = 0;
                        inddata.doublebins.diameterbins(j).branchlengthbins(k).rallratio.values            = [inddata.doublebins.diameterbins(j).branchlengthbins(k).piece.rallratio];
                        inddata.doublebins.diameterbins(j).branchlengthbins(k).rallratio1.values           = [inddata.doublebins.diameterbins(j).branchlengthbins(k).piece.rallratio1];
                        inddata.doublebins.diameterbins(j).branchlengthbins(k).rallratio2.values           = [inddata.doublebins.diameterbins(j).branchlengthbins(k).piece.rallratio2];
                        inddata.doublebins.diameterbins(j).branchlengthbins(k).rallratio3.values           = [inddata.doublebins.diameterbins(j).branchlengthbins(k).piece.rallratio3];
                        inddata.doublebins.diameterbins(j).branchlengthbins(k).daughterratio.values        = [inddata.doublebins.diameterbins(j).branchlengthbins(k).piece.daughterratio];
                        inddata.doublebins.diameterbins(j).branchlengthbins(k).parentdaughterratio.values  = [inddata.doublebins.diameterbins(j).branchlengthbins(k).piece.parentdaughterratio];
                        inddata.doublebins.diameterbins(j).branchlengthbins(k).parentdaughter2ratio.values = [inddata.doublebins.diameterbins(j).branchlengthbins(k).piece.parentdaughter2ratio];
                        inddata.doublebins.diameterbins(j).branchlengthbins(k).meandiameter.values         = ([inddata.doublebins.diameterbins(j).branchlengthbins(k).piece.proximaldiameter]+[inddata.doublebins.diameterbins(j).branchlengthbins(k).piece.distaldiameter])/2;
                        inddata.doublebins.diameterbins(j).branchlengthbins(k).taperrate.values            = [inddata.doublebins.diameterbins(j).branchlengthbins(k).piece.taperrate];
                        inddata.doublebins.diameterbins(j).branchlengthbins(k).piecelength.values          = [inddata.doublebins.diameterbins(j).branchlengthbins(k).piece.length];
                        
                        for m = 1:length(inddata.doublebins.diameterbins(j).branchlengthbins(k).piece)
                            if strcmp(inddata.doublebins.diameterbins(j).branchlengthbins(k).piece(m).distaltype,'bifurcation')==1
                                inddata.doublebins.diameterbins(j).branchlengthbins(k).numberbifurcations = 1 + inddata.doublebins.diameterbins(j).branchlengthbins(k).numberbifurcations;
                            end
                            if strcmp(inddata.doublebins.diameterbins(j).branchlengthbins(k).piece(m).distaltype,'m-furcation')==1
                                inddata.doublebins.diameterbins(j).branchlengthbins(k).numberbifurcations = length(inddata.doublebins.diameterbins(j).branchlengthbins(k).piece(m).daughters) - 1 + inddata.doublebins.diameterbins(j).branchlengthbins(k).numberbifurcations;
                            end
                            if strcmp(inddata.doublebins.diameterbins(j).branchlengthbins(k).piece(m).distaltype,'termination')==1
                                inddata.doublebins.diameterbins(j).branchlengthbins(k).numberterminations = 1 + inddata.doublebins.diameterbins(j).branchlengthbins(k).numberterminations;
                            end
                            if strcmp(inddata.doublebins.diameterbins(j).branchlengthbins(k).piece(m).proximaltype,'primary    ')==1 || strcmp(inddata.doublebins.diameterbins(j).branchlengthbins(k).piece(m).proximaltype,'daughter   ')==1  || strcmp(inddata.doublebins.diameterbins(j).branchlengthbins(k).piece(m).proximaltype,'daughter1  ')==1 || strcmp(inddata.doublebins.diameterbins(j).branchlengthbins(k).piece(m).proximaltype,'daughter2  ')==1
                                if strcmp(inddata.doublebins.diameterbins(j).branchlengthbins(k).piece(m).branchtype,'b')==1
                                    inddata.doublebins.diameterbins(j).branchlengthbins(k).numberbifurcatingbranches = 1 + inddata.doublebins.diameterbins(j).branchlengthbins(k).numberbifurcatingbranches;
                                elseif strcmp(inddata.doublebins.diameterbins(j).branchlengthbins(k).piece(m).branchtype,'t')==1
                                    inddata.doublebins.diameterbins(j).branchlengthbins(k).numberterminatingbranches = 1 + inddata.doublebins.diameterbins(j).branchlengthbins(k).numberterminatingbranches;
                                else disp('        Error in doublebinanalyzer: piece branch type not identified');
                                end
                            end
                        end
                    end
                    
                    if isfield(popdata.doublebins,'diameterbins') == 0; nextvalue = 1;
                    elseif j > length(popdata.doublebins.diameterbins); nextvalue = 1;
                    elseif isfield(popdata.doublebins.diameterbins(j).branchlengthbins(k),'length') == 0; nextvalue = 1;
                    elseif isfield(popdata.doublebins.diameterbins(j).branchlengthbins(k).length,'values') == 0; nextvalue = 1;
                    else nextvalue = 1 + length(popdata.doublebins.diameterbins(j).branchlengthbins(k).length.values);
                    end
                    popdata.doublebins.diameterbins(j).branchlengthbins(k).length.values(nextvalue)             = inddata.doublebins.diameterbins(j).branchlengthbins(k).length;
                    popdata.doublebins.diameterbins(j).branchlengthbins(k).surfacearea.values(nextvalue)        = inddata.doublebins.diameterbins(j).branchlengthbins(k).surfacearea;
                    popdata.doublebins.diameterbins(j).branchlengthbins(k).volume.values(nextvalue)             = inddata.doublebins.diameterbins(j).branchlengthbins(k).volume;
                    popdata.doublebins.diameterbins(j).branchlengthbins(k).numbersegments.values(nextvalue)     = inddata.doublebins.diameterbins(j).branchlengthbins(k).numbersegments;
                    popdata.doublebins.diameterbins(j).branchlengthbins(k).numberbifurcations.values(nextvalue) = inddata.doublebins.diameterbins(j).branchlengthbins(k).numberbifurcations;
                    popdata.doublebins.diameterbins(j).branchlengthbins(k).numberterminations.values(nextvalue) = inddata.doublebins.diameterbins(j).branchlengthbins(k).numberterminations;
                    popdata.doublebins.diameterbins(j).branchlengthbins(k).numberbifurcatingbranches.values(nextvalue) = inddata.doublebins.diameterbins(j).branchlengthbins(k).numberbifurcatingbranches;
                    popdata.doublebins.diameterbins(j).branchlengthbins(k).numberterminatingbranches.values(nextvalue) = inddata.doublebins.diameterbins(j).branchlengthbins(k).numberterminatingbranches;
                    popdata.doublebins.diameterbins(j).branchlengthbins(k).rallratio.values                     = [ [popdata.doublebins.diameterbins(j).branchlengthbins(k).rallratio.values] [inddata.doublebins.diameterbins(j).branchlengthbins(k).rallratio.values] ];
                    popdata.doublebins.diameterbins(j).branchlengthbins(k).rallratio1.values                    = [ [popdata.doublebins.diameterbins(j).branchlengthbins(k).rallratio1.values] [inddata.doublebins.diameterbins(j).branchlengthbins(k).rallratio1.values] ];
                    popdata.doublebins.diameterbins(j).branchlengthbins(k).rallratio2.values                    = [ [popdata.doublebins.diameterbins(j).branchlengthbins(k).rallratio2.values] [inddata.doublebins.diameterbins(j).branchlengthbins(k).rallratio2.values] ];
                    popdata.doublebins.diameterbins(j).branchlengthbins(k).rallratio3.values                    = [ [popdata.doublebins.diameterbins(j).branchlengthbins(k).rallratio3.values] [inddata.doublebins.diameterbins(j).branchlengthbins(k).rallratio3.values] ];
                    popdata.doublebins.diameterbins(j).branchlengthbins(k).daughterratio.values                 = [ [popdata.doublebins.diameterbins(j).branchlengthbins(k).daughterratio.values] [inddata.doublebins.diameterbins(j).branchlengthbins(k).daughterratio.values] ];
                    popdata.doublebins.diameterbins(j).branchlengthbins(k).parentdaughterratio.values           = [ [popdata.doublebins.diameterbins(j).branchlengthbins(k).parentdaughterratio.values] [inddata.doublebins.diameterbins(j).branchlengthbins(k).parentdaughterratio.values] ];
                    popdata.doublebins.diameterbins(j).branchlengthbins(k).parentdaughter2ratio.values          = [ [popdata.doublebins.diameterbins(j).branchlengthbins(k).parentdaughter2ratio.values] [inddata.doublebins.diameterbins(j).branchlengthbins(k).parentdaughter2ratio.values] ];
                    popdata.doublebins.diameterbins(j).branchlengthbins(k).meandiameter.values                  = [ [popdata.doublebins.diameterbins(j).branchlengthbins(k).meandiameter.values] [inddata.doublebins.diameterbins(j).branchlengthbins(k).meandiameter.values] ];
                    popdata.doublebins.diameterbins(j).branchlengthbins(k).taperrate.values                     = [ [popdata.doublebins.diameterbins(j).branchlengthbins(k).taperrate.values] [inddata.doublebins.diameterbins(j).branchlengthbins(k).taperrate.values] ];
                    popdata.doublebins.diameterbins(j).branchlengthbins(k).piecelength.values                   = [ [popdata.doublebins.diameterbins(j).branchlengthbins(k).piecelength.values] [inddata.doublebins.diameterbins(j).branchlengthbins(k).piecelength.values] ];
                    clear nextvalue;
                    
                end
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        
        for i = 1:length(popdata.doublebins.diameterbins)
            
            for j = 1:length(popdata.doublebins.diameterbins(i).branchlengthbins)
                
                typeanalysis.doublebin.diameterbranchlength.diameter(i,j)   = popdata.diameterbinmiddles(i);
                typeanalysis.doublebin.diameterbranchlength.branchlength(i,j) = (branchlengthbinwidth * j) - (branchlengthbinwidth / 2);
                
                if isfield(popdata.doublebins.diameterbins(i).branchlengthbins(j).length,'values') == 1
                    
                    typeanalysis.doublebin.diameterbranchlength.length(i,j)      = sum([popdata.doublebins.diameterbins(i).branchlengthbins(j).length.values]);
                    typeanalysis.doublebin.diameterbranchlength.surfacearea(i,j) = sum([popdata.doublebins.diameterbins(i).branchlengthbins(j).surfacearea.values]);
                    typeanalysis.doublebin.diameterbranchlength.volume(i,j)      = sum([popdata.doublebins.diameterbins(i).branchlengthbins(j).volume.values]);
                    
                    typeanalysis.doublebin.diameterbranchlength.numbersegments(i,j)     = sum([popdata.doublebins.diameterbins(i).branchlengthbins(j).numbersegments.values]);
                    typeanalysis.doublebin.diameterbranchlength.numberbifurcations(i,j) = sum([popdata.doublebins.diameterbins(i).branchlengthbins(j).numberbifurcations.values]);
                    typeanalysis.doublebin.diameterbranchlength.numberterminations(i,j) = sum([popdata.doublebins.diameterbins(i).branchlengthbins(j).numberterminations.values]);
                    typeanalysis.doublebin.diameterbranchlength.numberbifurcatingbranches(i,j) = sum([popdata.doublebins.diameterbins(i).branchlengthbins(j).numberbifurcatingbranches.values]);
                    typeanalysis.doublebin.diameterbranchlength.numberterminatingbranches(i,j) = sum([popdata.doublebins.diameterbins(i).branchlengthbins(j).numberterminatingbranches.values]);
                    
                    typeanalysis.doublebin.diameterbranchlength.rallratio.mean(i,j) = mean([popdata.doublebins.diameterbins(i).branchlengthbins(j).rallratio.values]);
                    typeanalysis.doublebin.diameterbranchlength.rallratio.std(i,j)  = std([popdata.doublebins.diameterbins(i).branchlengthbins(j).rallratio.values]);
                    typeanalysis.doublebin.diameterbranchlength.rallratio.skew(i,j) = skewness([popdata.doublebins.diameterbins(i).branchlengthbins(j).rallratio.values],0);
                    typeanalysis.doublebin.diameterbranchlength.rallratio.kurt(i,j) = kurtosis([popdata.doublebins.diameterbins(i).branchlengthbins(j).rallratio.values],0);
                    
                    typeanalysis.doublebin.diameterbranchlength.rallratio1.mean(i,j) = mean([popdata.doublebins.diameterbins(i).branchlengthbins(j).rallratio.values]);
                    typeanalysis.doublebin.diameterbranchlength.rallratio1.std(i,j)  = std([popdata.doublebins.diameterbins(i).branchlengthbins(j).rallratio.values]);
                    typeanalysis.doublebin.diameterbranchlength.rallratio1.skew(i,j) = skewness([popdata.doublebins.diameterbins(i).branchlengthbins(j).rallratio.values],0);
                    typeanalysis.doublebin.diameterbranchlength.rallratio1.kurt(i,j) = kurtosis([popdata.doublebins.diameterbins(i).branchlengthbins(j).rallratio.values],0);
                    
                    typeanalysis.doublebin.diameterbranchlength.rallratio2.mean(i,j) = mean([popdata.doublebins.diameterbins(i).branchlengthbins(j).rallratio2.values]);
                    typeanalysis.doublebin.diameterbranchlength.rallratio2.std(i,j)  = std([popdata.doublebins.diameterbins(i).branchlengthbins(j).rallratio2.values]);
                    typeanalysis.doublebin.diameterbranchlength.rallratio2.skew(i,j) = skewness([popdata.doublebins.diameterbins(i).branchlengthbins(j).rallratio2.values],0);
                    typeanalysis.doublebin.diameterbranchlength.rallratio2.kurt(i,j) = kurtosis([popdata.doublebins.diameterbins(i).branchlengthbins(j).rallratio2.values],0);
                    
                    typeanalysis.doublebin.diameterbranchlength.rallratio3.mean(i,j) = mean([popdata.doublebins.diameterbins(i).branchlengthbins(j).rallratio3.values]);
                    typeanalysis.doublebin.diameterbranchlength.rallratio3.std(i,j)  = std([popdata.doublebins.diameterbins(i).branchlengthbins(j).rallratio3.values]);
                    typeanalysis.doublebin.diameterbranchlength.rallratio3.skew(i,j) = skewness([popdata.doublebins.diameterbins(i).branchlengthbins(j).rallratio3.values],0);
                    typeanalysis.doublebin.diameterbranchlength.rallratio3.kurt(i,j) = kurtosis([popdata.doublebins.diameterbins(i).branchlengthbins(j).rallratio3.values],0);
                    
                    typeanalysis.doublebin.diameterbranchlength.daughterratio.mean(i,j) = mean([popdata.doublebins.diameterbins(i).branchlengthbins(j).daughterratio.values]);
                    typeanalysis.doublebin.diameterbranchlength.daughterratio.std(i,j)  = std([popdata.doublebins.diameterbins(i).branchlengthbins(j).daughterratio.values]);
                    typeanalysis.doublebin.diameterbranchlength.daughterratio.skew(i,j) = skewness([popdata.doublebins.diameterbins(i).branchlengthbins(j).daughterratio.values],0);
                    typeanalysis.doublebin.diameterbranchlength.daughterratio.kurt(i,j) = kurtosis([popdata.doublebins.diameterbins(i).branchlengthbins(j).daughterratio.values],0);
                    
                    typeanalysis.doublebin.diameterbranchlength.parentdaughterratio.mean(i,j) = mean([popdata.doublebins.diameterbins(i).branchlengthbins(j).parentdaughterratio.values]);
                    typeanalysis.doublebin.diameterbranchlength.parentdaughterratio.std(i,j)  = std([popdata.doublebins.diameterbins(i).branchlengthbins(j).parentdaughterratio.values]);
                    typeanalysis.doublebin.diameterbranchlength.parentdaughterratio.skew(i,j) = skewness([popdata.doublebins.diameterbins(i).branchlengthbins(j).parentdaughterratio.values],0);
                    typeanalysis.doublebin.diameterbranchlength.parentdaughterratio.kurt(i,j) = kurtosis([popdata.doublebins.diameterbins(i).branchlengthbins(j).parentdaughterratio.values],0);
                    
                    typeanalysis.doublebin.diameterbranchlength.parentdaughter2ratio.mean(i,j) = mean([popdata.doublebins.diameterbins(i).branchlengthbins(j).parentdaughter2ratio.values]);
                    typeanalysis.doublebin.diameterbranchlength.parentdaughter2ratio.std(i,j)  = std([popdata.doublebins.diameterbins(i).branchlengthbins(j).parentdaughter2ratio.values]);
                    typeanalysis.doublebin.diameterbranchlength.parentdaughter2ratio.skew(i,j) = skewness([popdata.doublebins.diameterbins(i).branchlengthbins(j).parentdaughter2ratio.values],0);
                    typeanalysis.doublebin.diameterbranchlength.parentdaughter2ratio.kurt(i,j) = kurtosis([popdata.doublebins.diameterbins(i).branchlengthbins(j).parentdaughter2ratio.values],0);
                    
                    typeanalysis.doublebin.diameterbranchlength.taperrate.mean(i,j) = sum([popdata.doublebins.diameterbins(i).branchlengthbins(j).taperrate.values].*[popdata.doublebins.diameterbins(i).branchlengthbins(j).piecelength.values])/sum([popdata.doublebins.diameterbins(i).branchlengthbins(j).piecelength.values]);
                    typeanalysis.doublebin.diameterbranchlength.taperrate.std(i,j)  = std([popdata.doublebins.diameterbins(i).branchlengthbins(j).taperrate.values]);
                    typeanalysis.doublebin.diameterbranchlength.taperrate.skew(i,j) = skewness([popdata.doublebins.diameterbins(i).branchlengthbins(j).taperrate.values],0);
                    typeanalysis.doublebin.diameterbranchlength.taperrate.kurt(i,j) = kurtosis([popdata.doublebins.diameterbins(i).branchlengthbins(j).taperrate.values],0);
                    
                    
                    typeanalysis.doublebin.diameterbranchlength.bifurcationprobability.bylength(i,j) = typeanalysis.doublebin.diameterbranchlength.numberbifurcations(i,j) / typeanalysis.doublebin.diameterbranchlength.length(i,j);
                    typeanalysis.doublebin.diameterbranchlength.terminationprobability.bylength(i,j) = typeanalysis.doublebin.diameterbranchlength.numberterminations(i,j) / typeanalysis.doublebin.diameterbranchlength.length(i,j);
                    
                    typeanalysis.doublebin.diameterbranchlength.bifurcationprobability.bysurfacearea(i,j) = typeanalysis.doublebin.diameterbranchlength.numberbifurcations(i,j) / typeanalysis.doublebin.diameterbranchlength.surfacearea(i,j);
                    typeanalysis.doublebin.diameterbranchlength.terminationprobability.bysurfacearea(i,j) = typeanalysis.doublebin.diameterbranchlength.numberterminations(i,j) / typeanalysis.doublebin.diameterbranchlength.surfacearea(i,j);
                    
                    typeanalysis.doublebin.diameterbranchlength.bifurcationprobability.byvolume(i,j) = typeanalysis.doublebin.diameterbranchlength.numberbifurcations(i,j) / typeanalysis.doublebin.diameterbranchlength.volume(i,j);
                    typeanalysis.doublebin.diameterbranchlength.terminationprobability.byvolume(i,j) = typeanalysis.doublebin.diameterbranchlength.numberterminations(i,j) / typeanalysis.doublebin.diameterbranchlength.volume(i,j);
                    
                end
            end
        end
        
        typeanalysis.doublebin.diameterbranchlength.array.diameter      = reshape(typeanalysis.doublebin.diameterbranchlength.diameter,numel(typeanalysis.doublebin.diameterbranchlength.diameter),1);
        typeanalysis.doublebin.diameterbranchlength.array.branchlength    = reshape(typeanalysis.doublebin.diameterbranchlength.branchlength,numel(typeanalysis.doublebin.diameterbranchlength.branchlength),1);
        
        typeanalysis.doublebin.diameterbranchlength.array.diameter   = reshape(typeanalysis.doublebin.diameterbranchlength.diameter,numel(typeanalysis.doublebin.diameterbranchlength.diameter),1);
        typeanalysis.doublebin.diameterbranchlength.array.branchlength = reshape(typeanalysis.doublebin.diameterbranchlength.branchlength,numel(typeanalysis.doublebin.diameterbranchlength.branchlength),1);
        
        typeanalysis.doublebin.diameterbranchlength.array.length      = reshape(typeanalysis.doublebin.diameterbranchlength.length,numel(typeanalysis.doublebin.diameterbranchlength.length),1);
        typeanalysis.doublebin.diameterbranchlength.array.surfacearea = reshape(typeanalysis.doublebin.diameterbranchlength.surfacearea,numel(typeanalysis.doublebin.diameterbranchlength.surfacearea),1);
        typeanalysis.doublebin.diameterbranchlength.array.volume      = reshape(typeanalysis.doublebin.diameterbranchlength.volume,numel(typeanalysis.doublebin.diameterbranchlength.volume),1);
        
        typeanalysis.doublebin.diameterbranchlength.array.numbersegments     = reshape(typeanalysis.doublebin.diameterbranchlength.numbersegments,numel(typeanalysis.doublebin.diameterbranchlength.numbersegments),1);
        typeanalysis.doublebin.diameterbranchlength.array.numberbifurcations = reshape(typeanalysis.doublebin.diameterbranchlength.numberbifurcations,numel(typeanalysis.doublebin.diameterbranchlength.numberbifurcations),1);
        typeanalysis.doublebin.diameterbranchlength.array.numberterminations = reshape(typeanalysis.doublebin.diameterbranchlength.numberterminations,numel(typeanalysis.doublebin.diameterbranchlength.numberterminations),1);
        typeanalysis.doublebin.diameterbranchlength.array.numberbifurcatingbranches = reshape(typeanalysis.doublebin.diameterbranchlength.numberbifurcatingbranches,numel(typeanalysis.doublebin.diameterbranchlength.numberbifurcatingbranches),1);
        typeanalysis.doublebin.diameterbranchlength.array.numberterminatingbranches = reshape(typeanalysis.doublebin.diameterbranchlength.numberterminatingbranches,numel(typeanalysis.doublebin.diameterbranchlength.numberterminatingbranches),1);
        
        typeanalysis.doublebin.diameterbranchlength.array.rallratio.mean = reshape(typeanalysis.doublebin.diameterbranchlength.rallratio.mean,numel(typeanalysis.doublebin.diameterbranchlength.rallratio.mean),1);
        typeanalysis.doublebin.diameterbranchlength.array.rallratio.std  = reshape(typeanalysis.doublebin.diameterbranchlength.rallratio.std,numel(typeanalysis.doublebin.diameterbranchlength.rallratio.std),1);
        typeanalysis.doublebin.diameterbranchlength.array.rallratio.skew = reshape(typeanalysis.doublebin.diameterbranchlength.rallratio.skew,numel(typeanalysis.doublebin.diameterbranchlength.rallratio.skew),1);
        typeanalysis.doublebin.diameterbranchlength.array.rallratio.kurt = reshape(typeanalysis.doublebin.diameterbranchlength.rallratio.kurt,numel(typeanalysis.doublebin.diameterbranchlength.rallratio.kurt),1);
        
        typeanalysis.doublebin.diameterbranchlength.array.rallratio1.mean = reshape(typeanalysis.doublebin.diameterbranchlength.rallratio1.mean,numel(typeanalysis.doublebin.diameterbranchlength.rallratio1.mean),1);
        typeanalysis.doublebin.diameterbranchlength.array.rallratio1.std  = reshape(typeanalysis.doublebin.diameterbranchlength.rallratio1.std,numel(typeanalysis.doublebin.diameterbranchlength.rallratio1.std),1);
        typeanalysis.doublebin.diameterbranchlength.array.rallratio1.skew = reshape(typeanalysis.doublebin.diameterbranchlength.rallratio1.skew,numel(typeanalysis.doublebin.diameterbranchlength.rallratio1.skew),1);
        typeanalysis.doublebin.diameterbranchlength.array.rallratio1.kurt = reshape(typeanalysis.doublebin.diameterbranchlength.rallratio1.kurt,numel(typeanalysis.doublebin.diameterbranchlength.rallratio1.kurt),1);
        
        typeanalysis.doublebin.diameterbranchlength.array.rallratio2.mean = reshape(typeanalysis.doublebin.diameterbranchlength.rallratio2.mean,numel(typeanalysis.doublebin.diameterbranchlength.rallratio2.mean),1);
        typeanalysis.doublebin.diameterbranchlength.array.rallratio2.std  = reshape(typeanalysis.doublebin.diameterbranchlength.rallratio2.std,numel(typeanalysis.doublebin.diameterbranchlength.rallratio2.std),1);
        typeanalysis.doublebin.diameterbranchlength.array.rallratio2.skew = reshape(typeanalysis.doublebin.diameterbranchlength.rallratio2.skew,numel(typeanalysis.doublebin.diameterbranchlength.rallratio2.skew),1);
        typeanalysis.doublebin.diameterbranchlength.array.rallratio2.kurt = reshape(typeanalysis.doublebin.diameterbranchlength.rallratio2.kurt,numel(typeanalysis.doublebin.diameterbranchlength.rallratio2.kurt),1);
        
        typeanalysis.doublebin.diameterbranchlength.array.rallratio3.mean = reshape(typeanalysis.doublebin.diameterbranchlength.rallratio3.mean,numel(typeanalysis.doublebin.diameterbranchlength.rallratio3.mean),1);
        typeanalysis.doublebin.diameterbranchlength.array.rallratio3.std  = reshape(typeanalysis.doublebin.diameterbranchlength.rallratio3.std,numel(typeanalysis.doublebin.diameterbranchlength.rallratio3.std),1);
        typeanalysis.doublebin.diameterbranchlength.array.rallratio3.skew = reshape(typeanalysis.doublebin.diameterbranchlength.rallratio3.skew,numel(typeanalysis.doublebin.diameterbranchlength.rallratio3.skew),1);
        typeanalysis.doublebin.diameterbranchlength.array.rallratio3.kurt = reshape(typeanalysis.doublebin.diameterbranchlength.rallratio3.kurt,numel(typeanalysis.doublebin.diameterbranchlength.rallratio3.kurt),1);
        
        typeanalysis.doublebin.diameterbranchlength.array.daughterratio.mean = reshape(typeanalysis.doublebin.diameterbranchlength.daughterratio.mean,numel(typeanalysis.doublebin.diameterbranchlength.daughterratio.mean),1);
        typeanalysis.doublebin.diameterbranchlength.array.daughterratio.std  = reshape(typeanalysis.doublebin.diameterbranchlength.daughterratio.std,numel(typeanalysis.doublebin.diameterbranchlength.daughterratio.std),1);
        typeanalysis.doublebin.diameterbranchlength.array.daughterratio.skew = reshape(typeanalysis.doublebin.diameterbranchlength.daughterratio.skew,numel(typeanalysis.doublebin.diameterbranchlength.daughterratio.skew),1);
        typeanalysis.doublebin.diameterbranchlength.array.daughterratio.kurt = reshape(typeanalysis.doublebin.diameterbranchlength.daughterratio.kurt,numel(typeanalysis.doublebin.diameterbranchlength.daughterratio.kurt),1);
        
        typeanalysis.doublebin.diameterbranchlength.array.parentdaughterratio.mean = reshape(typeanalysis.doublebin.diameterbranchlength.parentdaughterratio.mean,numel(typeanalysis.doublebin.diameterbranchlength.parentdaughterratio.mean),1);
        typeanalysis.doublebin.diameterbranchlength.array.parentdaughterratio.std  = reshape(typeanalysis.doublebin.diameterbranchlength.parentdaughterratio.std,numel(typeanalysis.doublebin.diameterbranchlength.parentdaughterratio.std),1);
        typeanalysis.doublebin.diameterbranchlength.array.parentdaughterratio.skew = reshape(typeanalysis.doublebin.diameterbranchlength.parentdaughterratio.skew,numel(typeanalysis.doublebin.diameterbranchlength.parentdaughterratio.skew),1);
        typeanalysis.doublebin.diameterbranchlength.array.parentdaughterratio.kurt = reshape(typeanalysis.doublebin.diameterbranchlength.parentdaughterratio.kurt,numel(typeanalysis.doublebin.diameterbranchlength.parentdaughterratio.kurt),1);
        
        typeanalysis.doublebin.diameterbranchlength.array.parentdaughter2ratio.mean = reshape(typeanalysis.doublebin.diameterbranchlength.parentdaughter2ratio.mean,numel(typeanalysis.doublebin.diameterbranchlength.parentdaughter2ratio.mean),1);
        typeanalysis.doublebin.diameterbranchlength.array.parentdaughter2ratio.std  = reshape(typeanalysis.doublebin.diameterbranchlength.parentdaughter2ratio.std,numel(typeanalysis.doublebin.diameterbranchlength.parentdaughter2ratio.std),1);
        typeanalysis.doublebin.diameterbranchlength.array.parentdaughter2ratio.skew = reshape(typeanalysis.doublebin.diameterbranchlength.parentdaughter2ratio.skew,numel(typeanalysis.doublebin.diameterbranchlength.parentdaughter2ratio.skew),1);
        typeanalysis.doublebin.diameterbranchlength.array.parentdaughter2ratio.kurt = reshape(typeanalysis.doublebin.diameterbranchlength.parentdaughter2ratio.kurt,numel(typeanalysis.doublebin.diameterbranchlength.parentdaughter2ratio.kurt),1);
        
        typeanalysis.doublebin.diameterbranchlength.array.taperrate.mean = reshape(typeanalysis.doublebin.diameterbranchlength.taperrate.mean,numel(typeanalysis.doublebin.diameterbranchlength.taperrate.mean),1);
        typeanalysis.doublebin.diameterbranchlength.array.taperrate.std  = reshape(typeanalysis.doublebin.diameterbranchlength.taperrate.std,numel(typeanalysis.doublebin.diameterbranchlength.taperrate.std),1);
        typeanalysis.doublebin.diameterbranchlength.array.taperrate.skew = reshape(typeanalysis.doublebin.diameterbranchlength.taperrate.skew,numel(typeanalysis.doublebin.diameterbranchlength.taperrate.skew),1);
        typeanalysis.doublebin.diameterbranchlength.array.taperrate.kurt = reshape(typeanalysis.doublebin.diameterbranchlength.taperrate.kurt,numel(typeanalysis.doublebin.diameterbranchlength.taperrate.kurt),1);
        
        
        typeanalysis.doublebin.diameterbranchlength.array.bifurcationprobability.bylength      = reshape(typeanalysis.doublebin.diameterbranchlength.bifurcationprobability.bylength,numel(typeanalysis.doublebin.diameterbranchlength.bifurcationprobability.bylength),1);
        typeanalysis.doublebin.diameterbranchlength.array.bifurcationprobability.bysurfacearea = reshape(typeanalysis.doublebin.diameterbranchlength.bifurcationprobability.bysurfacearea,numel(typeanalysis.doublebin.diameterbranchlength.bifurcationprobability.bysurfacearea),1);
        typeanalysis.doublebin.diameterbranchlength.array.bifurcationprobability.byvolume      = reshape(typeanalysis.doublebin.diameterbranchlength.bifurcationprobability.byvolume,numel(typeanalysis.doublebin.diameterbranchlength.bifurcationprobability.byvolume),1);
        typeanalysis.doublebin.diameterbranchlength.array.bifurcationprobability.diameter    = reshape(typeanalysis.doublebin.diameterbranchlength.diameter,numel(typeanalysis.doublebin.diameterbranchlength.diameter),1);
        typeanalysis.doublebin.diameterbranchlength.array.bifurcationprobability.branchlength  = reshape(typeanalysis.doublebin.diameterbranchlength.branchlength,numel(typeanalysis.doublebin.diameterbranchlength.branchlength),1);
        
        typeanalysis.doublebin.diameterbranchlength.array.bifurcationprobability.branchlength  = typeanalysis.doublebin.diameterbranchlength.array.bifurcationprobability.branchlength(~isnan(typeanalysis.doublebin.diameterbranchlength.array.bifurcationprobability.bylength));
        typeanalysis.doublebin.diameterbranchlength.array.bifurcationprobability.diameter    = typeanalysis.doublebin.diameterbranchlength.array.bifurcationprobability.diameter(~isnan(typeanalysis.doublebin.diameterbranchlength.array.bifurcationprobability.bylength));
        typeanalysis.doublebin.diameterbranchlength.array.bifurcationprobability.byvolume      = typeanalysis.doublebin.diameterbranchlength.array.bifurcationprobability.byvolume(~isnan(typeanalysis.doublebin.diameterbranchlength.array.bifurcationprobability.bylength));
        typeanalysis.doublebin.diameterbranchlength.array.bifurcationprobability.bysurfacearea = typeanalysis.doublebin.diameterbranchlength.array.bifurcationprobability.bysurfacearea(~isnan(typeanalysis.doublebin.diameterbranchlength.array.bifurcationprobability.bylength));
        typeanalysis.doublebin.diameterbranchlength.array.bifurcationprobability.bylength      = typeanalysis.doublebin.diameterbranchlength.array.bifurcationprobability.bylength(~isnan(typeanalysis.doublebin.diameterbranchlength.array.bifurcationprobability.bylength));
        
        %typeanalysis.doublebin.diameterbranchlength.array.bifurcationprobability.zunzunlength = [typeanalysis.doublebin.diameterbranchlength.array.bifurcationprobability.diameter typeanalysis.doublebin.diameterbranchlength.array.bifurcationprobability.branchlength typeanalysis.doublebin.diameterbranchlength.array.bifurcationprobability.bylength];
        %typeanalysis.doublebin.diameterbranchlength.array.bifurcationprobability.zunzunsurfacearea = [typeanalysis.doublebin.diameterbranchlength.array.bifurcationprobability.diameter typeanalysis.doublebin.diameterbranchlength.array.bifurcationprobability.branchlength typeanalysis.doublebin.diameterbranchlength.array.bifurcationprobability.bysurfacearea];
        %ypeanalysis.doublebin.diameterbranchlength.array.bifurcationprobability.zunzunvolume = [typeanalysis.doublebin.diameterbranchlength.array.bifurcationprobability.diameter typeanalysis.doublebin.diameterbranchlength.array.bifurcationprobability.branchlength typeanalysis.doublebin.diameterbranchlength.array.bifurcationprobability.byvolume];
        
        
        typeanalysis.doublebin.diameterbranchlength.array.terminationprobability.bylength      = reshape(typeanalysis.doublebin.diameterbranchlength.terminationprobability.bylength,numel(typeanalysis.doublebin.diameterbranchlength.terminationprobability.bylength),1);
        typeanalysis.doublebin.diameterbranchlength.array.terminationprobability.bysurfacearea = reshape(typeanalysis.doublebin.diameterbranchlength.terminationprobability.bysurfacearea,numel(typeanalysis.doublebin.diameterbranchlength.terminationprobability.bysurfacearea),1);
        typeanalysis.doublebin.diameterbranchlength.array.terminationprobability.byvolume      = reshape(typeanalysis.doublebin.diameterbranchlength.terminationprobability.byvolume,numel(typeanalysis.doublebin.diameterbranchlength.terminationprobability.byvolume),1);
        typeanalysis.doublebin.diameterbranchlength.array.terminationprobability.diameter    = reshape(typeanalysis.doublebin.diameterbranchlength.diameter,numel(typeanalysis.doublebin.diameterbranchlength.diameter),1);
        typeanalysis.doublebin.diameterbranchlength.array.terminationprobability.branchlength  = reshape(typeanalysis.doublebin.diameterbranchlength.branchlength,numel(typeanalysis.doublebin.diameterbranchlength.branchlength),1);
        
        typeanalysis.doublebin.diameterbranchlength.array.terminationprobability.branchlength  = typeanalysis.doublebin.diameterbranchlength.array.terminationprobability.branchlength(~isnan(typeanalysis.doublebin.diameterbranchlength.array.terminationprobability.bylength));
        typeanalysis.doublebin.diameterbranchlength.array.terminationprobability.diameter    = typeanalysis.doublebin.diameterbranchlength.array.terminationprobability.diameter(~isnan(typeanalysis.doublebin.diameterbranchlength.array.terminationprobability.bylength));
        typeanalysis.doublebin.diameterbranchlength.array.terminationprobability.byvolume      = typeanalysis.doublebin.diameterbranchlength.array.terminationprobability.byvolume(~isnan(typeanalysis.doublebin.diameterbranchlength.array.terminationprobability.bylength));
        typeanalysis.doublebin.diameterbranchlength.array.terminationprobability.bysurfacearea = typeanalysis.doublebin.diameterbranchlength.array.terminationprobability.bysurfacearea(~isnan(typeanalysis.doublebin.diameterbranchlength.array.terminationprobability.bylength));
        typeanalysis.doublebin.diameterbranchlength.array.terminationprobability.bylength      = typeanalysis.doublebin.diameterbranchlength.array.terminationprobability.bylength(~isnan(typeanalysis.doublebin.diameterbranchlength.array.terminationprobability.bylength));
        
        %typeanalysis.doublebin.diameterbranchlength.array.terminationprobability.zunzunlength = [typeanalysis.doublebin.diameterbranchlength.array.terminationprobability.diameter typeanalysis.doublebin.diameterbranchlength.array.terminationprobability.branchlength typeanalysis.doublebin.diameterbranchlength.array.terminationprobability.bylength];
        %typeanalysis.doublebin.diameterbranchlength.array.terminationprobability.zunzunsurfacearea = [typeanalysis.doublebin.diameterbranchlength.array.terminationprobability.diameter typeanalysis.doublebin.diameterbranchlength.array.terminationprobability.branchlength typeanalysis.doublebin.diameterbranchlength.array.terminationprobability.bysurfacearea];
        %typeanalysis.doublebin.diameterbranchlength.array.terminationprobability.zunzunvolume = [typeanalysis.doublebin.diameterbranchlength.array.terminationprobability.diameter typeanalysis.doublebin.diameterbranchlength.array.terminationprobability.branchlength typeanalysis.doublebin.diameterbranchlength.array.terminationprobability.byvolume];
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        % Begin bifurcation double bin analysis
        
        for i = 1:maxdiameterbin
            for j = 1:maxbranchlengthbin
                popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).rallratio.values            = [];
                popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).rallratio1.values           = [];
                popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).rallratio2.values           = [];
                popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).rallratio3.values           = [];
                popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).daughterratio.values        = [];
                popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).parentdaughterratio.values  = [];
                popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).parentdaughter2ratio.values = [];
                popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).meandiameter.values         = [];
                popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).taperrate.values            = [];
                popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).piecelength.values          = [];
            end
        end
        
        
        for i = 1:length(data.individual)
            
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            
            for j = 1:length(inddata.bifurcation.doublebins.diameterbins)
                
                for k = 1:length(inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins)
                    
                    inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).length                      = 0;
                    inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).surfacearea                 = 0;
                    inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).volume                      = 0;
                    inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).numbersegments              = 0;
                    inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).numberbifurcations          = 0;
                    inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).numberterminations          = 0;
                    inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).rallratio.values            = [];
                    inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).rallratio1.values           = [];
                    inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).rallratio2.values           = [];
                    inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).rallratio3.values           = [];
                    inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).daughterratio.values        = [];
                    inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).parentdaughterratio.values  = [];
                    inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).parentdaughter2ratio.values = [];
                    inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).meandiameter.values         = [];
                    inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).taperrate.values            = [];
                    inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).piecelength.values          = [];
                    
                    
                    if isfield(inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k),'piece') == 1 && isfield(inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).piece,'id')
                        
                        inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).length                      = sum([inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).piece.length]);
                        inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).surfacearea                 = sum([inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).piece.surfacearea]);
                        inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).volume                      = sum([inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).piece.volume]);
                        inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).numbersegments              = length(unique([inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).piece.cable]));
                        inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).numberbifurcations          = 0;
                        inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).numberterminations          = 0;
                        inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).rallratio.values            = [inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).piece.rallratio];
                        inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).rallratio1.values           = [inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).piece.rallratio1];
                        inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).rallratio2.values           = [inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).piece.rallratio2];
                        inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).rallratio3.values           = [inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).piece.rallratio3];
                        inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).daughterratio.values        = [inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).piece.daughterratio];
                        inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).parentdaughterratio.values  = [inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).piece.parentdaughterratio];
                        inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).parentdaughter2ratio.values = [inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).piece.parentdaughter2ratio];
                        inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).meandiameter.values         = ([inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).piece.proximaldiameter]+[inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).piece.distaldiameter])/2;
                        inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).taperrate.values            = [inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).piece.taperrate];
                        inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).piecelength.values          = [inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).piece.length];
                        
                        for m = 1:length(inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).piece)
                            if strcmp(inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).piece(m).distaltype,'bifurcation')==1
                                inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).numberbifurcations = 1 + inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).numberbifurcations;
                            end
                            if strcmp(inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).piece(m).distaltype,'m-furcation')==1
                                inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).numberbifurcations = length(inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).piece(m).daughters) - 1 + inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).numberbifurcations;
                            end
                            if strcmp(inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).piece(m).distaltype,'termination')==1
                                inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).numberterminations = 1 + inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).numberterminations;
                            end
                        end
                    end
                    
                    if isfield(popdata.bifurcation.doublebins,'diameterbins') == 0; nextvalue = 1;
                    elseif j > length(popdata.bifurcation.doublebins.diameterbins); nextvalue = 1;
                    elseif isfield(popdata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k),'length') == 0; nextvalue = 1;
                    elseif isfield(popdata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).length,'values') == 0; nextvalue = 1;
                    else nextvalue = 1 + length(popdata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).length.values);
                    end
                    popdata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).length.values(nextvalue)             = inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).length;
                    popdata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).surfacearea.values(nextvalue)        = inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).surfacearea;
                    popdata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).volume.values(nextvalue)             = inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).volume;
                    popdata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).numbersegments.values(nextvalue)     = inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).numbersegments;
                    popdata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).numberbifurcations.values(nextvalue) = inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).numberbifurcations;
                    popdata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).numberterminations.values(nextvalue) = inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).numberterminations;
                    popdata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).rallratio.values                     = [ [popdata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).rallratio.values] [inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).rallratio.values] ];
                    popdata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).rallratio1.values                    = [ [popdata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).rallratio1.values] [inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).rallratio1.values] ];
                    popdata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).rallratio2.values                    = [ [popdata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).rallratio2.values] [inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).rallratio2.values] ];
                    popdata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).rallratio3.values                    = [ [popdata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).rallratio3.values] [inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).rallratio3.values] ];
                    popdata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).daughterratio.values                 = [ [popdata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).daughterratio.values] [inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).daughterratio.values] ];
                    popdata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).parentdaughterratio.values           = [ [popdata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).parentdaughterratio.values] [inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).parentdaughterratio.values] ];
                    popdata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).parentdaughter2ratio.values          = [ [popdata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).parentdaughter2ratio.values] [inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).parentdaughter2ratio.values] ];
                    popdata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).meandiameter.values                  = [ [popdata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).meandiameter.values] [inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).meandiameter.values] ];
                    popdata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).taperrate.values                     = [ [popdata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).taperrate.values] [inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).taperrate.values] ];
                    popdata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).piecelength.values                   = [ [popdata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).piecelength.values] [inddata.bifurcation.doublebins.diameterbins(j).branchlengthbins(k).piecelength.values] ];
                    clear nextvalue;
                    
                end
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        
        for i = 1:length(popdata.bifurcation.doublebins.diameterbins)
            
            for j = 1:length(popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins)
                
                typeanalysis.bifurcation.doublebin.diameterbranchlength.diameter(i,j)   = popdata.diameterbinmiddles(i);
                typeanalysis.bifurcation.doublebin.diameterbranchlength.branchlength(i,j) = (branchlengthbinwidth * j) - (branchlengthbinwidth / 2);
                
                if isfield(popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).length,'values') == 1
                    
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.length(i,j)      = sum([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).length.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.surfacearea(i,j) = sum([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).surfacearea.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.volume(i,j)      = sum([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).volume.values]);
                    
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.numbersegments(i,j)     = sum([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).numbersegments.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.numberbifurcations(i,j) = sum([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).numberbifurcations.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.numberterminations(i,j) = sum([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).numberterminations.values]);
                    
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio.mean(i,j) = mean([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).rallratio.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio.std(i,j)  = std([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).rallratio.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio.skew(i,j) = skewness([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).rallratio.values],0);
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio.kurt(i,j) = kurtosis([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).rallratio.values],0);
                    
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio1.mean(i,j) = mean([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).rallratio1.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio1.std(i,j)  = std([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).rallratio1.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio1.skew(i,j) = skewness([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).rallratio1.values],0);
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio1.kurt(i,j) = kurtosis([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).rallratio1.values],0);
                    
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio2.mean(i,j) = mean([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).rallratio2.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio2.std(i,j)  = std([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).rallratio2.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio2.skew(i,j) = skewness([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).rallratio2.values],0);
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio2.kurt(i,j) = kurtosis([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).rallratio2.values],0);
                    
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio3.mean(i,j) = mean([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).rallratio3.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio3.std(i,j)  = std([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).rallratio3.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio3.skew(i,j) = skewness([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).rallratio3.values],0);
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio3.kurt(i,j) = kurtosis([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).rallratio3.values],0);
                    
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.daughterratio.mean(i,j) = mean([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).daughterratio.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.daughterratio.std(i,j)  = std([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).daughterratio.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.daughterratio.skew(i,j) = skewness([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).daughterratio.values],0);
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.daughterratio.kurt(i,j) = kurtosis([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).daughterratio.values],0);
                    
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.parentdaughterratio.mean(i,j) = mean([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).parentdaughterratio.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.parentdaughterratio.std(i,j)  = std([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).parentdaughterratio.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.parentdaughterratio.skew(i,j) = skewness([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).parentdaughterratio.values],0);
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.parentdaughterratio.kurt(i,j) = kurtosis([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).parentdaughterratio.values],0);
                    
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.parentdaughter2ratio.mean(i,j) = mean([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).parentdaughter2ratio.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.parentdaughter2ratio.std(i,j)  = std([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).parentdaughter2ratio.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.parentdaughter2ratio.skew(i,j) = skewness([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).parentdaughter2ratio.values],0);
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.parentdaughter2ratio.kurt(i,j) = kurtosis([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).parentdaughter2ratio.values],0);
                    
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.taperrate.mean(i,j) = sum([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).taperrate.values].*[popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).piecelength.values])/sum([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).piecelength.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.taperrate.std(i,j)  = std([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).taperrate.values]);
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.taperrate.skew(i,j) = skewness([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).taperrate.values],0);
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.taperrate.kurt(i,j) = kurtosis([popdata.bifurcation.doublebins.diameterbins(i).branchlengthbins(j).taperrate.values],0);
                    
                    
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.bifurcationprobability.bylength(i,j) = typeanalysis.bifurcation.doublebin.diameterbranchlength.numberbifurcations(i,j) / typeanalysis.bifurcation.doublebin.diameterbranchlength.length(i,j);
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.terminationprobability.bylength(i,j) = typeanalysis.bifurcation.doublebin.diameterbranchlength.numberterminations(i,j) / typeanalysis.bifurcation.doublebin.diameterbranchlength.length(i,j);
                    
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.bifurcationprobability.bysurfacearea(i,j) = typeanalysis.bifurcation.doublebin.diameterbranchlength.numberbifurcations(i,j) / typeanalysis.bifurcation.doublebin.diameterbranchlength.surfacearea(i,j);
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.terminationprobability.bysurfacearea(i,j) = typeanalysis.bifurcation.doublebin.diameterbranchlength.numberterminations(i,j) / typeanalysis.bifurcation.doublebin.diameterbranchlength.surfacearea(i,j);
                    
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.bifurcationprobability.byvolume(i,j) = typeanalysis.bifurcation.doublebin.diameterbranchlength.numberbifurcations(i,j) / typeanalysis.bifurcation.doublebin.diameterbranchlength.volume(i,j);
                    typeanalysis.bifurcation.doublebin.diameterbranchlength.terminationprobability.byvolume(i,j) = typeanalysis.bifurcation.doublebin.diameterbranchlength.numberterminations(i,j) / typeanalysis.bifurcation.doublebin.diameterbranchlength.volume(i,j);
                    
                end
            end
        end
        
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.diameter      = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.diameter,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.diameter),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.branchlength    = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.branchlength,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.branchlength),1);
        
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.length      = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.length,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.length),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.surfacearea = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.surfacearea,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.surfacearea),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.volume      = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.volume,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.volume),1);
        
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.numbersegments     = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.numbersegments,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.numbersegments),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.numberbifurcations = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.numberbifurcations,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.numberbifurcations),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.numberterminations = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.numberterminations,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.numberterminations),1);
        
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.rallratio.mean = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio.mean,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio.mean),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.rallratio.std  = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio.std,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio.std),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.rallratio.skew = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio.skew,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio.skew),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.rallratio.kurt = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio.kurt,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio.kurt),1);
        
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.rallratio1.mean = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio1.mean,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio1.mean),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.rallratio1.std  = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio1.std,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio1.std),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.rallratio1.skew = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio1.skew,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio1.skew),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.rallratio1.kurt = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio1.kurt,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio1.kurt),1);
        
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.rallratio2.mean = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio2.mean,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio2.mean),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.rallratio2.std  = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio2.std,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio2.std),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.rallratio2.skew = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio2.skew,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio2.skew),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.rallratio2.kurt = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio2.kurt,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio2.kurt),1);
        
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.rallratio3.mean = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio3.mean,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio3.mean),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.rallratio3.std  = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio3.std,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio3.std),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.rallratio3.skew = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio3.skew,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio3.skew),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.rallratio3.kurt = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio3.kurt,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.rallratio3.kurt),1);
        
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.daughterratio.mean = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.daughterratio.mean,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.daughterratio.mean),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.daughterratio.std  = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.daughterratio.std,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.daughterratio.std),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.daughterratio.skew = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.daughterratio.skew,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.daughterratio.skew),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.daughterratio.kurt = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.daughterratio.kurt,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.daughterratio.kurt),1);
        
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.parentdaughterratio.mean = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.parentdaughterratio.mean,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.parentdaughterratio.mean),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.parentdaughterratio.std  = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.parentdaughterratio.std,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.parentdaughterratio.std),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.parentdaughterratio.skew = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.parentdaughterratio.skew,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.parentdaughterratio.skew),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.parentdaughterratio.kurt = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.parentdaughterratio.kurt,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.parentdaughterratio.kurt),1);
        
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.parentdaughter2ratio.mean = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.parentdaughter2ratio.mean,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.parentdaughter2ratio.mean),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.parentdaughter2ratio.std  = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.parentdaughter2ratio.std,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.parentdaughter2ratio.std),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.parentdaughter2ratio.skew = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.parentdaughter2ratio.skew,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.parentdaughter2ratio.skew),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.parentdaughter2ratio.kurt = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.parentdaughter2ratio.kurt,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.parentdaughter2ratio.kurt),1);
        
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.taperrate.mean = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.taperrate.mean,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.taperrate.mean),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.taperrate.std  = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.taperrate.std,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.taperrate.std),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.taperrate.skew = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.taperrate.skew,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.taperrate.skew),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.taperrate.kurt = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.taperrate.kurt,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.taperrate.kurt),1);
        
        
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.bifurcationprobability.bylength      = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.bifurcationprobability.bylength,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.bifurcationprobability.bylength),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.bifurcationprobability.bysurfacearea = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.bifurcationprobability.bysurfacearea,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.bifurcationprobability.bysurfacearea),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.bifurcationprobability.byvolume      = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.bifurcationprobability.byvolume,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.bifurcationprobability.byvolume),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.bifurcationprobability.diameter    = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.diameter,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.diameter),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.bifurcationprobability.branchlength  = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.branchlength,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.branchlength),1);
        
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.bifurcationprobability.branchlength  = typeanalysis.bifurcation.doublebin.diameterbranchlength.array.bifurcationprobability.branchlength(~isnan(typeanalysis.bifurcation.doublebin.diameterbranchlength.array.bifurcationprobability.bylength));
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.bifurcationprobability.diameter    = typeanalysis.bifurcation.doublebin.diameterbranchlength.array.bifurcationprobability.diameter(~isnan(typeanalysis.bifurcation.doublebin.diameterbranchlength.array.bifurcationprobability.bylength));
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.bifurcationprobability.byvolume      = typeanalysis.bifurcation.doublebin.diameterbranchlength.array.bifurcationprobability.byvolume(~isnan(typeanalysis.bifurcation.doublebin.diameterbranchlength.array.bifurcationprobability.bylength));
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.bifurcationprobability.bysurfacearea = typeanalysis.bifurcation.doublebin.diameterbranchlength.array.bifurcationprobability.bysurfacearea(~isnan(typeanalysis.bifurcation.doublebin.diameterbranchlength.array.bifurcationprobability.bylength));
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.bifurcationprobability.bylength      = typeanalysis.bifurcation.doublebin.diameterbranchlength.array.bifurcationprobability.bylength(~isnan(typeanalysis.bifurcation.doublebin.diameterbranchlength.array.bifurcationprobability.bylength));
        
        %typeanalysis.bifurcation.doublebin.diameterbranchlength.array.bifurcationprobability.zunzunlength = [typeanalysis.bifurcation.doublebin.diameterbranchlength.array.bifurcationprobability.diameter typeanalysis.bifurcation.doublebin.diameterbranchlength.array.bifurcationprobability.branchlength typeanalysis.bifurcation.doublebin.diameterbranchlength.array.bifurcationprobability.bylength];
        %typeanalysis.bifurcation.doublebin.diameterbranchlength.array.bifurcationprobability.zunzunsurfacearea = [typeanalysis.bifurcation.doublebin.diameterbranchlength.array.bifurcationprobability.diameter typeanalysis.bifurcation.doublebin.diameterbranchlength.array.bifurcationprobability.branchlength typeanalysis.bifurcation.doublebin.diameterbranchlength.array.bifurcationprobability.bysurfacearea];
        %typeanalysis.bifurcation.doublebin.diameterbranchlength.array.bifurcationprobability.zunzunvolume = [typeanalysis.bifurcation.doublebin.diameterbranchlength.array.bifurcationprobability.diameter typeanalysis.bifurcation.doublebin.diameterbranchlength.array.bifurcationprobability.branchlength typeanalysis.bifurcation.doublebin.diameterbranchlength.array.bifurcationprobability.byvolume];
        
        
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.terminationprobability.bylength      = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.terminationprobability.bylength,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.terminationprobability.bylength),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.terminationprobability.bysurfacearea = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.terminationprobability.bysurfacearea,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.terminationprobability.bysurfacearea),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.terminationprobability.byvolume      = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.terminationprobability.byvolume,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.terminationprobability.byvolume),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.terminationprobability.diameter    = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.diameter,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.diameter),1);
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.terminationprobability.branchlength  = reshape(typeanalysis.bifurcation.doublebin.diameterbranchlength.branchlength,numel(typeanalysis.bifurcation.doublebin.diameterbranchlength.branchlength),1);
        
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.terminationprobability.branchlength  = typeanalysis.bifurcation.doublebin.diameterbranchlength.array.terminationprobability.branchlength(~isnan(typeanalysis.bifurcation.doublebin.diameterbranchlength.array.terminationprobability.bylength));
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.terminationprobability.diameter    = typeanalysis.bifurcation.doublebin.diameterbranchlength.array.terminationprobability.diameter(~isnan(typeanalysis.bifurcation.doublebin.diameterbranchlength.array.terminationprobability.bylength));
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.terminationprobability.byvolume      = typeanalysis.bifurcation.doublebin.diameterbranchlength.array.terminationprobability.byvolume(~isnan(typeanalysis.bifurcation.doublebin.diameterbranchlength.array.terminationprobability.bylength));
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.terminationprobability.bysurfacearea = typeanalysis.bifurcation.doublebin.diameterbranchlength.array.terminationprobability.bysurfacearea(~isnan(typeanalysis.bifurcation.doublebin.diameterbranchlength.array.terminationprobability.bylength));
        typeanalysis.bifurcation.doublebin.diameterbranchlength.array.terminationprobability.bylength      = typeanalysis.bifurcation.doublebin.diameterbranchlength.array.terminationprobability.bylength(~isnan(typeanalysis.bifurcation.doublebin.diameterbranchlength.array.terminationprobability.bylength));
        
        %typeanalysis.bifurcation.doublebin.diameterbranchlength.array.terminationprobability.zunzunlength = [typeanalysis.bifurcation.doublebin.diameterbranchlength.array.terminationprobability.diameter typeanalysis.bifurcation.doublebin.diameterbranchlength.array.terminationprobability.branchlength typeanalysis.bifurcation.doublebin.diameterbranchlength.array.terminationprobability.bylength];
        %typeanalysis.bifurcation.doublebin.diameterbranchlength.array.terminationprobability.zunzunsurfacearea = [typeanalysis.bifurcation.doublebin.diameterbranchlength.array.terminationprobability.diameter typeanalysis.bifurcation.doublebin.diameterbranchlength.array.terminationprobability.branchlength typeanalysis.bifurcation.doublebin.diameterbranchlength.array.terminationprobability.bysurfacearea];
        %typeanalysis.bifurcation.doublebin.diameterbranchlength.array.terminationprobability.zunzunvolume = [typeanalysis.bifurcation.doublebin.diameterbranchlength.array.terminationprobability.diameter typeanalysis.bifurcation.doublebin.diameterbranchlength.array.terminationprobability.branchlength typeanalysis.bifurcation.doublebin.diameterbranchlength.array.terminationprobability.byvolume];
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        % Begin termination double bin analysis
        
        for i = 1:maxdiameterbin
            for j = 1:maxbranchlengthbin
                popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).rallratio.values            = [];
                popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).rallratio1.values           = [];
                popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).rallratio2.values           = [];
                popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).rallratio3.values           = [];
                popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).daughterratio.values        = [];
                popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).parentdaughterratio.values  = [];
                popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).parentdaughter2ratio.values = [];
                popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).meandiameter.values         = [];
                popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).taperrate.values            = [];
                popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).piecelength.values          = [];
            end
        end
        
        
        for i = 1:length(data.individual)
            
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            
            for j = 1:length(inddata.termination.doublebins.diameterbins)
                
                for k = 1:length(inddata.termination.doublebins.diameterbins(j).branchlengthbins)
                    
                    inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).length                      = 0;
                    inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).surfacearea                 = 0;
                    inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).volume                      = 0;
                    inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).numbersegments              = 0;
                    inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).numberbifurcations          = 0;
                    inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).numberterminations          = 0;
                    inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).rallratio.values            = [];
                    inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).rallratio1.values           = [];
                    inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).rallratio2.values           = [];
                    inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).rallratio3.values           = [];
                    inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).daughterratio.values        = [];
                    inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).parentdaughterratio.values  = [];
                    inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).parentdaughter2ratio.values = [];
                    inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).meandiameter.values         = [];
                    inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).taperrate.values            = [];
                    inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).piecelength.values          = [];
                    
                    
                    if isfield(inddata.termination.doublebins.diameterbins(j).branchlengthbins(k),'piece') == 1 && isfield(inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).piece,'id')
                        
                        inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).length                      = sum([inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).piece.length]);
                        inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).surfacearea                 = sum([inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).piece.surfacearea]);
                        inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).volume                      = sum([inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).piece.volume]);
                        inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).numbersegments              = length(unique([inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).piece.cable]));
                        inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).numberbifurcations          = 0;
                        inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).numberterminations          = 0;
                        inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).rallratio.values            = [inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).piece.rallratio];
                        inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).rallratio1.values           = [inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).piece.rallratio1];
                        inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).rallratio2.values           = [inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).piece.rallratio2];
                        inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).rallratio3.values           = [inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).piece.rallratio3];
                        inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).daughterratio.values        = [inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).piece.daughterratio];
                        inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).parentdaughterratio.values  = [inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).piece.parentdaughterratio];
                        inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).parentdaughter2ratio.values = [inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).piece.parentdaughter2ratio];
                        inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).meandiameter.values         = ([inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).piece.proximaldiameter]+[inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).piece.distaldiameter])/2;
                        inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).taperrate.values            = [inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).piece.taperrate];
                        inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).piecelength.values          = [inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).piece.length];
                        
                        for m = 1:length(inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).piece)
                            if strcmp(inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).piece(m).distaltype,'bifurcation')==1
                                inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).numberbifurcations = 1 + inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).numberbifurcations;
                            end
                            if strcmp(inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).piece(m).distaltype,'m-furcation')==1
                                inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).numberbifurcations = length(inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).piece(m).daughters) - 1 + inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).numberbifurcations;
                            end
                            if strcmp(inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).piece(m).distaltype,'termination')==1
                                inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).numberterminations = 1 + inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).numberterminations;
                            end
                        end
                    end
                    
                    if isfield(popdata.termination.doublebins,'diameterbins') == 0; nextvalue = 1;
                    elseif j > length(popdata.termination.doublebins.diameterbins); nextvalue = 1;
                    elseif isfield(popdata.termination.doublebins.diameterbins(j).branchlengthbins(k),'length') == 0; nextvalue = 1;
                    elseif isfield(popdata.termination.doublebins.diameterbins(j).branchlengthbins(k).length,'values') == 0; nextvalue = 1;
                    else nextvalue = 1 + length(popdata.termination.doublebins.diameterbins(j).branchlengthbins(k).length.values);
                    end
                    popdata.termination.doublebins.diameterbins(j).branchlengthbins(k).length.values(nextvalue)             = inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).length;
                    popdata.termination.doublebins.diameterbins(j).branchlengthbins(k).surfacearea.values(nextvalue)        = inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).surfacearea;
                    popdata.termination.doublebins.diameterbins(j).branchlengthbins(k).volume.values(nextvalue)             = inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).volume;
                    popdata.termination.doublebins.diameterbins(j).branchlengthbins(k).numbersegments.values(nextvalue)     = inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).numbersegments;
                    popdata.termination.doublebins.diameterbins(j).branchlengthbins(k).numberbifurcations.values(nextvalue) = inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).numberbifurcations;
                    popdata.termination.doublebins.diameterbins(j).branchlengthbins(k).numberterminations.values(nextvalue) = inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).numberterminations;
                    popdata.termination.doublebins.diameterbins(j).branchlengthbins(k).rallratio.values                     = [ [popdata.termination.doublebins.diameterbins(j).branchlengthbins(k).rallratio.values] [inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).rallratio.values] ];
                    popdata.termination.doublebins.diameterbins(j).branchlengthbins(k).rallratio1.values                    = [ [popdata.termination.doublebins.diameterbins(j).branchlengthbins(k).rallratio1.values] [inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).rallratio1.values] ];
                    popdata.termination.doublebins.diameterbins(j).branchlengthbins(k).rallratio2.values                    = [ [popdata.termination.doublebins.diameterbins(j).branchlengthbins(k).rallratio2.values] [inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).rallratio2.values] ];
                    popdata.termination.doublebins.diameterbins(j).branchlengthbins(k).rallratio3.values                    = [ [popdata.termination.doublebins.diameterbins(j).branchlengthbins(k).rallratio3.values] [inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).rallratio3.values] ];
                    popdata.termination.doublebins.diameterbins(j).branchlengthbins(k).daughterratio.values                 = [ [popdata.termination.doublebins.diameterbins(j).branchlengthbins(k).daughterratio.values] [inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).daughterratio.values] ];
                    popdata.termination.doublebins.diameterbins(j).branchlengthbins(k).parentdaughterratio.values           = [ [popdata.termination.doublebins.diameterbins(j).branchlengthbins(k).parentdaughterratio.values] [inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).parentdaughterratio.values] ];
                    popdata.termination.doublebins.diameterbins(j).branchlengthbins(k).parentdaughter2ratio.values          = [ [popdata.termination.doublebins.diameterbins(j).branchlengthbins(k).parentdaughter2ratio.values] [inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).parentdaughter2ratio.values] ];
                    popdata.termination.doublebins.diameterbins(j).branchlengthbins(k).meandiameter.values                  = [ [popdata.termination.doublebins.diameterbins(j).branchlengthbins(k).meandiameter.values] [inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).meandiameter.values] ];
                    popdata.termination.doublebins.diameterbins(j).branchlengthbins(k).taperrate.values                     = [ [popdata.termination.doublebins.diameterbins(j).branchlengthbins(k).taperrate.values] [inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).taperrate.values] ];
                    popdata.termination.doublebins.diameterbins(j).branchlengthbins(k).piecelength.values                   = [ [popdata.termination.doublebins.diameterbins(j).branchlengthbins(k).piecelength.values] [inddata.termination.doublebins.diameterbins(j).branchlengthbins(k).piecelength.values] ];
                    clear nextvalue;
                    
                end
            end
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        
        
        for i = 1:length(popdata.termination.doublebins.diameterbins)
            
            for j = 1:length(popdata.termination.doublebins.diameterbins(i).branchlengthbins)
                
                typeanalysis.termination.doublebin.diameterbranchlength.diameter(i,j)   = popdata.diameterbinmiddles(i);
                typeanalysis.termination.doublebin.diameterbranchlength.branchlength(i,j) = (branchlengthbinwidth * j) - (branchlengthbinwidth / 2);
                
                if isfield(popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).length,'values') == 1
                    
                    typeanalysis.termination.doublebin.diameterbranchlength.length(i,j)      = sum([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).length.values]);
                    typeanalysis.termination.doublebin.diameterbranchlength.surfacearea(i,j) = sum([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).surfacearea.values]);
                    typeanalysis.termination.doublebin.diameterbranchlength.volume(i,j)      = sum([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).volume.values]);
                    
                    typeanalysis.termination.doublebin.diameterbranchlength.numbersegments(i,j)     = sum([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).numbersegments.values]);
                    typeanalysis.termination.doublebin.diameterbranchlength.numberbifurcations(i,j) = sum([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).numberbifurcations.values]);
                    typeanalysis.termination.doublebin.diameterbranchlength.numberterminations(i,j) = sum([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).numberterminations.values]);
                    
                    typeanalysis.termination.doublebin.diameterbranchlength.rallratio.mean(i,j) = mean([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).rallratio.values]);
                    typeanalysis.termination.doublebin.diameterbranchlength.rallratio.std(i,j)  = std([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).rallratio.values]);
                    typeanalysis.termination.doublebin.diameterbranchlength.rallratio.skew(i,j) = skewness([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).rallratio.values],0);
                    typeanalysis.termination.doublebin.diameterbranchlength.rallratio.kurt(i,j) = kurtosis([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).rallratio.values],0);
                    
                    typeanalysis.termination.doublebin.diameterbranchlength.rallratio1.mean(i,j) = mean([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).rallratio1.values]);
                    typeanalysis.termination.doublebin.diameterbranchlength.rallratio1.std(i,j)  = std([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).rallratio1.values]);
                    typeanalysis.termination.doublebin.diameterbranchlength.rallratio1.skew(i,j) = skewness([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).rallratio1.values],0);
                    typeanalysis.termination.doublebin.diameterbranchlength.rallratio1.kurt(i,j) = kurtosis([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).rallratio1.values],0);
                    
                    typeanalysis.termination.doublebin.diameterbranchlength.rallratio2.mean(i,j) = mean([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).rallratio2.values]);
                    typeanalysis.termination.doublebin.diameterbranchlength.rallratio2.std(i,j)  = std([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).rallratio2.values]);
                    typeanalysis.termination.doublebin.diameterbranchlength.rallratio2.skew(i,j) = skewness([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).rallratio2.values],0);
                    typeanalysis.termination.doublebin.diameterbranchlength.rallratio2.kurt(i,j) = kurtosis([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).rallratio2.values],0);
                    
                    typeanalysis.termination.doublebin.diameterbranchlength.rallratio3.mean(i,j) = mean([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).rallratio3.values]);
                    typeanalysis.termination.doublebin.diameterbranchlength.rallratio3.std(i,j)  = std([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).rallratio3.values]);
                    typeanalysis.termination.doublebin.diameterbranchlength.rallratio3.skew(i,j) = skewness([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).rallratio3.values],0);
                    typeanalysis.termination.doublebin.diameterbranchlength.rallratio3.kurt(i,j) = kurtosis([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).rallratio3.values],0);
                    
                    typeanalysis.termination.doublebin.diameterbranchlength.daughterratio.mean(i,j) = mean([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).daughterratio.values]);
                    typeanalysis.termination.doublebin.diameterbranchlength.daughterratio.std(i,j)  = std([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).daughterratio.values]);
                    typeanalysis.termination.doublebin.diameterbranchlength.daughterratio.skew(i,j) = skewness([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).daughterratio.values],0);
                    typeanalysis.termination.doublebin.diameterbranchlength.daughterratio.kurt(i,j) = kurtosis([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).daughterratio.values],0);
                    
                    typeanalysis.termination.doublebin.diameterbranchlength.parentdaughterratio.mean(i,j) = mean([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).parentdaughterratio.values]);
                    typeanalysis.termination.doublebin.diameterbranchlength.parentdaughterratio.std(i,j)  = std([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).parentdaughterratio.values]);
                    typeanalysis.termination.doublebin.diameterbranchlength.parentdaughterratio.skew(i,j) = skewness([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).parentdaughterratio.values],0);
                    typeanalysis.termination.doublebin.diameterbranchlength.parentdaughterratio.kurt(i,j) = kurtosis([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).parentdaughterratio.values],0);
                    
                    typeanalysis.termination.doublebin.diameterbranchlength.parentdaughter2ratio.mean(i,j) = mean([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).parentdaughter2ratio.values]);
                    typeanalysis.termination.doublebin.diameterbranchlength.parentdaughter2ratio.std(i,j)  = std([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).parentdaughter2ratio.values]);
                    typeanalysis.termination.doublebin.diameterbranchlength.parentdaughter2ratio.skew(i,j) = skewness([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).parentdaughter2ratio.values],0);
                    typeanalysis.termination.doublebin.diameterbranchlength.parentdaughter2ratio.kurt(i,j) = kurtosis([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).parentdaughter2ratio.values],0);
                    
                    typeanalysis.termination.doublebin.diameterbranchlength.taperrate.mean(i,j) = sum([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).taperrate.values].*[popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).piecelength.values])/sum([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).piecelength.values]);
                    typeanalysis.termination.doublebin.diameterbranchlength.taperrate.std(i,j)  = std([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).taperrate.values]);
                    typeanalysis.termination.doublebin.diameterbranchlength.taperrate.skew(i,j) = skewness([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).taperrate.values],0);
                    typeanalysis.termination.doublebin.diameterbranchlength.taperrate.kurt(i,j) = kurtosis([popdata.termination.doublebins.diameterbins(i).branchlengthbins(j).taperrate.values],0);
                    
                    
                    typeanalysis.termination.doublebin.diameterbranchlength.bifurcationprobability.bylength(i,j) = typeanalysis.termination.doublebin.diameterbranchlength.numberbifurcations(i,j) / typeanalysis.termination.doublebin.diameterbranchlength.length(i,j);
                    typeanalysis.termination.doublebin.diameterbranchlength.terminationprobability.bylength(i,j) = typeanalysis.termination.doublebin.diameterbranchlength.numberterminations(i,j) / typeanalysis.termination.doublebin.diameterbranchlength.length(i,j);
                    
                    typeanalysis.termination.doublebin.diameterbranchlength.bifurcationprobability.bysurfacearea(i,j) = typeanalysis.termination.doublebin.diameterbranchlength.numberbifurcations(i,j) / typeanalysis.termination.doublebin.diameterbranchlength.surfacearea(i,j);
                    typeanalysis.termination.doublebin.diameterbranchlength.terminationprobability.bysurfacearea(i,j) = typeanalysis.termination.doublebin.diameterbranchlength.numberterminations(i,j) / typeanalysis.termination.doublebin.diameterbranchlength.surfacearea(i,j);
                    
                    typeanalysis.termination.doublebin.diameterbranchlength.bifurcationprobability.byvolume(i,j) = typeanalysis.termination.doublebin.diameterbranchlength.numberbifurcations(i,j) / typeanalysis.termination.doublebin.diameterbranchlength.volume(i,j);
                    typeanalysis.termination.doublebin.diameterbranchlength.terminationprobability.byvolume(i,j) = typeanalysis.termination.doublebin.diameterbranchlength.numberterminations(i,j) / typeanalysis.termination.doublebin.diameterbranchlength.volume(i,j);
                    
                end
            end
        end
        
        typeanalysis.termination.doublebin.diameterbranchlength.array.diameter      = reshape(typeanalysis.termination.doublebin.diameterbranchlength.diameter,numel(typeanalysis.termination.doublebin.diameterbranchlength.diameter),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.branchlength    = reshape(typeanalysis.termination.doublebin.diameterbranchlength.branchlength,numel(typeanalysis.termination.doublebin.diameterbranchlength.branchlength),1);
        
        typeanalysis.termination.doublebin.diameterbranchlength.array.length      = reshape(typeanalysis.termination.doublebin.diameterbranchlength.length,numel(typeanalysis.termination.doublebin.diameterbranchlength.length),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.surfacearea = reshape(typeanalysis.termination.doublebin.diameterbranchlength.surfacearea,numel(typeanalysis.termination.doublebin.diameterbranchlength.surfacearea),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.volume      = reshape(typeanalysis.termination.doublebin.diameterbranchlength.volume,numel(typeanalysis.termination.doublebin.diameterbranchlength.volume),1);
        
        typeanalysis.termination.doublebin.diameterbranchlength.array.numbersegments     = reshape(typeanalysis.termination.doublebin.diameterbranchlength.numbersegments,numel(typeanalysis.termination.doublebin.diameterbranchlength.numbersegments),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.numberbifurcations = reshape(typeanalysis.termination.doublebin.diameterbranchlength.numberbifurcations,numel(typeanalysis.termination.doublebin.diameterbranchlength.numberbifurcations),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.numberterminations = reshape(typeanalysis.termination.doublebin.diameterbranchlength.numberterminations,numel(typeanalysis.termination.doublebin.diameterbranchlength.numberterminations),1);
        
        typeanalysis.termination.doublebin.diameterbranchlength.array.rallratio.mean = reshape(typeanalysis.termination.doublebin.diameterbranchlength.rallratio.mean,numel(typeanalysis.termination.doublebin.diameterbranchlength.rallratio.mean),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.rallratio.std  = reshape(typeanalysis.termination.doublebin.diameterbranchlength.rallratio.std,numel(typeanalysis.termination.doublebin.diameterbranchlength.rallratio.std),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.rallratio.skew = reshape(typeanalysis.termination.doublebin.diameterbranchlength.rallratio.skew,numel(typeanalysis.termination.doublebin.diameterbranchlength.rallratio.skew),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.rallratio.kurt = reshape(typeanalysis.termination.doublebin.diameterbranchlength.rallratio.kurt,numel(typeanalysis.termination.doublebin.diameterbranchlength.rallratio.kurt),1);
        
        typeanalysis.termination.doublebin.diameterbranchlength.array.rallratio1.mean = reshape(typeanalysis.termination.doublebin.diameterbranchlength.rallratio1.mean,numel(typeanalysis.termination.doublebin.diameterbranchlength.rallratio1.mean),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.rallratio1.std  = reshape(typeanalysis.termination.doublebin.diameterbranchlength.rallratio1.std,numel(typeanalysis.termination.doublebin.diameterbranchlength.rallratio1.std),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.rallratio1.skew = reshape(typeanalysis.termination.doublebin.diameterbranchlength.rallratio1.skew,numel(typeanalysis.termination.doublebin.diameterbranchlength.rallratio1.skew),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.rallratio1.kurt = reshape(typeanalysis.termination.doublebin.diameterbranchlength.rallratio1.kurt,numel(typeanalysis.termination.doublebin.diameterbranchlength.rallratio1.kurt),1);
        
        typeanalysis.termination.doublebin.diameterbranchlength.array.rallratio2.mean = reshape(typeanalysis.termination.doublebin.diameterbranchlength.rallratio2.mean,numel(typeanalysis.termination.doublebin.diameterbranchlength.rallratio2.mean),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.rallratio2.std  = reshape(typeanalysis.termination.doublebin.diameterbranchlength.rallratio2.std,numel(typeanalysis.termination.doublebin.diameterbranchlength.rallratio2.std),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.rallratio2.skew = reshape(typeanalysis.termination.doublebin.diameterbranchlength.rallratio2.skew,numel(typeanalysis.termination.doublebin.diameterbranchlength.rallratio2.skew),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.rallratio2.kurt = reshape(typeanalysis.termination.doublebin.diameterbranchlength.rallratio2.kurt,numel(typeanalysis.termination.doublebin.diameterbranchlength.rallratio2.kurt),1);
        
        typeanalysis.termination.doublebin.diameterbranchlength.array.rallratio3.mean = reshape(typeanalysis.termination.doublebin.diameterbranchlength.rallratio3.mean,numel(typeanalysis.termination.doublebin.diameterbranchlength.rallratio3.mean),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.rallratio3.std  = reshape(typeanalysis.termination.doublebin.diameterbranchlength.rallratio3.std,numel(typeanalysis.termination.doublebin.diameterbranchlength.rallratio3.std),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.rallratio3.skew = reshape(typeanalysis.termination.doublebin.diameterbranchlength.rallratio3.skew,numel(typeanalysis.termination.doublebin.diameterbranchlength.rallratio3.skew),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.rallratio3.kurt = reshape(typeanalysis.termination.doublebin.diameterbranchlength.rallratio3.kurt,numel(typeanalysis.termination.doublebin.diameterbranchlength.rallratio3.kurt),1);
        
        typeanalysis.termination.doublebin.diameterbranchlength.array.daughterratio.mean = reshape(typeanalysis.termination.doublebin.diameterbranchlength.daughterratio.mean,numel(typeanalysis.termination.doublebin.diameterbranchlength.daughterratio.mean),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.daughterratio.std  = reshape(typeanalysis.termination.doublebin.diameterbranchlength.daughterratio.std,numel(typeanalysis.termination.doublebin.diameterbranchlength.daughterratio.std),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.daughterratio.skew = reshape(typeanalysis.termination.doublebin.diameterbranchlength.daughterratio.skew,numel(typeanalysis.termination.doublebin.diameterbranchlength.daughterratio.skew),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.daughterratio.kurt = reshape(typeanalysis.termination.doublebin.diameterbranchlength.daughterratio.kurt,numel(typeanalysis.termination.doublebin.diameterbranchlength.daughterratio.kurt),1);
        
        typeanalysis.termination.doublebin.diameterbranchlength.array.parentdaughterratio.mean = reshape(typeanalysis.termination.doublebin.diameterbranchlength.parentdaughterratio.mean,numel(typeanalysis.termination.doublebin.diameterbranchlength.parentdaughterratio.mean),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.parentdaughterratio.std  = reshape(typeanalysis.termination.doublebin.diameterbranchlength.parentdaughterratio.std,numel(typeanalysis.termination.doublebin.diameterbranchlength.parentdaughterratio.std),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.parentdaughterratio.skew = reshape(typeanalysis.termination.doublebin.diameterbranchlength.parentdaughterratio.skew,numel(typeanalysis.termination.doublebin.diameterbranchlength.parentdaughterratio.skew),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.parentdaughterratio.kurt = reshape(typeanalysis.termination.doublebin.diameterbranchlength.parentdaughterratio.kurt,numel(typeanalysis.termination.doublebin.diameterbranchlength.parentdaughterratio.kurt),1);
        
        typeanalysis.termination.doublebin.diameterbranchlength.array.parentdaughter2ratio.mean = reshape(typeanalysis.termination.doublebin.diameterbranchlength.parentdaughter2ratio.mean,numel(typeanalysis.termination.doublebin.diameterbranchlength.parentdaughter2ratio.mean),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.parentdaughter2ratio.std  = reshape(typeanalysis.termination.doublebin.diameterbranchlength.parentdaughter2ratio.std,numel(typeanalysis.termination.doublebin.diameterbranchlength.parentdaughter2ratio.std),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.parentdaughter2ratio.skew = reshape(typeanalysis.termination.doublebin.diameterbranchlength.parentdaughter2ratio.skew,numel(typeanalysis.termination.doublebin.diameterbranchlength.parentdaughter2ratio.skew),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.parentdaughter2ratio.kurt = reshape(typeanalysis.termination.doublebin.diameterbranchlength.parentdaughter2ratio.kurt,numel(typeanalysis.termination.doublebin.diameterbranchlength.parentdaughter2ratio.kurt),1);
        
        typeanalysis.termination.doublebin.diameterbranchlength.array.taperrate.mean = reshape(typeanalysis.termination.doublebin.diameterbranchlength.taperrate.mean,numel(typeanalysis.termination.doublebin.diameterbranchlength.taperrate.mean),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.taperrate.std  = reshape(typeanalysis.termination.doublebin.diameterbranchlength.taperrate.std,numel(typeanalysis.termination.doublebin.diameterbranchlength.taperrate.std),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.taperrate.skew = reshape(typeanalysis.termination.doublebin.diameterbranchlength.taperrate.skew,numel(typeanalysis.termination.doublebin.diameterbranchlength.taperrate.skew),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.taperrate.kurt = reshape(typeanalysis.termination.doublebin.diameterbranchlength.taperrate.kurt,numel(typeanalysis.termination.doublebin.diameterbranchlength.taperrate.kurt),1);
        
        
        typeanalysis.termination.doublebin.diameterbranchlength.array.bifurcationprobability.bylength      = reshape(typeanalysis.termination.doublebin.diameterbranchlength.bifurcationprobability.bylength,numel(typeanalysis.termination.doublebin.diameterbranchlength.bifurcationprobability.bylength),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.bifurcationprobability.bysurfacearea = reshape(typeanalysis.termination.doublebin.diameterbranchlength.bifurcationprobability.bysurfacearea,numel(typeanalysis.termination.doublebin.diameterbranchlength.bifurcationprobability.bysurfacearea),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.bifurcationprobability.byvolume      = reshape(typeanalysis.termination.doublebin.diameterbranchlength.bifurcationprobability.byvolume,numel(typeanalysis.termination.doublebin.diameterbranchlength.bifurcationprobability.byvolume),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.bifurcationprobability.diameter    = reshape(typeanalysis.termination.doublebin.diameterbranchlength.diameter,numel(typeanalysis.termination.doublebin.diameterbranchlength.diameter),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.bifurcationprobability.branchlength  = reshape(typeanalysis.termination.doublebin.diameterbranchlength.branchlength,numel(typeanalysis.termination.doublebin.diameterbranchlength.branchlength),1);
        
        typeanalysis.termination.doublebin.diameterbranchlength.array.bifurcationprobability.branchlength  = typeanalysis.termination.doublebin.diameterbranchlength.array.bifurcationprobability.branchlength(~isnan(typeanalysis.termination.doublebin.diameterbranchlength.array.bifurcationprobability.bylength));
        typeanalysis.termination.doublebin.diameterbranchlength.array.bifurcationprobability.diameter    = typeanalysis.termination.doublebin.diameterbranchlength.array.bifurcationprobability.diameter(~isnan(typeanalysis.termination.doublebin.diameterbranchlength.array.bifurcationprobability.bylength));
        typeanalysis.termination.doublebin.diameterbranchlength.array.bifurcationprobability.byvolume      = typeanalysis.termination.doublebin.diameterbranchlength.array.bifurcationprobability.byvolume(~isnan(typeanalysis.termination.doublebin.diameterbranchlength.array.bifurcationprobability.bylength));
        typeanalysis.termination.doublebin.diameterbranchlength.array.bifurcationprobability.bysurfacearea = typeanalysis.termination.doublebin.diameterbranchlength.array.bifurcationprobability.bysurfacearea(~isnan(typeanalysis.termination.doublebin.diameterbranchlength.array.bifurcationprobability.bylength));
        typeanalysis.termination.doublebin.diameterbranchlength.array.bifurcationprobability.bylength      = typeanalysis.termination.doublebin.diameterbranchlength.array.bifurcationprobability.bylength(~isnan(typeanalysis.termination.doublebin.diameterbranchlength.array.bifurcationprobability.bylength));
        
        %typeanalysis.termination.doublebin.diameterbranchlength.array.bifurcationprobability.zunzunlength = [typeanalysis.termination.doublebin.diameterbranchlength.array.bifurcationprobability.diameter typeanalysis.termination.doublebin.diameterbranchlength.array.bifurcationprobability.branchlength typeanalysis.termination.doublebin.diameterbranchlength.array.bifurcationprobability.bylength];
        %typeanalysis.termination.doublebin.diameterbranchlength.array.bifurcationprobability.zunzunsurfacearea = [typeanalysis.termination.doublebin.diameterbranchlength.array.bifurcationprobability.diameter typeanalysis.termination.doublebin.diameterbranchlength.array.bifurcationprobability.branchlength typeanalysis.termination.doublebin.diameterbranchlength.array.bifurcationprobability.bysurfacearea];
        %typeanalysis.termination.doublebin.diameterbranchlength.array.bifurcationprobability.zunzunvolume = [typeanalysis.termination.doublebin.diameterbranchlength.array.bifurcationprobability.diameter typeanalysis.termination.doublebin.diameterbranchlength.array.bifurcationprobability.branchlength typeanalysis.termination.doublebin.diameterbranchlength.array.bifurcationprobability.byvolume];
        
        
        typeanalysis.termination.doublebin.diameterbranchlength.array.terminationprobability.bylength      = reshape(typeanalysis.termination.doublebin.diameterbranchlength.terminationprobability.bylength,numel(typeanalysis.termination.doublebin.diameterbranchlength.terminationprobability.bylength),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.terminationprobability.bysurfacearea = reshape(typeanalysis.termination.doublebin.diameterbranchlength.terminationprobability.bysurfacearea,numel(typeanalysis.termination.doublebin.diameterbranchlength.terminationprobability.bysurfacearea),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.terminationprobability.byvolume      = reshape(typeanalysis.termination.doublebin.diameterbranchlength.terminationprobability.byvolume,numel(typeanalysis.termination.doublebin.diameterbranchlength.terminationprobability.byvolume),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.terminationprobability.diameter    = reshape(typeanalysis.termination.doublebin.diameterbranchlength.diameter,numel(typeanalysis.termination.doublebin.diameterbranchlength.diameter),1);
        typeanalysis.termination.doublebin.diameterbranchlength.array.terminationprobability.branchlength  = reshape(typeanalysis.termination.doublebin.diameterbranchlength.branchlength,numel(typeanalysis.termination.doublebin.diameterbranchlength.branchlength),1);
        
        typeanalysis.termination.doublebin.diameterbranchlength.array.terminationprobability.branchlength  = typeanalysis.termination.doublebin.diameterbranchlength.array.terminationprobability.branchlength(~isnan(typeanalysis.termination.doublebin.diameterbranchlength.array.terminationprobability.bylength));
        typeanalysis.termination.doublebin.diameterbranchlength.array.terminationprobability.diameter    = typeanalysis.termination.doublebin.diameterbranchlength.array.terminationprobability.diameter(~isnan(typeanalysis.termination.doublebin.diameterbranchlength.array.terminationprobability.bylength));
        typeanalysis.termination.doublebin.diameterbranchlength.array.terminationprobability.byvolume      = typeanalysis.termination.doublebin.diameterbranchlength.array.terminationprobability.byvolume(~isnan(typeanalysis.termination.doublebin.diameterbranchlength.array.terminationprobability.bylength));
        typeanalysis.termination.doublebin.diameterbranchlength.array.terminationprobability.bysurfacearea = typeanalysis.termination.doublebin.diameterbranchlength.array.terminationprobability.bysurfacearea(~isnan(typeanalysis.termination.doublebin.diameterbranchlength.array.terminationprobability.bylength));
        typeanalysis.termination.doublebin.diameterbranchlength.array.terminationprobability.bylength      = typeanalysis.termination.doublebin.diameterbranchlength.array.terminationprobability.bylength(~isnan(typeanalysis.termination.doublebin.diameterbranchlength.array.terminationprobability.bylength));
        
        %typeanalysis.termination.doublebin.diameterbranchlength.array.terminationprobability.zunzunlength = [typeanalysis.termination.doublebin.diameterbranchlength.array.terminationprobability.diameter typeanalysis.termination.doublebin.diameterbranchlength.array.terminationprobability.branchlength typeanalysis.termination.doublebin.diameterbranchlength.array.terminationprobability.bylength];
        %typeanalysis.termination.doublebin.diameterbranchlength.array.terminationprobability.zunzunsurfacearea = [typeanalysis.termination.doublebin.diameterbranchlength.array.terminationprobability.diameter typeanalysis.termination.doublebin.diameterbranchlength.array.terminationprobability.branchlength typeanalysis.termination.doublebin.diameterbranchlength.array.terminationprobability.bysurfacearea];
        %typeanalysis.termination.doublebin.diameterbranchlength.array.terminationprobability.zunzunvolume = [typeanalysis.termination.doublebin.diameterbranchlength.array.terminationprobability.diameter typeanalysis.termination.doublebin.diameterbranchlength.array.terminationprobability.branchlength typeanalysis.termination.doublebin.diameterbranchlength.array.terminationprobability.byvolume];
        
        eval(['analysis.' currentpiecetype ' = typeanalysis;']);
        eval(['data.population.' currentpiecetype ' = popdata;']);
        
    end
end









warning('on', 'MATLAB:divideByZero');