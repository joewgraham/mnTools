function [data,analysis] = piecebinner(mnpop)
%Divides pieces into cables, primarydendritebins, branchorderbins,
%pathlengthbins, radialdistance bins, bifurcationbin, and terminationbin

mnoptions;

data.datapathname                              = mnpop.datapathname;
data.datetime                                  = mnpop.datetime;
data.inputfilename                             = mnpop.inputfilename;
data.binsettings.axon.distancebinwidth         = option.axon.distancebinwidth;
data.binsettings.axon.branchlengthbinwidth     = option.axon.branchlengthbinwidth;
data.binsettings.axon.diameterbinbreaks        = option.axon.diameterbinbreaks;
data.binsettings.axon.diameterbinwidths        = option.axon.diameterbinwidths;
data.binsettings.dendrite.distancebinwidth     = option.dendrite.distancebinwidth;
data.binsettings.dendrite.branchlengthbinwidth = option.dendrite.branchlengthbinwidth;
data.binsettings.dendrite.diameterbinbreaks    = option.dendrite.diameterbinbreaks;
data.binsettings.dendrite.diameterbinwidths    = option.dendrite.diameterbinwidths;
data.binsettings.apical.distancebinwidth       = option.apical.distancebinwidth;
data.binsettings.apical.branchlengthbinwidth   = option.apical.branchlengthbinwidth;
data.binsettings.apical.diameterbinbreaks      = option.apical.diameterbinbreaks;
data.binsettings.apical.diameterbinwidths      = option.apical.diameterbinwidths;

analysis.datapathname                              = mnpop.datapathname;
analysis.datetime                                  = mnpop.datetime;
analysis.inputfilename                             = mnpop.inputfilename;
analysis.binsettings.axon.distancebinwidth         = option.axon.distancebinwidth;
analysis.binsettings.axon.branchlengthbinwidth     = option.axon.branchlengthbinwidth;
analysis.binsettings.axon.diameterbinbreaks        = option.axon.diameterbinbreaks;
analysis.binsettings.axon.diameterbinwidths        = option.axon.diameterbinwidths;
analysis.binsettings.dendrite.distancebinwidth     = option.dendrite.distancebinwidth;
analysis.binsettings.dendrite.branchlengthbinwidth = option.dendrite.branchlengthbinwidth;
analysis.binsettings.dendrite.diameterbinbreaks    = option.dendrite.diameterbinbreaks;
analysis.binsettings.dendrite.diameterbinwidths    = option.dendrite.diameterbinwidths;
analysis.binsettings.apical.distancebinwidth       = option.apical.distancebinwidth;
analysis.binsettings.apical.branchlengthbinwidth   = option.apical.branchlengthbinwidth;
analysis.binsettings.apical.diameterbinbreaks      = option.apical.diameterbinbreaks;
analysis.binsettings.apical.diameterbinwidths      = option.apical.diameterbinwidths;

disp('   Piece binning started.');

% Pre-allocate the analysis data structure
data.individual(length(mnpop.mn)).somadiameter = [];

% Ensure diameter binning is set correctly
if length(option.axon.diameterbinwidths)-1 ~= length(option.axon.diameterbinbreaks) || length(option.dendrite.diameterbinwidths)-1 ~= length(option.dendrite.diameterbinbreaks) || length(option.apical.diameterbinwidths)-1 ~= length(option.apical.diameterbinbreaks)
    disp(' ');
    disp('Error: problem with diameter bins.');
    disp('See ''mnoptions.m''.                ');
    keyboard;
end

for i=1:length(mnpop.mn)
    % Begin filling in the data structure
    %data.individual(i).somadiameter           = mnpop.mn(i).somadiameter;
    data.individual(i).xposition              = mnpop.mn(i).xposition;
    data.individual(i).yposition              = mnpop.mn(i).yposition;
    data.individual(i).zposition              = mnpop.mn(i).zposition;
end

piecetypes{1} = 'soma';
piecetypes{2} = 'axon';
piecetypes{3} = 'dendrite';
piecetypes{4} = 'apical';

for piecetype = 2:4
    
    if isfield(mnpop.mn,piecetypes{piecetype})
        
        currentpiecetype = piecetypes{piecetype};
        
        for i=1:length(mnpop.mn)
            
            clear piecedata;
            clear binsettings;
            clear inddata;
            eval(['piecedata = mnpop.mn(i).' currentpiecetype ';']);
            eval(['binsettings = data.binsettings.' currentpiecetype ';']);
            
            inddata.maxbranchorder         = 0;
            inddata.minbranchorder         = inf;
            popdata.maxbranchorder         = 0;
            popdata.minbranchorder         = inf;
            inddata.totallength            = 0;
            inddata.totalsurfacearea       = 0;
            inddata.totalvolume            = 0;
            inddata.numberterminations     = 0;
            inddata.numberbifurcations     = 0;
            inddata.maxdiameter            = max([[piecedata.proximaldiameter] [piecedata.distaldiameter]]);
            inddata.mindiameter            = min([[piecedata.proximaldiameter] [piecedata.distaldiameter]]);
            inddata.maxpathlength          = max([[piecedata.proximalpathlength] [piecedata.distalpathlength]]);
            inddata.minpathlength          = min([[piecedata.proximalpathlength] [piecedata.distalpathlength]]);
            inddata.maxradialdistance      = max([[piecedata.proximalradialdistance] [piecedata.distalradialdistance]]);
            inddata.minradialdistance      = min([[piecedata.proximalradialdistance] [piecedata.distalradialdistance]]);
            inddata.maxbranchlength        = max([[piecedata.proximalbranchlength] [piecedata.distalbranchlength]]);
            inddata.minbranchlength        = min([[piecedata.distalbranchlength] [piecedata.distalbranchlength]]);
            
%             if ~isfield(piecedata,'daughter1')
%                 piecedata(1).daughter1 = [];
%                 piecedata(1).daughter1diameter = [];
%                 piecedata(1).daughter1xdirection = [];
%                 piecedata(1).daughter1ydirection = [];
%                 piecedata(1).daughter1zdirection = [];
%                 piecedata(1).daughter2 = [];
%                 piecedata(1).daughter2diameter = [];
%                 piecedata(1).daughter2xdirection = [];
%                 piecedata(1).daughter2ydirection = [];
%                 piecedata(1).daughter2zdirection = [];
%                 piecedata(1).daughterratio = [];
%                 piecedata(1).daughters = [];
%                 piecedata(1).parentdaughter2ratio = [];
%                 piecedata(1).parentdaughterratio = [];
%                 piecedata(1).rallratio = [];
%                 piecedata(1).rallratio1 = [];
%                 piecedata(1).rallratio2 = [];
%                 piecedata(1).rallratio3 = [];
%                 %keyboard
%             end
            
            % Create the diameter bins
            inddata.diameterbinedges   = 0:(binsettings.diameterbinwidths(1)):binsettings.diameterbinbreaks(1);
            inddata.diameterbinmiddles = inddata.diameterbinedges(1:(length(inddata.diameterbinedges)-1)) + (binsettings.diameterbinwidths(1)/2);
            if length(binsettings.diameterbinbreaks) > 1
                for binbreaks = 1:length(binsettings.diameterbinbreaks)-1
                    newbinedges   = binsettings.diameterbinbreaks(binbreaks)+binsettings.diameterbinwidths(binbreaks+1):binsettings.diameterbinwidths(binbreaks+1):binsettings.diameterbinbreaks(binbreaks+1);
                    newbinmiddles = newbinedges(1:(length(newbinedges))) - (binsettings.diameterbinwidths(binbreaks+1))/2;
                    inddata.diameterbinedges   = [inddata.diameterbinedges newbinedges];
                    inddata.diameterbinmiddles = [inddata.diameterbinmiddles newbinmiddles];
                end
            end
            newbinedges   = binsettings.diameterbinbreaks(length(binsettings.diameterbinbreaks))+binsettings.diameterbinwidths(length(binsettings.diameterbinwidths)):binsettings.diameterbinwidths(length(binsettings.diameterbinwidths)):(floor(inddata.maxdiameter/binsettings.diameterbinwidths(length(binsettings.diameterbinwidths)))*binsettings.diameterbinwidths(length(binsettings.diameterbinwidths)))+binsettings.diameterbinwidths(length(binsettings.diameterbinwidths));
            newbinmiddles = newbinedges(1:(length(newbinedges))) - (binsettings.diameterbinwidths(end))/2;
            inddata.diameterbinedges = [inddata.diameterbinedges newbinedges];
            inddata.diameterbinmiddles = [inddata.diameterbinmiddles newbinmiddles];
            
            % Make the population diameter bins equal to the largest individual diameter bins
            if i == 1
                popdata.diameterbinedges   = inddata.diameterbinedges;
                popdata.diameterbinmiddles = inddata.diameterbinmiddles;
                lengths = length(inddata.diameterbinedges);
                popdata.maxpathlength     = inddata.maxpathlength;
                popdata.maxradialdistance = inddata.maxradialdistance;
                popdata.maxbranchlength   = inddata.maxbranchlength;
            elseif i > 1
                lengths = [lengths length(inddata.diameterbinedges)];
                if length(inddata.diameterbinedges) >= max(lengths)
                    popdata.diameterbinedges   = inddata.diameterbinedges;
                    popdata.diameterbinmiddles = inddata.diameterbinmiddles;
                end
                if inddata.maxpathlength > popdata.maxpathlength
                    popdata.maxpathlength = inddata.maxpathlength;
                end
                if inddata.maxradialdistance > popdata.maxradialdistance
                    popdata.maxradialdistance = inddata.maxradialdistance;
                end
                if inddata.maxbranchlength > popdata.maxbranchlength
                    popdata.maxbranchlength = inddata.maxbranchlength;
                end
                
            end
            
            % Pre-allocate the individual diameter bins
            for diameterbins = 1:length(inddata.diameterbinmiddles)
                inddata.diameterbins(diameterbins).length = [];
                inddata.bifurcation.diameterbins(diameterbins).length = [];
                inddata.termination.diameterbins(diameterbins).length = [];
            end
            
            % Fill in the individual neuron's piece-type data structure
            eval(['data.individual(i).' currentpiecetype '=inddata;']);
            clear inddata;
            
        end
        
        % Pre-allocate the population diameter bins
        for diameterbins = 1:length(popdata.diameterbinmiddles)
            popdata.diameterbins(diameterbins).length = [];
            popdata.bifurcation.diameterbins(diameterbins).length = [];
            popdata.termination.diameterbins(diameterbins).length = [];
        end
        
        %         % Define the population path length bin middles
        %         maxpathlengthbin = ceil(max([inddata.maxpathlength]) / binsettings.distancebinwidth);
        %         for pathlengthbins = 1:maxpathlengthbin
        %             popdata.pathlengthbinmiddles(pathlengthbins) = (pathlengthbins * binsettings.distancebinwidth) - (binsettings.distancebinwidth / 2);
        %         end
        %
        %         % Define the population branch length bin middles
        %         maxbranchlengthbin = ceil(max([inddata.maxbranchlength]) / binsettings.branchlengthbinwidth);
        %         for branchlengthbins = 1:maxbranchlengthbin
        %             popdata.branchlengthbinmiddles(branchlengthbins) = (branchlengthbins * binsettings.branchlengthbinwidth) - (binsettings.branchlengthbinwidth / 2);
        %         end
        
        % Fill in population piece-type data structure
        %eval(['data.population.' currentpiecetype '=popdata;']);
        %clear popdata;
        
        
        for i=1:length(mnpop.mn)
            
            zerowarningon = true;
            clear piecedata;
            clear binsettings;
            clear inddata;
            clear firstcable;
            eval(['piecedata = mnpop.mn(i).' currentpiecetype ';']);
            eval(['binsettings = data.binsettings.' currentpiecetype ';']);
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            firstcable = piecedata(1).cable;
            
            if ~isfield(piecedata,'daughter1')
                piecedata(1).daughter1 = [];
                piecedata(1).daughter1diameter = [];
                piecedata(1).daughter1xdirection = [];
                piecedata(1).daughter1ydirection = [];
                piecedata(1).daughter1zdirection = [];
                piecedata(1).daughter2 = [];
                piecedata(1).daughter2diameter = [];
                piecedata(1).daughter2xdirection = [];
                piecedata(1).daughter2ydirection = [];
                piecedata(1).daughter2zdirection = [];
                piecedata(1).daughterratio = [];
                piecedata(1).daughters = [];
                piecedata(1).parentdaughter2ratio = [];
                piecedata(1).parentdaughterratio = [];
                piecedata(1).rallratio = [];
                piecedata(1).rallratio1 = [];
                piecedata(1).rallratio2 = [];
                piecedata(1).rallratio3 = [];
                %keyboard
            end
            
            for j=1:length(piecedata)
                
                if strcmp(piecedata(j).distaltype,'m-furcation')
                    disp(['     Warning: multifurcation in ' mnpop.importfilename{i}]);
                end
                
                % Determine which bins the current piece falls into
                currentcablebin                  = piecedata(j).cable - firstcable +1;
                currentproximalpathlength        = piecedata(j).proximalpathlength;
                currentdistalpathlength          = piecedata(j).distalpathlength;
                currentproximalpathlengthbin     = 1 + floor(currentproximalpathlength / binsettings.distancebinwidth);
                currentdistalpathlengthbin       = ceil(currentdistalpathlength / binsettings.distancebinwidth);
                if currentdistalpathlengthbin == 0; keyboard; currentdistalpathlengthbin = 1; end;
                currentproximalradialdistance    = piecedata(j).proximalradialdistance;
                currentdistalradialdistance      = piecedata(j).distalradialdistance;
                currentproximalradialdistancebin = 1 + floor(currentproximalradialdistance / binsettings.distancebinwidth);
                currentdistalradialdistancebin   = ceil(currentdistalradialdistance / binsettings.distancebinwidth);
                if currentdistalradialdistancebin == 0; keyboard; currentdistalradialdistancebin = 1; end;
                currentproximaldiameter          = piecedata(j).proximaldiameter;
                currentdistaldiameter            = piecedata(j).distaldiameter;
                currentproximalbranchlength        = piecedata(j).proximalbranchlength;
                currentdistalbranchlength          = piecedata(j).distalbranchlength;
                currentproximalbranchlengthbin     = 1 + floor(currentproximalbranchlength / binsettings.branchlengthbinwidth);
                currentdistalbranchlengthbin       = ceil(currentdistalbranchlength / binsettings.branchlengthbinwidth);
                if currentdistalbranchlengthbin == 0; keyboard; currentdistalbranchlengthbin = 1; end;
                
                clear currentproximaldiameterbin;
                clear currentdistaldiameterbin;
                for diameterbin = 1:length(inddata.diameterbinmiddles)
                    if currentproximaldiameter > inddata.diameterbinedges(diameterbin) && currentproximaldiameter <= inddata.diameterbinedges(diameterbin+1)
                        currentproximaldiameterbin = diameterbin;
                    end
                    if currentdistaldiameter > inddata.diameterbinedges(diameterbin) && currentdistaldiameter <= inddata.diameterbinedges(diameterbin+1)
                        currentdistaldiameterbin   = diameterbin;
                    end
                end
                clear diameterbin;
                if currentproximaldiameter == 0
                    currentproximaldiameterbin = 1;
                    if zerowarningon
                        disp(['     Warning: zero diameter in ' mnpop.importfilename{i}]);
                        zerowarningon = false;
                    end                   
                end
                if currentdistaldiameter == 0
                    currentdistaldiameterbin = 1;
                    if zerowarningon
                        disp(['     Warning: zero diameter in ' mnpop.importfilename{i}]);
                        zerowarningon = false;
                    end       
                end
                
                % Put the piece into the appropriate cable bin
                if     isfield(inddata,'cablebins')==0; nextpiece = 1;
                elseif currentcablebin > length(inddata.cablebins); nextpiece = 1;
                elseif isfield(inddata.cablebins(currentcablebin),'piece')==0; nextpiece = 1;
                else nextpiece = 1 + length(inddata.cablebins(currentcablebin).piece);
                end;
                inddata.cablebins(currentcablebin).piece(nextpiece) = piecedata(j);
                clear nextpiece;
                
                
                
                % Put the piece into the appropriate diameter bin
                if currentdistaldiameterbin < currentproximaldiameterbin
                    diameterstep = -1;
                else
                    diameterstep = 1;
                end
                
                for diameterbin = currentproximaldiameterbin:diameterstep:currentdistaldiameterbin
                    % Repeat for as many partial pieces as there will end up being
                    
                    if     isfield(inddata,'diameterbins')==0; nextpiece = 1;
                    elseif isfield(inddata.diameterbins(diameterbin),'piece')==0; nextpiece = 1;
                    else nextpiece = 1 + length(inddata.diameterbins(diameterbin).piece);
                    end;
                    
                    temppiece = setfield(piecedata(j),'partial','n');
                    inddata.diameterbins(diameterbin).piece(nextpiece) = temppiece;
                    clear temppiece;
                    
                    % If the piece lies in two or more diameter bins, split the piece and bin the current partial piece
                    
                    if currentdistaldiameterbin < currentproximaldiameterbin
                        % If the distal diameter is less than the proximal diameter
                        
                        inddata.diameterbins(diameterbin).piece(nextpiece).partial = 'y';
                        
                        if diameterbin == currentproximaldiameterbin
                            % If this partial piece is in the proximal diameter bin
                            inddata.diameterbins(diameterbin).piece(nextpiece).distaltype           = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).rallratio            = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).rallratio1           = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).rallratio2           = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).rallratio3           = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).daughterratio        = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).parentdaughterratio  = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).parentdaughter2ratio = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = piecedata(j).proximaldiameter;
                            inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter       = inddata.diameterbinedges(diameterbin);
                            if inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter > inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                                disp('Error.  Distal diameter is greater than proximal diameter.');
                                keyboard;
                            end
                            %inddata.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/piecedata(j).taperrate;
                            inddata.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/(piecedata(j).taperrate*inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter);

                            if inddata.diameterbins(diameterbin).piece(nextpiece).length > 1.01 * piecedata(j).length || inddata.diameterbins(diameterbin).piece(nextpiece).length < 0
                                disp('Error.  Partial piece length is greater than piece length.');
                                disp(sprintf('Partial Length: %f',inddata.diameterbins(diameterbin).piece(nextpiece).length));
                                disp(sprintf('Total Length:   %f',piecedata(j).length));
                                keyboard;
                            end
                            inddata.diameterbins(diameterbin).piece(nextpiece).surfacearea          = pi*((inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+inddata.diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                            inddata.diameterbins(diameterbin).piece(nextpiece).volume               = (pi/12)*inddata.diameterbins(diameterbin).piece(nextpiece).length*(inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter+inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);
                            
                            [xdirection, ydirection, zdirection]                                               = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                            inddata.diameterbins(diameterbin).piece(nextpiece).distalxposition      = piecedata(j).proximalxposition + xdirection * inddata.diameterbins(diameterbin).piece(nextpiece).length;
                            inddata.diameterbins(diameterbin).piece(nextpiece).distalyposition      = piecedata(j).proximalyposition + ydirection * inddata.diameterbins(diameterbin).piece(nextpiece).length;
                            inddata.diameterbins(diameterbin).piece(nextpiece).distalzposition      = piecedata(j).proximalzposition + zdirection * inddata.diameterbins(diameterbin).piece(nextpiece).length;
                            inddata.diameterbins(diameterbin).piece(nextpiece).distalpathlength     = inddata.diameterbins(diameterbin).piece(nextpiece).proximalpathlength + inddata.diameterbins(diameterbin).piece(nextpiece).length;
                            inddata.diameterbins(diameterbin).piece(nextpiece).distalradialdistance = ( (inddata.diameterbins(diameterbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                + (inddata.diameterbins(diameterbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                + (inddata.diameterbins(diameterbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                            
                            %                     disp(' ');
                            %                     disp('Distal diameter bin is smaller than proximal diameter bin.');
                            %                     disp(sprintf('  Piece ID: %.0f',j));
                            %                     disp(sprintf('    Length   : %.2f',piecedata(j).length));
                            %                     disp(sprintf('    Prox Diam: %.2f',piecedata(j).proximaldiameter));
                            %                     disp(sprintf('    Dist Diam: %.2f',piecedata(j).distaldiameter));
                            %
                            %disp(sprintf('  Partial piece ID %.0f falling into the proximal bin.',j));
                            %disp(sprintf('    Which has edges %.2f:%.2f',inddata.diameterbinedges(diameterbin),inddata.diameterbinedges(diameterbin+1)));
                            %disp(sprintf('      Partial Length   : %.2f',inddata.diameterbins(diameterbin).piece(nextpiece).length));
                            %disp(sprintf('      Partial Prox Diam: %.2f',inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter));
                            %disp(sprintf('      Partial Dist Diam: %.2f',inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter));
                            
                            
                        elseif diameterbin < currentproximaldiameterbin && diameterbin > currentdistaldiameterbin
                            % If this partial piece falls between the proximal and distal diameter bins
                            
                            inddata.diameterbins(diameterbin).piece(nextpiece).distaltype           = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).proximaltype         = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).rallratio            = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).rallratio1           = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).rallratio2           = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).rallratio3           = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).daughterratio        = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).parentdaughterratio  = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).parentdaughter2ratio = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = inddata.diameterbinedges(diameterbin+1);
                            inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter       = inddata.diameterbinedges(diameterbin);
                            if inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter > inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                                disp('Error.  Distal diameter is greater than proximal diameter.');
                                keyboard;
                            end
                            %inddata.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/piecedata(j).taperrate;
                            inddata.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/(inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*piecedata(j).taperrate);

                            if inddata.diameterbins(diameterbin).piece(nextpiece).length > 1.01 * piecedata(j).length || inddata.diameterbins(diameterbin).piece(nextpiece).length < 0
                                disp('Error.  Partial piece length is greater than piece length.');
                                disp(sprintf('Partial Length: %f',inddata.diameterbins(diameterbin).piece(nextpiece).length));
                                disp(sprintf('Total Length:   %f',piecedata(j).length));
                                keyboard;
                            end
                            inddata.diameterbins(diameterbin).piece(nextpiece).surfacearea            = pi*((inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+inddata.diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                            inddata.diameterbins(diameterbin).piece(nextpiece).volume                 = (pi/12)*inddata.diameterbins(diameterbin).piece(nextpiece).length*(inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter+inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);
                            
                            inddata.diameterbins(diameterbin).piece(nextpiece).proximalxposition      = inddata.diameterbins(diameterbin+1).piece(end).distalxposition;
                            inddata.diameterbins(diameterbin).piece(nextpiece).proximalyposition      = inddata.diameterbins(diameterbin+1).piece(end).distalyposition;
                            inddata.diameterbins(diameterbin).piece(nextpiece).proximalzposition      = inddata.diameterbins(diameterbin+1).piece(end).distalzposition;
                            [xdirection, ydirection, zdirection]                                                 = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                            inddata.diameterbins(diameterbin).piece(nextpiece).distalxposition        = piecedata(j).proximalxposition + xdirection * inddata.diameterbins(diameterbin).piece(nextpiece).length;
                            inddata.diameterbins(diameterbin).piece(nextpiece).distalyposition        = piecedata(j).proximalxposition + ydirection * inddata.diameterbins(diameterbin).piece(nextpiece).length;
                            inddata.diameterbins(diameterbin).piece(nextpiece).distalzposition        = piecedata(j).proximalxposition + zdirection * inddata.diameterbins(diameterbin).piece(nextpiece).length;
                            inddata.diameterbins(diameterbin).piece(nextpiece).proximalpathlength     = inddata.diameterbins(diameterbin+1).piece(end).distalpathlength;
                            inddata.diameterbins(diameterbin).piece(nextpiece).distalpathlength       = inddata.diameterbins(diameterbin).piece(nextpiece).proximalpathlength + inddata.diameterbins(diameterbin).piece(nextpiece).length;
                            inddata.diameterbins(diameterbin).piece(nextpiece).proximalradialdistance = ( (inddata.diameterbins(diameterbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                + (inddata.diameterbins(diameterbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                + (inddata.diameterbins(diameterbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                            inddata.diameterbins(diameterbin).piece(nextpiece).distalradialdistance = ( (inddata.diameterbins(diameterbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                + (inddata.diameterbins(diameterbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                + (inddata.diameterbins(diameterbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                            
                            
                            %disp(sprintf('  Partial piece ID %.0f falling into a middle bin.',j));
                            %disp(sprintf('    Which has edges %.2f:%.2f',inddata.diameterbinedges(diameterbin),inddata.diameterbinedges(diameterbin+1)));
                            %disp(sprintf('      Partial Length   : %.2f',inddata.diameterbins(diameterbin).piece(nextpiece).length));
                            %disp(sprintf('      Partial Prox Diam: %.2f',inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter));
                            %disp(sprintf('      Partial Dist Diam: %.2f',inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter));
                            
                        elseif diameterbin == currentdistaldiameterbin
                            % If this partial piece falls in the distal diameter bin
                            
                            inddata.diameterbins(diameterbin).piece(nextpiece).proximaltype         = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = inddata.diameterbinedges(diameterbin+1);
                            inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter       = piecedata(j).distaldiameter;
                            if inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter > inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                                disp('Error.  Distal diameter is greater than proximal diameter.');
                                keyboard;
                            end
                            %inddata.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/piecedata(j).taperrate;
                            inddata.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/(inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*piecedata(j).taperrate);
                            if inddata.diameterbins(diameterbin).piece(nextpiece).length > 1.01 * piecedata(j).length || inddata.diameterbins(diameterbin).piece(nextpiece).length < 0
                                disp('Error.  Partial piece length is greater than piece length.');
                                disp(sprintf('Partial Length: %f',inddata.diameterbins(diameterbin).piece(nextpiece).length));
                                disp(sprintf('Total Length:   %f',piecedata(j).length));
                                keyboard;
                            end
                            inddata.diameterbins(diameterbin).piece(nextpiece).surfacearea          = pi*((inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+inddata.diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                            inddata.diameterbins(diameterbin).piece(nextpiece).volume               = (pi/12)*inddata.diameterbins(diameterbin).piece(nextpiece).length*(inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter+inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);
                            
                            inddata.diameterbins(diameterbin).piece(nextpiece).proximalxposition      = inddata.diameterbins(diameterbin+1).piece(end).distalxposition;
                            inddata.diameterbins(diameterbin).piece(nextpiece).proximalyposition      = inddata.diameterbins(diameterbin+1).piece(end).distalyposition;
                            inddata.diameterbins(diameterbin).piece(nextpiece).proximalzposition      = inddata.diameterbins(diameterbin+1).piece(end).distalzposition;
                            inddata.diameterbins(diameterbin).piece(nextpiece).proximalpathlength     = inddata.diameterbins(diameterbin+1).piece(end).distalpathlength;
                            inddata.diameterbins(diameterbin).piece(nextpiece).proximalradialdistance = ( (inddata.diameterbins(diameterbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                + (inddata.diameterbins(diameterbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                + (inddata.diameterbins(diameterbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                            
                            %disp(sprintf('  Partial piece ID %.0f falling into the distal bin.',j));
                            %disp(sprintf('    Which has edges %.2f:%.2f',inddata.diameterbinedges(diameterbin),inddata.diameterbinedges(diameterbin+1)));
                            %disp(sprintf('      Partial Length   : %.2f',inddata.diameterbins(diameterbin).piece(nextpiece).length));
                            %disp(sprintf('      Partial Prox Diam: %.2f',inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter));
                            %disp(sprintf('      Partial Dist Diam: %.2f',inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter));
                            
                        else disp('Error.  See piecebinner.m line 291.');
                        end
                        
                    elseif currentdistaldiameterbin > currentproximaldiameterbin
                        % If the distal diameter is greater than the proximal diameter
                        
                        %disp('Distal diameter is greater than proximal diameter.');
                        inddata.diameterbins(diameterbin).piece(nextpiece).partial = 'y';
                        
                        if diameterbin == currentproximaldiameterbin
                            % If this partial piece is in the proximal diameter bin
                            
                            inddata.diameterbins(diameterbin).piece(nextpiece).distaltype           = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).rallratio            = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).rallratio1           = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).rallratio2           = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).rallratio3           = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).daughterratio        = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).parentdaughterratio  = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).parentdaughter2ratio = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = piecedata(j).proximaldiameter;
                            inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter       = inddata.diameterbinedges(diameterbin+1);
                            if inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter < inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                                disp('Error.  Distal diameter is less than proximal diameter.');
                                keyboard;
                            end
                            %inddata.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/piecedata(j).taperrate;
                            inddata.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/(inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*piecedata(j).taperrate);

                            if inddata.diameterbins(diameterbin).piece(nextpiece).length > 1.01 * piecedata(j).length || inddata.diameterbins(diameterbin).piece(nextpiece).length < 0
                                disp('Error.  Partial piece length is greater than piece length.');
                                disp(sprintf('Partial Length: %f',inddata.diameterbins(diameterbin).piece(nextpiece).length));
                                disp(sprintf('Total Length:   %f',piecedata(j).length));
                                keyboard;
                            end
                            inddata.diameterbins(diameterbin).piece(nextpiece).surfacearea          = pi*((inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+inddata.diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                            inddata.diameterbins(diameterbin).piece(nextpiece).volume               = (pi/12)*inddata.diameterbins(diameterbin).piece(nextpiece).length*(inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter+inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);
                            
                            [xdirection, ydirection, zdirection]                                               = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                            inddata.diameterbins(diameterbin).piece(nextpiece).distalxposition      = piecedata(j).proximalxposition + xdirection * inddata.diameterbins(diameterbin).piece(nextpiece).length;
                            inddata.diameterbins(diameterbin).piece(nextpiece).distalyposition      = piecedata(j).proximalyposition + ydirection * inddata.diameterbins(diameterbin).piece(nextpiece).length;
                            inddata.diameterbins(diameterbin).piece(nextpiece).distalzposition      = piecedata(j).proximalzposition + zdirection * inddata.diameterbins(diameterbin).piece(nextpiece).length;
                            inddata.diameterbins(diameterbin).piece(nextpiece).distalpathlength     = inddata.diameterbins(diameterbin).piece(nextpiece).proximalpathlength + inddata.diameterbins(diameterbin).piece(nextpiece).length;
                            inddata.diameterbins(diameterbin).piece(nextpiece).distalradialdistance = ( (inddata.diameterbins(diameterbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                + (inddata.diameterbins(diameterbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                + (inddata.diameterbins(diameterbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                            
                            %                     disp(' ');
                            %                     disp('Distal diameter bin is larger than proximal diameter bin.');
                            %                     disp(sprintf('  Piece ID: %.0f',j));
                            %                     disp(sprintf('    Length   : %.2f',piecedata(j).length));
                            %                     disp(sprintf('    Prox Diam: %.2f',piecedata(j).proximaldiameter));
                            %                     disp(sprintf('    Dist Diam: %.2f',piecedata(j).distaldiameter));
                            %
                            %                     disp(sprintf('  Partial piece ID %.0f falling into the proximal bin.',j));
                            %                     disp(sprintf('    Which has edges %.2f:%.2f',inddata.diameterbinedges(diameterbin),inddata.diameterbinedges(diameterbin+1)));
                            %                     disp(sprintf('      Partial Length   : %.2f',inddata.diameterbins(diameterbin).piece(nextpiece).length));
                            %                     disp(sprintf('      Partial Prox Diam: %.2f',inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter));
                            %                     disp(sprintf('      Partial Dist Diam: %.2f',inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter));
                            
                        elseif diameterbin > currentproximaldiameterbin && diameterbin < currentdistaldiameterbin
                            % If this partial piece falls between the proximal and distal diameter bins
                            
                            inddata.diameterbins(diameterbin).piece(nextpiece).proximaltype         = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).distaltype           = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).rallratio            = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).rallratio1           = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).rallratio2           = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).rallratio3           = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).daughterratio        = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).parentdaughterratio  = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).parentdaughter2ratio = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = inddata.diameterbinedges(diameterbin);
                            inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter       = inddata.diameterbinedges(diameterbin+1);
                            if inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter < inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                                disp('Error.  Distal diameter is less than proximal diameter.');
                                keyboard;
                            end
                            %inddata.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/piecedata(j).taperrate;
                            inddata.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/(inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*piecedata(j).taperrate);

                            if inddata.diameterbins(diameterbin).piece(nextpiece).length > 1.01 * piecedata(j).length || inddata.diameterbins(diameterbin).piece(nextpiece).length < 0
                                disp('Error.  Partial piece length is greater than piece length.');
                                disp(sprintf('Partial Length: %f',inddata.diameterbins(diameterbin).piece(nextpiece).length));
                                disp(sprintf('Total Length:   %f',piecedata(j).length));
                                keyboard;
                            end
                            inddata.diameterbins(diameterbin).piece(nextpiece).surfacearea          = pi*((inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+inddata.diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                            inddata.diameterbins(diameterbin).piece(nextpiece).volume               = (pi/12)*inddata.diameterbins(diameterbin).piece(nextpiece).length*(inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter+inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);
                            
                            inddata.diameterbins(diameterbin).piece(nextpiece).proximalxposition      = inddata.diameterbins(diameterbin-1).piece(end).distalxposition;
                            inddata.diameterbins(diameterbin).piece(nextpiece).proximalyposition      = inddata.diameterbins(diameterbin-1).piece(end).distalyposition;
                            inddata.diameterbins(diameterbin).piece(nextpiece).proximalzposition      = inddata.diameterbins(diameterbin-1).piece(end).distalzposition;
                            [xdirection, ydirection, zdirection]                                                 = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                            inddata.diameterbins(diameterbin).piece(nextpiece).distalxposition        = piecedata(j).proximalxposition + xdirection * inddata.diameterbins(diameterbin).piece(nextpiece).length;
                            inddata.diameterbins(diameterbin).piece(nextpiece).distalyposition        = piecedata(j).proximalyposition + ydirection * inddata.diameterbins(diameterbin).piece(nextpiece).length;
                            inddata.diameterbins(diameterbin).piece(nextpiece).distalzposition        = piecedata(j).proximalzposition + zdirection * inddata.diameterbins(diameterbin).piece(nextpiece).length;
                            inddata.diameterbins(diameterbin).piece(nextpiece).proximalpathlength     = inddata.diameterbins(diameterbin-1).piece(end).distalpathlength;
                            inddata.diameterbins(diameterbin).piece(nextpiece).distalpathlength       = inddata.diameterbins(diameterbin).piece(nextpiece).proximalpathlength + inddata.diameterbins(diameterbin).piece(nextpiece).length;
                            inddata.diameterbins(diameterbin).piece(nextpiece).proximalradialdistance = ( (inddata.diameterbins(diameterbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                + (inddata.diameterbins(diameterbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                + (inddata.diameterbins(diameterbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                            inddata.diameterbins(diameterbin).piece(nextpiece).distalradialdistance = ( (inddata.diameterbins(diameterbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                + (inddata.diameterbins(diameterbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                + (inddata.diameterbins(diameterbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                            
                            
                            %                     disp(sprintf('  Partial piece ID %.0f falling into a middle bin.',j));
                            %                     disp(sprintf('    Which has edges %.2f:%.2f',inddata.diameterbinedges(diameterbin),inddata.diameterbinedges(diameterbin+1)));
                            %                     disp(sprintf('      Partial Length   : %.2f',inddata.diameterbins(diameterbin).piece(nextpiece).length));
                            %                     disp(sprintf('      Partial Prox Diam: %.2f',inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter));
                            %                     disp(sprintf('      Partial Dist Diam: %.2f',inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter));
                            
                        elseif diameterbin == currentdistaldiameterbin
                            % If the piece falls in the distal diameter bin
                            
                            inddata.diameterbins(diameterbin).piece(nextpiece).proximaltype         = [];
                            inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = inddata.diameterbinedges(diameterbin);
                            inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter       = piecedata(j).distaldiameter;
                            if inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter < inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                                disp('Error.  Distal diameter is less than proximal diameter.');
                                keyboard;
                            end
                            %inddata.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/piecedata(j).taperrate;
                            inddata.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/(inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*piecedata(j).taperrate);

                            if inddata.diameterbins(diameterbin).piece(nextpiece).length > 1.01 * piecedata(j).length || inddata.diameterbins(diameterbin).piece(nextpiece).length < 0
                                disp('Error.  Partial piece length is greater than piece length.');
                                disp(sprintf('Partial Length: %f',inddata.diameterbins(diameterbin).piece(nextpiece).length));
                                disp(sprintf('Total Length:   %f',piecedata(j).length));
                                keyboard;
                            end
                            inddata.diameterbins(diameterbin).piece(nextpiece).surfacearea          = pi*((inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+inddata.diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                            inddata.diameterbins(diameterbin).piece(nextpiece).volume               = (pi/12)*inddata.diameterbins(diameterbin).piece(nextpiece).length*(inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter+inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);
                            
                            inddata.diameterbins(diameterbin).piece(nextpiece).proximalxposition      = inddata.diameterbins(diameterbin-1).piece(end).distalxposition;
                            inddata.diameterbins(diameterbin).piece(nextpiece).proximalyposition      = inddata.diameterbins(diameterbin-1).piece(end).distalyposition;
                            inddata.diameterbins(diameterbin).piece(nextpiece).proximalzposition      = inddata.diameterbins(diameterbin-1).piece(end).distalzposition;
                            inddata.diameterbins(diameterbin).piece(nextpiece).proximalpathlength     = inddata.diameterbins(diameterbin-1).piece(end).distalpathlength;
                            inddata.diameterbins(diameterbin).piece(nextpiece).proximalradialdistance = ( (inddata.diameterbins(diameterbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                + (inddata.diameterbins(diameterbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                + (inddata.diameterbins(diameterbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                            
                            %                     disp(sprintf('  Partial piece ID %.0f falling into the distal bin.',j));
                            %                     disp(sprintf('    Which has edges %.2f:%.2f',inddata.diameterbinedges(diameterbin),inddata.diameterbinedges(diameterbin+1)));
                            %                     disp(sprintf('      Partial Length   : %.2f',inddata.diameterbins(diameterbin).piece(nextpiece).length));
                            %                     disp(sprintf('      Partial Prox Diam: %.2f',inddata.diameterbins(diameterbin).piece(nextpiece).proximaldiameter));
                            %                     disp(sprintf('      Partial Dist Diam: %.2f',inddata.diameterbins(diameterbin).piece(nextpiece).distaldiameter));
                            
                        else disp('Error: see ''piecebinner.m''.');
                        end
                    end
                end % end of diameter binning
                
                
                
                % Put the piece into the appropriate path length bin
                for pathlengthbin = currentproximalpathlengthbin:currentdistalpathlengthbin
                    % Repeat for as many partial pieces as there will end up being
                    
                    if     isfield(inddata,'pathlengthbins')==0; nextpiece = 1;
                    elseif pathlengthbin > length(inddata.pathlengthbins); nextpiece = 1;
                    elseif isfield(inddata.pathlengthbins(pathlengthbin),'piece')==0; nextpiece = 1;
                    else nextpiece = 1 + length(inddata.pathlengthbins(pathlengthbin).piece);
                    end
                    
                    temppiece = setfield(piecedata(j),'partial','n');
                    inddata.pathlengthbins(pathlengthbin).piece(nextpiece) = temppiece;
                    clear temppiece;
                    
                    if currentdistalpathlengthbin ~= currentproximalpathlengthbin
                        % If the piece lies in two or more path length bins, split the piece and bin the current partial piece
                        
                        inddata.pathlengthbins(pathlengthbin).piece(nextpiece).partial = 'y';
                        
                        if pathlengthbin == currentproximalpathlengthbin
                            % If the current partial piece falls in the proximal path length bin
                            
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).distaltype           = [];
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).rallratio            = [];
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).rallratio1           = [];
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).rallratio2           = [];
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).rallratio3           = [];
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).daughterratio        = [];
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).parentdaughterratio  = [];
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).parentdaughter2ratio = [];
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).length               = (pathlengthbin*binsettings.distancebinwidth) - piecedata(j).proximalpathlength;
                            %inddata.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter       = piecedata(j).proximaldiameter - (piecedata(j).taperrate * inddata.pathlengthbins(pathlengthbin).piece(nextpiece).length);
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter       = piecedata(j).proximaldiameter - ((  (piecedata(j).proximaldiameter - piecedata(j).distaldiameter)/piecedata(j).length  ) * inddata.pathlengthbins(pathlengthbin).piece(nextpiece).length);
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea          = pi*((inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).volume               = (pi/12)*inddata.pathlengthbins(pathlengthbin).piece(nextpiece).length*(inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*inddata.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+inddata.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);
                            
                            [xdirection, ydirection, zdirection]                                               = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition      = piecedata(j).proximalxposition + xdirection * inddata.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition      = piecedata(j).proximalyposition + ydirection * inddata.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition      = piecedata(j).proximalzposition + zdirection * inddata.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).distalpathlength     = inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength + inddata.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).distalradialdistance = ( (inddata.pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                + (inddata.pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                + (inddata.pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                            
                            
                        elseif pathlengthbin > currentproximalpathlengthbin && pathlengthbin < currentdistalpathlengthbin
                            % If the current partial piece falls between the proximal and distal path length bins
                            
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximaltype         = [];
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).distaltype           = [];
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).rallratio            = [];
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).rallratio1           = [];
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).rallratio2           = [];
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).rallratio3           = [];
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).daughterratio        = [];
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).parentdaughterratio  = [];
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).parentdaughter2ratio = [];
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).length               = binsettings.distancebinwidth;
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter     = inddata.pathlengthbins(pathlengthbin-1).piece(length(inddata.pathlengthbins(pathlengthbin-1).piece)).distaldiameter;
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter       = inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter - ((  (piecedata(j).proximaldiameter - piecedata(j).distaldiameter)/piecedata(j).length  ) * binsettings.distancebinwidth);
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea          = pi*((inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).volume               = (pi/12)*inddata.pathlengthbins(pathlengthbin).piece(nextpiece).length*(inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*inddata.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+inddata.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);
                            
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition      = inddata.pathlengthbins(pathlengthbin-1).piece(end).distalxposition;
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition      = inddata.pathlengthbins(pathlengthbin-1).piece(end).distalyposition;
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition      = inddata.pathlengthbins(pathlengthbin-1).piece(end).distalzposition;
                            [xdirection, ydirection, zdirection]                                                     = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition        = piecedata(j).proximalxposition + xdirection * inddata.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition        = piecedata(j).proximalxposition + ydirection * inddata.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition        = piecedata(j).proximalxposition + zdirection * inddata.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength     = inddata.pathlengthbins(pathlengthbin-1).piece(end).distalpathlength;
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).distalpathlength       = inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength + inddata.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximalradialdistance = ( (inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                + (inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                + (inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).distalradialdistance = ( (inddata.pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                + (inddata.pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                + (inddata.pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                            
                            
                        elseif pathlengthbin == currentdistalpathlengthbin
                            % If the current partial piece falls in the distal path length bin
                            
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximaltype     = [];
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).length           = piecedata(j).distalpathlength - ((pathlengthbin-1)*binsettings.distancebinwidth);
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter = inddata.pathlengthbins(pathlengthbin-1).piece(length(inddata.pathlengthbins(pathlengthbin-1).piece)).distaldiameter;
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea      = pi*((inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).volume           = (pi/12)*inddata.pathlengthbins(pathlengthbin).piece(nextpiece).length*(inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*inddata.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+inddata.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);
                            
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition      = inddata.pathlengthbins(pathlengthbin-1).piece(end).distalxposition;
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition      = inddata.pathlengthbins(pathlengthbin-1).piece(end).distalyposition;
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition      = inddata.pathlengthbins(pathlengthbin-1).piece(end).distalzposition;
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength     = inddata.pathlengthbins(pathlengthbin-1).piece(end).distalpathlength;
                            inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximalradialdistance = ( (inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                + (inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                + (inddata.pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                            
                            
                        end
                    end
                end % end of pathlength binning
                
                
                
                
                % Put the piece into the appropriate radial distance bin
                if currentdistalradialdistancebin < currentproximalradialdistancebin
                    radialdistancestep = -1;
                else
                    radialdistancestep = 1;
                end
                
                for radialdistancebin = currentproximalradialdistancebin:radialdistancestep:currentdistalradialdistancebin
                    % Repeat for as many partial pieces as there will end up being
                    
                    if isfield(inddata,'radialdistancebins')==0; nextpiece = 1;
                    elseif radialdistancebin > length(inddata.radialdistancebins); nextpiece = 1;
                    elseif isfield(inddata.radialdistancebins(radialdistancebin),'piece')==0; nextpiece = 1;
                    else nextpiece = 1 + length(inddata.radialdistancebins(radialdistancebin).piece);
                    end
                    
                    temppiece = setfield(piecedata(j),'partial','n');
                    inddata.radialdistancebins(radialdistancebin).piece(nextpiece) = temppiece;
                    clear temppiece;
                    
                    if currentdistalradialdistancebin > currentproximalradialdistancebin
                        inddata.radialdistancebins(radialdistancebin).piece(nextpiece).partial = 'y';
                        if radialdistancebin == currentproximalradialdistancebin
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distaltype           = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio            = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio1           = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio2           = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio3           = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).daughterratio        = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).parentdaughterratio  = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).parentdaughter2ratio = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length               = ((radialdistancebin*binsettings.distancebinwidth-piecedata(j).proximalradialdistance)/(piecedata(j).distalradialdistance-piecedata(j).proximalradialdistance))*piecedata(j).length;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter       = piecedata(j).proximaldiameter - ((  (piecedata(j).proximaldiameter - piecedata(j).distaldiameter)/piecedata(j).length  ) * inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length);
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea          = pi*((inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).volume               = (pi/12)*inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length*(inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);
                            
                            [xdirection, ydirection, zdirection]                                                           = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition      = piecedata(j).proximalxposition + xdirection * inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition      = piecedata(j).proximalyposition + ydirection * inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition      = piecedata(j).proximalzposition + zdirection * inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalpathlength     = inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength + inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalradialdistance = ( (inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                + (inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                + (inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                            
                            
                        elseif radialdistancebin > currentproximalradialdistancebin && radialdistancebin < currentdistalradialdistancebin
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaltype         = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distaltype           = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio            = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio1           = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio2           = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio3           = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).daughterratio        = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).parentdaughterratio  = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).parentdaughter2ratio = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length               = (binsettings.distancebinwidth/(piecedata(j).distalradialdistance-piecedata(j).proximalradialdistance))*piecedata(j).length;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter     = inddata.radialdistancebins(radialdistancebin-1).piece(length(inddata.radialdistancebins(radialdistancebin-1).piece)).distaldiameter;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter       = inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter - ((  (piecedata(j).proximaldiameter - piecedata(j).distaldiameter)/piecedata(j).length  ) * inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length);
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea          = pi*((inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).volume               = (pi/12)*inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length*(inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);
                            
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition      = inddata.radialdistancebins(radialdistancebin-1).piece(end).distalxposition;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition      = inddata.radialdistancebins(radialdistancebin-1).piece(end).distalyposition;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition      = inddata.radialdistancebins(radialdistancebin-1).piece(end).distalzposition;
                            [xdirection, ydirection, zdirection]                                                     = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition        = piecedata(j).proximalxposition + xdirection * inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition        = piecedata(j).proximalxposition + ydirection * inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition        = piecedata(j).proximalxposition + zdirection * inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength     = inddata.radialdistancebins(radialdistancebin-1).piece(end).distalpathlength;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalpathlength       = inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength + inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalradialdistance = ( (inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                + (inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                + (inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalradialdistance = ( (inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                + (inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                + (inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                            
                            
                        elseif radialdistancebin == currentdistalradialdistancebin
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaltype     = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length           = ((piecedata(j).distalradialdistance-((radialdistancebin-1)*binsettings.distancebinwidth))/(piecedata(j).distalradialdistance-piecedata(j).proximalradialdistance))*piecedata(j).length;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter = inddata.radialdistancebins(radialdistancebin-1).piece(length(inddata.radialdistancebins(radialdistancebin-1).piece)).distaldiameter;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea      = pi*((inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).volume           = (pi/12)*inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length*(inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);
                            
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition      = inddata.radialdistancebins(radialdistancebin-1).piece(end).distalxposition;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition      = inddata.radialdistancebins(radialdistancebin-1).piece(end).distalyposition;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition      = inddata.radialdistancebins(radialdistancebin-1).piece(end).distalzposition;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength     = inddata.radialdistancebins(radialdistancebin-1).piece(end).distalpathlength;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalradialdistance = ( (inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                + (inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                + (inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                            
                            
                        end
                        
                    elseif currentdistalradialdistancebin < currentproximalradialdistancebin
                        inddata.radialdistancebins(radialdistancebin).piece(nextpiece).partial = 'y';
                        if radialdistancebin == currentproximalradialdistancebin
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distaltype           = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio            = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio1           = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio2           = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio3           = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).daughterratio        = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).parentdaughterratio  = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).parentdaughter2ratio = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length               = ((piecedata(j).proximalradialdistance-((radialdistancebin-1)*binsettings.distancebinwidth))/(piecedata(j).proximalradialdistance-piecedata(j).distalradialdistance))*piecedata(j).length;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter       = piecedata(j).proximaldiameter - ((  (piecedata(j).proximaldiameter - piecedata(j).distaldiameter)/piecedata(j).length  ) * inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length);
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea          = pi*((inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).volume               = (pi/12)*inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length*(inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);
                            
                            [xdirection, ydirection, zdirection]                                                           = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition      = piecedata(j).proximalxposition + xdirection * inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition      = piecedata(j).proximalyposition + ydirection * inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition      = piecedata(j).proximalzposition + zdirection * inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalpathlength     = inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength + inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalradialdistance = ( (inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                + (inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                + (inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                            
                            
                            %                     disp(' ');
                            %                     disp('Distal radial distance bin is smaller than proximal radialdistance bin.');
                            %                     disp(sprintf('  Piece ID: %.0f',j));
                            %                     disp(sprintf('    Length   : %.2f',piecedata(j).length));
                            %                     disp(sprintf('    Prox RD: %.2f',piecedata(j).proximalradialdistance));
                            %                     disp(sprintf('    Dist RD: %.2f',piecedata(j).distalradialdistance));
                            %
                            %                     disp(sprintf('  Partial piece ID %.0f falling into the proximal bin.',j));
                            %                     disp(sprintf('    Which has edges %.2f:%.2f',(radialdistancebin*binsettings.distancebinwidth)-binsettings.distancebinwidth,radialdistancebin*binsettings.distancebinwidth));
                            %                     disp(sprintf('      Partial Length : %.2f',inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length));
                            %                     disp(sprintf('      Partial Prox RD: %.2f',inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalradialdistance));
                            %                     disp(sprintf('      Partial Dist RD: %.2f',inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalradialdistance));
                            
                        elseif radialdistancebin < currentproximalradialdistancebin && radialdistancebin > currentdistalradialdistancebin
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaltype         = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distaltype           = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio            = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio1           = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio2           = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio3           = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).daughterratio        = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).parentdaughterratio  = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).parentdaughter2ratio = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length               = (binsettings.distancebinwidth/(piecedata(j).proximalradialdistance-piecedata(j).distalradialdistance))*piecedata(j).length;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter     = inddata.radialdistancebins(radialdistancebin+1).piece(length(inddata.radialdistancebins(radialdistancebin+1).piece)).distaldiameter;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter       = inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter - ((  (piecedata(j).proximaldiameter - piecedata(j).distaldiameter)/piecedata(j).length  ) * inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length);
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea          = pi*((inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).volume               = (pi/12)*inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length*(inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);
                            
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition      = inddata.radialdistancebins(radialdistancebin+1).piece(end).distalxposition;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition      = inddata.radialdistancebins(radialdistancebin+1).piece(end).distalyposition;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition      = inddata.radialdistancebins(radialdistancebin+1).piece(end).distalzposition;
                            [xdirection, ydirection, zdirection]                                                             = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition        = piecedata(j).proximalxposition + xdirection * inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition        = piecedata(j).proximalxposition + ydirection * inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition        = piecedata(j).proximalxposition + zdirection * inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength     = inddata.radialdistancebins(radialdistancebin+1).piece(end).distalpathlength;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalpathlength       = inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength + inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalradialdistance = ( (inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                + (inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                + (inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalradialdistance = ( (inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                + (inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                + (inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                            
                            
                            %                     disp(sprintf('  Partial piece ID %.0f falling into a middle bin.',j));
                            %                     disp(sprintf('    Which has edges %.2f:%.2f',(radialdistancebin*binsettings.distancebinwidth)-binsettings.distancebinwidth,radialdistancebin*binsettings.distancebinwidth));
                            %                     disp(sprintf('      Partial Length : %.2f',inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length));
                            %                     disp(sprintf('      Partial Prox RD: %.2f',inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalradialdistance));
                            %                     disp(sprintf('      Partial Dist RD: %.2f',inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalradialdistance));
                            
                        elseif radialdistancebin == currentdistalradialdistancebin
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaltype     = [];
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length           = (((radialdistancebin*binsettings.distancebinwidth)-piecedata(j).distalradialdistance)/(piecedata(j).proximalradialdistance-piecedata(j).distalradialdistance))*piecedata(j).length;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter = inddata.radialdistancebins(radialdistancebin+1).piece(length(inddata.radialdistancebins(radialdistancebin+1).piece)).distaldiameter;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea      = pi*((inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).volume           = (pi/12)*inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length*(inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);
                            
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition      = inddata.radialdistancebins(radialdistancebin+1).piece(end).distalxposition;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition      = inddata.radialdistancebins(radialdistancebin+1).piece(end).distalyposition;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition      = inddata.radialdistancebins(radialdistancebin+1).piece(end).distalzposition;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength     = inddata.radialdistancebins(radialdistancebin+1).piece(end).distalpathlength;
                            inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalradialdistance = ( (inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                + (inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                + (inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                            
                            
                            %                     disp(sprintf('  Partial piece ID %.0f falling into distal bin.',j));
                            %                     disp(sprintf('    Which has edges %.2f:%.2f',(radialdistancebin*binsettings.distancebinwidth)-binsettings.distancebinwidth,radialdistancebin*binsettings.distancebinwidth));
                            %                     disp(sprintf('      Partial Length : %.2f',inddata.radialdistancebins(radialdistancebin).piece(nextpiece).length));
                            %                     disp(sprintf('      Partial Prox RD: %.2f',inddata.radialdistancebins(radialdistancebin).piece(nextpiece).proximalradialdistance));
                            %                     disp(sprintf('      Partial Dist RD: %.2f',inddata.radialdistancebins(radialdistancebin).piece(nextpiece).distalradialdistance));
                            
                            
                        end
                    end
                end
                
                
                
                
                
                % Put the piece into the appropriate branch length bin
                for branchlengthbin = currentproximalbranchlengthbin:currentdistalbranchlengthbin
                    % Repeat for as many partial pieces as there will end up being
                    
                    if     isfield(inddata,'branchlengthbins')==0; nextpiece = 1;
                    elseif branchlengthbin > length(inddata.branchlengthbins); nextpiece = 1;
                    elseif isfield(inddata.branchlengthbins(branchlengthbin),'piece')==0; nextpiece = 1;
                    else nextpiece = 1 + length(inddata.branchlengthbins(branchlengthbin).piece);
                    end
                    
                    temppiece = setfield(piecedata(j),'partial','n');
                    inddata.branchlengthbins(branchlengthbin).piece(nextpiece) = temppiece;
                    clear temppiece;
                    
                    if currentdistalbranchlengthbin ~= currentproximalbranchlengthbin
                        % If the piece lies in two or more branch length bins, split the piece and bin the current partial piece
                        
                        inddata.branchlengthbins(branchlengthbin).piece(nextpiece).partial = 'y';
                        
                        if branchlengthbin == currentproximalbranchlengthbin
                            % If the current partial piece falls in the proximal branch length bin
                            
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).distaltype           = [];
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).rallratio            = [];
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).rallratio1           = [];
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).rallratio2           = [];
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).rallratio3           = [];
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).daughterratio        = [];
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).parentdaughterratio  = [];
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).parentdaughter2ratio = [];
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).length               = (branchlengthbin*binsettings.branchlengthbinwidth) - piecedata(j).proximalbranchlength;
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter       = piecedata(j).proximaldiameter - ((  (piecedata(j).proximaldiameter - piecedata(j).distaldiameter)/piecedata(j).length  ) * inddata.branchlengthbins(branchlengthbin).piece(nextpiece).length);
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea          = pi*((inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.branchlengthbins(branchlengthbin).piece(nextpiece).length^2)^0.5);
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).volume               = (pi/12)*inddata.branchlengthbins(branchlengthbin).piece(nextpiece).length*(inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter^2+inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter*inddata.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter+inddata.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter^2);
                            
                            [xdirection, ydirection, zdirection]                                               = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition      = piecedata(j).proximalxposition + xdirection * inddata.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition      = piecedata(j).proximalyposition + ydirection * inddata.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition      = piecedata(j).proximalzposition + zdirection * inddata.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).distalbranchlength     = inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength + inddata.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).distalradialdistance = ( (inddata.branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                + (inddata.branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                + (inddata.branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                            
                            
                        elseif branchlengthbin > currentproximalbranchlengthbin && branchlengthbin < currentdistalbranchlengthbin
                            % If the current partial piece falls between the proximal and distal branch length bins
                            
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximaltype         = [];
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).distaltype           = [];
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).rallratio            = [];
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).rallratio1           = [];
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).rallratio2           = [];
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).rallratio3           = [];
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).daughterratio        = [];
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).parentdaughterratio  = [];
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).parentdaughter2ratio = [];
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).length               = binsettings.branchlengthbinwidth;
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter     = inddata.branchlengthbins(branchlengthbin-1).piece(length(inddata.branchlengthbins(branchlengthbin-1).piece)).distaldiameter;
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter       = inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter - ((  (piecedata(j).proximaldiameter - piecedata(j).distaldiameter)/piecedata(j).length  ) * binsettings.branchlengthbinwidth);
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea          = pi*((inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.branchlengthbins(branchlengthbin).piece(nextpiece).length^2)^0.5);
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).volume               = (pi/12)*inddata.branchlengthbins(branchlengthbin).piece(nextpiece).length*(inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter^2+inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter*inddata.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter+inddata.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter^2);
                            
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition      = inddata.branchlengthbins(branchlengthbin-1).piece(end).distalxposition;
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition      = inddata.branchlengthbins(branchlengthbin-1).piece(end).distalyposition;
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition      = inddata.branchlengthbins(branchlengthbin-1).piece(end).distalzposition;
                            [xdirection, ydirection, zdirection]                                                     = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition        = piecedata(j).proximalxposition + xdirection * inddata.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition        = piecedata(j).proximalxposition + ydirection * inddata.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition        = piecedata(j).proximalxposition + zdirection * inddata.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength     = inddata.branchlengthbins(branchlengthbin-1).piece(end).distalbranchlength;
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).distalbranchlength       = inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength + inddata.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximalradialdistance = ( (inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                + (inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                + (inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).distalradialdistance = ( (inddata.branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                + (inddata.branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                + (inddata.branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                            
                            
                        elseif branchlengthbin == currentdistalbranchlengthbin
                            % If the current partial piece falls in the distal branch length bin
                            
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximaltype     = [];
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).length           = piecedata(j).distalbranchlength - ((branchlengthbin-1)*binsettings.branchlengthbinwidth);
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter = inddata.branchlengthbins(branchlengthbin-1).piece(length(inddata.branchlengthbins(branchlengthbin-1).piece)).distaldiameter;
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea      = pi*((inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.branchlengthbins(branchlengthbin).piece(nextpiece).length^2)^0.5);
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).volume           = (pi/12)*inddata.branchlengthbins(branchlengthbin).piece(nextpiece).length*(inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter^2+inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter*inddata.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter+inddata.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter^2);
                            
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition      = inddata.branchlengthbins(branchlengthbin-1).piece(end).distalxposition;
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition      = inddata.branchlengthbins(branchlengthbin-1).piece(end).distalyposition;
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition      = inddata.branchlengthbins(branchlengthbin-1).piece(end).distalzposition;
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength     = inddata.branchlengthbins(branchlengthbin-1).piece(end).distalbranchlength;
                            inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximalradialdistance = ( (inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                + (inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                + (inddata.branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                            
                            
                        end
                        
                        if inddata.branchlengthbins(branchlengthbin).piece(nextpiece).length < 0 || ...
                                inddata.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter < 0 || ...
                                inddata.branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea < 0 || ...
                                inddata.branchlengthbins(branchlengthbin).piece(nextpiece).volume < 0
                            disp('Error in piecebinner (876)');
                            %keyboard;
                        end
                    end
                end % end of branch length binning
                
                
                
                
                
                % Start of bifurcation piece binning
                
                if strcmp(piecedata(j).branchtype,'b') == 1
                    
                    % Put the piece into the population bifurcation piece section
                    %if isfield(popdata,'bifurcation')==0; nextpiece = 1;
                    %elseif isfield(popdata.bifurcation,'piece')==0; nextpiece = 1;
                    %else nextpiece = 1 + length(popdata.bifurcation.piece);
                    %end;
                    %popdata.bifurcation.piece(nextpiece) = orderfields(piecedata(j));
                    
                    % Put the piece into the analysis population bifurcation piece section
                    if exist('popanalysis','var')~=1; nextpiece = 1;
                    elseif isfield(popanalysis,'bifurcation')==0; nextpiece = 1;
                    elseif isfield(popanalysis.bifurcation,'piece')==0; nextpiece = 1;
                    else nextpiece = 1 + length(popanalysis.bifurcation.piece);
                    end;
                    popanalysis.bifurcation.piece(nextpiece) = orderfields(piecedata(j));
                    
                    % Put the piece into the appropriate diameter bin
                    for diameterbin = currentproximaldiameterbin:diameterstep:currentdistaldiameterbin
                        % Repeat for as many partial pieces as there will end up being
                        
                        if     isfield(inddata.bifurcation,'diameterbins')==0; nextpiece = 1;
                        elseif isfield(inddata.bifurcation.diameterbins(diameterbin),'piece')==0; nextpiece = 1;
                        else nextpiece = 1 + length(inddata.bifurcation.diameterbins(diameterbin).piece);
                        end;
                        
                        temppiece = setfield(piecedata(j),'partial','n');
                        inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece) = temppiece;
                        clear temppiece;
                        
                        % If the piece lies in two or more diameter bins, split the piece and bin the current partial piece
                        
                        if currentdistaldiameterbin < currentproximaldiameterbin
                            % If the distal diameter is less than the proximal diameter
                            
                            %disp('Distal diameter is less than proximal diameter.');
                            inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).partial = 'y';
                            
                            if diameterbin == currentproximaldiameterbin
                                % If this partial piece is in the proximal diameter bin
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaltype           = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).rallratio            = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).rallratio1           = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).rallratio2           = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).rallratio3           = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).daughterratio        = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).parentdaughterratio  = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).parentdaughter2ratio = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = piecedata(j).proximaldiameter;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter       = inddata.diameterbinedges(diameterbin);
                                if inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter > inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                                    disp('Error.  Distal diameter is greater than proximal diameter.');
                                    keyboard;
                                end
                                %inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/piecedata(j).taperrate;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/(inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*piecedata(j).taperrate);

                                if inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length > 1.01 * piecedata(j).length || inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length < 0
                                    disp('Error.  Partial piece length is greater than piece length.');
                                    disp(sprintf('Length: %f',inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length));
                                    keyboard;
                                end
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).surfacearea          = pi*((inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).volume               = (pi/12)*inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length*(inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter+inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);
                                
                                [xdirection, ydirection, zdirection]                                               = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distalxposition      = piecedata(j).proximalxposition + xdirection * inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distalyposition      = piecedata(j).proximalyposition + ydirection * inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distalzposition      = piecedata(j).proximalzposition + zdirection * inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distalpathlength     = inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalpathlength + inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distalradialdistance = ( (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                                
                            elseif diameterbin < currentproximaldiameterbin && diameterbin > currentdistaldiameterbin
                                % If this partial piece falls between the proximal and distal diameter bins
                                
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaltype         = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaltype           = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).rallratio            = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).rallratio1           = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).rallratio2           = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).rallratio3           = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).daughterratio        = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).parentdaughterratio  = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).parentdaughter2ratio = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = inddata.diameterbinedges(diameterbin+1);
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter       = inddata.diameterbinedges(diameterbin);
                                if inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter > inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                                    disp('Error.  Distal diameter is greater than proximal diameter.');
                                    keyboard;
                                end
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/piecedata(j).taperrate;
                                if inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length > 1.01 * piecedata(j).length || inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length < 0
                                    disp('Error.  Partial piece length is greater than piece length.');
                                    disp(sprintf('Length: %f',inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length));
                                    keyboard;
                                end
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).surfacearea            = pi*((inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).volume                 = (pi/12)*inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length*(inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter+inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);
                                
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalxposition      = inddata.bifurcation.diameterbins(diameterbin+1).piece(end).distalxposition;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalyposition      = inddata.bifurcation.diameterbins(diameterbin+1).piece(end).distalyposition;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalzposition      = inddata.bifurcation.diameterbins(diameterbin+1).piece(end).distalzposition;
                                [xdirection, ydirection, zdirection]                                                 = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distalxposition        = piecedata(j).proximalxposition + xdirection * inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distalyposition        = piecedata(j).proximalxposition + ydirection * inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distalzposition        = piecedata(j).proximalxposition + zdirection * inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalpathlength     = inddata.bifurcation.diameterbins(diameterbin+1).piece(end).distalpathlength;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distalpathlength       = inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalpathlength + inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalradialdistance = ( (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distalradialdistance = ( (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                            elseif diameterbin == currentdistaldiameterbin
                                % If this partial piece falls in the distal diameter bin
                                
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaltype         = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = inddata.diameterbinedges(diameterbin+1);
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter       = piecedata(j).distaldiameter;
                                if inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter > inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                                    disp('Error.  Distal diameter is greater than proximal diameter.');
                                    keyboard;
                                end
                                %inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/piecedata(j).taperrate;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/(inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*piecedata(j).taperrate);

                                if inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length > 1.01 * piecedata(j).length || inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length < 0
                                    disp('Error.  Partial piece length is greater than piece length.');
                                    disp(sprintf('Length: %f',inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length));
                                    keyboard;
                                end
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).surfacearea          = pi*((inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).volume               = (pi/12)*inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length*(inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter+inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);
                                
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalxposition      = inddata.bifurcation.diameterbins(diameterbin+1).piece(end).distalxposition;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalyposition      = inddata.bifurcation.diameterbins(diameterbin+1).piece(end).distalyposition;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalzposition      = inddata.bifurcation.diameterbins(diameterbin+1).piece(end).distalzposition;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalpathlength     = inddata.bifurcation.diameterbins(diameterbin+1).piece(end).distalpathlength;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalradialdistance = ( (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                            else disp('Error.  See piecebinner.m line 249.');
                            end
                            
                        elseif currentdistaldiameterbin > currentproximaldiameterbin
                            % If the distal diameter is greater than the proximal diameter
                            
                            %disp('Distal diameter is greater than proximal diameter.');
                            inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).partial = 'y';
                            
                            if diameterbin == currentproximaldiameterbin
                                % If this partial piece is in the proximal diameter bin
                                
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaltype           = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).rallratio            = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).rallratio1           = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).rallratio2           = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).rallratio3           = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).daughterratio        = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).parentdaughterratio  = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).parentdaughter2ratio = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = piecedata(j).proximaldiameter;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter       = inddata.diameterbinedges(diameterbin+1);
                                if inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter < inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                                    disp('Error.  Distal diameter is less than proximal diameter.');
                                    keyboard;
                                end
                                %inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/piecedata(j).taperrate;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/(inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*piecedata(j).taperrate);

                                if inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length > 1.01 * piecedata(j).length || inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length < 0
                                    disp('Error.  Partial piece length is greater than piece length.');
                                    disp(sprintf('Length: %f',inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length));
                                    keyboard;
                                end
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).surfacearea          = pi*((inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).volume               = (pi/12)*inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length*(inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter+inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);
                                
                                [xdirection, ydirection, zdirection]                                               = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distalxposition      = piecedata(j).proximalxposition + xdirection * inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distalyposition      = piecedata(j).proximalyposition + ydirection * inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distalzposition      = piecedata(j).proximalzposition + zdirection * inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distalpathlength     = inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalpathlength + inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distalradialdistance = ( (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                            elseif diameterbin > currentproximaldiameterbin && diameterbin < currentdistaldiameterbin
                                % If this partial piece falls between the proximal and distal diameter bins
                                
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaltype         = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaltype           = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).rallratio            = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).rallratio1           = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).rallratio2           = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).rallratio3           = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).daughterratio        = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).parentdaughterratio  = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).parentdaughter2ratio = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = inddata.diameterbinedges(diameterbin);
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter       = inddata.diameterbinedges(diameterbin+1);
                                if inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter < inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                                    disp('Error.  Distal diameter is less than proximal diameter.');
                                    keyboard;
                                end
                                %inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/piecedata(j).taperrate;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/(inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*piecedata(j).taperrate);

                                if inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length > 1.01 * piecedata(j).length || inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length < 0
                                    disp('Error.  Partial piece length is greater than piece length.');
                                    disp(sprintf('Length: %f',inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length));
                                    keyboard;
                                end
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).surfacearea          = pi*((inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).volume               = (pi/12)*inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length*(inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter+inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);
                                
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalxposition      = inddata.bifurcation.diameterbins(diameterbin-1).piece(end).distalxposition;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalyposition      = inddata.bifurcation.diameterbins(diameterbin-1).piece(end).distalyposition;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalzposition      = inddata.bifurcation.diameterbins(diameterbin-1).piece(end).distalzposition;
                                [xdirection, ydirection, zdirection]                                                 = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distalxposition        = piecedata(j).proximalxposition + xdirection * inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distalyposition        = piecedata(j).proximalyposition + ydirection * inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distalzposition        = piecedata(j).proximalzposition + zdirection * inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalpathlength     = inddata.bifurcation.diameterbins(diameterbin-1).piece(end).distalpathlength;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distalpathlength       = inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalpathlength + inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalradialdistance = ( (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distalradialdistance = ( (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                                
                            elseif diameterbin == currentdistaldiameterbin
                                % If the piece falls in the distal diameter bin
                                
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaltype         = [];
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = inddata.diameterbinedges(diameterbin);
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter       = piecedata(j).distaldiameter;
                                if inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter < inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                                    disp('Error.  Distal diameter is less than proximal diameter.');
                                    keyboard;
                                end
                                %inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/piecedata(j).taperrate;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/(inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*piecedata(j).taperrate);

                                if inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length > 101 * piecedata(j).length || inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length < 0
                                    disp('Error.  Partial piece length is greater than piece length.');
                                    disp(sprintf('Length: %f',inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length));
                                    keyboard;
                                end
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).surfacearea          = pi*((inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).volume               = (pi/12)*inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).length*(inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter+inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);
                                
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalxposition      = inddata.bifurcation.diameterbins(diameterbin-1).piece(end).distalxposition;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalyposition      = inddata.bifurcation.diameterbins(diameterbin-1).piece(end).distalyposition;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalzposition      = inddata.bifurcation.diameterbins(diameterbin-1).piece(end).distalzposition;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalpathlength     = inddata.bifurcation.diameterbins(diameterbin-1).piece(end).distalpathlength;
                                inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalradialdistance = ( (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                            else disp('Error: see piecebinner.m line 364.');
                            end
                        end
                    end
                    
                    % Put the piece into the appropriate path length bin
                    
                    for pathlengthbin = currentproximalpathlengthbin:currentdistalpathlengthbin
                        % Repeat for as many partial pieces as there will end up being
                        
                        if     isfield(inddata.bifurcation,'pathlengthbins')==0; nextpiece = 1;
                        elseif pathlengthbin > length(inddata.bifurcation.pathlengthbins); nextpiece = 1;
                        elseif isfield(inddata.bifurcation.pathlengthbins(pathlengthbin),'piece')==0; nextpiece = 1;
                        else nextpiece = 1 + length(inddata.bifurcation.pathlengthbins(pathlengthbin).piece);
                        end
                        
                        temppiece = setfield(piecedata(j),'partial','n');
                        inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece) = temppiece;
                        clear temppiece;
                        
                        if currentdistalpathlengthbin ~= currentproximalpathlengthbin
                            % If the piece lies in two or more path length bins, split the piece and bin the current partial piece
                            
                            inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).partial = 'y';
                            
                            if pathlengthbin == currentproximalpathlengthbin
                                % If the current partial piece falls in the proximal path length bin
                                
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distaltype           = [];
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).rallratio            = [];
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).rallratio1           = [];
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).rallratio2           = [];
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).rallratio3           = [];
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).daughterratio        = [];
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).parentdaughterratio  = [];
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).parentdaughter2ratio = [];
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length               = (pathlengthbin*binsettings.distancebinwidth) - piecedata(j).proximalpathlength;
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter       = piecedata(j).proximaldiameter - ((  (piecedata(j).proximaldiameter - piecedata(j).distaldiameter)/piecedata(j).length  ) * inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length);
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea          = pi*((inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).volume               = (pi/12)*inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length*(inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);
                                
                                [xdirection, ydirection, zdirection]                                               = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition      = piecedata(j).proximalxposition + xdirection * inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition      = piecedata(j).proximalyposition + ydirection * inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition      = piecedata(j).proximalzposition + zdirection * inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distalpathlength     = inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength + inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distalradialdistance = ( (inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                                
                            elseif pathlengthbin > currentproximalpathlengthbin && pathlengthbin < currentdistalpathlengthbin
                                % If the current partial piece falls between the proximal and distal path length bins
                                
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaltype         = [];
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distaltype           = [];
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).rallratio            = [];
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).rallratio1           = [];
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).rallratio2           = [];
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).rallratio3           = [];
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).daughterratio        = [];
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).parentdaughterratio  = [];
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).parentdaughter2ratio = [];
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length               = binsettings.distancebinwidth;
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter     = inddata.bifurcation.pathlengthbins(pathlengthbin-1).piece(length(inddata.bifurcation.pathlengthbins(pathlengthbin-1).piece)).distaldiameter;
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter       = inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter - ((  (piecedata(j).proximaldiameter - piecedata(j).distaldiameter)/piecedata(j).length  ) * binsettings.distancebinwidth);
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea          = pi*((inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).volume               = (pi/12)*inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length*(inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);
                                
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition      = inddata.bifurcation.pathlengthbins(pathlengthbin-1).piece(end).distalxposition;
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition      = inddata.bifurcation.pathlengthbins(pathlengthbin-1).piece(end).distalyposition;
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition      = inddata.bifurcation.pathlengthbins(pathlengthbin-1).piece(end).distalzposition;
                                [xdirection, ydirection, zdirection]                                                     = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition        = piecedata(j).proximalxposition + xdirection * inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition        = piecedata(j).proximalxposition + ydirection * inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition        = piecedata(j).proximalxposition + zdirection * inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength     = inddata.bifurcation.pathlengthbins(pathlengthbin-1).piece(end).distalpathlength;
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distalpathlength       = inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength + inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalradialdistance = ( (inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distalradialdistance = ( (inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                                
                            elseif pathlengthbin == currentdistalpathlengthbin
                                % If the current partial piece falls in the distal path length bin
                                
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaltype     = [];
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length           = piecedata(j).distalpathlength - ((pathlengthbin-1)*binsettings.distancebinwidth);
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter = inddata.bifurcation.pathlengthbins(pathlengthbin-1).piece(length(inddata.bifurcation.pathlengthbins(pathlengthbin-1).piece)).distaldiameter;
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea      = pi*((inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).volume           = (pi/12)*inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length*(inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);
                                
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition      = inddata.bifurcation.pathlengthbins(pathlengthbin-1).piece(end).distalxposition;
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition      = inddata.bifurcation.pathlengthbins(pathlengthbin-1).piece(end).distalyposition;
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition      = inddata.bifurcation.pathlengthbins(pathlengthbin-1).piece(end).distalzposition;
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength     = inddata.bifurcation.pathlengthbins(pathlengthbin-1).piece(end).distalpathlength;
                                inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalradialdistance = ( (inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                                
                            end
                        end
                    end
                    
                    
                    % Put the piece into the appropriate radial distance bin
                    
                    for radialdistancebin = currentproximalradialdistancebin:radialdistancestep:currentdistalradialdistancebin
                        % Repeat for as many partial pieces as there will end up being
                        
                        if isfield(inddata.bifurcation,'radialdistancebins')==0; nextpiece = 1;
                        elseif radialdistancebin > length(inddata.bifurcation.radialdistancebins); nextpiece = 1;
                        elseif isfield(inddata.bifurcation.radialdistancebins(radialdistancebin),'piece')==0; nextpiece = 1;
                        else nextpiece = 1 + length(inddata.bifurcation.radialdistancebins(radialdistancebin).piece);
                        end
                        
                        temppiece = setfield(piecedata(j),'partial','n');
                        inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece) = temppiece;
                        clear temppiece;
                        
                        if currentdistalradialdistancebin > currentproximalradialdistancebin
                            inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).partial = 'y';
                            if radialdistancebin == currentproximalradialdistancebin
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaltype           = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio            = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio1           = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio2           = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio3           = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).daughterratio        = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).parentdaughterratio  = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).parentdaughter2ratio = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length               = ((radialdistancebin*binsettings.distancebinwidth-piecedata(j).proximalradialdistance)/(piecedata(j).distalradialdistance-piecedata(j).proximalradialdistance))*piecedata(j).length;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter       = piecedata(j).proximaldiameter - ((  (piecedata(j).proximaldiameter - piecedata(j).distaldiameter)/piecedata(j).length  ) * inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length);
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea          = pi*((inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).volume               = (pi/12)*inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length*(inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);
                                
                                [xdirection, ydirection, zdirection]                                                           = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition      = piecedata(j).proximalxposition + xdirection * inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition      = piecedata(j).proximalyposition + ydirection * inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition      = piecedata(j).proximalzposition + zdirection * inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalpathlength     = inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength + inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalradialdistance = ( (inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                                
                            elseif radialdistancebin > currentproximalradialdistancebin && radialdistancebin < currentdistalradialdistancebin
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaltype         = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaltype           = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio            = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio1           = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio2           = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio3           = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).daughterratio        = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).parentdaughterratio  = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).parentdaughter2ratio = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length               = (binsettings.distancebinwidth/(piecedata(j).distalradialdistance-piecedata(j).proximalradialdistance))*piecedata(j).length;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter     = inddata.bifurcation.radialdistancebins(radialdistancebin-1).piece(length(inddata.bifurcation.radialdistancebins(radialdistancebin-1).piece)).distaldiameter;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter       = inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter - ((  (piecedata(j).proximaldiameter - piecedata(j).distaldiameter)/piecedata(j).length  ) * inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length);
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea          = pi*((inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).volume               = (pi/12)*inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length*(inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);
                                
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition      = inddata.bifurcation.radialdistancebins(radialdistancebin-1).piece(end).distalxposition;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition      = inddata.bifurcation.radialdistancebins(radialdistancebin-1).piece(end).distalyposition;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition      = inddata.bifurcation.radialdistancebins(radialdistancebin-1).piece(end).distalzposition;
                                [xdirection, ydirection, zdirection]                                                     = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition        = piecedata(j).proximalxposition + xdirection * inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition        = piecedata(j).proximalxposition + ydirection * inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition        = piecedata(j).proximalxposition + zdirection * inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength     = inddata.bifurcation.radialdistancebins(radialdistancebin-1).piece(end).distalpathlength;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalpathlength       = inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength + inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalradialdistance = ( (inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalradialdistance = ( (inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                                
                            elseif radialdistancebin == currentdistalradialdistancebin
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaltype     = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length           = ((piecedata(j).distalradialdistance-((radialdistancebin-1)*binsettings.distancebinwidth))/(piecedata(j).distalradialdistance-piecedata(j).proximalradialdistance))*piecedata(j).length;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter = inddata.bifurcation.radialdistancebins(radialdistancebin-1).piece(length(inddata.bifurcation.radialdistancebins(radialdistancebin-1).piece)).distaldiameter;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea      = pi*((inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).volume           = (pi/12)*inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length*(inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);
                                
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition      = inddata.bifurcation.radialdistancebins(radialdistancebin-1).piece(end).distalxposition;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition      = inddata.bifurcation.radialdistancebins(radialdistancebin-1).piece(end).distalyposition;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition      = inddata.bifurcation.radialdistancebins(radialdistancebin-1).piece(end).distalzposition;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength     = inddata.bifurcation.radialdistancebins(radialdistancebin-1).piece(end).distalpathlength;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalradialdistance = ( (inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                                
                            end
                            
                        elseif currentdistalradialdistancebin < currentproximalradialdistancebin
                            inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).partial = 'y';
                            if radialdistancebin == currentproximalradialdistancebin
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaltype           = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio            = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio1           = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio2           = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio3           = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).daughterratio        = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).parentdaughterratio  = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).parentdaughter2ratio = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length               = ((piecedata(j).proximalradialdistance-((radialdistancebin-1)*binsettings.distancebinwidth))/(piecedata(j).proximalradialdistance-piecedata(j).distalradialdistance))*piecedata(j).length;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter       = piecedata(j).proximaldiameter - ((  (piecedata(j).proximaldiameter - piecedata(j).distaldiameter)/piecedata(j).length  ) * inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length);
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea          = pi*((inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).volume               = (pi/12)*inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length*(inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);
                                
                                [xdirection, ydirection, zdirection]                                                           = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition      = piecedata(j).proximalxposition + xdirection * inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition      = piecedata(j).proximalyposition + ydirection * inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition      = piecedata(j).proximalzposition + zdirection * inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalpathlength     = inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength + inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalradialdistance = ( (inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                                
                            elseif radialdistancebin < currentproximalradialdistancebin && radialdistancebin > currentdistalradialdistancebin
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaltype         = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaltype           = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio            = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio1           = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio2           = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio3           = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).daughterratio        = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).parentdaughterratio  = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).parentdaughter2ratio = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length               = (binsettings.distancebinwidth/(piecedata(j).proximalradialdistance-piecedata(j).distalradialdistance))*piecedata(j).length;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter     = inddata.bifurcation.radialdistancebins(radialdistancebin+1).piece(length(inddata.bifurcation.radialdistancebins(radialdistancebin+1).piece)).distaldiameter;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter       = inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter - ((  (piecedata(j).proximaldiameter - piecedata(j).distaldiameter)/piecedata(j).length  ) * inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length);
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea          = pi*((inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).volume               = (pi/12)*inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length*(inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);
                                
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition      = inddata.bifurcation.radialdistancebins(radialdistancebin+1).piece(end).distalxposition;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition      = inddata.bifurcation.radialdistancebins(radialdistancebin+1).piece(end).distalyposition;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition      = inddata.bifurcation.radialdistancebins(radialdistancebin+1).piece(end).distalzposition;
                                [xdirection, ydirection, zdirection]                                                             = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition        = piecedata(j).proximalxposition + xdirection * inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition        = piecedata(j).proximalxposition + ydirection * inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition        = piecedata(j).proximalxposition + zdirection * inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength     = inddata.bifurcation.radialdistancebins(radialdistancebin+1).piece(end).distalpathlength;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalpathlength       = inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength + inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalradialdistance = ( (inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalradialdistance = ( (inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                                
                            elseif radialdistancebin == currentdistalradialdistancebin
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaltype     = [];
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length           = (((radialdistancebin*binsettings.distancebinwidth)-piecedata(j).distalradialdistance)/(piecedata(j).proximalradialdistance-piecedata(j).distalradialdistance))*piecedata(j).length;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter = inddata.bifurcation.radialdistancebins(radialdistancebin+1).piece(length(inddata.bifurcation.radialdistancebins(radialdistancebin+1).piece)).distaldiameter;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea      = pi*((inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).volume           = (pi/12)*inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length*(inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);
                                
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition      = inddata.bifurcation.radialdistancebins(radialdistancebin+1).piece(end).distalxposition;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition      = inddata.bifurcation.radialdistancebins(radialdistancebin+1).piece(end).distalyposition;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition      = inddata.bifurcation.radialdistancebins(radialdistancebin+1).piece(end).distalzposition;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength     = inddata.bifurcation.radialdistancebins(radialdistancebin+1).piece(end).distalpathlength;
                                inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalradialdistance = ( (inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                                
                            end
                        end
                    end
                    
                    
                    % Put the piece into the appropriate branch length bin
                    
                    for branchlengthbin = currentproximalbranchlengthbin:currentdistalbranchlengthbin
                        % Repeat for as many partial pieces as there will end up being
                        
                        if     isfield(inddata.bifurcation,'branchlengthbins')==0; nextpiece = 1;
                        elseif branchlengthbin > length(inddata.bifurcation.branchlengthbins); nextpiece = 1;
                        elseif isfield(inddata.bifurcation.branchlengthbins(branchlengthbin),'piece')==0; nextpiece = 1;
                        else nextpiece = 1 + length(inddata.bifurcation.branchlengthbins(branchlengthbin).piece);
                        end
                        
                        temppiece = setfield(piecedata(j),'partial','n');
                        inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece) = temppiece;
                        clear temppiece;
                        
                        if currentdistalbranchlengthbin ~= currentproximalbranchlengthbin
                            % If the piece lies in two or more branch length bins, split the piece and bin the current partial piece
                            
                            inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).partial = 'y';
                            
                            if branchlengthbin == currentproximalbranchlengthbin
                                % If the current partial piece falls in the proximal branch length bin
                                
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaltype           = [];
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).rallratio            = [];
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).rallratio1           = [];
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).rallratio2           = [];
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).rallratio3           = [];
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).daughterratio        = [];
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).parentdaughterratio  = [];
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).parentdaughter2ratio = [];
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length               = (branchlengthbin*binsettings.branchlengthbinwidth) - piecedata(j).proximalbranchlength;
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter       = piecedata(j).proximaldiameter - ((  (piecedata(j).proximaldiameter - piecedata(j).distaldiameter)/piecedata(j).length  ) * inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length);
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea          = pi*((inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length^2)^0.5);
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).volume               = (pi/12)*inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length*(inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter^2+inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter*inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter+inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter^2);
                                
                                [xdirection, ydirection, zdirection]                                               = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition      = piecedata(j).proximalxposition + xdirection * inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition      = piecedata(j).proximalyposition + ydirection * inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition      = piecedata(j).proximalzposition + zdirection * inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distalbranchlength     = inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength + inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distalradialdistance = ( (inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                                
                            elseif branchlengthbin > currentproximalbranchlengthbin && branchlengthbin < currentdistalbranchlengthbin
                                % If the current partial piece falls between the proximal and distal branch length bins
                                
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaltype         = [];
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaltype           = [];
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).rallratio            = [];
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).rallratio1           = [];
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).rallratio2           = [];
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).rallratio3           = [];
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).daughterratio        = [];
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).parentdaughterratio  = [];
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).parentdaughter2ratio = [];
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length               = binsettings.branchlengthbinwidth;
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter     = inddata.bifurcation.branchlengthbins(branchlengthbin-1).piece(length(inddata.bifurcation.branchlengthbins(branchlengthbin-1).piece)).distaldiameter;
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter       = inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter - ((  (piecedata(j).proximaldiameter - piecedata(j).distaldiameter)/piecedata(j).length  ) * binsettings.branchlengthbinwidth);
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea          = pi*((inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length^2)^0.5);
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).volume               = (pi/12)*inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length*(inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter^2+inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter*inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter+inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter^2);
                                
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition      = inddata.bifurcation.branchlengthbins(branchlengthbin-1).piece(end).distalxposition;
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition      = inddata.bifurcation.branchlengthbins(branchlengthbin-1).piece(end).distalyposition;
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition      = inddata.bifurcation.branchlengthbins(branchlengthbin-1).piece(end).distalzposition;
                                [xdirection, ydirection, zdirection]                                                     = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition        = piecedata(j).proximalxposition + xdirection * inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition        = piecedata(j).proximalxposition + ydirection * inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition        = piecedata(j).proximalxposition + zdirection * inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength     = inddata.bifurcation.branchlengthbins(branchlengthbin-1).piece(end).distalbranchlength;
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distalbranchlength       = inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength + inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalradialdistance = ( (inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distalradialdistance = ( (inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                                
                            elseif branchlengthbin == currentdistalbranchlengthbin
                                % If the current partial piece falls in the distal branch length bin
                                
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaltype     = [];
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length           = piecedata(j).distalbranchlength - ((branchlengthbin-1)*binsettings.branchlengthbinwidth);
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter = inddata.bifurcation.branchlengthbins(branchlengthbin-1).piece(length(inddata.bifurcation.branchlengthbins(branchlengthbin-1).piece)).distaldiameter;
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea      = pi*((inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length^2)^0.5);
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).volume           = (pi/12)*inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length*(inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter^2+inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter*inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter+inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter^2);
                                
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition      = inddata.bifurcation.branchlengthbins(branchlengthbin-1).piece(end).distalxposition;
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition      = inddata.bifurcation.branchlengthbins(branchlengthbin-1).piece(end).distalyposition;
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition      = inddata.bifurcation.branchlengthbins(branchlengthbin-1).piece(end).distalzposition;
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength     = inddata.bifurcation.branchlengthbins(branchlengthbin-1).piece(end).distalbranchlength;
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalradialdistance = ( (inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                                
                            end
                            
                            if inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length < 0 || ...
                                    inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter < 0 || ...
                                    inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea < 0 || ...
                                    inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).volume < 0
                                disp('Error in piecebinner (1545)');
                                keyboard;
                            end
                            
                        end
                        
                        if inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length < 0 || ...
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter < 0 || ...
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea < 0 || ...
                                inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).volume < 0
                            disp('Error in piecebinner (1555)');
                            keyboard;
                        end
                        
                        
                    end
                    
                    if inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length < 0 || ...
                            inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter < 0 || ...
                            inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea < 0 || ...
                            inddata.bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).volume < 0
                        disp('Error in piecebinner (1566)');
                        keyboard;
                    end
                    
                    
                    
                    
                    
                    
                    
                    
                % Start of termination piece binning
                elseif strcmp(piecedata(j).branchtype,'t') == 1
                    
                    % Put the piece into the population termination piece section
                    %if isfield(popdata,'termination')==0; nextpiece = 1;
                    %elseif isfield(popdata.termination,'piece')==0; nextpiece = 1;
                    %else nextpiece = 1 + length(popdata.termination.piece);
                    %end;
                    %popdata.termination.piece(nextpiece) = orderfields(piecedata(j));
                    
                    % Put the piece into the analysis population termination piece section
                    if exist('popanalysis','var')~=1; nextpiece = 1;
                    elseif isfield(popanalysis,'termination')==0; nextpiece = 1;
                    elseif isfield(popanalysis.termination,'piece')==0; nextpiece = 1;
                    else nextpiece = 1 + length(popanalysis.termination.piece);
                    end;
                    if ~isfield(piecedata,'daughter1')
                        keyboard
                    end
                    popanalysis.termination.piece(nextpiece) = orderfields(piecedata(j));
                    
                    % Put the piece into the appropriate diameter bin
                    
                    for diameterbin = currentproximaldiameterbin:diameterstep:currentdistaldiameterbin
                        % Repeat for as many partial pieces as there will end up being
                        
                        if     isfield(inddata.termination,'diameterbins')==0; nextpiece = 1;
                        elseif isfield(inddata.termination.diameterbins(diameterbin),'piece')==0; nextpiece = 1;
                        else nextpiece = 1 + length(inddata.termination.diameterbins(diameterbin).piece);
                        end;
                        
                        temppiece = setfield(piecedata(j),'partial','n');
                        inddata.termination.diameterbins(diameterbin).piece(nextpiece) = temppiece;
                        clear temppiece;
                        
                        % If the piece lies in two or more diameter bins, split the piece and bin the current partial piece
                        
                        if currentdistaldiameterbin < currentproximaldiameterbin
                            % If the distal diameter is less than the proximal diameter
                            
                            %disp('Distal diameter is less than proximal diameter.');
                            inddata.termination.diameterbins(diameterbin).piece(nextpiece).partial = 'y';
                            
                            if diameterbin == currentproximaldiameterbin
                                % If this partial piece is in the proximal diameter bin
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaltype           = [];
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = piecedata(j).proximaldiameter;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter       = inddata.diameterbinedges(diameterbin);
                                if inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter > inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                                    disp('Error.  Distal diameter is greater than proximal diameter.');
                                    keyboard;
                                end
                                %inddata.termination.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/piecedata(j).taperrate;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/(inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*piecedata(j).taperrate);

                                if inddata.termination.diameterbins(diameterbin).piece(nextpiece).length > 1.01 * piecedata(j).length || inddata.termination.diameterbins(diameterbin).piece(nextpiece).length < 0
                                    disp('Error.  Partial piece length is greater than piece length.');
                                    disp(sprintf('Length: %f',inddata.termination.diameterbins(diameterbin).piece(nextpiece).length));
                                    keyboard;
                                end
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).surfacearea          = pi*((inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+inddata.termination.diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).volume               = (pi/12)*inddata.termination.diameterbins(diameterbin).piece(nextpiece).length*(inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter+inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);
                                
                                [xdirection, ydirection, zdirection]                                               = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).distalxposition      = piecedata(j).proximalxposition + xdirection * inddata.termination.diameterbins(diameterbin).piece(nextpiece).length;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).distalyposition      = piecedata(j).proximalyposition + ydirection * inddata.termination.diameterbins(diameterbin).piece(nextpiece).length;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).distalzposition      = piecedata(j).proximalzposition + zdirection * inddata.termination.diameterbins(diameterbin).piece(nextpiece).length;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).distalpathlength     = inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalpathlength + inddata.termination.diameterbins(diameterbin).piece(nextpiece).length;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).distalradialdistance = ( (inddata.termination.diameterbins(diameterbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.termination.diameterbins(diameterbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.termination.diameterbins(diameterbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                                
                            elseif diameterbin < currentproximaldiameterbin && diameterbin > currentdistaldiameterbin
                                % If this partial piece falls between the proximal and distal diameter bins
                                
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaltype         = [];
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaltype           = [];
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = inddata.diameterbinedges(diameterbin+1);
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter       = inddata.diameterbinedges(diameterbin);
                                if inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter > inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                                    disp('Error.  Distal diameter is greater than proximal diameter.');
                                    keyboard;
                                end
                                %inddata.termination.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/piecedata(j).taperrate;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/(inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*piecedata(j).taperrate);

                                if inddata.termination.diameterbins(diameterbin).piece(nextpiece).length > 1.01 * piecedata(j).length || inddata.termination.diameterbins(diameterbin).piece(nextpiece).length < 0
                                    disp('Error.  Partial piece length is greater than piece length.');
                                    disp(sprintf('Length: %f',inddata.termination.diameterbins(diameterbin).piece(nextpiece).length));
                                    keyboard;
                                end
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).surfacearea            = pi*((inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+inddata.termination.diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).volume                 = (pi/12)*inddata.termination.diameterbins(diameterbin).piece(nextpiece).length*(inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter+inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);
                                
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalxposition      = inddata.termination.diameterbins(diameterbin+1).piece(end).distalxposition;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalyposition      = inddata.termination.diameterbins(diameterbin+1).piece(end).distalyposition;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalzposition      = inddata.termination.diameterbins(diameterbin+1).piece(end).distalzposition;
                                [xdirection, ydirection, zdirection]                                                 = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).distalxposition        = piecedata(j).proximalxposition + xdirection * inddata.termination.diameterbins(diameterbin).piece(nextpiece).length;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).distalyposition        = piecedata(j).proximalxposition + ydirection * inddata.termination.diameterbins(diameterbin).piece(nextpiece).length;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).distalzposition        = piecedata(j).proximalxposition + zdirection * inddata.termination.diameterbins(diameterbin).piece(nextpiece).length;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalpathlength     = inddata.termination.diameterbins(diameterbin+1).piece(end).distalpathlength;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).distalpathlength       = inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalpathlength + inddata.termination.diameterbins(diameterbin).piece(nextpiece).length;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalradialdistance = ( (inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).distalradialdistance = ( (inddata.termination.diameterbins(diameterbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.termination.diameterbins(diameterbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.termination.diameterbins(diameterbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                            elseif diameterbin == currentdistaldiameterbin
                                % If this partial piece falls in the distal diameter bin
                                
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaltype         = [];
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = inddata.diameterbinedges(diameterbin+1);
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter       = piecedata(j).distaldiameter;
                                if inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter > inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                                    disp('Error.  Distal diameter is greater than proximal diameter.');
                                    keyboard;
                                end
                                %inddata.termination.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/piecedata(j).taperrate;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/(inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*piecedata(j).taperrate);

                                if inddata.termination.diameterbins(diameterbin).piece(nextpiece).length > 1.01 * piecedata(j).length || inddata.termination.diameterbins(diameterbin).piece(nextpiece).length < 0
                                    disp('Error.  Partial piece length is greater than piece length.');
                                    disp(sprintf('Length: %f',inddata.termination.diameterbins(diameterbin).piece(nextpiece).length));
                                    keyboard;
                                end
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).surfacearea          = pi*((inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+inddata.termination.diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).volume               = (pi/12)*inddata.termination.diameterbins(diameterbin).piece(nextpiece).length*(inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter+inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);
                                
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalxposition      = inddata.termination.diameterbins(diameterbin+1).piece(end).distalxposition;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalyposition      = inddata.termination.diameterbins(diameterbin+1).piece(end).distalyposition;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalzposition      = inddata.termination.diameterbins(diameterbin+1).piece(end).distalzposition;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalpathlength     = inddata.termination.diameterbins(diameterbin+1).piece(end).distalpathlength;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalradialdistance = ( (inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                            else disp('Error.  See piecebinner.m line 249.');
                            end
                            
                        elseif currentdistaldiameterbin > currentproximaldiameterbin
                            % If the distal diameter is greater than the proximal diameter
                            
                            %disp('Distal diameter is greater than proximal diameter.');
                            inddata.termination.diameterbins(diameterbin).piece(nextpiece).partial = 'y';
                            
                            if diameterbin == currentproximaldiameterbin
                                % If this partial piece is in the proximal diameter bin
                                
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaltype           = [];
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = piecedata(j).proximaldiameter;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter       = inddata.diameterbinedges(diameterbin+1);
                                if inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter < inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                                    disp('Error.  Distal diameter is less than proximal diameter.');
                                    keyboard;
                                end
                                %inddata.termination.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/piecedata(j).taperrate;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/(inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*piecedata(j).taperrate);

                                if inddata.termination.diameterbins(diameterbin).piece(nextpiece).length > 1.01 * piecedata(j).length || inddata.termination.diameterbins(diameterbin).piece(nextpiece).length < 0
                                    disp('Error.  Partial piece length is greater than piece length.');
                                    disp(sprintf('Length: %f',inddata.termination.diameterbins(diameterbin).piece(nextpiece).length));
                                    keyboard;
                                end
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).surfacearea          = pi*((inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+inddata.termination.diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).volume               = (pi/12)*inddata.termination.diameterbins(diameterbin).piece(nextpiece).length*(inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter+inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);
                                
                                [xdirection, ydirection, zdirection]                                               = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).distalxposition      = piecedata(j).proximalxposition + xdirection * inddata.termination.diameterbins(diameterbin).piece(nextpiece).length;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).distalyposition      = piecedata(j).proximalyposition + ydirection * inddata.termination.diameterbins(diameterbin).piece(nextpiece).length;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).distalzposition      = piecedata(j).proximalzposition + zdirection * inddata.termination.diameterbins(diameterbin).piece(nextpiece).length;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).distalpathlength     = inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalpathlength + inddata.termination.diameterbins(diameterbin).piece(nextpiece).length;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).distalradialdistance = ( (inddata.termination.diameterbins(diameterbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.termination.diameterbins(diameterbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.termination.diameterbins(diameterbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                            elseif diameterbin > currentproximaldiameterbin && diameterbin < currentdistaldiameterbin
                                % If this partial piece falls between the proximal and distal diameter bins
                                
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaltype         = [];
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaltype           = [];
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = inddata.diameterbinedges(diameterbin);
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter       = inddata.diameterbinedges(diameterbin+1);
                                if inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter < inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                                    disp('Error.  Distal diameter is less than proximal diameter.');
                                    keyboard;
                                end
                                %inddata.termination.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/piecedata(j).taperrate;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/(inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*piecedata(j).taperrate);

                                if inddata.termination.diameterbins(diameterbin).piece(nextpiece).length > 1.01 * piecedata(j).length || inddata.termination.diameterbins(diameterbin).piece(nextpiece).length < 0
                                    disp('Error.  Partial piece length is greater than piece length.');
                                    disp(sprintf('Length: %f',inddata.termination.diameterbins(diameterbin).piece(nextpiece).length));
                                    keyboard;
                                end
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).surfacearea          = pi*((inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+inddata.termination.diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).volume               = (pi/12)*inddata.termination.diameterbins(diameterbin).piece(nextpiece).length*(inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter+inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);
                                
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalxposition      = inddata.termination.diameterbins(diameterbin-1).piece(end).distalxposition;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalyposition      = inddata.termination.diameterbins(diameterbin-1).piece(end).distalyposition;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalzposition      = inddata.termination.diameterbins(diameterbin-1).piece(end).distalzposition;
                                [xdirection, ydirection, zdirection]                                                 = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).distalxposition        = piecedata(j).proximalxposition + xdirection * inddata.termination.diameterbins(diameterbin).piece(nextpiece).length;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).distalyposition        = piecedata(j).proximalyposition + ydirection * inddata.termination.diameterbins(diameterbin).piece(nextpiece).length;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).distalzposition        = piecedata(j).proximalzposition + zdirection * inddata.termination.diameterbins(diameterbin).piece(nextpiece).length;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalpathlength     = inddata.termination.diameterbins(diameterbin-1).piece(end).distalpathlength;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).distalpathlength       = inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalpathlength + inddata.termination.diameterbins(diameterbin).piece(nextpiece).length;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalradialdistance = ( (inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).distalradialdistance = ( (inddata.termination.diameterbins(diameterbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.termination.diameterbins(diameterbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.termination.diameterbins(diameterbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                                
                            elseif diameterbin == currentdistaldiameterbin
                                % If the piece falls in the distal diameter bin
                                
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaltype         = [];
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = inddata.diameterbinedges(diameterbin);
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter       = piecedata(j).distaldiameter;
                                if inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter < inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                                    disp('Error.  Distal diameter is less than proximal diameter.');
                                    keyboard;
                                end
                                %inddata.termination.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/piecedata(j).taperrate;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).length               = (inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/(inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*piecedata(j).taperrate);

                                if inddata.termination.diameterbins(diameterbin).piece(nextpiece).length > 1.01 * piecedata(j).length || inddata.termination.diameterbins(diameterbin).piece(nextpiece).length < 0
                                    disp('Error.  Partial piece length is greater than piece length.');
                                    disp(sprintf('Length: %f',inddata.termination.diameterbins(diameterbin).piece(nextpiece).length));
                                    keyboard;
                                end
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).surfacearea          = pi*((inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+inddata.termination.diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).volume               = (pi/12)*inddata.termination.diameterbins(diameterbin).piece(nextpiece).length*(inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter+inddata.termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);
                                
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalxposition      = inddata.termination.diameterbins(diameterbin-1).piece(end).distalxposition;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalyposition      = inddata.termination.diameterbins(diameterbin-1).piece(end).distalyposition;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalzposition      = inddata.termination.diameterbins(diameterbin-1).piece(end).distalzposition;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalpathlength     = inddata.termination.diameterbins(diameterbin-1).piece(end).distalpathlength;
                                inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalradialdistance = ( (inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.termination.diameterbins(diameterbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                            else disp('Error: see piecebinner.m line 364.');
                            end
                        end
                    end
                    
                    % Put the piece into the appropriate path length bin
                    
                    for pathlengthbin = currentproximalpathlengthbin:currentdistalpathlengthbin
                        % Repeat for as many partial pieces as there will end up being
                        
                        if     isfield(inddata.termination,'pathlengthbins')==0; nextpiece = 1;
                        elseif pathlengthbin > length(inddata.termination.pathlengthbins); nextpiece = 1;
                        elseif isfield(inddata.termination.pathlengthbins(pathlengthbin),'piece')==0; nextpiece = 1;
                        else nextpiece = 1 + length(inddata.termination.pathlengthbins(pathlengthbin).piece);
                        end
                        
                        temppiece = setfield(piecedata(j),'partial','n');
                        inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece) = temppiece;
                        clear temppiece;
                        
                        if currentdistalpathlengthbin ~= currentproximalpathlengthbin
                            % If the piece lies in two or more path length bins, split the piece and bin the current partial piece
                            
                            inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).partial = 'y';
                            
                            if pathlengthbin == currentproximalpathlengthbin
                                % If the current partial piece falls in the proximal path length bin
                                
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).distaltype           = [];
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).length               = (pathlengthbin*binsettings.distancebinwidth) - piecedata(j).proximalpathlength;
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter       = piecedata(j).proximaldiameter - ((  (piecedata(j).proximaldiameter - piecedata(j).distaldiameter)/piecedata(j).length  ) * inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).length);
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea          = pi*((inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).volume               = (pi/12)*inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).length*(inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);
                                
                                [xdirection, ydirection, zdirection]                                               = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition      = piecedata(j).proximalxposition + xdirection * inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition      = piecedata(j).proximalyposition + ydirection * inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition      = piecedata(j).proximalzposition + zdirection * inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).distalpathlength     = inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength + inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).distalradialdistance = ( (inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                                
                            elseif pathlengthbin > currentproximalpathlengthbin && pathlengthbin < currentdistalpathlengthbin
                                % If the current partial piece falls between the proximal and distal path length bins
                                
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaltype         = [];
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).distaltype           = [];
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).length               = binsettings.distancebinwidth;
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter     = inddata.termination.pathlengthbins(pathlengthbin-1).piece(length(inddata.termination.pathlengthbins(pathlengthbin-1).piece)).distaldiameter;
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter       = inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter - ((  (piecedata(j).proximaldiameter - piecedata(j).distaldiameter)/piecedata(j).length  ) * binsettings.distancebinwidth);
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea          = pi*((inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).volume               = (pi/12)*inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).length*(inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);
                                
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition      = inddata.termination.pathlengthbins(pathlengthbin-1).piece(end).distalxposition;
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition      = inddata.termination.pathlengthbins(pathlengthbin-1).piece(end).distalyposition;
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition      = inddata.termination.pathlengthbins(pathlengthbin-1).piece(end).distalzposition;
                                [xdirection, ydirection, zdirection]                                                     = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition        = piecedata(j).proximalxposition + xdirection * inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition        = piecedata(j).proximalxposition + ydirection * inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition        = piecedata(j).proximalxposition + zdirection * inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength     = inddata.termination.pathlengthbins(pathlengthbin-1).piece(end).distalpathlength;
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).distalpathlength       = inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength + inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalradialdistance = ( (inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).distalradialdistance = ( (inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                                
                            elseif pathlengthbin == currentdistalpathlengthbin
                                % If the current partial piece falls in the distal path length bin
                                
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaltype     = [];
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).length           = piecedata(j).distalpathlength - ((pathlengthbin-1)*binsettings.distancebinwidth);
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter = inddata.termination.pathlengthbins(pathlengthbin-1).piece(length(inddata.termination.pathlengthbins(pathlengthbin-1).piece)).distaldiameter;
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea      = pi*((inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).volume           = (pi/12)*inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).length*(inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);
                                
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition      = inddata.termination.pathlengthbins(pathlengthbin-1).piece(end).distalxposition;
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition      = inddata.termination.pathlengthbins(pathlengthbin-1).piece(end).distalyposition;
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition      = inddata.termination.pathlengthbins(pathlengthbin-1).piece(end).distalzposition;
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength     = inddata.termination.pathlengthbins(pathlengthbin-1).piece(end).distalpathlength;
                                inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalradialdistance = ( (inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                                
                            end
                        end
                    end
                    
                    
                    % Put the piece into the appropriate radial distance bin
                    
                    for radialdistancebin = currentproximalradialdistancebin:radialdistancestep:currentdistalradialdistancebin
                        % Repeat for as many partial pieces as there will end up being
                        
                        if isfield(inddata.termination,'radialdistancebins')==0; nextpiece = 1;
                        elseif radialdistancebin > length(inddata.termination.radialdistancebins); nextpiece = 1;
                        elseif isfield(inddata.termination.radialdistancebins(radialdistancebin),'piece')==0; nextpiece = 1;
                        else nextpiece = 1 + length(inddata.termination.radialdistancebins(radialdistancebin).piece);
                        end
                        
                        temppiece = setfield(piecedata(j),'partial','n');
                        inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece) = temppiece;
                        clear temppiece;
                        
                        if currentdistalradialdistancebin > currentproximalradialdistancebin
                            inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).partial = 'y';
                            if radialdistancebin == currentproximalradialdistancebin
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaltype           = [];
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length               = ((radialdistancebin*binsettings.distancebinwidth-piecedata(j).proximalradialdistance)/(piecedata(j).distalradialdistance-piecedata(j).proximalradialdistance))*piecedata(j).length;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter       = piecedata(j).proximaldiameter - ((  (piecedata(j).proximaldiameter - piecedata(j).distaldiameter)/piecedata(j).length  ) * inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length);
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea          = pi*((inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).volume               = (pi/12)*inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length*(inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);
                                
                                [xdirection, ydirection, zdirection]                                                           = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition      = piecedata(j).proximalxposition + xdirection * inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition      = piecedata(j).proximalyposition + ydirection * inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition      = piecedata(j).proximalzposition + zdirection * inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalpathlength     = inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength + inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalradialdistance = ( (inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                                
                            elseif radialdistancebin > currentproximalradialdistancebin && radialdistancebin < currentdistalradialdistancebin
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaltype         = [];
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaltype           = [];
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length               = (binsettings.distancebinwidth/(piecedata(j).distalradialdistance-piecedata(j).proximalradialdistance))*piecedata(j).length;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter     = inddata.termination.radialdistancebins(radialdistancebin-1).piece(length(inddata.termination.radialdistancebins(radialdistancebin-1).piece)).distaldiameter;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter       = inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter - ((  (piecedata(j).proximaldiameter - piecedata(j).distaldiameter)/piecedata(j).length  ) * inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length);
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea          = pi*((inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).volume               = (pi/12)*inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length*(inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);
                                
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition      = inddata.termination.radialdistancebins(radialdistancebin-1).piece(end).distalxposition;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition      = inddata.termination.radialdistancebins(radialdistancebin-1).piece(end).distalyposition;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition      = inddata.termination.radialdistancebins(radialdistancebin-1).piece(end).distalzposition;
                                [xdirection, ydirection, zdirection]                                                     = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition        = piecedata(j).proximalxposition + xdirection * inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition        = piecedata(j).proximalxposition + ydirection * inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition        = piecedata(j).proximalxposition + zdirection * inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength     = inddata.termination.radialdistancebins(radialdistancebin-1).piece(end).distalpathlength;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalpathlength       = inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength + inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalradialdistance = ( (inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalradialdistance = ( (inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                                
                            elseif radialdistancebin == currentdistalradialdistancebin
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaltype     = [];
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length           = ((piecedata(j).distalradialdistance-((radialdistancebin-1)*binsettings.distancebinwidth))/(piecedata(j).distalradialdistance-piecedata(j).proximalradialdistance))*piecedata(j).length;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter = inddata.termination.radialdistancebins(radialdistancebin-1).piece(length(inddata.termination.radialdistancebins(radialdistancebin-1).piece)).distaldiameter;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea      = pi*((inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).volume           = (pi/12)*inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length*(inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);
                                
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition      = inddata.termination.radialdistancebins(radialdistancebin-1).piece(end).distalxposition;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition      = inddata.termination.radialdistancebins(radialdistancebin-1).piece(end).distalyposition;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition      = inddata.termination.radialdistancebins(radialdistancebin-1).piece(end).distalzposition;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength     = inddata.termination.radialdistancebins(radialdistancebin-1).piece(end).distalpathlength;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalradialdistance = ( (inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                                
                            end
                            
                        elseif currentdistalradialdistancebin < currentproximalradialdistancebin
                            inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).partial = 'y';
                            if radialdistancebin == currentproximalradialdistancebin
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaltype           = [];
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length               = ((piecedata(j).proximalradialdistance-((radialdistancebin-1)*binsettings.distancebinwidth))/(piecedata(j).proximalradialdistance-piecedata(j).distalradialdistance))*piecedata(j).length;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter       = piecedata(j).proximaldiameter - ((  (piecedata(j).proximaldiameter - piecedata(j).distaldiameter)/piecedata(j).length  ) * inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length);
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea          = pi*((inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).volume               = (pi/12)*inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length*(inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);
                                
                                [xdirection, ydirection, zdirection]                                                           = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition      = piecedata(j).proximalxposition + xdirection * inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition      = piecedata(j).proximalyposition + ydirection * inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition      = piecedata(j).proximalzposition + zdirection * inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalpathlength     = inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength + inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalradialdistance = ( (inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                                
                            elseif radialdistancebin < currentproximalradialdistancebin && radialdistancebin > currentdistalradialdistancebin
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaltype         = [];
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaltype           = [];
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length               = (binsettings.distancebinwidth/(piecedata(j).proximalradialdistance-piecedata(j).distalradialdistance))*piecedata(j).length;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter     = inddata.termination.radialdistancebins(radialdistancebin+1).piece(length(inddata.termination.radialdistancebins(radialdistancebin+1).piece)).distaldiameter;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter       = inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter - ((  (piecedata(j).proximaldiameter - piecedata(j).distaldiameter)/piecedata(j).length  ) * inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length);
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea          = pi*((inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).volume               = (pi/12)*inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length*(inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);
                                
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition      = inddata.termination.radialdistancebins(radialdistancebin+1).piece(end).distalxposition;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition      = inddata.termination.radialdistancebins(radialdistancebin+1).piece(end).distalyposition;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition      = inddata.termination.radialdistancebins(radialdistancebin+1).piece(end).distalzposition;
                                [xdirection, ydirection, zdirection]                                                             = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition        = piecedata(j).proximalxposition + xdirection * inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition        = piecedata(j).proximalxposition + ydirection * inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition        = piecedata(j).proximalxposition + zdirection * inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength     = inddata.termination.radialdistancebins(radialdistancebin+1).piece(end).distalpathlength;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalpathlength       = inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength + inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalradialdistance = ( (inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalradialdistance = ( (inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                                
                            elseif radialdistancebin == currentdistalradialdistancebin
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaltype     = [];
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length           = (((radialdistancebin*binsettings.distancebinwidth)-piecedata(j).distalradialdistance)/(piecedata(j).proximalradialdistance-piecedata(j).distalradialdistance))*piecedata(j).length;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter = inddata.termination.radialdistancebins(radialdistancebin+1).piece(length(inddata.termination.radialdistancebins(radialdistancebin+1).piece)).distaldiameter;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea      = pi*((inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).volume           = (pi/12)*inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).length*(inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);
                                
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition      = inddata.termination.radialdistancebins(radialdistancebin+1).piece(end).distalxposition;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition      = inddata.termination.radialdistancebins(radialdistancebin+1).piece(end).distalyposition;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition      = inddata.termination.radialdistancebins(radialdistancebin+1).piece(end).distalzposition;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength     = inddata.termination.radialdistancebins(radialdistancebin+1).piece(end).distalpathlength;
                                inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalradialdistance = ( (inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                                
                            end
                        end
                    end
                    
                    
                    % Put the piece into the appropriate branch length bin
                    
                    for branchlengthbin = currentproximalbranchlengthbin:currentdistalbranchlengthbin
                        % Repeat for as many partial pieces as there will end up being
                        
                        if     isfield(inddata.termination,'branchlengthbins')==0; nextpiece = 1;
                        elseif branchlengthbin > length(inddata.termination.branchlengthbins); nextpiece = 1;
                        elseif isfield(inddata.termination.branchlengthbins(branchlengthbin),'piece')==0; nextpiece = 1;
                        else nextpiece = 1 + length(inddata.termination.branchlengthbins(branchlengthbin).piece);
                        end
                        
                        temppiece = setfield(piecedata(j),'partial','n');
                        inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece) = temppiece;
                        clear temppiece;
                        
                        if currentdistalbranchlengthbin ~= currentproximalbranchlengthbin
                            % If the piece lies in two or more branch length bins, split the piece and bin the current partial piece
                            
                            inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).partial = 'y';
                            
                            if branchlengthbin == currentproximalbranchlengthbin
                                % If the current partial piece falls in the proximal branch length bin
                                
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).distaltype           = [];
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).length               = (branchlengthbin*binsettings.branchlengthbinwidth) - piecedata(j).proximalbranchlength;
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter       = piecedata(j).proximaldiameter - ((  (piecedata(j).proximaldiameter - piecedata(j).distaldiameter)/piecedata(j).length  ) * inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).length);
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea          = pi*((inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).length^2)^0.5);
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).volume               = (pi/12)*inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).length*(inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter^2+inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter*inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter+inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter^2);
                                
                                [xdirection, ydirection, zdirection]                                               = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition      = piecedata(j).proximalxposition + xdirection * inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition      = piecedata(j).proximalyposition + ydirection * inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition      = piecedata(j).proximalzposition + zdirection * inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).distalbranchlength     = inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength + inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).distalradialdistance = ( (inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                                
                            elseif branchlengthbin > currentproximalbranchlengthbin && branchlengthbin < currentdistalbranchlengthbin
                                % If the current partial piece falls between the proximal and distal branch length bins
                                
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaltype         = [];
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).distaltype           = [];
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).length               = binsettings.branchlengthbinwidth;
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter     = inddata.termination.branchlengthbins(branchlengthbin-1).piece(length(inddata.termination.branchlengthbins(branchlengthbin-1).piece)).distaldiameter;
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter       = inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter - ((  (piecedata(j).proximaldiameter - piecedata(j).distaldiameter)/piecedata(j).length  ) * binsettings.branchlengthbinwidth);
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea          = pi*((inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).length^2)^0.5);
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).volume               = (pi/12)*inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).length*(inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter^2+inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter*inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter+inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter^2);
                                
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition      = inddata.termination.branchlengthbins(branchlengthbin-1).piece(end).distalxposition;
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition      = inddata.termination.branchlengthbins(branchlengthbin-1).piece(end).distalyposition;
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition      = inddata.termination.branchlengthbins(branchlengthbin-1).piece(end).distalzposition;
                                [xdirection, ydirection, zdirection]                                                     = directionfunction(piecedata(j).elevation,piecedata(j).azimuth);
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition        = piecedata(j).proximalxposition + xdirection * inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition        = piecedata(j).proximalxposition + ydirection * inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition        = piecedata(j).proximalxposition + zdirection * inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength     = inddata.termination.branchlengthbins(branchlengthbin-1).piece(end).distalbranchlength;
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).distalbranchlength       = inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength + inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalradialdistance = ( (inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).distalradialdistance = ( (inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                                
                            elseif branchlengthbin == currentdistalbranchlengthbin
                                % If the current partial piece falls in the distal branch length bin
                                
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaltype     = [];
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).length           = piecedata(j).distalbranchlength - ((branchlengthbin-1)*binsettings.branchlengthbinwidth);
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter = inddata.termination.branchlengthbins(branchlengthbin-1).piece(length(inddata.termination.branchlengthbins(branchlengthbin-1).piece)).distaldiameter;
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea      = pi*((inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)+(inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))*(((((inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)-(inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))^2)+inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).length^2)^0.5);
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).volume           = (pi/12)*inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).length*(inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter^2+inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter*inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter+inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter^2);
                                
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition      = inddata.termination.branchlengthbins(branchlengthbin-1).piece(end).distalxposition;
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition      = inddata.termination.branchlengthbins(branchlengthbin-1).piece(end).distalyposition;
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition      = inddata.termination.branchlengthbins(branchlengthbin-1).piece(end).distalzposition;
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength     = inddata.termination.branchlengthbins(branchlengthbin-1).piece(end).distalbranchlength;
                                inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalradialdistance = ( (inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                    + (inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                    + (inddata.termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                
                                
                            end
                        end
                    end % end of termination piece binning
                else
                    disp('Error: piece type not identified.');
                end % end of piece bif/term if/then
                
                
                
                % Start of whole motoneuron analysis and bifurcation/termination counting
                
                if piecedata(j).branchorder > inddata.maxbranchorder
                    inddata.maxbranchorder = piecedata(j).branchorder;
                    if inddata.maxbranchorder > popdata.maxbranchorder
                        popdata.maxbranchorder = inddata.maxbranchorder;
                    end
                end
                
                inddata.totallength      = inddata.totallength      + piecedata(j).length;
                inddata.totalsurfacearea = inddata.totalsurfacearea + piecedata(j).surfacearea;
                inddata.totalvolume      = inddata.totalvolume      + piecedata(j).volume;
                
                if strcmp(piecedata(j).distaltype,'bifurcation') == 1
                    inddata.numberbifurcations = inddata.numberbifurcations + 1;
                    if piecedata(j).daughter1diameter < piecedata(j).daughter2diameter
                        disp(' ');
                        disp('Error: daughter 2 diameter is greater than daughter 1 diameter.');
                        disp(sprintf('Daughter Ratio: %f',piecedata(j).daughterratio));
                        disp(sprintf('Daughter 1 Diameter: %f',piecedata(j).daughter1diameter));
                        disp(sprintf('Daughter 2 Diameter: %f',piecedata(j).daughter2diameter));
                    end
                end
                
                if strcmp(piecedata(j).distaltype,'m-furcation') == 1
                    inddata.numberbifurcations = inddata.numberbifurcations + length(piecedata(j).daughters) - 1;
                end
                
                if strcmp(piecedata(j).distaltype,'termination') == 1
                    inddata.numberterminations = inddata.numberterminations + 1;
                    if piecedata(j).branchorder < inddata.minbranchorder
                        inddata.minbranchorder = piecedata(j).branchorder;
                        if inddata.minbranchorder < popdata.minbranchorder
                            popdata.minbranchorder = inddata.minbranchorder;
                        end
                    end
                end
                
                
           
            end % end of pieces
            
            % Fill in the individual neuron's piece-type data structure
            eval(['data.individual(i).' currentpiecetype '=inddata;']);
            clear inddata;
            
            
        end % end of mns
        
        % Fill in the population piece-type data structure
        popdata.bifurcation.maxdiameter            = max([[popanalysis.bifurcation.piece.proximaldiameter] [popanalysis.bifurcation.piece.distaldiameter]]);
        popdata.bifurcation.mindiameter            = min([[popanalysis.bifurcation.piece.proximaldiameter] [popanalysis.bifurcation.piece.distaldiameter]]);
        popdata.bifurcation.maxpathlength          = max([[popanalysis.bifurcation.piece.proximalpathlength] [popanalysis.bifurcation.piece.distalpathlength]]);
        popdata.bifurcation.minpathlength          = min([[popanalysis.bifurcation.piece.proximalpathlength] [popanalysis.bifurcation.piece.distalpathlength]]);
        popdata.bifurcation.maxradialdistance      = max([[popanalysis.bifurcation.piece.proximalradialdistance] [popanalysis.bifurcation.piece.distalradialdistance]]);
        popdata.bifurcation.minradialdistance      = min([[popanalysis.bifurcation.piece.proximalradialdistance] [popanalysis.bifurcation.piece.distalradialdistance]]);
        popdata.bifurcation.maxbranchlength        = max([[popanalysis.bifurcation.piece.proximalbranchlength] [popanalysis.bifurcation.piece.distalbranchlength]]);
        popdata.bifurcation.minbranchlength        = min([popanalysis.bifurcation.piece.distalbranchlength]);
        popdata.bifurcation.maxbranchorder         = max([popanalysis.bifurcation.piece.branchorder]);
        popdata.bifurcation.minbranchorder         = min([popanalysis.bifurcation.piece.branchorder]);
        popdata.bifurcation.maxtaperrate           = max([popanalysis.bifurcation.piece.taperrate]);
        popdata.bifurcation.meantaperrate          = sum([popanalysis.bifurcation.piece.taperrate].*[popanalysis.bifurcation.piece.length])/sum([popanalysis.bifurcation.piece.length]);
        popdata.bifurcation.mintaperrate           = min([popanalysis.bifurcation.piece.taperrate]);
        
        popdata.termination.maxdiameter            = max([[popanalysis.termination.piece.proximaldiameter] [popanalysis.termination.piece.distaldiameter]]);
        popdata.termination.mindiameter            = min([[popanalysis.termination.piece.proximaldiameter] [popanalysis.termination.piece.distaldiameter]]);
        popdata.termination.maxpathlength          = max([[popanalysis.termination.piece.proximalpathlength] [popanalysis.termination.piece.distalpathlength]]);
        popdata.termination.minpathlength          = min([[popanalysis.termination.piece.proximalpathlength] [popanalysis.termination.piece.distalpathlength]]);
        popdata.termination.maxradialdistance      = max([[popanalysis.termination.piece.proximalradialdistance] [popanalysis.termination.piece.distalradialdistance]]);
        popdata.termination.minradialdistance      = min([[popanalysis.termination.piece.proximalradialdistance] [popanalysis.termination.piece.distalradialdistance]]);
        popdata.termination.maxbranchlength        = max([[popanalysis.termination.piece.proximalbranchlength] [popanalysis.termination.piece.distalbranchlength]]);
        popdata.termination.minbranchlength        = min([popanalysis.termination.piece.distalbranchlength]);
        popdata.termination.maxbranchorder         = max([popanalysis.termination.piece.branchorder]);
        popdata.termination.minbranchorder         = min([popanalysis.termination.piece.branchorder]);
        popdata.termination.maxtaperrate           = max([popanalysis.termination.piece.taperrate]);
        popdata.termination.meantaperrate          = sum([popanalysis.termination.piece.taperrate].*[popanalysis.termination.piece.length])/sum([popanalysis.termination.piece.length]);
        popdata.termination.mintaperrate           = min([popanalysis.termination.piece.taperrate]);
        
        popdata.maxdiameter                        = max([[popdata.bifurcation.maxdiameter] [popdata.termination.maxdiameter]]);
        popdata.mindiameter                        = min([[popdata.bifurcation.mindiameter] [popdata.termination.mindiameter]]);
        popdata.maxpathlength                      = max([[popdata.bifurcation.maxpathlength] [popdata.termination.maxpathlength]]);
        popdata.minpathlength                      = min([[popdata.bifurcation.minpathlength] [popdata.termination.minpathlength]]);
        popdata.maxradialdistance                  = max([[popdata.bifurcation.maxradialdistance] [popdata.termination.maxradialdistance]]);
        popdata.minradialdistance                  = min([[popdata.bifurcation.minradialdistance] [popdata.termination.minradialdistance]]);
        popdata.maxbranchlength                    = max([[popdata.bifurcation.maxbranchlength] [popdata.termination.maxbranchlength]]);
        popdata.minbranchlength                    = min([[popdata.bifurcation.minbranchlength] [popdata.termination.minbranchlength]]);
        popdata.maxbranchorder                     = max([[popanalysis.bifurcation.piece.branchorder] [popanalysis.termination.piece.branchorder]]);
        popdata.minbranchorder                     = min([[popanalysis.bifurcation.piece.branchorder] [popanalysis.termination.piece.branchorder]]);
        popdata.maxtaperrate                       = max([[popanalysis.bifurcation.piece.taperrate] [popanalysis.termination.piece.taperrate]]);
        popdata.meantaperrate                      = sum([[popanalysis.bifurcation.piece.taperrate] [popanalysis.termination.piece.taperrate]].*[[popanalysis.bifurcation.piece.length] [popanalysis.termination.piece.length]])/sum([[popanalysis.bifurcation.piece.length] [popanalysis.termination.piece.length]]);
        popdata.mintaperrate                       = min([[popanalysis.bifurcation.piece.taperrate] [popanalysis.termination.piece.taperrate]]);
        
        popanalysis.bifurcation.popmaxdiameter            = popdata.bifurcation.maxdiameter;
        popanalysis.bifurcation.popmindiameter            = popdata.bifurcation.mindiameter;
        popanalysis.bifurcation.popmaxpathlength          = popdata.bifurcation.maxpathlength;
        popanalysis.bifurcation.popminpathlength          = popdata.bifurcation.minpathlength;
        popanalysis.bifurcation.popmaxradialdistance      = popdata.bifurcation.maxradialdistance;
        popanalysis.bifurcation.popminradialdistance      = popdata.bifurcation.minradialdistance;
        popanalysis.bifurcation.popmaxbranchlength        = popdata.bifurcation.maxbranchlength;
        popanalysis.bifurcation.popminbranchlength        = popdata.bifurcation.minbranchlength;
        popanalysis.bifurcation.popmaxbranchorder         = popdata.bifurcation.maxbranchorder;
        popanalysis.bifurcation.popminbranchorder         = popdata.bifurcation.minbranchorder;
        popanalysis.bifurcation.popmaxtaperrate           = popdata.bifurcation.maxtaperrate;
        popanalysis.bifurcation.popmeantaperrate          = popdata.bifurcation.meantaperrate;
        popanalysis.bifurcation.popmintaperrate           = popdata.bifurcation.mintaperrate;
        
        popanalysis.termination.popmaxdiameter            = popdata.termination.maxdiameter;
        popanalysis.termination.popmindiameter            = popdata.termination.mindiameter;
        popanalysis.termination.popmaxpathlength          = popdata.termination.maxpathlength;
        popanalysis.termination.popminpathlength          = popdata.termination.minpathlength;
        popanalysis.termination.popmaxradialdistance      = popdata.termination.maxradialdistance;
        popanalysis.termination.popminradialdistance      = popdata.termination.minradialdistance;
        popanalysis.termination.popmaxbranchlength        = popdata.termination.maxbranchlength;
        popanalysis.termination.popminbranchlength        = popdata.termination.minbranchlength;
        popanalysis.termination.popmaxbranchorder         = popdata.termination.maxbranchorder;
        popanalysis.termination.popminbranchorder         = popdata.termination.minbranchorder;
        popanalysis.termination.popmaxtaperrate           = popdata.termination.maxtaperrate;
        popanalysis.termination.popmeantaperrate          = popdata.termination.meantaperrate;
        popanalysis.termination.popmintaperrate           = popdata.termination.mintaperrate;
        
        popanalysis.popmaxdiameter                        = popdata.maxdiameter;
        popanalysis.popmindiameter                        = popdata.mindiameter;
        popanalysis.popmaxpathlength                      = popdata.maxpathlength;
        popanalysis.popminpathlength                      = popdata.minpathlength;
        popanalysis.popmaxradialdistance                  = popdata.maxradialdistance;
        popanalysis.popminradialdistance                  = popdata.minradialdistance;
        popanalysis.popmaxbranchlength                    = popdata.maxbranchlength;
        popanalysis.popminbranchlength                    = popdata.minbranchlength;
        popanalysis.popmaxbranchorder                     = popdata.maxbranchorder;
        popanalysis.popminbranchorder                     = popdata.minbranchorder;
        popanalysis.popmaxtaperrate                       = popdata.maxtaperrate;
        popanalysis.popmeantaperrate                      = popdata.meantaperrate;
        popanalysis.popmintaperrate                       = popdata.mintaperrate;
        
        eval(['data.population.' currentpiecetype '=popdata;']);
        clear popdata;
        eval(['analysis.' currentpiecetype '=popanalysis;']);
        clear popanalysis;
        
    end % end of piece type (if exist)
end     % end of piece type (for loop)
