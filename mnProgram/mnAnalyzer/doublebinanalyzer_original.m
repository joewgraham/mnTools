function [data,analysis]   = doublebinanalyzer(data,analysis)

disp('   Double bin analysis started.');

warning('off', 'MATLAB:divideByZero');

maxdiameterbin   = length(data.individual(1).doublebins.diameterbins);
maxpathlengthbin = length(data.individual(1).doublebins.diameterbins(1).pathlengthbins);


for i = 1:maxdiameterbin
    for j = 1:maxpathlengthbin
        data.population.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values            = [];
        data.population.doublebins.diameterbins(i).pathlengthbins(j).rallratio1.values           = [];
        data.population.doublebins.diameterbins(i).pathlengthbins(j).rallratio2.values           = [];
        data.population.doublebins.diameterbins(i).pathlengthbins(j).rallratio3.values           = [];
		data.population.doublebins.diameterbins(i).pathlengthbins(j).daughterratio.values        = [];
        data.population.doublebins.diameterbins(i).pathlengthbins(j).parentdaughterratio.values  = [];
        data.population.doublebins.diameterbins(i).pathlengthbins(j).parentdaughter2ratio.values = [];
        data.population.doublebins.diameterbins(i).pathlengthbins(j).meandiameter.values         = [];
        data.population.doublebins.diameterbins(i).pathlengthbins(j).taperrate.values            = [];
        data.population.doublebins.diameterbins(i).pathlengthbins(j).piecelength.values          = [];
    end
end
    

for i = 1:length(data.individual)
    
    for j = 1:length(data.individual(i).doublebins.diameterbins)
        
        for k = 1:length(data.individual(i).doublebins.diameterbins(j).pathlengthbins)
        
            data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).length                      = 0;
            data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).surfacearea                 = 0;
            data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).volume                      = 0;
            data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).numbersegments              = 0;
            data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations          = 0;
            data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).numberterminations          = 0;
            data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).numberbifurcatingbranches   = 0;
            data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).numberterminatingbranches   = 0;
            data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).rallratio.values            = [];
            data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).rallratio1.values           = [];
            data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).rallratio2.values           = [];
			data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).rallratio3.values           = [];
            data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).daughterratio.values        = [];
            data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).parentdaughterratio.values  = [];
            data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).parentdaughter2ratio.values = [];
            data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).meandiameter.values         = [];
            data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).taperrate.values            = [];
            data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).piecelength.values          = [];
        
        
            if isfield(data.individual(i).doublebins.diameterbins(j).pathlengthbins(k),'piece') == 1 && isfield(data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).piece,'id')

                data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).length                      = sum([data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).piece.length]);
                data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).surfacearea                 = sum([data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).piece.surfacearea]);
                data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).volume                      = sum([data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).piece.volume]);
                data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).numbersegments              = length(unique([data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).piece.cable]));
                data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations          = 0;
                data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).numberterminations          = 0;
                data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).numberbifurcatingbranches   = 0;
                data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).numberterminatingbranches   = 0;
                data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).rallratio.values            = [data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).piece.rallratio];
                data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).rallratio1.values           = [data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).piece.rallratio1];
                data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).rallratio2.values           = [data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).piece.rallratio2];
				data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).rallratio3.values           = [data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).piece.rallratio3];
                data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).daughterratio.values        = [data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).piece.daughterratio];
                data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).parentdaughterratio.values  = [data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).piece.parentdaughterratio];
                data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).parentdaughter2ratio.values = [data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).piece.parentdaughter2ratio];
                data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).meandiameter.values         = ([data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).piece.proximaldiameter]+[data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).piece.distaldiameter])/2;            
                data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).taperrate.values            = [data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).piece.taperrate];
                data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).piecelength.values          = [data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).piece.length];

                for m = 1:length(data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).piece)           
                    if strcmp(data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).piece(m).distaltype,'bifurcation')==1
                        data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations = 1 + data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations;
                    end
                    if strcmp(data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).piece(m).distaltype,'termination')==1
                        data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).numberterminations = 1 + data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).numberterminations;
                    end
                    if strcmp(data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).piece(m).proximaltype,'primary    ')==1 || strcmp(data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).piece(m).proximaltype,'daughter1  ')==1 || strcmp(data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).piece(m).proximaltype,'daughter2  ')==1
                        if strcmp(data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).piece(m).branchtype,'b')==1
                            data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).numberbifurcatingbranches = 1 + data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).numberbifurcatingbranches;
                        elseif strcmp(data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).piece(m).branchtype,'t')==1
                            data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).numberterminatingbranches = 1 + data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).numberterminatingbranches;
                        else disp('        Error in doublebinanalyzer: piece branch type not identified');
                        end
                    end
                end
            end
            
            if isfield(data.population.doublebins,'diameterbins') == 0; nextvalue = 1;
            elseif j > length(data.population.doublebins.diameterbins); nextvalue = 1;
            elseif isfield(data.population.doublebins.diameterbins(j).pathlengthbins(k),'length') == 0; nextvalue = 1;
            elseif isfield(data.population.doublebins.diameterbins(j).pathlengthbins(k).length,'values') == 0; nextvalue = 1;
            else nextvalue = 1 + length(data.population.doublebins.diameterbins(j).pathlengthbins(k).length.values);
            end
            data.population.doublebins.diameterbins(j).pathlengthbins(k).length.values(nextvalue)             = data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).length;
            data.population.doublebins.diameterbins(j).pathlengthbins(k).surfacearea.values(nextvalue)        = data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).surfacearea;
            data.population.doublebins.diameterbins(j).pathlengthbins(k).volume.values(nextvalue)             = data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).volume;
            data.population.doublebins.diameterbins(j).pathlengthbins(k).numbersegments.values(nextvalue)     = data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).numbersegments;
            data.population.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations.values(nextvalue) = data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations;
            data.population.doublebins.diameterbins(j).pathlengthbins(k).numberterminations.values(nextvalue) = data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).numberterminations;
            data.population.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcatingbranches.values(nextvalue) = data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).numberbifurcatingbranches;
            data.population.doublebins.diameterbins(j).pathlengthbins(k).numberterminatingbranches.values(nextvalue) = data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).numberterminatingbranches;
            data.population.doublebins.diameterbins(j).pathlengthbins(k).rallratio.values                     = [ [data.population.doublebins.diameterbins(j).pathlengthbins(k).rallratio.values] [data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).rallratio.values] ];
            data.population.doublebins.diameterbins(j).pathlengthbins(k).rallratio1.values                    = [ [data.population.doublebins.diameterbins(j).pathlengthbins(k).rallratio1.values] [data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).rallratio1.values] ];
            data.population.doublebins.diameterbins(j).pathlengthbins(k).rallratio2.values                    = [ [data.population.doublebins.diameterbins(j).pathlengthbins(k).rallratio2.values] [data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).rallratio2.values] ];
			data.population.doublebins.diameterbins(j).pathlengthbins(k).rallratio3.values                    = [ [data.population.doublebins.diameterbins(j).pathlengthbins(k).rallratio3.values] [data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).rallratio3.values] ];
            data.population.doublebins.diameterbins(j).pathlengthbins(k).daughterratio.values                 = [ [data.population.doublebins.diameterbins(j).pathlengthbins(k).daughterratio.values] [data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).daughterratio.values] ];
            data.population.doublebins.diameterbins(j).pathlengthbins(k).parentdaughterratio.values           = [ [data.population.doublebins.diameterbins(j).pathlengthbins(k).parentdaughterratio.values] [data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).parentdaughterratio.values] ];
            data.population.doublebins.diameterbins(j).pathlengthbins(k).parentdaughter2ratio.values          = [ [data.population.doublebins.diameterbins(j).pathlengthbins(k).parentdaughter2ratio.values] [data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).parentdaughter2ratio.values] ];
            data.population.doublebins.diameterbins(j).pathlengthbins(k).meandiameter.values                  = [ [data.population.doublebins.diameterbins(j).pathlengthbins(k).meandiameter.values] [data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).meandiameter.values] ];
            data.population.doublebins.diameterbins(j).pathlengthbins(k).taperrate.values                     = [ [data.population.doublebins.diameterbins(j).pathlengthbins(k).taperrate.values] [data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).taperrate.values] ];
            data.population.doublebins.diameterbins(j).pathlengthbins(k).piecelength.values                   = [ [data.population.doublebins.diameterbins(j).pathlengthbins(k).piecelength.values] [data.individual(i).doublebins.diameterbins(j).pathlengthbins(k).piecelength.values] ];
            clear nextvalue;
            
        end
    end
end


for i = 1:length(data.population.doublebins.diameterbins)
    
    for j = 1:length(data.population.doublebins.diameterbins(i).pathlengthbins)
        
        analysis.doublebin.diameter(i,j)   = data.population.diameterbinmiddles(i);
        analysis.doublebin.pathlength(i,j) = data.population.pathlengthbinmiddles(j);
    
        if isfield(data.population.doublebins.diameterbins(i).pathlengthbins(j).length,'values') == 1

            analysis.doublebin.length(i,j)      = sum([data.population.doublebins.diameterbins(i).pathlengthbins(j).length.values]);
            analysis.doublebin.surfacearea(i,j) = sum([data.population.doublebins.diameterbins(i).pathlengthbins(j).surfacearea.values]);
            analysis.doublebin.volume(i,j)      = sum([data.population.doublebins.diameterbins(i).pathlengthbins(j).volume.values]);
            
            analysis.doublebin.numbersegments(i,j)     = sum([data.population.doublebins.diameterbins(i).pathlengthbins(j).numbersegments.values]);
            analysis.doublebin.numberbifurcations(i,j) = sum([data.population.doublebins.diameterbins(i).pathlengthbins(j).numberbifurcations.values]);
            analysis.doublebin.numberterminations(i,j) = sum([data.population.doublebins.diameterbins(i).pathlengthbins(j).numberterminations.values]);
            analysis.doublebin.numberbifurcatingbranches(i,j) = sum([data.population.doublebins.diameterbins(i).pathlengthbins(j).numberbifurcatingbranches.values]);
            analysis.doublebin.numberterminatingbranches(i,j) = sum([data.population.doublebins.diameterbins(i).pathlengthbins(j).numberterminatingbranches.values]);
            
            analysis.doublebin.rallratio.mean(i,j) = mean([data.population.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values]);
            analysis.doublebin.rallratio.std(i,j)  = std([data.population.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values]);
            analysis.doublebin.rallratio.skew(i,j) = skewness([data.population.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values],0);
            analysis.doublebin.rallratio.kurt(i,j) = kurtosis([data.population.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values],0);
            
            analysis.doublebin.rallratio1.mean(i,j) = mean([data.population.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values]);
            analysis.doublebin.rallratio1.std(i,j)  = std([data.population.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values]);
            analysis.doublebin.rallratio1.skew(i,j) = skewness([data.population.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values],0);
            analysis.doublebin.rallratio1.kurt(i,j) = kurtosis([data.population.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values],0);
            
            analysis.doublebin.rallratio2.mean(i,j) = mean([data.population.doublebins.diameterbins(i).pathlengthbins(j).rallratio2.values]);
            analysis.doublebin.rallratio2.std(i,j)  = std([data.population.doublebins.diameterbins(i).pathlengthbins(j).rallratio2.values]);
            analysis.doublebin.rallratio2.skew(i,j) = skewness([data.population.doublebins.diameterbins(i).pathlengthbins(j).rallratio2.values],0);
            analysis.doublebin.rallratio2.kurt(i,j) = kurtosis([data.population.doublebins.diameterbins(i).pathlengthbins(j).rallratio2.values],0);
			
			analysis.doublebin.rallratio3.mean(i,j) = mean([data.population.doublebins.diameterbins(i).pathlengthbins(j).rallratio3.values]);
            analysis.doublebin.rallratio3.std(i,j)  = std([data.population.doublebins.diameterbins(i).pathlengthbins(j).rallratio3.values]);
            analysis.doublebin.rallratio3.skew(i,j) = skewness([data.population.doublebins.diameterbins(i).pathlengthbins(j).rallratio3.values],0);
            analysis.doublebin.rallratio3.kurt(i,j) = kurtosis([data.population.doublebins.diameterbins(i).pathlengthbins(j).rallratio3.values],0);
            
            analysis.doublebin.daughterratio.mean(i,j) = mean([data.population.doublebins.diameterbins(i).pathlengthbins(j).daughterratio.values]);
            analysis.doublebin.daughterratio.std(i,j)  = std([data.population.doublebins.diameterbins(i).pathlengthbins(j).daughterratio.values]);
            analysis.doublebin.daughterratio.skew(i,j) = skewness([data.population.doublebins.diameterbins(i).pathlengthbins(j).daughterratio.values],0);
            analysis.doublebin.daughterratio.kurt(i,j) = kurtosis([data.population.doublebins.diameterbins(i).pathlengthbins(j).daughterratio.values],0);
            
            analysis.doublebin.parentdaughterratio.mean(i,j) = mean([data.population.doublebins.diameterbins(i).pathlengthbins(j).parentdaughterratio.values]);
            analysis.doublebin.parentdaughterratio.std(i,j)  = std([data.population.doublebins.diameterbins(i).pathlengthbins(j).parentdaughterratio.values]);
            analysis.doublebin.parentdaughterratio.skew(i,j) = skewness([data.population.doublebins.diameterbins(i).pathlengthbins(j).parentdaughterratio.values],0);
            analysis.doublebin.parentdaughterratio.kurt(i,j) = kurtosis([data.population.doublebins.diameterbins(i).pathlengthbins(j).parentdaughterratio.values],0);
            
            analysis.doublebin.parentdaughter2ratio.mean(i,j) = mean([data.population.doublebins.diameterbins(i).pathlengthbins(j).parentdaughter2ratio.values]);
            analysis.doublebin.parentdaughter2ratio.std(i,j)  = std([data.population.doublebins.diameterbins(i).pathlengthbins(j).parentdaughter2ratio.values]);
            analysis.doublebin.parentdaughter2ratio.skew(i,j) = skewness([data.population.doublebins.diameterbins(i).pathlengthbins(j).parentdaughter2ratio.values],0);
            analysis.doublebin.parentdaughter2ratio.kurt(i,j) = kurtosis([data.population.doublebins.diameterbins(i).pathlengthbins(j).parentdaughter2ratio.values],0);
            
            analysis.doublebin.taperrate.mean(i,j) = sum([data.population.doublebins.diameterbins(i).pathlengthbins(j).taperrate.values].*[data.population.doublebins.diameterbins(i).pathlengthbins(j).piecelength.values])/sum([data.population.doublebins.diameterbins(i).pathlengthbins(j).piecelength.values]);
            analysis.doublebin.taperrate.std(i,j)  = std([data.population.doublebins.diameterbins(i).pathlengthbins(j).taperrate.values]);
            analysis.doublebin.taperrate.skew(i,j) = skewness([data.population.doublebins.diameterbins(i).pathlengthbins(j).taperrate.values],0);
            analysis.doublebin.taperrate.kurt(i,j) = kurtosis([data.population.doublebins.diameterbins(i).pathlengthbins(j).taperrate.values],0);
            
            
            analysis.doublebin.bifurcationprobability.bylength(i,j) = analysis.doublebin.numberbifurcations(i,j) / analysis.doublebin.length(i,j);
            analysis.doublebin.terminationprobability.bylength(i,j) = analysis.doublebin.numberterminations(i,j) / analysis.doublebin.length(i,j);
            
            analysis.doublebin.bifurcationprobability.bysurfacearea(i,j) = analysis.doublebin.numberbifurcations(i,j) / analysis.doublebin.surfacearea(i,j);
            analysis.doublebin.terminationprobability.bysurfacearea(i,j) = analysis.doublebin.numberterminations(i,j) / analysis.doublebin.surfacearea(i,j);
            
            analysis.doublebin.bifurcationprobability.byvolume(i,j) = analysis.doublebin.numberbifurcations(i,j) / analysis.doublebin.volume(i,j);
            analysis.doublebin.terminationprobability.byvolume(i,j) = analysis.doublebin.numberterminations(i,j) / analysis.doublebin.volume(i,j);

        end
    end
end

analysis.doublebin.array.diameter      = reshape(analysis.doublebin.diameter,numel(analysis.doublebin.diameter),1);
analysis.doublebin.array.pathlength    = reshape(analysis.doublebin.pathlength,numel(analysis.doublebin.pathlength),1);

analysis.doublebin.array.diameter   = reshape(analysis.doublebin.diameter,numel(analysis.doublebin.diameter),1);
analysis.doublebin.array.pathlength = reshape(analysis.doublebin.pathlength,numel(analysis.doublebin.pathlength),1);

analysis.doublebin.array.length      = reshape(analysis.doublebin.length,numel(analysis.doublebin.length),1);
analysis.doublebin.array.surfacearea = reshape(analysis.doublebin.surfacearea,numel(analysis.doublebin.surfacearea),1);
analysis.doublebin.array.volume      = reshape(analysis.doublebin.volume,numel(analysis.doublebin.volume),1);

analysis.doublebin.array.numbersegments     = reshape(analysis.doublebin.numbersegments,numel(analysis.doublebin.numbersegments),1);
analysis.doublebin.array.numberbifurcations = reshape(analysis.doublebin.numberbifurcations,numel(analysis.doublebin.numberbifurcations),1);
analysis.doublebin.array.numberterminations = reshape(analysis.doublebin.numberterminations,numel(analysis.doublebin.numberterminations),1);
analysis.doublebin.array.numberbifurcatingbranches = reshape(analysis.doublebin.numberbifurcatingbranches,numel(analysis.doublebin.numberbifurcatingbranches),1);
analysis.doublebin.array.numberterminatingbranches = reshape(analysis.doublebin.numberterminatingbranches,numel(analysis.doublebin.numberterminatingbranches),1);

analysis.doublebin.array.rallratio.mean = reshape(analysis.doublebin.rallratio.mean,numel(analysis.doublebin.rallratio.mean),1);
analysis.doublebin.array.rallratio.std  = reshape(analysis.doublebin.rallratio.std,numel(analysis.doublebin.rallratio.std),1);
analysis.doublebin.array.rallratio.skew = reshape(analysis.doublebin.rallratio.skew,numel(analysis.doublebin.rallratio.skew),1);
analysis.doublebin.array.rallratio.kurt = reshape(analysis.doublebin.rallratio.kurt,numel(analysis.doublebin.rallratio.kurt),1);

analysis.doublebin.array.rallratio1.mean = reshape(analysis.doublebin.rallratio1.mean,numel(analysis.doublebin.rallratio1.mean),1);
analysis.doublebin.array.rallratio1.std  = reshape(analysis.doublebin.rallratio1.std,numel(analysis.doublebin.rallratio1.std),1);
analysis.doublebin.array.rallratio1.skew = reshape(analysis.doublebin.rallratio1.skew,numel(analysis.doublebin.rallratio1.skew),1);
analysis.doublebin.array.rallratio1.kurt = reshape(analysis.doublebin.rallratio1.kurt,numel(analysis.doublebin.rallratio1.kurt),1);

analysis.doublebin.array.rallratio2.mean = reshape(analysis.doublebin.rallratio2.mean,numel(analysis.doublebin.rallratio2.mean),1);
analysis.doublebin.array.rallratio2.std  = reshape(analysis.doublebin.rallratio2.std,numel(analysis.doublebin.rallratio2.std),1);
analysis.doublebin.array.rallratio2.skew = reshape(analysis.doublebin.rallratio2.skew,numel(analysis.doublebin.rallratio2.skew),1);
analysis.doublebin.array.rallratio2.kurt = reshape(analysis.doublebin.rallratio2.kurt,numel(analysis.doublebin.rallratio2.kurt),1);

analysis.doublebin.array.rallratio3.mean = reshape(analysis.doublebin.rallratio3.mean,numel(analysis.doublebin.rallratio3.mean),1);
analysis.doublebin.array.rallratio3.std  = reshape(analysis.doublebin.rallratio3.std,numel(analysis.doublebin.rallratio3.std),1);
analysis.doublebin.array.rallratio3.skew = reshape(analysis.doublebin.rallratio3.skew,numel(analysis.doublebin.rallratio3.skew),1);
analysis.doublebin.array.rallratio3.kurt = reshape(analysis.doublebin.rallratio3.kurt,numel(analysis.doublebin.rallratio3.kurt),1);

analysis.doublebin.array.daughterratio.mean = reshape(analysis.doublebin.daughterratio.mean,numel(analysis.doublebin.daughterratio.mean),1);
analysis.doublebin.array.daughterratio.std  = reshape(analysis.doublebin.daughterratio.std,numel(analysis.doublebin.daughterratio.std),1);
analysis.doublebin.array.daughterratio.skew = reshape(analysis.doublebin.daughterratio.skew,numel(analysis.doublebin.daughterratio.skew),1);
analysis.doublebin.array.daughterratio.kurt = reshape(analysis.doublebin.daughterratio.kurt,numel(analysis.doublebin.daughterratio.kurt),1);

analysis.doublebin.array.parentdaughterratio.mean = reshape(analysis.doublebin.parentdaughterratio.mean,numel(analysis.doublebin.parentdaughterratio.mean),1);
analysis.doublebin.array.parentdaughterratio.std  = reshape(analysis.doublebin.parentdaughterratio.std,numel(analysis.doublebin.parentdaughterratio.std),1);
analysis.doublebin.array.parentdaughterratio.skew = reshape(analysis.doublebin.parentdaughterratio.skew,numel(analysis.doublebin.parentdaughterratio.skew),1);
analysis.doublebin.array.parentdaughterratio.kurt = reshape(analysis.doublebin.parentdaughterratio.kurt,numel(analysis.doublebin.parentdaughterratio.kurt),1);

analysis.doublebin.array.parentdaughter2ratio.mean = reshape(analysis.doublebin.parentdaughter2ratio.mean,numel(analysis.doublebin.parentdaughter2ratio.mean),1);
analysis.doublebin.array.parentdaughter2ratio.std  = reshape(analysis.doublebin.parentdaughter2ratio.std,numel(analysis.doublebin.parentdaughter2ratio.std),1);
analysis.doublebin.array.parentdaughter2ratio.skew = reshape(analysis.doublebin.parentdaughter2ratio.skew,numel(analysis.doublebin.parentdaughter2ratio.skew),1);
analysis.doublebin.array.parentdaughter2ratio.kurt = reshape(analysis.doublebin.parentdaughter2ratio.kurt,numel(analysis.doublebin.parentdaughter2ratio.kurt),1);

analysis.doublebin.array.taperrate.mean = reshape(analysis.doublebin.taperrate.mean,numel(analysis.doublebin.taperrate.mean),1);
analysis.doublebin.array.taperrate.std  = reshape(analysis.doublebin.taperrate.std,numel(analysis.doublebin.taperrate.std),1);
analysis.doublebin.array.taperrate.skew = reshape(analysis.doublebin.taperrate.skew,numel(analysis.doublebin.taperrate.skew),1);
analysis.doublebin.array.taperrate.kurt = reshape(analysis.doublebin.taperrate.kurt,numel(analysis.doublebin.taperrate.kurt),1);


analysis.doublebin.array.bifurcationprobability.bylength      = reshape(analysis.doublebin.bifurcationprobability.bylength,numel(analysis.doublebin.bifurcationprobability.bylength),1);
analysis.doublebin.array.bifurcationprobability.bysurfacearea = reshape(analysis.doublebin.bifurcationprobability.bysurfacearea,numel(analysis.doublebin.bifurcationprobability.bysurfacearea),1);
analysis.doublebin.array.bifurcationprobability.byvolume      = reshape(analysis.doublebin.bifurcationprobability.byvolume,numel(analysis.doublebin.bifurcationprobability.byvolume),1);
analysis.doublebin.array.bifurcationprobability.diameter    = reshape(analysis.doublebin.diameter,numel(analysis.doublebin.diameter),1);
analysis.doublebin.array.bifurcationprobability.pathlength  = reshape(analysis.doublebin.pathlength,numel(analysis.doublebin.pathlength),1);

analysis.doublebin.array.bifurcationprobability.pathlength  = analysis.doublebin.array.bifurcationprobability.pathlength(~isnan(analysis.doublebin.array.bifurcationprobability.bylength));
analysis.doublebin.array.bifurcationprobability.diameter    = analysis.doublebin.array.bifurcationprobability.diameter(~isnan(analysis.doublebin.array.bifurcationprobability.bylength));
analysis.doublebin.array.bifurcationprobability.byvolume      = analysis.doublebin.array.bifurcationprobability.byvolume(~isnan(analysis.doublebin.array.bifurcationprobability.bylength));
analysis.doublebin.array.bifurcationprobability.bysurfacearea = analysis.doublebin.array.bifurcationprobability.bysurfacearea(~isnan(analysis.doublebin.array.bifurcationprobability.bylength));
analysis.doublebin.array.bifurcationprobability.bylength      = analysis.doublebin.array.bifurcationprobability.bylength(~isnan(analysis.doublebin.array.bifurcationprobability.bylength));

analysis.doublebin.array.bifurcationprobability.zunzunlength = [analysis.doublebin.array.bifurcationprobability.diameter analysis.doublebin.array.bifurcationprobability.pathlength analysis.doublebin.array.bifurcationprobability.bylength];
analysis.doublebin.array.bifurcationprobability.zunzunsurfacearea = [analysis.doublebin.array.bifurcationprobability.diameter analysis.doublebin.array.bifurcationprobability.pathlength analysis.doublebin.array.bifurcationprobability.bysurfacearea];
analysis.doublebin.array.bifurcationprobability.zunzunvolume = [analysis.doublebin.array.bifurcationprobability.diameter analysis.doublebin.array.bifurcationprobability.pathlength analysis.doublebin.array.bifurcationprobability.byvolume];


analysis.doublebin.array.terminationprobability.bylength      = reshape(analysis.doublebin.terminationprobability.bylength,numel(analysis.doublebin.terminationprobability.bylength),1);
analysis.doublebin.array.terminationprobability.bysurfacearea = reshape(analysis.doublebin.terminationprobability.bysurfacearea,numel(analysis.doublebin.terminationprobability.bysurfacearea),1);
analysis.doublebin.array.terminationprobability.byvolume      = reshape(analysis.doublebin.terminationprobability.byvolume,numel(analysis.doublebin.terminationprobability.byvolume),1);
analysis.doublebin.array.terminationprobability.diameter    = reshape(analysis.doublebin.diameter,numel(analysis.doublebin.diameter),1);
analysis.doublebin.array.terminationprobability.pathlength  = reshape(analysis.doublebin.pathlength,numel(analysis.doublebin.pathlength),1);

analysis.doublebin.array.terminationprobability.pathlength  = analysis.doublebin.array.terminationprobability.pathlength(~isnan(analysis.doublebin.array.terminationprobability.bylength));
analysis.doublebin.array.terminationprobability.diameter    = analysis.doublebin.array.terminationprobability.diameter(~isnan(analysis.doublebin.array.terminationprobability.bylength));
analysis.doublebin.array.terminationprobability.byvolume      = analysis.doublebin.array.terminationprobability.byvolume(~isnan(analysis.doublebin.array.terminationprobability.bylength));
analysis.doublebin.array.terminationprobability.bysurfacearea = analysis.doublebin.array.terminationprobability.bysurfacearea(~isnan(analysis.doublebin.array.terminationprobability.bylength));
analysis.doublebin.array.terminationprobability.bylength      = analysis.doublebin.array.terminationprobability.bylength(~isnan(analysis.doublebin.array.terminationprobability.bylength));

analysis.doublebin.array.terminationprobability.zunzunlength = [analysis.doublebin.array.terminationprobability.diameter analysis.doublebin.array.terminationprobability.pathlength analysis.doublebin.array.terminationprobability.bylength];
analysis.doublebin.array.terminationprobability.zunzunsurfacearea = [analysis.doublebin.array.terminationprobability.diameter analysis.doublebin.array.terminationprobability.pathlength analysis.doublebin.array.terminationprobability.bysurfacearea];
analysis.doublebin.array.terminationprobability.zunzunvolume = [analysis.doublebin.array.terminationprobability.diameter analysis.doublebin.array.terminationprobability.pathlength analysis.doublebin.array.terminationprobability.byvolume];























% Begin bifurcation double bin analysis

for i = 1:maxdiameterbin
    for j = 1:maxpathlengthbin
        data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values            = [];
        data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio1.values           = [];
        data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio2.values           = [];
		data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio3.values           = [];
        data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).daughterratio.values        = [];
        data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).parentdaughterratio.values  = [];
        data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).parentdaughter2ratio.values = [];
        data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).meandiameter.values         = [];
        data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).taperrate.values            = [];
        data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).piecelength.values          = [];
    end
end


for i = 1:length(data.individual)
    
    for j = 1:length(data.individual(i).bifurcation.doublebins.diameterbins)
        
        for k = 1:length(data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins)
        
            data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).length                      = 0;
            data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).surfacearea                 = 0;
            data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).volume                      = 0;
            data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numbersegments              = 0;
            data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations          = 0;
            data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numberterminations          = 0;
            data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio.values            = [];
            data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio1.values           = [];
            data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio2.values           = [];
			data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio3.values           = [];
            data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).daughterratio.values        = [];
            data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).parentdaughterratio.values  = [];
            data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).parentdaughter2ratio.values = [];
            data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).meandiameter.values         = [];
            data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).taperrate.values            = [];
            data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piecelength.values          = [];
        
        
            if isfield(data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k),'piece') == 1 && isfield(data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece,'id')

                data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).length                      = sum([data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece.length]);
                data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).surfacearea                 = sum([data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece.surfacearea]);
                data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).volume                      = sum([data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece.volume]);
                data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numbersegments              = length(unique([data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece.cable]));
                data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations          = 0;
                data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numberterminations          = 0;
                data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio.values            = [data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece.rallratio];
                data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio1.values           = [data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece.rallratio1];
                data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio2.values           = [data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece.rallratio2];
				data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio3.values           = [data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece.rallratio3];
                data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).daughterratio.values        = [data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece.daughterratio];
                data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).parentdaughterratio.values  = [data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece.parentdaughterratio];
                data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).parentdaughter2ratio.values = [data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece.parentdaughter2ratio];
                data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).meandiameter.values         = ([data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece.proximaldiameter]+[data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece.distaldiameter])/2;            
                data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).taperrate.values            = [data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece.taperrate];
                data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piecelength.values          = [data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece.length];

                for m = 1:length(data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece)           
                    if strcmp(data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece(m).distaltype,'bifurcation')==1
                        data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations = 1 + data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations;
                    end
                    if strcmp(data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piece(m).distaltype,'termination')==1
                        data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numberterminations = 1 + data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numberterminations;
                    end
                end
            end
            
            if isfield(data.population.bifurcation.doublebins,'diameterbins') == 0; nextvalue = 1;
            elseif j > length(data.population.bifurcation.doublebins.diameterbins); nextvalue = 1;
            elseif isfield(data.population.bifurcation.doublebins.diameterbins(j).pathlengthbins(k),'length') == 0; nextvalue = 1;
            elseif isfield(data.population.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).length,'values') == 0; nextvalue = 1;
            else nextvalue = 1 + length(data.population.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).length.values);
            end
            data.population.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).length.values(nextvalue)             = data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).length;
            data.population.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).surfacearea.values(nextvalue)        = data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).surfacearea;
            data.population.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).volume.values(nextvalue)             = data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).volume;
            data.population.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numbersegments.values(nextvalue)     = data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numbersegments;
            data.population.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations.values(nextvalue) = data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations;
            data.population.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numberterminations.values(nextvalue) = data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).numberterminations;
            data.population.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio.values                     = [ [data.population.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio.values] [data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio.values] ];
            data.population.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio1.values                    = [ [data.population.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio1.values] [data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio1.values] ];
            data.population.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio2.values                    = [ [data.population.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio2.values] [data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio2.values] ];
			data.population.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio3.values                    = [ [data.population.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio3.values] [data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).rallratio3.values] ];
            data.population.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).daughterratio.values                 = [ [data.population.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).daughterratio.values] [data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).daughterratio.values] ];
            data.population.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).parentdaughterratio.values           = [ [data.population.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).parentdaughterratio.values] [data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).parentdaughterratio.values] ];
            data.population.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).parentdaughter2ratio.values          = [ [data.population.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).parentdaughter2ratio.values] [data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).parentdaughter2ratio.values] ];
            data.population.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).meandiameter.values                  = [ [data.population.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).meandiameter.values] [data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).meandiameter.values] ];
            data.population.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).taperrate.values                     = [ [data.population.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).taperrate.values] [data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).taperrate.values] ];
            data.population.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piecelength.values                   = [ [data.population.bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piecelength.values] [data.individual(i).bifurcation.doublebins.diameterbins(j).pathlengthbins(k).piecelength.values] ];
            clear nextvalue;
            
        end
    end
end


for i = 1:length(data.population.bifurcation.doublebins.diameterbins)
    
    for j = 1:length(data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins)
        
        analysis.bifurcation.doublebin.diameter(i,j)   = data.population.diameterbinmiddles(i);
        analysis.bifurcation.doublebin.pathlength(i,j) = data.population.pathlengthbinmiddles(j);
    
        if isfield(data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).length,'values') == 1

            analysis.bifurcation.doublebin.length(i,j)      = sum([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).length.values]);
            analysis.bifurcation.doublebin.surfacearea(i,j) = sum([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).surfacearea.values]);
            analysis.bifurcation.doublebin.volume(i,j)      = sum([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).volume.values]);
            
            analysis.bifurcation.doublebin.numbersegments(i,j)     = sum([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).numbersegments.values]);
            analysis.bifurcation.doublebin.numberbifurcations(i,j) = sum([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).numberbifurcations.values]);
            analysis.bifurcation.doublebin.numberterminations(i,j) = sum([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).numberterminations.values]);
            
            analysis.bifurcation.doublebin.rallratio.mean(i,j) = mean([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values]);
            analysis.bifurcation.doublebin.rallratio.std(i,j)  = std([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values]);
            analysis.bifurcation.doublebin.rallratio.skew(i,j) = skewness([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values],0);
            analysis.bifurcation.doublebin.rallratio.kurt(i,j) = kurtosis([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values],0);
            
            analysis.bifurcation.doublebin.rallratio1.mean(i,j) = mean([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio1.values]);
            analysis.bifurcation.doublebin.rallratio1.std(i,j)  = std([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio1.values]);
            analysis.bifurcation.doublebin.rallratio1.skew(i,j) = skewness([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio1.values],0);
            analysis.bifurcation.doublebin.rallratio1.kurt(i,j) = kurtosis([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio1.values],0);
            
            analysis.bifurcation.doublebin.rallratio2.mean(i,j) = mean([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio2.values]);
            analysis.bifurcation.doublebin.rallratio2.std(i,j)  = std([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio2.values]);
            analysis.bifurcation.doublebin.rallratio2.skew(i,j) = skewness([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio2.values],0);
            analysis.bifurcation.doublebin.rallratio2.kurt(i,j) = kurtosis([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio2.values],0);
			
			analysis.bifurcation.doublebin.rallratio3.mean(i,j) = mean([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio3.values]);
            analysis.bifurcation.doublebin.rallratio3.std(i,j)  = std([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio3.values]);
            analysis.bifurcation.doublebin.rallratio3.skew(i,j) = skewness([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio3.values],0);
            analysis.bifurcation.doublebin.rallratio3.kurt(i,j) = kurtosis([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).rallratio3.values],0);
            
            analysis.bifurcation.doublebin.daughterratio.mean(i,j) = mean([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).daughterratio.values]);
            analysis.bifurcation.doublebin.daughterratio.std(i,j)  = std([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).daughterratio.values]);
            analysis.bifurcation.doublebin.daughterratio.skew(i,j) = skewness([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).daughterratio.values],0);
            analysis.bifurcation.doublebin.daughterratio.kurt(i,j) = kurtosis([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).daughterratio.values],0);
            
            analysis.bifurcation.doublebin.parentdaughterratio.mean(i,j) = mean([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).parentdaughterratio.values]);
            analysis.bifurcation.doublebin.parentdaughterratio.std(i,j)  = std([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).parentdaughterratio.values]);
            analysis.bifurcation.doublebin.parentdaughterratio.skew(i,j) = skewness([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).parentdaughterratio.values],0);
            analysis.bifurcation.doublebin.parentdaughterratio.kurt(i,j) = kurtosis([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).parentdaughterratio.values],0);
            
            analysis.bifurcation.doublebin.parentdaughter2ratio.mean(i,j) = mean([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).parentdaughter2ratio.values]);
            analysis.bifurcation.doublebin.parentdaughter2ratio.std(i,j)  = std([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).parentdaughter2ratio.values]);
            analysis.bifurcation.doublebin.parentdaughter2ratio.skew(i,j) = skewness([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).parentdaughter2ratio.values],0);
            analysis.bifurcation.doublebin.parentdaughter2ratio.kurt(i,j) = kurtosis([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).parentdaughter2ratio.values],0);
            
            analysis.bifurcation.doublebin.taperrate.mean(i,j) = sum([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).taperrate.values].*[data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).piecelength.values])/sum([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).piecelength.values]);
            analysis.bifurcation.doublebin.taperrate.std(i,j)  = std([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).taperrate.values]);
            analysis.bifurcation.doublebin.taperrate.skew(i,j) = skewness([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).taperrate.values],0);
            analysis.bifurcation.doublebin.taperrate.kurt(i,j) = kurtosis([data.population.bifurcation.doublebins.diameterbins(i).pathlengthbins(j).taperrate.values],0);
            
            
            analysis.bifurcation.doublebin.bifurcationprobability.bylength(i,j) = analysis.bifurcation.doublebin.numberbifurcations(i,j) / analysis.bifurcation.doublebin.length(i,j);
            analysis.bifurcation.doublebin.terminationprobability.bylength(i,j) = analysis.bifurcation.doublebin.numberterminations(i,j) / analysis.bifurcation.doublebin.length(i,j);
            
            analysis.bifurcation.doublebin.bifurcationprobability.bysurfacearea(i,j) = analysis.bifurcation.doublebin.numberbifurcations(i,j) / analysis.bifurcation.doublebin.surfacearea(i,j);
            analysis.bifurcation.doublebin.terminationprobability.bysurfacearea(i,j) = analysis.bifurcation.doublebin.numberterminations(i,j) / analysis.bifurcation.doublebin.surfacearea(i,j);
            
            analysis.bifurcation.doublebin.bifurcationprobability.byvolume(i,j) = analysis.bifurcation.doublebin.numberbifurcations(i,j) / analysis.bifurcation.doublebin.volume(i,j);
            analysis.bifurcation.doublebin.terminationprobability.byvolume(i,j) = analysis.bifurcation.doublebin.numberterminations(i,j) / analysis.bifurcation.doublebin.volume(i,j);

        end
    end
end

analysis.bifurcation.doublebin.array.diameter      = reshape(analysis.bifurcation.doublebin.diameter,numel(analysis.bifurcation.doublebin.diameter),1);
analysis.bifurcation.doublebin.array.pathlength    = reshape(analysis.bifurcation.doublebin.pathlength,numel(analysis.bifurcation.doublebin.pathlength),1);

analysis.bifurcation.doublebin.array.length      = reshape(analysis.bifurcation.doublebin.length,numel(analysis.bifurcation.doublebin.length),1);
analysis.bifurcation.doublebin.array.surfacearea = reshape(analysis.bifurcation.doublebin.surfacearea,numel(analysis.bifurcation.doublebin.surfacearea),1);
analysis.bifurcation.doublebin.array.volume      = reshape(analysis.bifurcation.doublebin.volume,numel(analysis.bifurcation.doublebin.volume),1);

analysis.bifurcation.doublebin.array.numbersegments     = reshape(analysis.bifurcation.doublebin.numbersegments,numel(analysis.bifurcation.doublebin.numbersegments),1);
analysis.bifurcation.doublebin.array.numberbifurcations = reshape(analysis.bifurcation.doublebin.numberbifurcations,numel(analysis.bifurcation.doublebin.numberbifurcations),1);
analysis.bifurcation.doublebin.array.numberterminations = reshape(analysis.bifurcation.doublebin.numberterminations,numel(analysis.bifurcation.doublebin.numberterminations),1);

analysis.bifurcation.doublebin.array.rallratio.mean = reshape(analysis.bifurcation.doublebin.rallratio.mean,numel(analysis.bifurcation.doublebin.rallratio.mean),1);
analysis.bifurcation.doublebin.array.rallratio.std  = reshape(analysis.bifurcation.doublebin.rallratio.std,numel(analysis.bifurcation.doublebin.rallratio.std),1);
analysis.bifurcation.doublebin.array.rallratio.skew = reshape(analysis.bifurcation.doublebin.rallratio.skew,numel(analysis.bifurcation.doublebin.rallratio.skew),1);
analysis.bifurcation.doublebin.array.rallratio.kurt = reshape(analysis.bifurcation.doublebin.rallratio.kurt,numel(analysis.bifurcation.doublebin.rallratio.kurt),1);

analysis.bifurcation.doublebin.array.rallratio1.mean = reshape(analysis.bifurcation.doublebin.rallratio1.mean,numel(analysis.bifurcation.doublebin.rallratio1.mean),1);
analysis.bifurcation.doublebin.array.rallratio1.std  = reshape(analysis.bifurcation.doublebin.rallratio1.std,numel(analysis.bifurcation.doublebin.rallratio1.std),1);
analysis.bifurcation.doublebin.array.rallratio1.skew = reshape(analysis.bifurcation.doublebin.rallratio1.skew,numel(analysis.bifurcation.doublebin.rallratio1.skew),1);
analysis.bifurcation.doublebin.array.rallratio1.kurt = reshape(analysis.bifurcation.doublebin.rallratio1.kurt,numel(analysis.bifurcation.doublebin.rallratio1.kurt),1);

analysis.bifurcation.doublebin.array.rallratio2.mean = reshape(analysis.bifurcation.doublebin.rallratio2.mean,numel(analysis.bifurcation.doublebin.rallratio2.mean),1);
analysis.bifurcation.doublebin.array.rallratio2.std  = reshape(analysis.bifurcation.doublebin.rallratio2.std,numel(analysis.bifurcation.doublebin.rallratio2.std),1);
analysis.bifurcation.doublebin.array.rallratio2.skew = reshape(analysis.bifurcation.doublebin.rallratio2.skew,numel(analysis.bifurcation.doublebin.rallratio2.skew),1);
analysis.bifurcation.doublebin.array.rallratio2.kurt = reshape(analysis.bifurcation.doublebin.rallratio2.kurt,numel(analysis.bifurcation.doublebin.rallratio2.kurt),1);

analysis.bifurcation.doublebin.array.rallratio3.mean = reshape(analysis.bifurcation.doublebin.rallratio3.mean,numel(analysis.bifurcation.doublebin.rallratio3.mean),1);
analysis.bifurcation.doublebin.array.rallratio3.std  = reshape(analysis.bifurcation.doublebin.rallratio3.std,numel(analysis.bifurcation.doublebin.rallratio3.std),1);
analysis.bifurcation.doublebin.array.rallratio3.skew = reshape(analysis.bifurcation.doublebin.rallratio3.skew,numel(analysis.bifurcation.doublebin.rallratio3.skew),1);
analysis.bifurcation.doublebin.array.rallratio3.kurt = reshape(analysis.bifurcation.doublebin.rallratio3.kurt,numel(analysis.bifurcation.doublebin.rallratio3.kurt),1);

analysis.bifurcation.doublebin.array.daughterratio.mean = reshape(analysis.bifurcation.doublebin.daughterratio.mean,numel(analysis.bifurcation.doublebin.daughterratio.mean),1);
analysis.bifurcation.doublebin.array.daughterratio.std  = reshape(analysis.bifurcation.doublebin.daughterratio.std,numel(analysis.bifurcation.doublebin.daughterratio.std),1);
analysis.bifurcation.doublebin.array.daughterratio.skew = reshape(analysis.bifurcation.doublebin.daughterratio.skew,numel(analysis.bifurcation.doublebin.daughterratio.skew),1);
analysis.bifurcation.doublebin.array.daughterratio.kurt = reshape(analysis.bifurcation.doublebin.daughterratio.kurt,numel(analysis.bifurcation.doublebin.daughterratio.kurt),1);

analysis.bifurcation.doublebin.array.parentdaughterratio.mean = reshape(analysis.bifurcation.doublebin.parentdaughterratio.mean,numel(analysis.bifurcation.doublebin.parentdaughterratio.mean),1);
analysis.bifurcation.doublebin.array.parentdaughterratio.std  = reshape(analysis.bifurcation.doublebin.parentdaughterratio.std,numel(analysis.bifurcation.doublebin.parentdaughterratio.std),1);
analysis.bifurcation.doublebin.array.parentdaughterratio.skew = reshape(analysis.bifurcation.doublebin.parentdaughterratio.skew,numel(analysis.bifurcation.doublebin.parentdaughterratio.skew),1);
analysis.bifurcation.doublebin.array.parentdaughterratio.kurt = reshape(analysis.bifurcation.doublebin.parentdaughterratio.kurt,numel(analysis.bifurcation.doublebin.parentdaughterratio.kurt),1);

analysis.bifurcation.doublebin.array.parentdaughter2ratio.mean = reshape(analysis.bifurcation.doublebin.parentdaughter2ratio.mean,numel(analysis.bifurcation.doublebin.parentdaughter2ratio.mean),1);
analysis.bifurcation.doublebin.array.parentdaughter2ratio.std  = reshape(analysis.bifurcation.doublebin.parentdaughter2ratio.std,numel(analysis.bifurcation.doublebin.parentdaughter2ratio.std),1);
analysis.bifurcation.doublebin.array.parentdaughter2ratio.skew = reshape(analysis.bifurcation.doublebin.parentdaughter2ratio.skew,numel(analysis.bifurcation.doublebin.parentdaughter2ratio.skew),1);
analysis.bifurcation.doublebin.array.parentdaughter2ratio.kurt = reshape(analysis.bifurcation.doublebin.parentdaughter2ratio.kurt,numel(analysis.bifurcation.doublebin.parentdaughter2ratio.kurt),1);

analysis.bifurcation.doublebin.array.taperrate.mean = reshape(analysis.bifurcation.doublebin.taperrate.mean,numel(analysis.bifurcation.doublebin.taperrate.mean),1);
analysis.bifurcation.doublebin.array.taperrate.std  = reshape(analysis.bifurcation.doublebin.taperrate.std,numel(analysis.bifurcation.doublebin.taperrate.std),1);
analysis.bifurcation.doublebin.array.taperrate.skew = reshape(analysis.bifurcation.doublebin.taperrate.skew,numel(analysis.bifurcation.doublebin.taperrate.skew),1);
analysis.bifurcation.doublebin.array.taperrate.kurt = reshape(analysis.bifurcation.doublebin.taperrate.kurt,numel(analysis.bifurcation.doublebin.taperrate.kurt),1);


analysis.bifurcation.doublebin.array.bifurcationprobability.bylength      = reshape(analysis.bifurcation.doublebin.bifurcationprobability.bylength,numel(analysis.bifurcation.doublebin.bifurcationprobability.bylength),1);
analysis.bifurcation.doublebin.array.bifurcationprobability.bysurfacearea = reshape(analysis.bifurcation.doublebin.bifurcationprobability.bysurfacearea,numel(analysis.bifurcation.doublebin.bifurcationprobability.bysurfacearea),1);
analysis.bifurcation.doublebin.array.bifurcationprobability.byvolume      = reshape(analysis.bifurcation.doublebin.bifurcationprobability.byvolume,numel(analysis.bifurcation.doublebin.bifurcationprobability.byvolume),1);
analysis.bifurcation.doublebin.array.bifurcationprobability.diameter    = reshape(analysis.bifurcation.doublebin.diameter,numel(analysis.bifurcation.doublebin.diameter),1);
analysis.bifurcation.doublebin.array.bifurcationprobability.pathlength  = reshape(analysis.bifurcation.doublebin.pathlength,numel(analysis.bifurcation.doublebin.pathlength),1);

analysis.bifurcation.doublebin.array.bifurcationprobability.pathlength  = analysis.bifurcation.doublebin.array.bifurcationprobability.pathlength(~isnan(analysis.bifurcation.doublebin.array.bifurcationprobability.bylength));
analysis.bifurcation.doublebin.array.bifurcationprobability.diameter    = analysis.bifurcation.doublebin.array.bifurcationprobability.diameter(~isnan(analysis.bifurcation.doublebin.array.bifurcationprobability.bylength));
analysis.bifurcation.doublebin.array.bifurcationprobability.byvolume      = analysis.bifurcation.doublebin.array.bifurcationprobability.byvolume(~isnan(analysis.bifurcation.doublebin.array.bifurcationprobability.bylength));
analysis.bifurcation.doublebin.array.bifurcationprobability.bysurfacearea = analysis.bifurcation.doublebin.array.bifurcationprobability.bysurfacearea(~isnan(analysis.bifurcation.doublebin.array.bifurcationprobability.bylength));
analysis.bifurcation.doublebin.array.bifurcationprobability.bylength      = analysis.bifurcation.doublebin.array.bifurcationprobability.bylength(~isnan(analysis.bifurcation.doublebin.array.bifurcationprobability.bylength));

analysis.bifurcation.doublebin.array.bifurcationprobability.zunzunlength = [analysis.bifurcation.doublebin.array.bifurcationprobability.diameter analysis.bifurcation.doublebin.array.bifurcationprobability.pathlength analysis.bifurcation.doublebin.array.bifurcationprobability.bylength];
analysis.bifurcation.doublebin.array.bifurcationprobability.zunzunsurfacearea = [analysis.bifurcation.doublebin.array.bifurcationprobability.diameter analysis.bifurcation.doublebin.array.bifurcationprobability.pathlength analysis.bifurcation.doublebin.array.bifurcationprobability.bysurfacearea];
analysis.bifurcation.doublebin.array.bifurcationprobability.zunzunvolume = [analysis.bifurcation.doublebin.array.bifurcationprobability.diameter analysis.bifurcation.doublebin.array.bifurcationprobability.pathlength analysis.bifurcation.doublebin.array.bifurcationprobability.byvolume];


analysis.bifurcation.doublebin.array.terminationprobability.bylength      = reshape(analysis.bifurcation.doublebin.terminationprobability.bylength,numel(analysis.bifurcation.doublebin.terminationprobability.bylength),1);
analysis.bifurcation.doublebin.array.terminationprobability.bysurfacearea = reshape(analysis.bifurcation.doublebin.terminationprobability.bysurfacearea,numel(analysis.bifurcation.doublebin.terminationprobability.bysurfacearea),1);
analysis.bifurcation.doublebin.array.terminationprobability.byvolume      = reshape(analysis.bifurcation.doublebin.terminationprobability.byvolume,numel(analysis.bifurcation.doublebin.terminationprobability.byvolume),1);
analysis.bifurcation.doublebin.array.terminationprobability.diameter    = reshape(analysis.bifurcation.doublebin.diameter,numel(analysis.bifurcation.doublebin.diameter),1);
analysis.bifurcation.doublebin.array.terminationprobability.pathlength  = reshape(analysis.bifurcation.doublebin.pathlength,numel(analysis.bifurcation.doublebin.pathlength),1);

analysis.bifurcation.doublebin.array.terminationprobability.pathlength  = analysis.bifurcation.doublebin.array.terminationprobability.pathlength(~isnan(analysis.bifurcation.doublebin.array.terminationprobability.bylength));
analysis.bifurcation.doublebin.array.terminationprobability.diameter    = analysis.bifurcation.doublebin.array.terminationprobability.diameter(~isnan(analysis.bifurcation.doublebin.array.terminationprobability.bylength));
analysis.bifurcation.doublebin.array.terminationprobability.byvolume      = analysis.bifurcation.doublebin.array.terminationprobability.byvolume(~isnan(analysis.bifurcation.doublebin.array.terminationprobability.bylength));
analysis.bifurcation.doublebin.array.terminationprobability.bysurfacearea = analysis.bifurcation.doublebin.array.terminationprobability.bysurfacearea(~isnan(analysis.bifurcation.doublebin.array.terminationprobability.bylength));
analysis.bifurcation.doublebin.array.terminationprobability.bylength      = analysis.bifurcation.doublebin.array.terminationprobability.bylength(~isnan(analysis.bifurcation.doublebin.array.terminationprobability.bylength));

analysis.bifurcation.doublebin.array.terminationprobability.zunzunlength = [analysis.bifurcation.doublebin.array.terminationprobability.diameter analysis.bifurcation.doublebin.array.terminationprobability.pathlength analysis.bifurcation.doublebin.array.terminationprobability.bylength];
analysis.bifurcation.doublebin.array.terminationprobability.zunzunsurfacearea = [analysis.bifurcation.doublebin.array.terminationprobability.diameter analysis.bifurcation.doublebin.array.terminationprobability.pathlength analysis.bifurcation.doublebin.array.terminationprobability.bysurfacearea];
analysis.bifurcation.doublebin.array.terminationprobability.zunzunvolume = [analysis.bifurcation.doublebin.array.terminationprobability.diameter analysis.bifurcation.doublebin.array.terminationprobability.pathlength analysis.bifurcation.doublebin.array.terminationprobability.byvolume];





















% Begin termination double bin analysis

for i = 1:maxdiameterbin
    for j = 1:maxpathlengthbin
        data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values            = [];
        data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio1.values           = [];
        data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio2.values           = [];
		data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio3.values           = [];
        data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).daughterratio.values        = [];
        data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).parentdaughterratio.values  = [];
        data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).parentdaughter2ratio.values = [];
        data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).meandiameter.values         = [];
        data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).taperrate.values            = [];
        data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).piecelength.values          = [];
    end
end


for i = 1:length(data.individual)
    
    for j = 1:length(data.individual(i).termination.doublebins.diameterbins)
        
        for k = 1:length(data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins)
        
            data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).length                      = 0;
            data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).surfacearea                 = 0;
            data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).volume                      = 0;
            data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).numbersegments              = 0;
            data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations          = 0;
            data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).numberterminations          = 0;
            data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio.values            = [];
            data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio1.values           = [];
            data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio2.values           = [];
			data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio3.values           = [];
            data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).daughterratio.values        = [];
            data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).parentdaughterratio.values  = [];
            data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).parentdaughter2ratio.values = [];
            data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).meandiameter.values         = [];
            data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).taperrate.values            = [];
            data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).piecelength.values          = [];
        
        
            if isfield(data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k),'piece') == 1 && isfield(data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).piece,'id')

                data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).length                      = sum([data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).piece.length]);
                data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).surfacearea                 = sum([data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).piece.surfacearea]);
                data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).volume                      = sum([data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).piece.volume]);
                data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).numbersegments              = length(unique([data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).piece.cable]));
                data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations          = 0;
                data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).numberterminations          = 0;
                data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio.values            = [data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).piece.rallratio];
                data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio1.values           = [data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).piece.rallratio1];
                data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio2.values           = [data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).piece.rallratio2];
				data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio3.values           = [data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).piece.rallratio3];
                data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).daughterratio.values        = [data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).piece.daughterratio];
                data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).parentdaughterratio.values  = [data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).piece.parentdaughterratio];
                data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).parentdaughter2ratio.values = [data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).piece.parentdaughter2ratio];
                data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).meandiameter.values         = ([data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).piece.proximaldiameter]+[data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).piece.distaldiameter])/2;            
                data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).taperrate.values            = [data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).piece.taperrate];
                data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).piecelength.values          = [data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).piece.length];

                for m = 1:length(data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).piece)           
                    if strcmp(data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).piece(m).distaltype,'bifurcation')==1
                        data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations = 1 + data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations;
                    end
                    if strcmp(data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).piece(m).distaltype,'termination')==1
                        data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).numberterminations = 1 + data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).numberterminations;
                    end
                end
            end
            
            if isfield(data.population.termination.doublebins,'diameterbins') == 0; nextvalue = 1;
            elseif j > length(data.population.termination.doublebins.diameterbins); nextvalue = 1;
            elseif isfield(data.population.termination.doublebins.diameterbins(j).pathlengthbins(k),'length') == 0; nextvalue = 1;
            elseif isfield(data.population.termination.doublebins.diameterbins(j).pathlengthbins(k).length,'values') == 0; nextvalue = 1;
            else nextvalue = 1 + length(data.population.termination.doublebins.diameterbins(j).pathlengthbins(k).length.values);
            end
            data.population.termination.doublebins.diameterbins(j).pathlengthbins(k).length.values(nextvalue)             = data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).length;
            data.population.termination.doublebins.diameterbins(j).pathlengthbins(k).surfacearea.values(nextvalue)        = data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).surfacearea;
            data.population.termination.doublebins.diameterbins(j).pathlengthbins(k).volume.values(nextvalue)             = data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).volume;
            data.population.termination.doublebins.diameterbins(j).pathlengthbins(k).numbersegments.values(nextvalue)     = data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).numbersegments;
            data.population.termination.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations.values(nextvalue) = data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).numberbifurcations;
            data.population.termination.doublebins.diameterbins(j).pathlengthbins(k).numberterminations.values(nextvalue) = data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).numberterminations;
            data.population.termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio.values                     = [ [data.population.termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio.values] [data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio.values] ];
            data.population.termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio1.values                    = [ [data.population.termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio1.values] [data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio1.values] ];
            data.population.termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio2.values                    = [ [data.population.termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio2.values] [data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio2.values] ];
			data.population.termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio3.values                    = [ [data.population.termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio3.values] [data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).rallratio3.values] ];
            data.population.termination.doublebins.diameterbins(j).pathlengthbins(k).daughterratio.values                 = [ [data.population.termination.doublebins.diameterbins(j).pathlengthbins(k).daughterratio.values] [data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).daughterratio.values] ];
            data.population.termination.doublebins.diameterbins(j).pathlengthbins(k).parentdaughterratio.values           = [ [data.population.termination.doublebins.diameterbins(j).pathlengthbins(k).parentdaughterratio.values] [data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).parentdaughterratio.values] ];
            data.population.termination.doublebins.diameterbins(j).pathlengthbins(k).parentdaughter2ratio.values          = [ [data.population.termination.doublebins.diameterbins(j).pathlengthbins(k).parentdaughter2ratio.values] [data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).parentdaughter2ratio.values] ];
            data.population.termination.doublebins.diameterbins(j).pathlengthbins(k).meandiameter.values                  = [ [data.population.termination.doublebins.diameterbins(j).pathlengthbins(k).meandiameter.values] [data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).meandiameter.values] ];
            data.population.termination.doublebins.diameterbins(j).pathlengthbins(k).taperrate.values                     = [ [data.population.termination.doublebins.diameterbins(j).pathlengthbins(k).taperrate.values] [data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).taperrate.values] ];
            data.population.termination.doublebins.diameterbins(j).pathlengthbins(k).piecelength.values                   = [ [data.population.termination.doublebins.diameterbins(j).pathlengthbins(k).piecelength.values] [data.individual(i).termination.doublebins.diameterbins(j).pathlengthbins(k).piecelength.values] ];
            clear nextvalue;
            
        end
    end
end


for i = 1:length(data.population.termination.doublebins.diameterbins)
    
    for j = 1:length(data.population.termination.doublebins.diameterbins(i).pathlengthbins)
        
        analysis.termination.doublebin.diameter(i,j)   = data.population.diameterbinmiddles(i);
        analysis.termination.doublebin.pathlength(i,j) = data.population.pathlengthbinmiddles(j);
    
        if isfield(data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).length,'values') == 1

            analysis.termination.doublebin.length(i,j)      = sum([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).length.values]);
            analysis.termination.doublebin.surfacearea(i,j) = sum([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).surfacearea.values]);
            analysis.termination.doublebin.volume(i,j)      = sum([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).volume.values]);
            
            analysis.termination.doublebin.numbersegments(i,j)     = sum([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).numbersegments.values]);
            analysis.termination.doublebin.numberbifurcations(i,j) = sum([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).numberbifurcations.values]);
            analysis.termination.doublebin.numberterminations(i,j) = sum([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).numberterminations.values]);
            
            analysis.termination.doublebin.rallratio.mean(i,j) = mean([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values]);
            analysis.termination.doublebin.rallratio.std(i,j)  = std([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values]);
            analysis.termination.doublebin.rallratio.skew(i,j) = skewness([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values],0);
            analysis.termination.doublebin.rallratio.kurt(i,j) = kurtosis([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio.values],0);
            
            analysis.termination.doublebin.rallratio1.mean(i,j) = mean([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio1.values]);
            analysis.termination.doublebin.rallratio1.std(i,j)  = std([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio1.values]);
            analysis.termination.doublebin.rallratio1.skew(i,j) = skewness([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio1.values],0);
            analysis.termination.doublebin.rallratio1.kurt(i,j) = kurtosis([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio1.values],0);
            
            analysis.termination.doublebin.rallratio2.mean(i,j) = mean([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio2.values]);
            analysis.termination.doublebin.rallratio2.std(i,j)  = std([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio2.values]);
            analysis.termination.doublebin.rallratio2.skew(i,j) = skewness([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio2.values],0);
            analysis.termination.doublebin.rallratio2.kurt(i,j) = kurtosis([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio2.values],0);
			
			analysis.termination.doublebin.rallratio3.mean(i,j) = mean([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio3.values]);
            analysis.termination.doublebin.rallratio3.std(i,j)  = std([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio3.values]);
            analysis.termination.doublebin.rallratio3.skew(i,j) = skewness([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio3.values],0);
            analysis.termination.doublebin.rallratio3.kurt(i,j) = kurtosis([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).rallratio3.values],0);
            
            analysis.termination.doublebin.daughterratio.mean(i,j) = mean([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).daughterratio.values]);
            analysis.termination.doublebin.daughterratio.std(i,j)  = std([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).daughterratio.values]);
            analysis.termination.doublebin.daughterratio.skew(i,j) = skewness([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).daughterratio.values],0);
            analysis.termination.doublebin.daughterratio.kurt(i,j) = kurtosis([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).daughterratio.values],0);
            
            analysis.termination.doublebin.parentdaughterratio.mean(i,j) = mean([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).parentdaughterratio.values]);
            analysis.termination.doublebin.parentdaughterratio.std(i,j)  = std([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).parentdaughterratio.values]);
            analysis.termination.doublebin.parentdaughterratio.skew(i,j) = skewness([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).parentdaughterratio.values],0);
            analysis.termination.doublebin.parentdaughterratio.kurt(i,j) = kurtosis([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).parentdaughterratio.values],0);
            
            analysis.termination.doublebin.parentdaughter2ratio.mean(i,j) = mean([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).parentdaughter2ratio.values]);
            analysis.termination.doublebin.parentdaughter2ratio.std(i,j)  = std([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).parentdaughter2ratio.values]);
            analysis.termination.doublebin.parentdaughter2ratio.skew(i,j) = skewness([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).parentdaughter2ratio.values],0);
            analysis.termination.doublebin.parentdaughter2ratio.kurt(i,j) = kurtosis([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).parentdaughter2ratio.values],0);
            
            analysis.termination.doublebin.taperrate.mean(i,j) = sum([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).taperrate.values].*[data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).piecelength.values])/sum([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).piecelength.values]);
            analysis.termination.doublebin.taperrate.std(i,j)  = std([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).taperrate.values]);
            analysis.termination.doublebin.taperrate.skew(i,j) = skewness([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).taperrate.values],0);
            analysis.termination.doublebin.taperrate.kurt(i,j) = kurtosis([data.population.termination.doublebins.diameterbins(i).pathlengthbins(j).taperrate.values],0);
            
            
            analysis.termination.doublebin.bifurcationprobability.bylength(i,j) = analysis.termination.doublebin.numberbifurcations(i,j) / analysis.termination.doublebin.length(i,j);
            analysis.termination.doublebin.terminationprobability.bylength(i,j) = analysis.termination.doublebin.numberterminations(i,j) / analysis.termination.doublebin.length(i,j);
            
            analysis.termination.doublebin.bifurcationprobability.bysurfacearea(i,j) = analysis.termination.doublebin.numberbifurcations(i,j) / analysis.termination.doublebin.surfacearea(i,j);
            analysis.termination.doublebin.terminationprobability.bysurfacearea(i,j) = analysis.termination.doublebin.numberterminations(i,j) / analysis.termination.doublebin.surfacearea(i,j);
            
            analysis.termination.doublebin.bifurcationprobability.byvolume(i,j) = analysis.termination.doublebin.numberbifurcations(i,j) / analysis.termination.doublebin.volume(i,j);
            analysis.termination.doublebin.terminationprobability.byvolume(i,j) = analysis.termination.doublebin.numberterminations(i,j) / analysis.termination.doublebin.volume(i,j);

        end
    end
end

analysis.termination.doublebin.array.diameter      = reshape(analysis.termination.doublebin.diameter,numel(analysis.termination.doublebin.diameter),1);
analysis.termination.doublebin.array.pathlength    = reshape(analysis.termination.doublebin.pathlength,numel(analysis.termination.doublebin.pathlength),1);

analysis.termination.doublebin.array.length      = reshape(analysis.termination.doublebin.length,numel(analysis.termination.doublebin.length),1);
analysis.termination.doublebin.array.surfacearea = reshape(analysis.termination.doublebin.surfacearea,numel(analysis.termination.doublebin.surfacearea),1);
analysis.termination.doublebin.array.volume      = reshape(analysis.termination.doublebin.volume,numel(analysis.termination.doublebin.volume),1);

analysis.termination.doublebin.array.numbersegments     = reshape(analysis.termination.doublebin.numbersegments,numel(analysis.termination.doublebin.numbersegments),1);
analysis.termination.doublebin.array.numberbifurcations = reshape(analysis.termination.doublebin.numberbifurcations,numel(analysis.termination.doublebin.numberbifurcations),1);
analysis.termination.doublebin.array.numberterminations = reshape(analysis.termination.doublebin.numberterminations,numel(analysis.termination.doublebin.numberterminations),1);

analysis.termination.doublebin.array.rallratio.mean = reshape(analysis.termination.doublebin.rallratio.mean,numel(analysis.termination.doublebin.rallratio.mean),1);
analysis.termination.doublebin.array.rallratio.std  = reshape(analysis.termination.doublebin.rallratio.std,numel(analysis.termination.doublebin.rallratio.std),1);
analysis.termination.doublebin.array.rallratio.skew = reshape(analysis.termination.doublebin.rallratio.skew,numel(analysis.termination.doublebin.rallratio.skew),1);
analysis.termination.doublebin.array.rallratio.kurt = reshape(analysis.termination.doublebin.rallratio.kurt,numel(analysis.termination.doublebin.rallratio.kurt),1);

analysis.termination.doublebin.array.rallratio1.mean = reshape(analysis.termination.doublebin.rallratio1.mean,numel(analysis.termination.doublebin.rallratio1.mean),1);
analysis.termination.doublebin.array.rallratio1.std  = reshape(analysis.termination.doublebin.rallratio1.std,numel(analysis.termination.doublebin.rallratio1.std),1);
analysis.termination.doublebin.array.rallratio1.skew = reshape(analysis.termination.doublebin.rallratio1.skew,numel(analysis.termination.doublebin.rallratio1.skew),1);
analysis.termination.doublebin.array.rallratio1.kurt = reshape(analysis.termination.doublebin.rallratio1.kurt,numel(analysis.termination.doublebin.rallratio1.kurt),1);

analysis.termination.doublebin.array.rallratio2.mean = reshape(analysis.termination.doublebin.rallratio2.mean,numel(analysis.termination.doublebin.rallratio2.mean),1);
analysis.termination.doublebin.array.rallratio2.std  = reshape(analysis.termination.doublebin.rallratio2.std,numel(analysis.termination.doublebin.rallratio2.std),1);
analysis.termination.doublebin.array.rallratio2.skew = reshape(analysis.termination.doublebin.rallratio2.skew,numel(analysis.termination.doublebin.rallratio2.skew),1);
analysis.termination.doublebin.array.rallratio2.kurt = reshape(analysis.termination.doublebin.rallratio2.kurt,numel(analysis.termination.doublebin.rallratio2.kurt),1);

analysis.termination.doublebin.array.rallratio3.mean = reshape(analysis.termination.doublebin.rallratio3.mean,numel(analysis.termination.doublebin.rallratio3.mean),1);
analysis.termination.doublebin.array.rallratio3.std  = reshape(analysis.termination.doublebin.rallratio3.std,numel(analysis.termination.doublebin.rallratio3.std),1);
analysis.termination.doublebin.array.rallratio3.skew = reshape(analysis.termination.doublebin.rallratio3.skew,numel(analysis.termination.doublebin.rallratio3.skew),1);
analysis.termination.doublebin.array.rallratio3.kurt = reshape(analysis.termination.doublebin.rallratio3.kurt,numel(analysis.termination.doublebin.rallratio3.kurt),1);

analysis.termination.doublebin.array.daughterratio.mean = reshape(analysis.termination.doublebin.daughterratio.mean,numel(analysis.termination.doublebin.daughterratio.mean),1);
analysis.termination.doublebin.array.daughterratio.std  = reshape(analysis.termination.doublebin.daughterratio.std,numel(analysis.termination.doublebin.daughterratio.std),1);
analysis.termination.doublebin.array.daughterratio.skew = reshape(analysis.termination.doublebin.daughterratio.skew,numel(analysis.termination.doublebin.daughterratio.skew),1);
analysis.termination.doublebin.array.daughterratio.kurt = reshape(analysis.termination.doublebin.daughterratio.kurt,numel(analysis.termination.doublebin.daughterratio.kurt),1);

analysis.termination.doublebin.array.parentdaughterratio.mean = reshape(analysis.termination.doublebin.parentdaughterratio.mean,numel(analysis.termination.doublebin.parentdaughterratio.mean),1);
analysis.termination.doublebin.array.parentdaughterratio.std  = reshape(analysis.termination.doublebin.parentdaughterratio.std,numel(analysis.termination.doublebin.parentdaughterratio.std),1);
analysis.termination.doublebin.array.parentdaughterratio.skew = reshape(analysis.termination.doublebin.parentdaughterratio.skew,numel(analysis.termination.doublebin.parentdaughterratio.skew),1);
analysis.termination.doublebin.array.parentdaughterratio.kurt = reshape(analysis.termination.doublebin.parentdaughterratio.kurt,numel(analysis.termination.doublebin.parentdaughterratio.kurt),1);

analysis.termination.doublebin.array.parentdaughter2ratio.mean = reshape(analysis.termination.doublebin.parentdaughter2ratio.mean,numel(analysis.termination.doublebin.parentdaughter2ratio.mean),1);
analysis.termination.doublebin.array.parentdaughter2ratio.std  = reshape(analysis.termination.doublebin.parentdaughter2ratio.std,numel(analysis.termination.doublebin.parentdaughter2ratio.std),1);
analysis.termination.doublebin.array.parentdaughter2ratio.skew = reshape(analysis.termination.doublebin.parentdaughter2ratio.skew,numel(analysis.termination.doublebin.parentdaughter2ratio.skew),1);
analysis.termination.doublebin.array.parentdaughter2ratio.kurt = reshape(analysis.termination.doublebin.parentdaughter2ratio.kurt,numel(analysis.termination.doublebin.parentdaughter2ratio.kurt),1);

analysis.termination.doublebin.array.taperrate.mean = reshape(analysis.termination.doublebin.taperrate.mean,numel(analysis.termination.doublebin.taperrate.mean),1);
analysis.termination.doublebin.array.taperrate.std  = reshape(analysis.termination.doublebin.taperrate.std,numel(analysis.termination.doublebin.taperrate.std),1);
analysis.termination.doublebin.array.taperrate.skew = reshape(analysis.termination.doublebin.taperrate.skew,numel(analysis.termination.doublebin.taperrate.skew),1);
analysis.termination.doublebin.array.taperrate.kurt = reshape(analysis.termination.doublebin.taperrate.kurt,numel(analysis.termination.doublebin.taperrate.kurt),1);


analysis.termination.doublebin.array.bifurcationprobability.bylength      = reshape(analysis.termination.doublebin.bifurcationprobability.bylength,numel(analysis.termination.doublebin.bifurcationprobability.bylength),1);
analysis.termination.doublebin.array.bifurcationprobability.bysurfacearea = reshape(analysis.termination.doublebin.bifurcationprobability.bysurfacearea,numel(analysis.termination.doublebin.bifurcationprobability.bysurfacearea),1);
analysis.termination.doublebin.array.bifurcationprobability.byvolume      = reshape(analysis.termination.doublebin.bifurcationprobability.byvolume,numel(analysis.termination.doublebin.bifurcationprobability.byvolume),1);
analysis.termination.doublebin.array.bifurcationprobability.diameter    = reshape(analysis.termination.doublebin.diameter,numel(analysis.termination.doublebin.diameter),1);
analysis.termination.doublebin.array.bifurcationprobability.pathlength  = reshape(analysis.termination.doublebin.pathlength,numel(analysis.termination.doublebin.pathlength),1);

analysis.termination.doublebin.array.bifurcationprobability.pathlength  = analysis.termination.doublebin.array.bifurcationprobability.pathlength(~isnan(analysis.termination.doublebin.array.bifurcationprobability.bylength));
analysis.termination.doublebin.array.bifurcationprobability.diameter    = analysis.termination.doublebin.array.bifurcationprobability.diameter(~isnan(analysis.termination.doublebin.array.bifurcationprobability.bylength));
analysis.termination.doublebin.array.bifurcationprobability.byvolume      = analysis.termination.doublebin.array.bifurcationprobability.byvolume(~isnan(analysis.termination.doublebin.array.bifurcationprobability.bylength));
analysis.termination.doublebin.array.bifurcationprobability.bysurfacearea = analysis.termination.doublebin.array.bifurcationprobability.bysurfacearea(~isnan(analysis.termination.doublebin.array.bifurcationprobability.bylength));
analysis.termination.doublebin.array.bifurcationprobability.bylength      = analysis.termination.doublebin.array.bifurcationprobability.bylength(~isnan(analysis.termination.doublebin.array.bifurcationprobability.bylength));

analysis.termination.doublebin.array.bifurcationprobability.zunzunlength = [analysis.termination.doublebin.array.bifurcationprobability.diameter analysis.termination.doublebin.array.bifurcationprobability.pathlength analysis.termination.doublebin.array.bifurcationprobability.bylength];
analysis.termination.doublebin.array.bifurcationprobability.zunzunsurfacearea = [analysis.termination.doublebin.array.bifurcationprobability.diameter analysis.termination.doublebin.array.bifurcationprobability.pathlength analysis.termination.doublebin.array.bifurcationprobability.bysurfacearea];
analysis.termination.doublebin.array.bifurcationprobability.zunzunvolume = [analysis.termination.doublebin.array.bifurcationprobability.diameter analysis.termination.doublebin.array.bifurcationprobability.pathlength analysis.termination.doublebin.array.bifurcationprobability.byvolume];


analysis.termination.doublebin.array.terminationprobability.bylength      = reshape(analysis.termination.doublebin.terminationprobability.bylength,numel(analysis.termination.doublebin.terminationprobability.bylength),1);
analysis.termination.doublebin.array.terminationprobability.bysurfacearea = reshape(analysis.termination.doublebin.terminationprobability.bysurfacearea,numel(analysis.termination.doublebin.terminationprobability.bysurfacearea),1);
analysis.termination.doublebin.array.terminationprobability.byvolume      = reshape(analysis.termination.doublebin.terminationprobability.byvolume,numel(analysis.termination.doublebin.terminationprobability.byvolume),1);
analysis.termination.doublebin.array.terminationprobability.diameter    = reshape(analysis.termination.doublebin.diameter,numel(analysis.termination.doublebin.diameter),1);
analysis.termination.doublebin.array.terminationprobability.pathlength  = reshape(analysis.termination.doublebin.pathlength,numel(analysis.termination.doublebin.pathlength),1);

analysis.termination.doublebin.array.terminationprobability.pathlength  = analysis.termination.doublebin.array.terminationprobability.pathlength(~isnan(analysis.termination.doublebin.array.terminationprobability.bylength));
analysis.termination.doublebin.array.terminationprobability.diameter    = analysis.termination.doublebin.array.terminationprobability.diameter(~isnan(analysis.termination.doublebin.array.terminationprobability.bylength));
analysis.termination.doublebin.array.terminationprobability.byvolume      = analysis.termination.doublebin.array.terminationprobability.byvolume(~isnan(analysis.termination.doublebin.array.terminationprobability.bylength));
analysis.termination.doublebin.array.terminationprobability.bysurfacearea = analysis.termination.doublebin.array.terminationprobability.bysurfacearea(~isnan(analysis.termination.doublebin.array.terminationprobability.bylength));
analysis.termination.doublebin.array.terminationprobability.bylength      = analysis.termination.doublebin.array.terminationprobability.bylength(~isnan(analysis.termination.doublebin.array.terminationprobability.bylength));

analysis.termination.doublebin.array.terminationprobability.zunzunlength = [analysis.termination.doublebin.array.terminationprobability.diameter analysis.termination.doublebin.array.terminationprobability.pathlength analysis.termination.doublebin.array.terminationprobability.bylength];
analysis.termination.doublebin.array.terminationprobability.zunzunsurfacearea = [analysis.termination.doublebin.array.terminationprobability.diameter analysis.termination.doublebin.array.terminationprobability.pathlength analysis.termination.doublebin.array.terminationprobability.bysurfacearea];
analysis.termination.doublebin.array.terminationprobability.zunzunvolume = [analysis.termination.doublebin.array.terminationprobability.diameter analysis.termination.doublebin.array.terminationprobability.pathlength analysis.termination.doublebin.array.terminationprobability.byvolume];










warning('on', 'MATLAB:divideByZero');