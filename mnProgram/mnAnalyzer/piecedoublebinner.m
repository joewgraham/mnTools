function data = piecedoublebinner(data)
%Divides pieces into cables, primarydendritebins, branchorderbins,
%pathlengthbins, radialdistance bins, bifurcationbin, and terminationbin

disp('   Piece double binning started.');

mnoptions;

piecetypes{1} = 'soma';
piecetypes{2} = 'axon';
piecetypes{3} = 'dendrite';
piecetypes{4} = 'apical';

for piecetype = 2:4
    
    if isfield(data.population,piecetypes{piecetype})
        
        currentpiecetype = piecetypes{piecetype};
        clear popdata;
        eval(['popdata = data.population.' currentpiecetype ';']);
        
        % Pre-allocate the pathlength bins
        clear maxpathlengthbin;
        clear distancebinwidth;
        eval(['distancebinwidth = option.' currentpiecetype '.distancebinwidth;']);
        maxpathlengthbin = ceil(popdata.maxpathlength / distancebinwidth);
        for j = 1:length(data.individual)
            eval(['inddata = data.individual(j).' currentpiecetype ';']);
            for k = 1:length(popdata.diameterbins)
                for m = 1:maxpathlengthbin
                    inddata.doublebins.diameterbins(k).pathlengthbins(m).length = [];
                    inddata.bifurcation.doublebins.diameterbins(k).pathlengthbins(m).length = [];
                    inddata.termination.doublebins.diameterbins(k).pathlengthbins(m).length = [];
                end
            end
            eval(['data.individual(j).' currentpiecetype ' = inddata;']);
        end
        
        % Pre-allocate the branchlength bins
        clear maxbranchlengthbin;
        clear branchlengthbinwidth;
        eval(['branchlengthbinwidth = option.' currentpiecetype '.branchlengthbinwidth;']);
        maxbranchlengthbin = ceil(popdata.maxbranchlength / branchlengthbinwidth);
        for j = 1:length(data.individual)
            eval(['inddata = data.individual(j).' currentpiecetype ';']);
            for k = 1:length(popdata.diameterbins)
                for m = 1:maxbranchlengthbin
                    inddata.doublebins.diameterbins(k).branchlengthbins(m).length = [];
                    inddata.bifurcation.doublebins.diameterbins(k).branchlengthbins(m).length = [];
                    inddata.termination.doublebins.diameterbins(k).branchlengthbins(m).length = [];
                end
            end
            eval(['data.individual(j).' currentpiecetype ' = inddata;']);
        end
        
        % Pre-allocate the branchorder bins
        maxbranchorderbin = popdata.maxbranchorder;
        for j = 1:length(data.individual)
            eval(['inddata = data.individual(j).' currentpiecetype ';']);
            for k = 1:length(popdata.diameterbins)
                for m = 1:maxbranchorderbin
                    inddata.doublebins.diameterbins(k).branchorderbins(m).length = [];
                    inddata.bifurcation.doublebins.diameterbins(k).branchorderbins(m).length = [];
                    inddata.termination.doublebins.diameterbins(k).branchorderbins(m).length = [];
                end
            end
            eval(['data.individual(j).' currentpiecetype ' = inddata;']);
        end
        
        
        
        
        for mnnum = 1:length(data.individual)
            
            eval(['inddata = data.individual(mnnum).' currentpiecetype ';']);
            
            for diameterbin = 1:length(inddata.diameterbins)
                
                if isfield(inddata.diameterbins(diameterbin),'piece') == 1
                    
                    for currentpiece = 1:length(inddata.diameterbins(diameterbin).piece)
                        
                        currentproximalpathlength        = inddata.diameterbins(diameterbin).piece(currentpiece).proximalpathlength;
                        currentdistalpathlength          = inddata.diameterbins(diameterbin).piece(currentpiece).distalpathlength;
                        currentproximalpathlengthbin     = 1 + floor(currentproximalpathlength / distancebinwidth);
                        currentdistalpathlengthbin       = 1 + floor(currentdistalpathlength / distancebinwidth);
                        
                        currentproximalbranchlength        = inddata.diameterbins(diameterbin).piece(currentpiece).proximalbranchlength;
                        currentdistalbranchlength          = inddata.diameterbins(diameterbin).piece(currentpiece).distalbranchlength;
                        currentproximalbranchlengthbin     = 1 + floor(currentproximalbranchlength / branchlengthbinwidth);
                        currentdistalbranchlengthbin       = 1 + floor(currentdistalbranchlength / branchlengthbinwidth);
                        
                        currentbranchorderbin            = inddata.diameterbins(diameterbin).piece(currentpiece).branchorder;
                        
                        % Put the piece into the appropriate path length bin
                        
                        for pathlengthbin = currentproximalpathlengthbin:currentdistalpathlengthbin
                            % Repeat for as many partial pieces as there will end up being
                            
                            if     isfield(inddata,'doublebins')==0; nextpiece = 1;
                            elseif diameterbin > length(inddata.doublebins.diameterbins); nextpiece = 1;
                            elseif isfield(inddata.doublebins.diameterbins(diameterbin),'pathlengthbins')==0; nextpiece = 1;
                            elseif pathlengthbin > length(inddata.doublebins.diameterbins(diameterbin).pathlengthbins); nextpiece = 1;
                            elseif isfield(inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin),'piece')==0; nextpiece = 1;
                            else nextpiece = 1 + length(inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece);
                            end
                            
                            temppiece = setfield(inddata.diameterbins(diameterbin).piece(currentpiece),'partial2','n');
                            inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece) = temppiece;
                            clear temppiece;
                            
                            if currentdistalpathlengthbin ~= currentproximalpathlengthbin
                                % If the piece lies in two or more path length bins, split the piece and bin the current partial piece
                                
                                inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).partial2 = 'y';
                                
                                if pathlengthbin == currentproximalpathlengthbin
                                    % If the current partial piece falls in the proximal path length bin
                                    
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaltype           = [];
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio            = [];
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio1           = [];
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio2           = [];
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio3           = [];
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).daughterratio        = [];
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).parentdaughterratio  = [];
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).parentdaughter2ratio = [];
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length               = (pathlengthbin*distancebinwidth) - inddata.diameterbins(diameterbin).piece(currentpiece).proximalpathlength;
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter       = inddata.diameterbins(diameterbin).piece(currentpiece).proximaldiameter - (inddata.diameterbins(diameterbin).piece(currentpiece).taperrate * inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length);
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea          = pi*((inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).volume               = (pi/12)*inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length*(inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);
                                    
                                    [xdirection, ydirection, zdirection]                                               = directionfunction(inddata.diameterbins(diameterbin).piece(currentpiece).elevation,inddata.diameterbins(diameterbin).piece(currentpiece).azimuth);
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition      = inddata.diameterbins(diameterbin).piece(currentpiece).proximalxposition + xdirection * inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition      = inddata.diameterbins(diameterbin).piece(currentpiece).proximalyposition + ydirection * inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition      = inddata.diameterbins(diameterbin).piece(currentpiece).proximalzposition + zdirection * inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalpathlength     = inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength + inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalradialdistance = ( (inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition-data.individual(mnnum).xposition)^2 ...
                                        + (inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition-data.individual(mnnum).yposition)^2 ...
                                        + (inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition-data.individual(mnnum).zposition)^2 )^0.5;
                                    
                                    
                                elseif pathlengthbin > currentproximalpathlengthbin && pathlengthbin < currentdistalpathlengthbin
                                    % If the current partial piece falls between the proximal and distal path length bins
                                    
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaltype         = [];
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaltype           = [];
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio            = [];
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio1           = [];
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio2           = [];
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio3           = [];
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).daughterratio        = [];
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).parentdaughterratio  = [];
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).parentdaughter2ratio = [];
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length               = distancebinwidth;
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter     = inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(length(inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece)).distaldiameter;
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter       = inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter - (inddata.diameterbins(diameterbin).piece(currentpiece).taperrate * distancebinwidth);
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea          = pi*((inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).volume               = (pi/12)*inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length*(inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);
                                    
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition      = inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalxposition;
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition      = inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalyposition;
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition      = inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalzposition;
                                    [xdirection, ydirection, zdirection]                                                     = directionfunction(inddata.diameterbins(diameterbin).piece(currentpiece).elevation,inddata.diameterbins(diameterbin).piece(currentpiece).azimuth);
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition        = inddata.diameterbins(diameterbin).piece(currentpiece).proximalxposition + xdirection * inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition        = inddata.diameterbins(diameterbin).piece(currentpiece).proximalxposition + ydirection * inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition        = inddata.diameterbins(diameterbin).piece(currentpiece).proximalxposition + zdirection * inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength     = inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalpathlength;
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalpathlength       = inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength + inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalradialdistance = ( (inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition-data.individual(mnnum).xposition)^2 ...
                                        + (inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition-data.individual(mnnum).yposition)^2 ...
                                        + (inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition-data.individual(mnnum).zposition)^2 )^0.5;
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalradialdistance = ( (inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition-data.individual(mnnum).xposition)^2 ...
                                        + (inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition-data.individual(mnnum).yposition)^2 ...
                                        + (inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition-data.individual(mnnum).zposition)^2 )^0.5;
                                    
                                    
                                elseif pathlengthbin == currentdistalpathlengthbin
                                    % If the current partial piece falls in the distal path length bin
                                    
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaltype     = [];
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length           = inddata.diameterbins(diameterbin).piece(currentpiece).distalpathlength - ((pathlengthbin-1)*distancebinwidth);
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter = inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(length(inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece)).distaldiameter;
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea      = pi*((inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).volume           = (pi/12)*inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length*(inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);
                                    
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition      = inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalxposition;
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition      = inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalyposition;
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition      = inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalzposition;
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength     = inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalpathlength;
                                    inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalradialdistance = ( (inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition-data.individual(mnnum).xposition)^2 ...
                                        + (inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition-data.individual(mnnum).yposition)^2 ...
                                        + (inddata.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition-data.individual(mnnum).zposition)^2 )^0.5;
                                    
                                    
                                end
                                % End of individual split piece path length binning
                            end
                            % End of split piece path length binning for this piece
                        end
                        % End of path length binning
                        
                        
                        
                        
                        
                        
                        
                        % Put the piece into the appropriate branch length bin
                        
                        for branchlengthbin = currentproximalbranchlengthbin:currentdistalbranchlengthbin
                            % Repeat for as many partial pieces as there will end up being
                            
                            if     isfield(inddata,'doublebins')==0; nextpiece = 1;
                            elseif diameterbin > length(inddata.doublebins.diameterbins); nextpiece = 1;
                            elseif isfield(inddata.doublebins.diameterbins(diameterbin),'branchlengthbins')==0; nextpiece = 1;
                            elseif branchlengthbin > length(inddata.doublebins.diameterbins(diameterbin).branchlengthbins); nextpiece = 1;
                            elseif isfield(inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin),'piece')==0; nextpiece = 1;
                            else nextpiece = 1 + length(inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece);
                            end
                            
                            temppiece = setfield(inddata.diameterbins(diameterbin).piece(currentpiece),'partial2','n');
                            inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece) = temppiece;
                            clear temppiece;
                            
                            if currentdistalbranchlengthbin ~= currentproximalbranchlengthbin
                                % If the piece lies in two or more branch length bins, split the piece and bin the current partial piece
                                
                                inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).partial2 = 'y';
                                
                                if branchlengthbin == currentproximalbranchlengthbin
                                    % If the current partial piece falls in the proximal branch length bin
                                    
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaltype           = [];
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).rallratio            = [];
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).rallratio1           = [];
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).rallratio2           = [];
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).rallratio3           = [];
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).daughterratio        = [];
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).parentdaughterratio  = [];
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).parentdaughter2ratio = [];
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length               = (branchlengthbin*branchlengthbinwidth) - inddata.diameterbins(diameterbin).piece(currentpiece).proximalbranchlength;
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter       = inddata.diameterbins(diameterbin).piece(currentpiece).proximaldiameter - (inddata.diameterbins(diameterbin).piece(currentpiece).taperrate * inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length);
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea          = pi*((inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length^2)^0.5);
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).volume               = (pi/12)*inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length*(inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter^2+inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter*inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter+inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter^2);
                                    
                                    [xdirection, ydirection, zdirection]                                               = directionfunction(inddata.diameterbins(diameterbin).piece(currentpiece).elevation,inddata.diameterbins(diameterbin).piece(currentpiece).azimuth);
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition      = inddata.diameterbins(diameterbin).piece(currentpiece).proximalxposition + xdirection * inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition      = inddata.diameterbins(diameterbin).piece(currentpiece).proximalyposition + ydirection * inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition      = inddata.diameterbins(diameterbin).piece(currentpiece).proximalzposition + zdirection * inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalbranchlength     = inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength + inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalradialdistance = ( (inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition-data.individual(mnnum).xposition)^2 ...
                                        + (inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition-data.individual(mnnum).yposition)^2 ...
                                        + (inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition-data.individual(mnnum).zposition)^2 )^0.5;
                                    
                                    
                                elseif branchlengthbin > currentproximalbranchlengthbin && branchlengthbin < currentdistalbranchlengthbin
                                    % If the current partial piece falls between the proximal and distal branch length bins
                                    
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaltype         = [];
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaltype           = [];
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).rallratio            = [];
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).rallratio1           = [];
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).rallratio2           = [];
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).rallratio3           = [];
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).daughterratio        = [];
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).parentdaughterratio  = [];
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).parentdaughter2ratio = [];
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length               = branchlengthbinwidth;
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter     = inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece(length(inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece)).distaldiameter;
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter       = inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter - (inddata.diameterbins(diameterbin).piece(currentpiece).taperrate * branchlengthbinwidth);
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea          = pi*((inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length^2)^0.5);
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).volume               = (pi/12)*inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length*(inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter^2+inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter*inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter+inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter^2);
                                    
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition      = inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece(end).distalxposition;
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition      = inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece(end).distalyposition;
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition      = inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece(end).distalzposition;
                                    [xdirection, ydirection, zdirection]                                                     = directionfunction(inddata.diameterbins(diameterbin).piece(currentpiece).elevation,inddata.diameterbins(diameterbin).piece(currentpiece).azimuth);
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition        = inddata.diameterbins(diameterbin).piece(currentpiece).proximalxposition + xdirection * inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition        = inddata.diameterbins(diameterbin).piece(currentpiece).proximalxposition + ydirection * inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition        = inddata.diameterbins(diameterbin).piece(currentpiece).proximalxposition + zdirection * inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength     = inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece(end).distalbranchlength;
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalbranchlength       = inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength + inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalradialdistance = ( (inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition-data.individual(mnnum).xposition)^2 ...
                                        + (inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition-data.individual(mnnum).yposition)^2 ...
                                        + (inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition-data.individual(mnnum).zposition)^2 )^0.5;
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalradialdistance = ( (inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition-data.individual(mnnum).xposition)^2 ...
                                        + (inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition-data.individual(mnnum).yposition)^2 ...
                                        + (inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition-data.individual(mnnum).zposition)^2 )^0.5;
                                    
                                    
                                elseif branchlengthbin == currentdistalbranchlengthbin
                                    % If the current partial piece falls in the distal branch length bin
                                    
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaltype     = [];
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length           = inddata.diameterbins(diameterbin).piece(currentpiece).distalbranchlength - ((branchlengthbin-1)*branchlengthbinwidth);
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter = inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece(length(inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece)).distaldiameter;
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea      = pi*((inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length^2)^0.5);
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).volume           = (pi/12)*inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length*(inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter^2+inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter*inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter+inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter^2);
                                    
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition      = inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece(end).distalxposition;
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition      = inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece(end).distalyposition;
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition      = inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece(end).distalzposition;
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength     = inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece(end).distalbranchlength;
                                    inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalradialdistance = ( (inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition-data.individual(mnnum).xposition)^2 ...
                                        + (inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition-data.individual(mnnum).yposition)^2 ...
                                        + (inddata.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition-data.individual(mnnum).zposition)^2 )^0.5;
                                    
                                    
                                end
                                % End of individual split piece branch length binning
                            end
                            % End of split piece branch length binning for this piece
                        end
                        % End of branch length binning
                        
                        
                        
                        % Put the piece into the appropriate branch order bin
                        
                        if     isfield(inddata,'doublebins')==0; nextpiece = 1;
                        elseif diameterbin > length(inddata.doublebins.diameterbins); nextpiece = 1;
                        elseif isfield(inddata.doublebins.diameterbins(diameterbin),'branchorderbins')==0; nextpiece = 1;
                        elseif currentbranchorderbin > length(inddata.doublebins.diameterbins(diameterbin).branchorderbins); nextpiece = 1;
                        elseif isfield(inddata.doublebins.diameterbins(diameterbin).branchorderbins(currentbranchorderbin),'piece')==0; nextpiece = 1;
                        else nextpiece = 1 + length(inddata.doublebins.diameterbins(diameterbin).branchorderbins(currentbranchorderbin).piece);
                        end
                        inddata.doublebins.diameterbins(diameterbin).branchorderbins(currentbranchorderbin).piece(nextpiece) = inddata.diameterbins(diameterbin).piece(currentpiece);
                        
                        
                        
                        if strcmp(inddata.diameterbins(diameterbin).piece(currentpiece).branchtype,'b') == 1
                            % Begin bifurcation piece binning
                            
                            % Put the piece into the appropriate path length bin
                            
                            for pathlengthbin = currentproximalpathlengthbin:currentdistalpathlengthbin
                                % Repeat for as many partial pieces as there will end up being
                                
                                if     isfield(inddata.bifurcation,'doublebins')==0; nextpiece = 1;
                                elseif diameterbin > length(inddata.bifurcation.doublebins.diameterbins); nextpiece = 1;
                                elseif isfield(inddata.bifurcation.doublebins.diameterbins(diameterbin),'pathlengthbins')==0; nextpiece = 1;
                                elseif pathlengthbin > length(inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins); nextpiece = 1;
                                elseif isfield(inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin),'piece')==0; nextpiece = 1;
                                else nextpiece = 1 + length(inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece);
                                end
                                
                                temppiece = setfield(inddata.diameterbins(diameterbin).piece(currentpiece),'partial2','n');
                                inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece) = temppiece;
                                clear temppiece;
                                
                                if currentdistalpathlengthbin ~= currentproximalpathlengthbin
                                    % If the piece lies in two or more path length bins, split the piece and bin the current partial piece
                                    
                                    inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).partial2 = 'y';
                                    
                                    if pathlengthbin == currentproximalpathlengthbin
                                        % If the current partial piece falls in the proximal path length bin
                                        
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaltype           = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio            = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio1           = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio2           = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio3           = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).daughterratio        = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).parentdaughterratio  = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).parentdaughter2ratio = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length               = (pathlengthbin*distancebinwidth) - inddata.diameterbins(diameterbin).piece(currentpiece).proximalpathlength;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter       = inddata.diameterbins(diameterbin).piece(currentpiece).proximaldiameter - (inddata.diameterbins(diameterbin).piece(currentpiece).taperrate * inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length);
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea          = pi*((inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).volume               = (pi/12)*inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length*(inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);
                                        
                                        [xdirection, ydirection, zdirection]                                               = directionfunction(inddata.diameterbins(diameterbin).piece(currentpiece).elevation,inddata.diameterbins(diameterbin).piece(currentpiece).azimuth);
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition      = inddata.diameterbins(diameterbin).piece(currentpiece).proximalxposition + xdirection * inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition      = inddata.diameterbins(diameterbin).piece(currentpiece).proximalyposition + ydirection * inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition      = inddata.diameterbins(diameterbin).piece(currentpiece).proximalzposition + zdirection * inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalpathlength     = inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength + inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalradialdistance = ( (inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition-data.individual(mnnum).xposition)^2 ...
                                            + (inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition-data.individual(mnnum).yposition)^2 ...
                                            + (inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition-data.individual(mnnum).zposition)^2 )^0.5;
                                        
                                        
                                    elseif pathlengthbin > currentproximalpathlengthbin && pathlengthbin < currentdistalpathlengthbin
                                        % If the current partial piece falls between the proximal and distal path length bins
                                        
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaltype         = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaltype           = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio            = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio1           = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio2           = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio3           = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).daughterratio        = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).parentdaughterratio  = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).parentdaughter2ratio = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length               = distancebinwidth;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter     = inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(length(inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece)).distaldiameter;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter       = inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter - (inddata.diameterbins(diameterbin).piece(currentpiece).taperrate * distancebinwidth);
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea          = pi*((inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).volume               = (pi/12)*inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length*(inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);
                                        
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition      = inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalxposition;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition      = inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalyposition;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition      = inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalzposition;
                                        [xdirection, ydirection, zdirection]                                                     = directionfunction(inddata.diameterbins(diameterbin).piece(currentpiece).elevation,inddata.diameterbins(diameterbin).piece(currentpiece).azimuth);
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition        = inddata.diameterbins(diameterbin).piece(currentpiece).proximalxposition + xdirection * inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition        = inddata.diameterbins(diameterbin).piece(currentpiece).proximalxposition + ydirection * inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition        = inddata.diameterbins(diameterbin).piece(currentpiece).proximalxposition + zdirection * inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength     = inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalpathlength;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalpathlength       = inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength + inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalradialdistance = ( (inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition-data.individual(mnnum).xposition)^2 ...
                                            + (inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition-data.individual(mnnum).yposition)^2 ...
                                            + (inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition-data.individual(mnnum).zposition)^2 )^0.5;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalradialdistance = ( (inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition-data.individual(mnnum).xposition)^2 ...
                                            + (inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition-data.individual(mnnum).yposition)^2 ...
                                            + (inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition-data.individual(mnnum).zposition)^2 )^0.5;
                                        
                                        
                                    elseif pathlengthbin == currentdistalpathlengthbin
                                        % If the current partial piece falls in the distal path length bin
                                        
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaltype     = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length           = inddata.diameterbins(diameterbin).piece(currentpiece).distalpathlength - ((pathlengthbin-1)*distancebinwidth);
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter = inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(length(inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece)).distaldiameter;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea      = pi*((inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).volume           = (pi/12)*inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length*(inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);
                                        
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition      = inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalxposition;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition      = inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalyposition;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition      = inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalzposition;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength     = inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalpathlength;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalradialdistance = ( (inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition-data.individual(mnnum).xposition)^2 ...
                                            + (inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition-data.individual(mnnum).yposition)^2 ...
                                            + (inddata.bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition-data.individual(mnnum).zposition)^2 )^0.5;
                                        
                                        
                                    end
                                    % End of individual split piece path length binning
                                end
                                % End of split piece path length binning for this piece
                            end
                            % End of path length binning
                            
                            
                            
                            
                            
                            
                            
                            % Put the piece into the appropriate branch length bin
                            
                            for branchlengthbin = currentproximalbranchlengthbin:currentdistalbranchlengthbin
                                % Repeat for as many partial pieces as there will end up being
                                
                                if     isfield(inddata.bifurcation,'doublebins')==0; nextpiece = 1;
                                elseif diameterbin > length(inddata.bifurcation.doublebins.diameterbins); nextpiece = 1;
                                elseif isfield(inddata.bifurcation.doublebins.diameterbins(diameterbin),'branchlengthbins')==0; nextpiece = 1;
                                elseif branchlengthbin > length(inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins); nextpiece = 1;
                                elseif isfield(inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin),'piece')==0; nextpiece = 1;
                                else nextpiece = 1 + length(inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece);
                                end
                                
                                temppiece = setfield(inddata.diameterbins(diameterbin).piece(currentpiece),'partial2','n');
                                inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece) = temppiece;
                                clear temppiece;
                                
                                if currentdistalbranchlengthbin ~= currentproximalbranchlengthbin
                                    % If the piece lies in two or more branch length bins, split the piece and bin the current partial piece
                                    
                                    inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).partial2 = 'y';
                                    
                                    if branchlengthbin == currentproximalbranchlengthbin
                                        % If the current partial piece falls in the proximal branch length bin
                                        
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaltype           = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).rallratio            = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).rallratio1           = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).rallratio2           = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).rallratio3           = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).daughterratio        = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).parentdaughterratio  = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).parentdaughter2ratio = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length               = (branchlengthbin*branchlengthbinwidth) - inddata.diameterbins(diameterbin).piece(currentpiece).proximalbranchlength;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter       = inddata.diameterbins(diameterbin).piece(currentpiece).proximaldiameter - (inddata.diameterbins(diameterbin).piece(currentpiece).taperrate * inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length);
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea          = pi*((inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length^2)^0.5);
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).volume               = (pi/12)*inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length*(inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter^2+inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter*inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter+inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter^2);
                                        
                                        [xdirection, ydirection, zdirection]                                               = directionfunction(inddata.diameterbins(diameterbin).piece(currentpiece).elevation,inddata.diameterbins(diameterbin).piece(currentpiece).azimuth);
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition      = inddata.diameterbins(diameterbin).piece(currentpiece).proximalxposition + xdirection * inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition      = inddata.diameterbins(diameterbin).piece(currentpiece).proximalyposition + ydirection * inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition      = inddata.diameterbins(diameterbin).piece(currentpiece).proximalzposition + zdirection * inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalbranchlength     = inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength + inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalradialdistance = ( (inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition-data.individual(mnnum).xposition)^2 ...
                                            + (inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition-data.individual(mnnum).yposition)^2 ...
                                            + (inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition-data.individual(mnnum).zposition)^2 )^0.5;
                                        
                                        
                                    elseif branchlengthbin > currentproximalbranchlengthbin && branchlengthbin < currentdistalbranchlengthbin
                                        % If the current partial piece falls between the proximal and distal branch length bins
                                        
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaltype         = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaltype           = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).rallratio            = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).rallratio1           = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).rallratio2           = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).rallratio3           = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).daughterratio        = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).parentdaughterratio  = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).parentdaughter2ratio = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length               = branchlengthbinwidth;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter     = inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece(length(inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece)).distaldiameter;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter       = inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter - (inddata.diameterbins(diameterbin).piece(currentpiece).taperrate * branchlengthbinwidth);
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea          = pi*((inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length^2)^0.5);
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).volume               = (pi/12)*inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length*(inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter^2+inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter*inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter+inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter^2);
                                        
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition      = inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece(end).distalxposition;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition      = inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece(end).distalyposition;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition      = inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece(end).distalzposition;
                                        [xdirection, ydirection, zdirection]                                                     = directionfunction(inddata.diameterbins(diameterbin).piece(currentpiece).elevation,inddata.diameterbins(diameterbin).piece(currentpiece).azimuth);
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition        = inddata.diameterbins(diameterbin).piece(currentpiece).proximalxposition + xdirection * inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition        = inddata.diameterbins(diameterbin).piece(currentpiece).proximalxposition + ydirection * inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition        = inddata.diameterbins(diameterbin).piece(currentpiece).proximalxposition + zdirection * inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength     = inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece(end).distalbranchlength;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalbranchlength       = inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength + inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalradialdistance = ( (inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition-data.individual(mnnum).xposition)^2 ...
                                            + (inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition-data.individual(mnnum).yposition)^2 ...
                                            + (inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition-data.individual(mnnum).zposition)^2 )^0.5;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalradialdistance = ( (inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition-data.individual(mnnum).xposition)^2 ...
                                            + (inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition-data.individual(mnnum).yposition)^2 ...
                                            + (inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition-data.individual(mnnum).zposition)^2 )^0.5;
                                        
                                        
                                    elseif branchlengthbin == currentdistalbranchlengthbin
                                        % If the current partial piece falls in the distal branch length bin
                                        
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaltype     = [];
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length           = inddata.diameterbins(diameterbin).piece(currentpiece).distalbranchlength - ((branchlengthbin-1)*branchlengthbinwidth);
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter = inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece(length(inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece)).distaldiameter;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea      = pi*((inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length^2)^0.5);
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).volume           = (pi/12)*inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length*(inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter^2+inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter*inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter+inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter^2);
                                        
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition      = inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece(end).distalxposition;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition      = inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece(end).distalyposition;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition      = inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece(end).distalzposition;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength     = inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece(end).distalbranchlength;
                                        inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalradialdistance = ( (inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition-data.individual(mnnum).xposition)^2 ...
                                            + (inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition-data.individual(mnnum).yposition)^2 ...
                                            + (inddata.bifurcation.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition-data.individual(mnnum).zposition)^2 )^0.5;
                                        
                                        
                                    end
                                    % End of individual split piece branch length binning
                                end
                                % End of split piece branch length binning for this piece
                            end
                            % End of branch length binning
                            
                            
                            % Put the piece into the appropriate branch order bin
                            
                            if     isfield(inddata.bifurcation,'doublebins')==0; nextpiece = 1;
                            elseif diameterbin > length(inddata.bifurcation.doublebins.diameterbins); nextpiece = 1;
                            elseif isfield(inddata.bifurcation.doublebins.diameterbins(diameterbin),'branchorderbins')==0; nextpiece = 1;
                            elseif currentbranchorderbin > length(inddata.bifurcation.doublebins.diameterbins(diameterbin).branchorderbins); nextpiece = 1;
                            elseif isfield(inddata.bifurcation.doublebins.diameterbins(diameterbin).branchorderbins(currentbranchorderbin),'piece')==0; nextpiece = 1;
                            else nextpiece = 1 + length(inddata.bifurcation.doublebins.diameterbins(diameterbin).branchorderbins(currentbranchorderbin).piece);
                            end
                            inddata.bifurcation.doublebins.diameterbins(diameterbin).branchorderbins(currentbranchorderbin).piece(nextpiece) = inddata.diameterbins(diameterbin).piece(currentpiece);
                            
                            % End of bifurcation binning
                            
                            
                        elseif strcmp(inddata.diameterbins(diameterbin).piece(currentpiece).branchtype,'t') == 1
                            % Begin termination piece binning
                            
                            % Put the piece into the appropriate path length bin
                            
                            for pathlengthbin = currentproximalpathlengthbin:currentdistalpathlengthbin
                                % Repeat for as many partial pieces as there will end up being
                                
                                if     isfield(inddata.termination,'doublebins')==0; nextpiece = 1;
                                elseif diameterbin > length(inddata.termination.doublebins.diameterbins); nextpiece = 1;
                                elseif isfield(inddata.termination.doublebins.diameterbins(diameterbin),'pathlengthbins')==0; nextpiece = 1;
                                elseif pathlengthbin > length(inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins); nextpiece = 1;
                                elseif isfield(inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin),'piece')==0; nextpiece = 1;
                                else nextpiece = 1 + length(inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece);
                                end
                                
                                temppiece = setfield(inddata.diameterbins(diameterbin).piece(currentpiece),'partial2','n');
                                inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece) = temppiece;
                                clear temppiece;
                                
                                if currentdistalpathlengthbin ~= currentproximalpathlengthbin
                                    % If the piece lies in two or more path length bins, split the piece and bin the current partial piece
                                    
                                    inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).partial2 = 'y';
                                    
                                    if pathlengthbin == currentproximalpathlengthbin
                                        % If the current partial piece falls in the proximal path length bin
                                        
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaltype           = [];
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length               = (pathlengthbin*distancebinwidth) - inddata.diameterbins(diameterbin).piece(currentpiece).proximalpathlength;
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter       = inddata.diameterbins(diameterbin).piece(currentpiece).proximaldiameter - (inddata.diameterbins(diameterbin).piece(currentpiece).taperrate * inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length);
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea          = pi*((inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).volume               = (pi/12)*inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length*(inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);
                                        
                                        [xdirection, ydirection, zdirection]                                               = directionfunction(inddata.diameterbins(diameterbin).piece(currentpiece).elevation,inddata.diameterbins(diameterbin).piece(currentpiece).azimuth);
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition      = inddata.diameterbins(diameterbin).piece(currentpiece).proximalxposition + xdirection * inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition      = inddata.diameterbins(diameterbin).piece(currentpiece).proximalyposition + ydirection * inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition      = inddata.diameterbins(diameterbin).piece(currentpiece).proximalzposition + zdirection * inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalpathlength     = inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength + inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalradialdistance = ( (inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition-data.individual(mnnum).xposition)^2 ...
                                            + (inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition-data.individual(mnnum).yposition)^2 ...
                                            + (inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition-data.individual(mnnum).zposition)^2 )^0.5;
                                        
                                        
                                    elseif pathlengthbin > currentproximalpathlengthbin && pathlengthbin < currentdistalpathlengthbin
                                        % If the current partial piece falls between the proximal and distal path length bins
                                        
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaltype         = [];
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaltype           = [];
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length               = distancebinwidth;
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter     = inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(length(inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece)).distaldiameter;
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter       = inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter - (inddata.diameterbins(diameterbin).piece(currentpiece).taperrate * distancebinwidth);
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea          = pi*((inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).volume               = (pi/12)*inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length*(inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);
                                        
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition      = inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalxposition;
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition      = inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalyposition;
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition      = inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalzposition;
                                        [xdirection, ydirection, zdirection]                                                     = directionfunction(inddata.diameterbins(diameterbin).piece(currentpiece).elevation,inddata.diameterbins(diameterbin).piece(currentpiece).azimuth);
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition        = inddata.diameterbins(diameterbin).piece(currentpiece).proximalxposition + xdirection * inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition        = inddata.diameterbins(diameterbin).piece(currentpiece).proximalxposition + ydirection * inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition        = inddata.diameterbins(diameterbin).piece(currentpiece).proximalxposition + zdirection * inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength     = inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalpathlength;
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalpathlength       = inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength + inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalradialdistance = ( (inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition-data.individual(mnnum).xposition)^2 ...
                                            + (inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition-data.individual(mnnum).yposition)^2 ...
                                            + (inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition-data.individual(mnnum).zposition)^2 )^0.5;
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalradialdistance = ( (inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition-data.individual(mnnum).xposition)^2 ...
                                            + (inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition-data.individual(mnnum).yposition)^2 ...
                                            + (inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition-data.individual(mnnum).zposition)^2 )^0.5;
                                        
                                        
                                    elseif pathlengthbin == currentdistalpathlengthbin
                                        % If the current partial piece falls in the distal path length bin
                                        
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaltype     = [];
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length           = inddata.diameterbins(diameterbin).piece(currentpiece).distalpathlength - ((pathlengthbin-1)*distancebinwidth);
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter = inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(length(inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece)).distaldiameter;
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea      = pi*((inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).volume           = (pi/12)*inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length*(inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);
                                        
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition      = inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalxposition;
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition      = inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalyposition;
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition      = inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalzposition;
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength     = inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalpathlength;
                                        inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalradialdistance = ( (inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition-data.individual(mnnum).xposition)^2 ...
                                            + (inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition-data.individual(mnnum).yposition)^2 ...
                                            + (inddata.termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition-data.individual(mnnum).zposition)^2 )^0.5;
                                        
                                        
                                    end
                                    % End of individual split piece path length binning
                                end
                                % End of split piece path length binning for this piece
                            end
                            % End of path length binning
                            
                            
                            
                            
                            
                            
                            
                            
                            % Put the piece into the appropriate branch length bin
                            
                            for branchlengthbin = currentproximalbranchlengthbin:currentdistalbranchlengthbin
                                % Repeat for as many partial pieces as there will end up being
                                
                                if     isfield(inddata.termination,'doublebins')==0; nextpiece = 1;
                                elseif diameterbin > length(inddata.termination.doublebins.diameterbins); nextpiece = 1;
                                elseif isfield(inddata.termination.doublebins.diameterbins(diameterbin),'branchlengthbins')==0; nextpiece = 1;
                                elseif branchlengthbin > length(inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins); nextpiece = 1;
                                elseif isfield(inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin),'piece')==0; nextpiece = 1;
                                else nextpiece = 1 + length(inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece);
                                end
                                
                                temppiece = setfield(inddata.diameterbins(diameterbin).piece(currentpiece),'partial2','n');
                                inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece) = temppiece;
                                clear temppiece;
                                
                                if currentdistalbranchlengthbin ~= currentproximalbranchlengthbin
                                    % If the piece lies in two or more branch length bins, split the piece and bin the current partial piece
                                    
                                    inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).partial2 = 'y';
                                    
                                    if branchlengthbin == currentproximalbranchlengthbin
                                        % If the current partial piece falls in the proximal branch length bin
                                        
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaltype           = [];
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length               = (branchlengthbin*branchlengthbinwidth) - inddata.diameterbins(diameterbin).piece(currentpiece).proximalbranchlength;
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter       = inddata.diameterbins(diameterbin).piece(currentpiece).proximaldiameter - (inddata.diameterbins(diameterbin).piece(currentpiece).taperrate * inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length);
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea          = pi*((inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length^2)^0.5);
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).volume               = (pi/12)*inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length*(inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter^2+inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter*inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter+inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter^2);
                                        
                                        [xdirection, ydirection, zdirection]                                               = directionfunction(inddata.diameterbins(diameterbin).piece(currentpiece).elevation,inddata.diameterbins(diameterbin).piece(currentpiece).azimuth);
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition      = inddata.diameterbins(diameterbin).piece(currentpiece).proximalxposition + xdirection * inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition      = inddata.diameterbins(diameterbin).piece(currentpiece).proximalyposition + ydirection * inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition      = inddata.diameterbins(diameterbin).piece(currentpiece).proximalzposition + zdirection * inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalbranchlength     = inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength + inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalradialdistance = ( (inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition-data.individual(mnnum).xposition)^2 ...
                                            + (inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition-data.individual(mnnum).yposition)^2 ...
                                            + (inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition-data.individual(mnnum).zposition)^2 )^0.5;
                                        
                                        
                                    elseif branchlengthbin > currentproximalbranchlengthbin && branchlengthbin < currentdistalbranchlengthbin
                                        % If the current partial piece falls between the proximal and distal branch length bins
                                        
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaltype         = [];
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaltype           = [];
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length               = branchlengthbinwidth;
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter     = inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece(length(inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece)).distaldiameter;
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter       = inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter - (inddata.diameterbins(diameterbin).piece(currentpiece).taperrate * branchlengthbinwidth);
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea          = pi*((inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length^2)^0.5);
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).volume               = (pi/12)*inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length*(inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter^2+inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter*inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter+inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter^2);
                                        
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition      = inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece(end).distalxposition;
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition      = inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece(end).distalyposition;
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition      = inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece(end).distalzposition;
                                        [xdirection, ydirection, zdirection]                                                     = directionfunction(inddata.diameterbins(diameterbin).piece(currentpiece).elevation,inddata.diameterbins(diameterbin).piece(currentpiece).azimuth);
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition        = inddata.diameterbins(diameterbin).piece(currentpiece).proximalxposition + xdirection * inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition        = inddata.diameterbins(diameterbin).piece(currentpiece).proximalxposition + ydirection * inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition        = inddata.diameterbins(diameterbin).piece(currentpiece).proximalxposition + zdirection * inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength     = inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece(end).distalbranchlength;
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalbranchlength       = inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength + inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalradialdistance = ( (inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition-data.individual(mnnum).xposition)^2 ...
                                            + (inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition-data.individual(mnnum).yposition)^2 ...
                                            + (inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition-data.individual(mnnum).zposition)^2 )^0.5;
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalradialdistance = ( (inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition-data.individual(mnnum).xposition)^2 ...
                                            + (inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition-data.individual(mnnum).yposition)^2 ...
                                            + (inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition-data.individual(mnnum).zposition)^2 )^0.5;
                                        
                                        
                                    elseif branchlengthbin == currentdistalbranchlengthbin
                                        % If the current partial piece falls in the distal branch length bin
                                        
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaltype     = [];
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length           = inddata.diameterbins(diameterbin).piece(currentpiece).distalbranchlength - ((branchlengthbin-1)*branchlengthbinwidth);
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter = inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece(length(inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece)).distaldiameter;
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea      = pi*((inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length^2)^0.5);
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).volume           = (pi/12)*inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).length*(inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter^2+inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter*inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter+inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter^2);
                                        
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition      = inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece(end).distalxposition;
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition      = inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece(end).distalyposition;
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition      = inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece(end).distalzposition;
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength     = inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin-1).piece(end).distalbranchlength;
                                        inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalradialdistance = ( (inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition-data.individual(mnnum).xposition)^2 ...
                                            + (inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition-data.individual(mnnum).yposition)^2 ...
                                            + (inddata.termination.doublebins.diameterbins(diameterbin).branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition-data.individual(mnnum).zposition)^2 )^0.5;
                                        
                                        
                                    end
                                    % End of individual split piece binning
                                end
                                % End of split piece binning for this piece
                            end
                            % End of termination binning
                            
                            % Put the piece into the appropriate branch order bin
                            
                            if     isfield(inddata.termination,'doublebins')==0; nextpiece = 1;
                            elseif diameterbin > length(inddata.termination.doublebins.diameterbins); nextpiece = 1;
                            elseif isfield(inddata.termination.doublebins.diameterbins(diameterbin),'branchorderbins')==0; nextpiece = 1;
                            elseif currentbranchorderbin > length(inddata.termination.doublebins.diameterbins(diameterbin).branchorderbins); nextpiece = 1;
                            elseif isfield(inddata.termination.doublebins.diameterbins(diameterbin).branchorderbins(currentbranchorderbin),'piece')==0; nextpiece = 1;
                            else nextpiece = 1 + length(inddata.termination.doublebins.diameterbins(diameterbin).branchorderbins(currentbranchorderbin).piece);
                            end
                            inddata.termination.doublebins.diameterbins(diameterbin).branchorderbins(currentbranchorderbin).piece(nextpiece) = inddata.diameterbins(diameterbin).piece(currentpiece);
                            
                            
                        else
                            disp('Error: piece branch type not identified.');
                            keyboard
                        end
                        % End of binning
                        
                        
                        
                        
                    end
                    % End of pieces in this diameter bin
                end
                % End of piece
            end
            % End of diameter bins
        eval(['data.individual(mnnum).' currentpiecetype ' = inddata;']);
        end
        % End of motoneuron
        
        eval(['data.population.' currentpiecetype ' = popdata;']);
        
    end
end





























