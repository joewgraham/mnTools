function [data,analysis] = piecebinner(mnpop,data)
%Divides pieces into cables, primarydendritebins, branchorderbins,
%pathlengthbins, radialdistance bins, bifurcationbin, and terminationbin

data.datapathname       = mnpop.datapathname;
data.datetime           = mnpop.datetime;
data.inputfilename      = mnpop.inputfilename;

analysis.datapathname     = data.datapathname;
analysis.datetime         = data.datetime;
analysis.inputfilename    = data.inputfilename;

disp('   Piece binning started.');

% Pre-allocate the analysis data structure
data.individual(length(mnpop.mn)).somadiameter = [];

if length(data.diameterbinwidths)-1 ~= length(data.diameterbinbreaks)
    disp(' ');
    disp('Error: problem with diameter bins.');
    disp('See ''mnoptions.m''.                ');
    keyboard;
end   

for i=1:length(mnpop.mn)
% For every motoneuron in the population, do the following:
    
    % Begin filling in the data structure
    data.individual(i).somadiameter           = mnpop.mn(i).somadiameter;
    data.individual(i).xposition              = mnpop.mn(i).xposition;
    data.individual(i).yposition              = mnpop.mn(i).yposition;
    data.individual(i).zposition              = mnpop.mn(i).zposition;
    data.individual(i).numberprimarydendrites = mnpop.mn(i).numberprimarydendrites;
    data.individual(i).numbersegments         = mnpop.mn(i).piece(length(mnpop.mn(i).piece)).cable - 1;
    data.individual(i).maxbranchorder         = 0;
    data.individual(i).minbranchorder         = inf;
    data.individual(i).totallength            = 0;
    data.individual(i).totalsurfacearea       = 0;
    data.individual(i).totalvolume            = 0;
    data.individual(i).numberterminations     = 0;
    data.individual(i).numberbifurcations     = 0;
    data.individual(i).maxdiameter            = max([[mnpop.mn(i).piece(2:end).proximaldiameter] [mnpop.mn(i).piece(2:end).distaldiameter]]);
    data.individual(i).mindiameter            = min([[mnpop.mn(i).piece(2:end).proximaldiameter] [mnpop.mn(i).piece(2:end).distaldiameter]]);
    data.individual(i).maxpathlength          = max([[mnpop.mn(i).piece(2:end).proximalpathlength] [mnpop.mn(i).piece(2:end).distalpathlength]]);
    data.individual(i).maxradialdistance      = max([[mnpop.mn(i).piece(2:end).proximalradialdistance] [mnpop.mn(i).piece(2:end).distalradialdistance]]);
    data.individual(i).maxbranchlength        = max([[mnpop.mn(i).piece(2:end).proximalbranchlength] [mnpop.mn(i).piece(2:end).distalbranchlength]]);
		
   
   
    % Create the diameter bins
    data.individual(i).diameterbinedges   = 0:(data.diameterbinwidths(1)):data.diameterbinbreaks(1);
    data.individual(i).diameterbinmiddles = data.individual(i).diameterbinedges(1:(length(data.individual(i).diameterbinedges)-1)) + (data.diameterbinwidths(1)/2);
	if length(data.diameterbinbreaks) > 1	
		for binbreaks = 1:length(data.diameterbinbreaks)-1
			newbinedges   = data.diameterbinbreaks(binbreaks)+data.diameterbinwidths(binbreaks+1):data.diameterbinwidths(binbreaks+1):data.diameterbinbreaks(binbreaks+1);
			newbinmiddles = newbinedges(1:(length(newbinedges))) - (data.diameterbinwidths(binbreaks+1))/2;
			data.individual(i).diameterbinedges   = [data.individual(i).diameterbinedges newbinedges];
			data.individual(i).diameterbinmiddles = [data.individual(i).diameterbinmiddles newbinmiddles];
		end
	end
	newbinedges   = data.diameterbinbreaks(length(data.diameterbinbreaks))+data.diameterbinwidths(length(data.diameterbinwidths)):data.diameterbinwidths(length(data.diameterbinwidths)):(floor(data.individual(i).maxdiameter/data.diameterbinwidths(length(data.diameterbinwidths)))*data.diameterbinwidths(length(data.diameterbinwidths)))+data.diameterbinwidths(length(data.diameterbinwidths));
	newbinmiddles = newbinedges(1:(length(newbinedges))) - (data.diameterbinwidths(end))/2;
	data.individual(i).diameterbinedges = [data.individual(i).diameterbinedges newbinedges];
	data.individual(i).diameterbinmiddles = [data.individual(i).diameterbinmiddles newbinmiddles];
	
    % Make the population diameter bins equal to the largest individual diameter bins
    if i == 1
        data.population.diameterbinedges   = data.individual(i).diameterbinedges;
        data.population.diameterbinmiddles = data.individual(i).diameterbinmiddles;
        lengths = length(data.individual(i).diameterbinedges);
    elseif i > 1
        lengths = [lengths length(data.individual(i).diameterbinedges)];
        if length(data.individual(i).diameterbinedges) >= max(lengths)
            data.population.diameterbinedges   = data.individual(i).diameterbinedges;
            data.population.diameterbinmiddles = data.individual(i).diameterbinmiddles;
        end
    end
      
    % Pre-allocate the individual diameter bins
    for diameterbins = 1:length(data.individual(i).diameterbinmiddles)
        data.individual(i).diameterbins(diameterbins).length = [];
        data.individual(i).bifurcation.diameterbins(diameterbins).length = [];
        data.individual(i).termination.diameterbins(diameterbins).length = [];      
    end
end

% Pre-allocate the population diameter bins
for diameterbins = 1:length(data.population.diameterbinmiddles)
    data.population.diameterbins(diameterbins).length = [];
    data.population.bifurcation.diameterbins(diameterbins).length = [];
    data.population.termination.diameterbins(diameterbins).length = [];      
end

% Define the population path length bin middles
maxpathlengthbin = 1 + floor(max([data.individual.maxpathlength]) / data.distancebinwidth);
for pathlengthbins = 1:maxpathlengthbin
    data.population.pathlengthbinmiddles(pathlengthbins) = (pathlengthbins * data.distancebinwidth) - (data.distancebinwidth / 2);
end

% Define the population branch length bin middles
maxbranchlengthbin = 1 + floor(max([data.individual.maxbranchlength]) / data.branchlengthbinwidth);
for branchlengthbins = 1:maxbranchlengthbin
    data.population.branchlengthbinmiddles(branchlengthbins) = (branchlengthbins * data.branchlengthbinwidth) - (data.branchlengthbinwidth / 2);
end



for i=1:length(mnpop.mn)
% For every motoneuron in the population, do the following:

    for j=2:length(mnpop.mn(i).piece)
    % For every piece in this motoneuron, do the following:
        
        % Determine which bins the current piece falls into
        currentcablebin                  = mnpop.mn(i).piece(j).cable; %-1;
        currentprimarydendritebin        = mnpop.mn(i).piece(j).primarydendrite;
        currentbranchorderbin            = mnpop.mn(i).piece(j).branchorder;
        currentproximalpathlength        = mnpop.mn(i).piece(j).proximalpathlength;
        currentdistalpathlength          = mnpop.mn(i).piece(j).distalpathlength;
        currentproximalpathlengthbin     = 1 + floor(currentproximalpathlength / data.distancebinwidth);
        currentdistalpathlengthbin       = 1 + floor(currentdistalpathlength / data.distancebinwidth);
        currentproximalradialdistance    = mnpop.mn(i).piece(j).proximalradialdistance;
        currentdistalradialdistance      = mnpop.mn(i).piece(j).distalradialdistance;
        currentproximalradialdistancebin = 1 + floor(currentproximalradialdistance / data.distancebinwidth);
        currentdistalradialdistancebin   = 1 + floor(currentdistalradialdistance / data.distancebinwidth);
        currentproximaldiameter          = mnpop.mn(i).piece(j).proximaldiameter;
        currentdistaldiameter            = mnpop.mn(i).piece(j).distaldiameter;
		currentproximalbranchlength        = mnpop.mn(i).piece(j).proximalbranchlength;
        currentdistalbranchlength          = mnpop.mn(i).piece(j).distalbranchlength;
        currentproximalbranchlengthbin     = 1 + floor(currentproximalbranchlength / data.branchlengthbinwidth);
        currentdistalbranchlengthbin       = 1 + floor(currentdistalbranchlength / data.branchlengthbinwidth);
        for diameterbin = 1:length(data.individual(i).diameterbinmiddles)
            if currentproximaldiameter > data.individual(i).diameterbinedges(diameterbin) && currentproximaldiameter <= data.individual(i).diameterbinedges(diameterbin+1)
                currentproximaldiameterbin = diameterbin;
            end
            if currentdistaldiameter > data.individual(i).diameterbinedges(diameterbin) && currentdistaldiameter <= data.individual(i).diameterbinedges(diameterbin+1)
                currentdistaldiameterbin   = diameterbin; %clear diameterbin;
            end
        end
        clear diameterbin;
        
        % Put the piece into the appropriate cable bin   
        
        if     isfield(data.individual(i),'cablebins')==0; nextpiece = 1;
        elseif currentcablebin > length(data.individual(i).cablebins); nextpiece = 1;
        elseif isfield(data.individual(i).cablebins(currentcablebin),'piece')==0; nextpiece = 1;    
        else nextpiece = 1 + length(data.individual(i).cablebins(currentcablebin).piece); 
        end;
        data.individual(i).cablebins(currentcablebin).piece(nextpiece) = mnpop.mn(i).piece(j); 
        clear nextpiece;

        
        % Put the piece into the appropriate diameter bin
        if currentdistaldiameterbin < currentproximaldiameterbin
            diameterstep = -1;
        else
            diameterstep = 1;
        end
        
        for diameterbin = currentproximaldiameterbin:diameterstep:currentdistaldiameterbin
        % Repeat for as many partial pieces as there will end up being    
        
            if     isfield(data.individual(i),'diameterbins')==0; nextpiece = 1; 
            elseif isfield(data.individual(i).diameterbins(diameterbin),'piece')==0; nextpiece = 1;
            else nextpiece = 1 + length(data.individual(i).diameterbins(diameterbin).piece); 
            end;
            
            temppiece = setfield(mnpop.mn(i).piece(j),'partial','n');
            data.individual(i).diameterbins(diameterbin).piece(nextpiece) = temppiece;
            
            clear temppiece;
            
            % If the piece lies in two or more diameter bins, split the piece and bin the current partial piece
            
            if currentdistaldiameterbin < currentproximaldiameterbin
            % If the distal diameter is less than the proximal diameter
                
                data.individual(i).diameterbins(diameterbin).piece(nextpiece).partial = 'y';
                
                if diameterbin == currentproximaldiameterbin
                % If this partial piece is in the proximal diameter bin
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaltype           = [];
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).rallratio            = [];
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).rallratio1           = [];
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).rallratio2           = [];
					data.individual(i).diameterbins(diameterbin).piece(nextpiece).rallratio3           = [];
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).daughterratio        = [];
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).parentdaughterratio  = [];
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).parentdaughter2ratio = [];
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = mnpop.mn(i).piece(j).proximaldiameter;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter       = data.individual(i).diameterbinedges(diameterbin);  
                    if data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter > data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                        disp('Error.  Distal diameter is greater than proximal diameter.');
                        keyboard;
                    end
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).length               = (data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter-data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter)/mnpop.mn(i).piece(j).taperrate;
                    if data.individual(i).diameterbins(diameterbin).piece(nextpiece).length > 1.01 * mnpop.mn(i).piece(j).length || data.individual(i).diameterbins(diameterbin).piece(nextpiece).length < 0
                        disp('Error.  Partial piece length is greater than piece length.');
                        disp(sprintf('Partial Length: %f',data.individual(i).diameterbins(diameterbin).piece(nextpiece).length));
                        disp(sprintf('Total Length:   %f',mnpop.mn(i).piece(j).length));
                        keyboard;
                    end
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).surfacearea          = pi*((data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).volume               = (pi/12)*data.individual(i).diameterbins(diameterbin).piece(nextpiece).length*(data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter*data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter+data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);                    
                    
                    [xdirection, ydirection, zdirection]                                               = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).distalxposition      = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).diameterbins(diameterbin).piece(nextpiece).length;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).distalyposition      = mnpop.mn(i).piece(j).proximalyposition + ydirection * data.individual(i).diameterbins(diameterbin).piece(nextpiece).length;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).distalzposition      = mnpop.mn(i).piece(j).proximalzposition + zdirection * data.individual(i).diameterbins(diameterbin).piece(nextpiece).length;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).distalpathlength     = data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalpathlength + data.individual(i).diameterbins(diameterbin).piece(nextpiece).length;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).distalradialdistance = ( (data.individual(i).diameterbins(diameterbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                         + (data.individual(i).diameterbins(diameterbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                         + (data.individual(i).diameterbins(diameterbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                    
%                     disp(' ');
%                     disp('Distal diameter bin is smaller than proximal diameter bin.'); 
%                     disp(sprintf('  Piece ID: %.0f',j));
%                     disp(sprintf('    Length   : %.2f',mnpop.mn(i).piece(j).length));
%                     disp(sprintf('    Prox Diam: %.2f',mnpop.mn(i).piece(j).proximaldiameter));
%                     disp(sprintf('    Dist Diam: %.2f',mnpop.mn(i).piece(j).distaldiameter)); 
%                     
%                     disp(sprintf('  Partial piece ID %.0f falling into the proximal bin.',j));             
%                     disp(sprintf('    Which has edges %.2f:%.2f',data.individual(i).diameterbinedges(diameterbin),data.individual(i).diameterbinedges(diameterbin+1)));
%                     disp(sprintf('      Partial Length   : %.2f',data.individual(i).diameterbins(diameterbin).piece(nextpiece).length));
%                     disp(sprintf('      Partial Prox Diam: %.2f',data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter));
%                     disp(sprintf('      Partial Dist Diam: %.2f',data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter));
                                                                                                                       
                                                                                                     
                elseif diameterbin < currentproximaldiameterbin && diameterbin > currentdistaldiameterbin
                % If this partial piece falls between the proximal and distal diameter bins
                    
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaltype           = [];
					data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaltype         = [];
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).rallratio            = [];
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).rallratio1           = [];
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).rallratio2           = [];
					data.individual(i).diameterbins(diameterbin).piece(nextpiece).rallratio3           = [];
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).daughterratio        = [];
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).parentdaughterratio  = [];
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).parentdaughter2ratio = [];
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = data.individual(i).diameterbinedges(diameterbin+1);
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter       = data.individual(i).diameterbinedges(diameterbin);
                    if data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter > data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                        disp('Error.  Distal diameter is greater than proximal diameter.');
                        keyboard;
                    end
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).length               = (data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter-data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter)/mnpop.mn(i).piece(j).taperrate;
                    if data.individual(i).diameterbins(diameterbin).piece(nextpiece).length > 1.01 * mnpop.mn(i).piece(j).length || data.individual(i).diameterbins(diameterbin).piece(nextpiece).length < 0
                        disp('Error.  Partial piece length is greater than piece length.');
                        disp(sprintf('Partial Length: %f',data.individual(i).diameterbins(diameterbin).piece(nextpiece).length));
                        disp(sprintf('Total Length:   %f',mnpop.mn(i).piece(j).length));
                        keyboard;
                    end
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).surfacearea            = pi*((data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).volume                 = (pi/12)*data.individual(i).diameterbins(diameterbin).piece(nextpiece).length*(data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter*data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter+data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);                    
                    
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalxposition      = data.individual(i).diameterbins(diameterbin+1).piece(end).distalxposition;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalyposition      = data.individual(i).diameterbins(diameterbin+1).piece(end).distalyposition;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalzposition      = data.individual(i).diameterbins(diameterbin+1).piece(end).distalzposition;
                    [xdirection, ydirection, zdirection]                                                 = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).distalxposition        = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).diameterbins(diameterbin).piece(nextpiece).length;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).distalyposition        = mnpop.mn(i).piece(j).proximalxposition + ydirection * data.individual(i).diameterbins(diameterbin).piece(nextpiece).length;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).distalzposition        = mnpop.mn(i).piece(j).proximalxposition + zdirection * data.individual(i).diameterbins(diameterbin).piece(nextpiece).length;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalpathlength     = data.individual(i).diameterbins(diameterbin+1).piece(end).distalpathlength;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).distalpathlength       = data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalpathlength + data.individual(i).diameterbins(diameterbin).piece(nextpiece).length;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                         + (data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                         + (data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).distalradialdistance = ( (data.individual(i).diameterbins(diameterbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                         + (data.individual(i).diameterbins(diameterbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                         + (data.individual(i).diameterbins(diameterbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                    
                                                                                                     
%                     disp(sprintf('  Partial piece ID %.0f falling into a middle bin.',j));             
%                     disp(sprintf('    Which has edges %.2f:%.2f',data.individual(i).diameterbinedges(diameterbin),data.individual(i).diameterbinedges(diameterbin+1)));
%                     disp(sprintf('      Partial Length   : %.2f',data.individual(i).diameterbins(diameterbin).piece(nextpiece).length));
%                     disp(sprintf('      Partial Prox Diam: %.2f',data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter));
%                     disp(sprintf('      Partial Dist Diam: %.2f',data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter));
                                                                                 
                elseif diameterbin == currentdistaldiameterbin
                % If this partial piece falls in the distal diameter bin
                
					data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaltype         = [];
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = data.individual(i).diameterbinedges(diameterbin+1);
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter       = mnpop.mn(i).piece(j).distaldiameter;
                    if data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter > data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                        disp('Error.  Distal diameter is greater than proximal diameter.');
                        keyboard;
                    end
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).length               = (data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter-data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter)/mnpop.mn(i).piece(j).taperrate;
                    if data.individual(i).diameterbins(diameterbin).piece(nextpiece).length > 1.01 * mnpop.mn(i).piece(j).length || data.individual(i).diameterbins(diameterbin).piece(nextpiece).length < 0
                        disp('Error.  Partial piece length is greater than piece length.');
                        disp(sprintf('Partial Length: %f',data.individual(i).diameterbins(diameterbin).piece(nextpiece).length));
                        disp(sprintf('Total Length:   %f',mnpop.mn(i).piece(j).length));
                        keyboard;
                    end
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).surfacearea          = pi*((data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).volume               = (pi/12)*data.individual(i).diameterbins(diameterbin).piece(nextpiece).length*(data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter*data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter+data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);                    
                
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalxposition      = data.individual(i).diameterbins(diameterbin+1).piece(end).distalxposition;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalyposition      = data.individual(i).diameterbins(diameterbin+1).piece(end).distalyposition;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalzposition      = data.individual(i).diameterbins(diameterbin+1).piece(end).distalzposition;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalpathlength     = data.individual(i).diameterbins(diameterbin+1).piece(end).distalpathlength;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                         + (data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                         + (data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                    
%                     disp(sprintf('  Partial piece ID %.0f falling into the distal bin.',j));             
%                     disp(sprintf('    Which has edges %.2f:%.2f',data.individual(i).diameterbinedges(diameterbin),data.individual(i).diameterbinedges(diameterbin+1)));
%                     disp(sprintf('      Partial Length   : %.2f',data.individual(i).diameterbins(diameterbin).piece(nextpiece).length));
%                     disp(sprintf('      Partial Prox Diam: %.2f',data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter));
%                     disp(sprintf('      Partial Dist Diam: %.2f',data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter));
                
                else disp('Error.  See piecebinner.m line 291.');
                end
                               
            elseif currentdistaldiameterbin > currentproximaldiameterbin
            % If the distal diameter is greater than the proximal diameter
                
                %disp('Distal diameter is greater than proximal diameter.');
                data.individual(i).diameterbins(diameterbin).piece(nextpiece).partial = 'y';
                
                if diameterbin == currentproximaldiameterbin
                % If this partial piece is in the proximal diameter bin
                
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaltype           = [];
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).rallratio            = [];
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).rallratio1           = [];
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).rallratio2           = [];
					data.individual(i).diameterbins(diameterbin).piece(nextpiece).rallratio3           = [];
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).daughterratio        = [];
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).parentdaughterratio  = [];
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).parentdaughter2ratio = [];
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = mnpop.mn(i).piece(j).proximaldiameter;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter       = data.individual(i).diameterbinedges(diameterbin+1);
                    if data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter < data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                        disp('Error.  Distal diameter is less than proximal diameter.');
                        keyboard;
                    end
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).length               = (data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter-data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter)/mnpop.mn(i).piece(j).taperrate;
                    if data.individual(i).diameterbins(diameterbin).piece(nextpiece).length > 1.01 * mnpop.mn(i).piece(j).length || data.individual(i).diameterbins(diameterbin).piece(nextpiece).length < 0
                        disp('Error.  Partial piece length is greater than piece length.');
                        disp(sprintf('Partial Length: %f',data.individual(i).diameterbins(diameterbin).piece(nextpiece).length));
                        disp(sprintf('Total Length:   %f',mnpop.mn(i).piece(j).length));
                        keyboard;
                    end
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).surfacearea          = pi*((data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).volume               = (pi/12)*data.individual(i).diameterbins(diameterbin).piece(nextpiece).length*(data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter*data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter+data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);                    
                
                    [xdirection, ydirection, zdirection]                                               = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).distalxposition      = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).diameterbins(diameterbin).piece(nextpiece).length;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).distalyposition      = mnpop.mn(i).piece(j).proximalyposition + ydirection * data.individual(i).diameterbins(diameterbin).piece(nextpiece).length;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).distalzposition      = mnpop.mn(i).piece(j).proximalzposition + zdirection * data.individual(i).diameterbins(diameterbin).piece(nextpiece).length;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).distalpathlength     = data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalpathlength + data.individual(i).diameterbins(diameterbin).piece(nextpiece).length;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).distalradialdistance = ( (data.individual(i).diameterbins(diameterbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                         + (data.individual(i).diameterbins(diameterbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                         + (data.individual(i).diameterbins(diameterbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                    
%                     disp(' ');
%                     disp('Distal diameter bin is larger than proximal diameter bin.'); 
%                     disp(sprintf('  Piece ID: %.0f',j));
%                     disp(sprintf('    Length   : %.2f',mnpop.mn(i).piece(j).length));
%                     disp(sprintf('    Prox Diam: %.2f',mnpop.mn(i).piece(j).proximaldiameter));
%                     disp(sprintf('    Dist Diam: %.2f',mnpop.mn(i).piece(j).distaldiameter)); 
%                     
%                     disp(sprintf('  Partial piece ID %.0f falling into the proximal bin.',j));             
%                     disp(sprintf('    Which has edges %.2f:%.2f',data.individual(i).diameterbinedges(diameterbin),data.individual(i).diameterbinedges(diameterbin+1)));
%                     disp(sprintf('      Partial Length   : %.2f',data.individual(i).diameterbins(diameterbin).piece(nextpiece).length));
%                     disp(sprintf('      Partial Prox Diam: %.2f',data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter));
%                     disp(sprintf('      Partial Dist Diam: %.2f',data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter));
                
                elseif diameterbin > currentproximaldiameterbin && diameterbin < currentdistaldiameterbin
                % If this partial piece falls between the proximal and distal diameter bins    
                
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaltype         = [];
					data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaltype           = [];
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).rallratio            = [];
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).rallratio1           = [];
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).rallratio2           = [];
					data.individual(i).diameterbins(diameterbin).piece(nextpiece).rallratio3           = [];
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).daughterratio        = [];
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).parentdaughterratio  = [];
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).parentdaughter2ratio = [];
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = data.individual(i).diameterbinedges(diameterbin);
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter       = data.individual(i).diameterbinedges(diameterbin+1);
                    if data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter < data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                        disp('Error.  Distal diameter is less than proximal diameter.');
                        keyboard;
                    end
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).length               = (data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter-data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter)/mnpop.mn(i).piece(j).taperrate;
                    if data.individual(i).diameterbins(diameterbin).piece(nextpiece).length > 1.01 * mnpop.mn(i).piece(j).length || data.individual(i).diameterbins(diameterbin).piece(nextpiece).length < 0
                        disp('Error.  Partial piece length is greater than piece length.');
                        disp(sprintf('Partial Length: %f',data.individual(i).diameterbins(diameterbin).piece(nextpiece).length));
                        disp(sprintf('Total Length:   %f',mnpop.mn(i).piece(j).length));
                        keyboard;
                    end
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).surfacearea          = pi*((data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).volume               = (pi/12)*data.individual(i).diameterbins(diameterbin).piece(nextpiece).length*(data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter*data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter+data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);                    
                
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalxposition      = data.individual(i).diameterbins(diameterbin-1).piece(end).distalxposition;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalyposition      = data.individual(i).diameterbins(diameterbin-1).piece(end).distalyposition;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalzposition      = data.individual(i).diameterbins(diameterbin-1).piece(end).distalzposition;
                    [xdirection, ydirection, zdirection]                                                 = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).distalxposition        = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).diameterbins(diameterbin).piece(nextpiece).length;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).distalyposition        = mnpop.mn(i).piece(j).proximalyposition + ydirection * data.individual(i).diameterbins(diameterbin).piece(nextpiece).length;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).distalzposition        = mnpop.mn(i).piece(j).proximalzposition + zdirection * data.individual(i).diameterbins(diameterbin).piece(nextpiece).length;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalpathlength     = data.individual(i).diameterbins(diameterbin-1).piece(end).distalpathlength;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).distalpathlength       = data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalpathlength + data.individual(i).diameterbins(diameterbin).piece(nextpiece).length;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                         + (data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                         + (data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).distalradialdistance = ( (data.individual(i).diameterbins(diameterbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                         + (data.individual(i).diameterbins(diameterbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                         + (data.individual(i).diameterbins(diameterbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;

                    
%                     disp(sprintf('  Partial piece ID %.0f falling into a middle bin.',j));             
%                     disp(sprintf('    Which has edges %.2f:%.2f',data.individual(i).diameterbinedges(diameterbin),data.individual(i).diameterbinedges(diameterbin+1)));
%                     disp(sprintf('      Partial Length   : %.2f',data.individual(i).diameterbins(diameterbin).piece(nextpiece).length));
%                     disp(sprintf('      Partial Prox Diam: %.2f',data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter));
%                     disp(sprintf('      Partial Dist Diam: %.2f',data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter));
                
                elseif diameterbin == currentdistaldiameterbin
                % If the piece falls in the distal diameter bin
                
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaltype         = [];
					data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = data.individual(i).diameterbinedges(diameterbin);
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter       = mnpop.mn(i).piece(j).distaldiameter;
                    if data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter < data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                        disp('Error.  Distal diameter is less than proximal diameter.');
                        keyboard;
                    end
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).length               = (data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter-data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter)/mnpop.mn(i).piece(j).taperrate;
                    if data.individual(i).diameterbins(diameterbin).piece(nextpiece).length > 1.01 * mnpop.mn(i).piece(j).length || data.individual(i).diameterbins(diameterbin).piece(nextpiece).length < 0
                        disp('Error.  Partial piece length is greater than piece length.');
                        disp(sprintf('Partial Length: %f',data.individual(i).diameterbins(diameterbin).piece(nextpiece).length));
                        disp(sprintf('Total Length:   %f',mnpop.mn(i).piece(j).length));
                        keyboard;
                    end
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).surfacearea          = pi*((data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).volume               = (pi/12)*data.individual(i).diameterbins(diameterbin).piece(nextpiece).length*(data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter*data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter+data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);                    
                
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalxposition      = data.individual(i).diameterbins(diameterbin-1).piece(end).distalxposition;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalyposition      = data.individual(i).diameterbins(diameterbin-1).piece(end).distalyposition;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalzposition      = data.individual(i).diameterbins(diameterbin-1).piece(end).distalzposition;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalpathlength     = data.individual(i).diameterbins(diameterbin-1).piece(end).distalpathlength;
                    data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                         + (data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                         + (data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                    
%                     disp(sprintf('  Partial piece ID %.0f falling into the distal bin.',j));             
%                     disp(sprintf('    Which has edges %.2f:%.2f',data.individual(i).diameterbinedges(diameterbin),data.individual(i).diameterbinedges(diameterbin+1)));
%                     disp(sprintf('      Partial Length   : %.2f',data.individual(i).diameterbins(diameterbin).piece(nextpiece).length));
%                     disp(sprintf('      Partial Prox Diam: %.2f',data.individual(i).diameterbins(diameterbin).piece(nextpiece).proximaldiameter));
%                     disp(sprintf('      Partial Dist Diam: %.2f',data.individual(i).diameterbins(diameterbin).piece(nextpiece).distaldiameter));
                
                else disp('Error: see piecebinner.m line 364.');
                end
            end
        end
        
        % Put the piece into the appropriate path length bin      
        
        for pathlengthbin = currentproximalpathlengthbin:currentdistalpathlengthbin
        % Repeat for as many partial pieces as there will end up being 

            if     isfield(data.individual(i),'pathlengthbins')==0; nextpiece = 1;
            elseif pathlengthbin > length(data.individual(i).pathlengthbins); nextpiece = 1;
            elseif isfield(data.individual(i).pathlengthbins(pathlengthbin),'piece')==0; nextpiece = 1;
            else nextpiece = 1 + length(data.individual(i).pathlengthbins(pathlengthbin).piece);
            end

            temppiece = setfield(mnpop.mn(i).piece(j),'partial','n');
            data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece) = temppiece;
            clear temppiece;

            if currentdistalpathlengthbin ~= currentproximalpathlengthbin
            % If the piece lies in two or more path length bins, split the piece and bin the current partial piece
            
                data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).partial = 'y';
                
                if pathlengthbin == currentproximalpathlengthbin
                % If the current partial piece falls in the proximal path length bin
                    
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).distaltype           = [];
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio            = [];
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio1           = [];
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio2           = [];
					data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio3           = [];
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).daughterratio        = [];
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).parentdaughterratio  = [];
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).parentdaughter2ratio = [];
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).length               = (pathlengthbin*data.distancebinwidth) - mnpop.mn(i).piece(j).proximalpathlength;
                    %data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter       = mnpop.mn(i).piece(j).proximaldiameter - (mnpop.mn(i).piece(j).taperrate * data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).length);
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter       = mnpop.mn(i).piece(j).proximaldiameter - ((  (mnpop.mn(i).piece(j).proximaldiameter - mnpop.mn(i).piece(j).distaldiameter)/mnpop.mn(i).piece(j).length  ) * data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).length);
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea          = pi*((data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).volume               = (pi/12)*data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).length*(data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);
                    
                    [xdirection, ydirection, zdirection]                                               = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition      = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition      = mnpop.mn(i).piece(j).proximalyposition + ydirection * data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition      = mnpop.mn(i).piece(j).proximalzposition + zdirection * data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).distalpathlength     = data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength + data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).distalradialdistance = ( (data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                         + (data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                         + (data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                    
                    
                elseif pathlengthbin > currentproximalpathlengthbin && pathlengthbin < currentdistalpathlengthbin
                % If the current partial piece falls between the proximal and distal path length bins
                    
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximaltype         = [];
					data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).distaltype           = [];
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio            = [];
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio1           = [];
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio2           = [];
					data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio3           = [];
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).daughterratio        = [];
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).parentdaughterratio  = [];
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).parentdaughter2ratio = [];
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).length               = data.distancebinwidth;
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter     = data.individual(i).pathlengthbins(pathlengthbin-1).piece(length(data.individual(i).pathlengthbins(pathlengthbin-1).piece)).distaldiameter;
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter       = data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter - ((  (mnpop.mn(i).piece(j).proximaldiameter - mnpop.mn(i).piece(j).distaldiameter)/mnpop.mn(i).piece(j).length  ) * data.distancebinwidth);
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea          = pi*((data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).volume               = (pi/12)*data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).length*(data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);
                
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition      = data.individual(i).pathlengthbins(pathlengthbin-1).piece(end).distalxposition;
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition      = data.individual(i).pathlengthbins(pathlengthbin-1).piece(end).distalyposition;
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition      = data.individual(i).pathlengthbins(pathlengthbin-1).piece(end).distalzposition;
                    [xdirection, ydirection, zdirection]                                                     = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition        = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition        = mnpop.mn(i).piece(j).proximalxposition + ydirection * data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition        = mnpop.mn(i).piece(j).proximalxposition + zdirection * data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength     = data.individual(i).pathlengthbins(pathlengthbin-1).piece(end).distalpathlength;
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).distalpathlength       = data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength + data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                               + (data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                               + (data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).distalradialdistance = ( (data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                             + (data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                             + (data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                    
                    
                elseif pathlengthbin == currentdistalpathlengthbin
                % If the current partial piece falls in the distal path length bin
                    
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximaltype     = [];
					data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).length           = mnpop.mn(i).piece(j).distalpathlength - ((pathlengthbin-1)*data.distancebinwidth);
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter = data.individual(i).pathlengthbins(pathlengthbin-1).piece(length(data.individual(i).pathlengthbins(pathlengthbin-1).piece)).distaldiameter;
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea      = pi*((data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).volume           = (pi/12)*data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).length*(data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);
                
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition      = data.individual(i).pathlengthbins(pathlengthbin-1).piece(end).distalxposition;
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition      = data.individual(i).pathlengthbins(pathlengthbin-1).piece(end).distalyposition;
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition      = data.individual(i).pathlengthbins(pathlengthbin-1).piece(end).distalzposition;
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength     = data.individual(i).pathlengthbins(pathlengthbin-1).piece(end).distalpathlength;
                    data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                               + (data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                               + (data.individual(i).pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                    
                    
                end
            end
        end
  

        % Put the piece into the appropriate radial distance bin
        if currentdistalradialdistancebin < currentproximalradialdistancebin
            radialdistancestep = -1;
        else
            radialdistancestep = 1;
        end
        
        for radialdistancebin = currentproximalradialdistancebin:radialdistancestep:currentdistalradialdistancebin
        % Repeat for as many partial pieces as there will end up being 
            
            if isfield(data.individual(i),'radialdistancebins')==0; nextpiece = 1;
            elseif radialdistancebin > length(data.individual(i).radialdistancebins); nextpiece = 1;
            elseif isfield(data.individual(i).radialdistancebins(radialdistancebin),'piece')==0; nextpiece = 1;
            else nextpiece = 1 + length(data.individual(i).radialdistancebins(radialdistancebin).piece);
            end
            
            temppiece = setfield(mnpop.mn(i).piece(j),'partial','n');
            data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece) = temppiece;
            clear temppiece;
        
            if currentdistalradialdistancebin > currentproximalradialdistancebin
                data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).partial = 'y';
                if radialdistancebin == currentproximalradialdistancebin
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distaltype           = [];
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).rallratio            = [];
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).rallratio1           = [];
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).rallratio2           = [];
					data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).rallratio3           = [];
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).daughterratio        = [];
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).parentdaughterratio  = [];
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).parentdaughter2ratio = [];
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length               = ((radialdistancebin*data.distancebinwidth-mnpop.mn(i).piece(j).proximalradialdistance)/(mnpop.mn(i).piece(j).distalradialdistance-mnpop.mn(i).piece(j).proximalradialdistance))*mnpop.mn(i).piece(j).length;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter       = mnpop.mn(i).piece(j).proximaldiameter - ((  (mnpop.mn(i).piece(j).proximaldiameter - mnpop.mn(i).piece(j).distaldiameter)/mnpop.mn(i).piece(j).length  ) * data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length);
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea          = pi*((data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).volume               = (pi/12)*data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length*(data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);
                    
                    [xdirection, ydirection, zdirection]                                                           = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition      = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition      = mnpop.mn(i).piece(j).proximalyposition + ydirection * data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition      = mnpop.mn(i).piece(j).proximalzposition + zdirection * data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalpathlength     = data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength + data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalradialdistance = ( (data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                                     + (data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                                     + (data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                    
                    
                elseif radialdistancebin > currentproximalradialdistancebin && radialdistancebin < currentdistalradialdistancebin
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaltype         = [];
					data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distaltype           = [];
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).rallratio            = [];
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).rallratio1           = [];
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).rallratio2           = [];
					data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).rallratio3           = [];
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).daughterratio        = [];
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).parentdaughterratio  = [];
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).parentdaughter2ratio = [];
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length               = (data.distancebinwidth/(mnpop.mn(i).piece(j).distalradialdistance-mnpop.mn(i).piece(j).proximalradialdistance))*mnpop.mn(i).piece(j).length;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter     = data.individual(i).radialdistancebins(radialdistancebin-1).piece(length(data.individual(i).radialdistancebins(radialdistancebin-1).piece)).distaldiameter;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter       = data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter - ((  (mnpop.mn(i).piece(j).proximaldiameter - mnpop.mn(i).piece(j).distaldiameter)/mnpop.mn(i).piece(j).length  ) * data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length);
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea          = pi*((data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).volume               = (pi/12)*data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length*(data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);
                    
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition      = data.individual(i).radialdistancebins(radialdistancebin-1).piece(end).distalxposition;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition      = data.individual(i).radialdistancebins(radialdistancebin-1).piece(end).distalyposition;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition      = data.individual(i).radialdistancebins(radialdistancebin-1).piece(end).distalzposition;
                    [xdirection, ydirection, zdirection]                                                     = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition        = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition        = mnpop.mn(i).piece(j).proximalxposition + ydirection * data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition        = mnpop.mn(i).piece(j).proximalxposition + zdirection * data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength     = data.individual(i).radialdistancebins(radialdistancebin-1).piece(end).distalpathlength;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalpathlength       = data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength + data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                               + (data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                               + (data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalradialdistance = ( (data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                             + (data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                             + (data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                    
                    
                elseif radialdistancebin == currentdistalradialdistancebin
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaltype     = [];
					data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length           = ((mnpop.mn(i).piece(j).distalradialdistance-((radialdistancebin-1)*data.distancebinwidth))/(mnpop.mn(i).piece(j).distalradialdistance-mnpop.mn(i).piece(j).proximalradialdistance))*mnpop.mn(i).piece(j).length;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter = data.individual(i).radialdistancebins(radialdistancebin-1).piece(length(data.individual(i).radialdistancebins(radialdistancebin-1).piece)).distaldiameter;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea      = pi*((data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).volume           = (pi/12)*data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length*(data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);
                
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition      = data.individual(i).radialdistancebins(radialdistancebin-1).piece(end).distalxposition;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition      = data.individual(i).radialdistancebins(radialdistancebin-1).piece(end).distalyposition;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition      = data.individual(i).radialdistancebins(radialdistancebin-1).piece(end).distalzposition;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength     = data.individual(i).radialdistancebins(radialdistancebin-1).piece(end).distalpathlength;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                               + (data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                               + (data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                    
                    
                end
            
            elseif currentdistalradialdistancebin < currentproximalradialdistancebin
                data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).partial = 'y';
                if radialdistancebin == currentproximalradialdistancebin
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distaltype           = [];
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).rallratio            = [];
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).rallratio1           = [];
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).rallratio2           = [];
					data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).rallratio3           = [];
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).daughterratio        = [];
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).parentdaughterratio  = [];
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).parentdaughter2ratio = [];
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length               = ((mnpop.mn(i).piece(j).proximalradialdistance-((radialdistancebin-1)*data.distancebinwidth))/(mnpop.mn(i).piece(j).proximalradialdistance-mnpop.mn(i).piece(j).distalradialdistance))*mnpop.mn(i).piece(j).length;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter       = mnpop.mn(i).piece(j).proximaldiameter - ((  (mnpop.mn(i).piece(j).proximaldiameter - mnpop.mn(i).piece(j).distaldiameter)/mnpop.mn(i).piece(j).length  ) * data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length);
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea          = pi*((data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).volume               = (pi/12)*data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length*(data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);
                    
                    [xdirection, ydirection, zdirection]                                                           = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition      = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition      = mnpop.mn(i).piece(j).proximalyposition + ydirection * data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition      = mnpop.mn(i).piece(j).proximalzposition + zdirection * data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalpathlength     = data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength + data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalradialdistance = ( (data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                                     + (data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                                     + (data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                    
                    
%                     disp(' ');
%                     disp('Distal radial distance bin is smaller than proximal radialdistance bin.'); 
%                     disp(sprintf('  Piece ID: %.0f',j));
%                     disp(sprintf('    Length   : %.2f',mnpop.mn(i).piece(j).length));
%                     disp(sprintf('    Prox RD: %.2f',mnpop.mn(i).piece(j).proximalradialdistance));
%                     disp(sprintf('    Dist RD: %.2f',mnpop.mn(i).piece(j).distalradialdistance)); 
%                     
%                     disp(sprintf('  Partial piece ID %.0f falling into the proximal bin.',j));             
%                     disp(sprintf('    Which has edges %.2f:%.2f',(radialdistancebin*data.distancebinwidth)-data.distancebinwidth,radialdistancebin*data.distancebinwidth));
%                     disp(sprintf('      Partial Length : %.2f',data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length));
%                     disp(sprintf('      Partial Prox RD: %.2f',data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalradialdistance));
%                     disp(sprintf('      Partial Dist RD: %.2f',data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalradialdistance)); 
                                                                                                                 
                elseif radialdistancebin < currentproximalradialdistancebin && radialdistancebin > currentdistalradialdistancebin
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaltype         = [];
					data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distaltype           = [];
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).rallratio            = [];
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).rallratio1           = [];
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).rallratio2           = [];
					data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).rallratio3           = [];
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).daughterratio        = [];
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).parentdaughterratio  = [];
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).parentdaughter2ratio = [];
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length               = (data.distancebinwidth/(mnpop.mn(i).piece(j).proximalradialdistance-mnpop.mn(i).piece(j).distalradialdistance))*mnpop.mn(i).piece(j).length;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter     = data.individual(i).radialdistancebins(radialdistancebin+1).piece(length(data.individual(i).radialdistancebins(radialdistancebin+1).piece)).distaldiameter;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter       = data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter - ((  (mnpop.mn(i).piece(j).proximaldiameter - mnpop.mn(i).piece(j).distaldiameter)/mnpop.mn(i).piece(j).length  ) * data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length);
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea          = pi*((data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).volume               = (pi/12)*data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length*(data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);
                    
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition      = data.individual(i).radialdistancebins(radialdistancebin+1).piece(end).distalxposition;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition      = data.individual(i).radialdistancebins(radialdistancebin+1).piece(end).distalyposition;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition      = data.individual(i).radialdistancebins(radialdistancebin+1).piece(end).distalzposition;
                    [xdirection, ydirection, zdirection]                                                             = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition        = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition        = mnpop.mn(i).piece(j).proximalxposition + ydirection * data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition        = mnpop.mn(i).piece(j).proximalxposition + zdirection * data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength     = data.individual(i).radialdistancebins(radialdistancebin+1).piece(end).distalpathlength;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalpathlength       = data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength + data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                                       + (data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                                       + (data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalradialdistance = ( (data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                                     + (data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                                     + (data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                        
                    
%                     disp(sprintf('  Partial piece ID %.0f falling into a middle bin.',j));             
%                     disp(sprintf('    Which has edges %.2f:%.2f',(radialdistancebin*data.distancebinwidth)-data.distancebinwidth,radialdistancebin*data.distancebinwidth));
%                     disp(sprintf('      Partial Length : %.2f',data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length));
%                     disp(sprintf('      Partial Prox RD: %.2f',data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalradialdistance));
%                     disp(sprintf('      Partial Dist RD: %.2f',data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalradialdistance)); 
                
                elseif radialdistancebin == currentdistalradialdistancebin
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaltype     = [];
					data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length           = (((radialdistancebin*data.distancebinwidth)-mnpop.mn(i).piece(j).distalradialdistance)/(mnpop.mn(i).piece(j).proximalradialdistance-mnpop.mn(i).piece(j).distalradialdistance))*mnpop.mn(i).piece(j).length;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter = data.individual(i).radialdistancebins(radialdistancebin+1).piece(length(data.individual(i).radialdistancebins(radialdistancebin+1).piece)).distaldiameter;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea      = pi*((data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).volume           = (pi/12)*data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length*(data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);
                
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition      = data.individual(i).radialdistancebins(radialdistancebin+1).piece(end).distalxposition;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition      = data.individual(i).radialdistancebins(radialdistancebin+1).piece(end).distalyposition;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition      = data.individual(i).radialdistancebins(radialdistancebin+1).piece(end).distalzposition;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength     = data.individual(i).radialdistancebins(radialdistancebin+1).piece(end).distalpathlength;
                    data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                               + (data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                               + (data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                    
                   
%                     disp(sprintf('  Partial piece ID %.0f falling into distal bin.',j));             
%                     disp(sprintf('    Which has edges %.2f:%.2f',(radialdistancebin*data.distancebinwidth)-data.distancebinwidth,radialdistancebin*data.distancebinwidth));
%                     disp(sprintf('      Partial Length : %.2f',data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).length));
%                     disp(sprintf('      Partial Prox RD: %.2f',data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).proximalradialdistance));
%                     disp(sprintf('      Partial Dist RD: %.2f',data.individual(i).radialdistancebins(radialdistancebin).piece(nextpiece).distalradialdistance)); 
                                                                                                           
                                                                                                           
                end
            end
        end        
        
		
		
		
		
		
		
		
		% Put the piece into the appropriate branch length bin  
		
        for branchlengthbin = currentproximalbranchlengthbin:currentdistalbranchlengthbin
        % Repeat for as many partial pieces as there will end up being 

            if     isfield(data.individual(i),'branchlengthbins')==0; nextpiece = 1;
            elseif branchlengthbin > length(data.individual(i).branchlengthbins); nextpiece = 1;
            elseif isfield(data.individual(i).branchlengthbins(branchlengthbin),'piece')==0; nextpiece = 1;
            else nextpiece = 1 + length(data.individual(i).branchlengthbins(branchlengthbin).piece);
            end

            temppiece = setfield(mnpop.mn(i).piece(j),'partial','n');
            data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece) = temppiece;
            clear temppiece;

            if currentdistalbranchlengthbin ~= currentproximalbranchlengthbin
            % If the piece lies in two or more branch length bins, split the piece and bin the current partial piece
            
                data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).partial = 'y';
                
                if branchlengthbin == currentproximalbranchlengthbin
                % If the current partial piece falls in the proximal branch length bin
                    
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).distaltype           = [];
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).rallratio            = [];
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).rallratio1           = [];
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).rallratio2           = [];
					data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).rallratio3           = [];
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).daughterratio        = [];
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).parentdaughterratio  = [];
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).parentdaughter2ratio = [];
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).length               = (branchlengthbin*data.branchlengthbinwidth) - mnpop.mn(i).piece(j).proximalbranchlength;
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter       = mnpop.mn(i).piece(j).proximaldiameter - ((  (mnpop.mn(i).piece(j).proximaldiameter - mnpop.mn(i).piece(j).distaldiameter)/mnpop.mn(i).piece(j).length  ) * data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).length);
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea          = pi*((data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).length^2)^0.5);
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).volume               = (pi/12)*data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).length*(data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter^2+data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter*data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter+data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter^2);
                    
                    [xdirection, ydirection, zdirection]                                               = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition      = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).length;
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition      = mnpop.mn(i).piece(j).proximalyposition + ydirection * data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).length;
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition      = mnpop.mn(i).piece(j).proximalzposition + zdirection * data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).length;
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).distalbranchlength     = data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength + data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).length;
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).distalradialdistance = ( (data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                         + (data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                         + (data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                    
                    
                elseif branchlengthbin > currentproximalbranchlengthbin && branchlengthbin < currentdistalbranchlengthbin
                % If the current partial piece falls between the proximal and distal branch length bins
                    
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximaltype         = [];
					data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).distaltype           = [];
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).rallratio            = [];
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).rallratio1           = [];
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).rallratio2           = [];
					data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).rallratio3           = [];
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).daughterratio        = [];
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).parentdaughterratio  = [];
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).parentdaughter2ratio = [];
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).length               = data.branchlengthbinwidth;
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter     = data.individual(i).branchlengthbins(branchlengthbin-1).piece(length(data.individual(i).branchlengthbins(branchlengthbin-1).piece)).distaldiameter;
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter       = data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter - ((  (mnpop.mn(i).piece(j).proximaldiameter - mnpop.mn(i).piece(j).distaldiameter)/mnpop.mn(i).piece(j).length  ) * data.branchlengthbinwidth);
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea          = pi*((data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).length^2)^0.5);
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).volume               = (pi/12)*data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).length*(data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter^2+data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter*data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter+data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter^2);
                
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition      = data.individual(i).branchlengthbins(branchlengthbin-1).piece(end).distalxposition;
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition      = data.individual(i).branchlengthbins(branchlengthbin-1).piece(end).distalyposition;
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition      = data.individual(i).branchlengthbins(branchlengthbin-1).piece(end).distalzposition;
                    [xdirection, ydirection, zdirection]                                                     = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition        = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).length;
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition        = mnpop.mn(i).piece(j).proximalxposition + ydirection * data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).length;
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition        = mnpop.mn(i).piece(j).proximalxposition + zdirection * data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).length;
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength     = data.individual(i).branchlengthbins(branchlengthbin-1).piece(end).distalbranchlength;
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).distalbranchlength       = data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength + data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).length;
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                               + (data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                               + (data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).distalradialdistance = ( (data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                             + (data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                             + (data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                    
                    
                elseif branchlengthbin == currentdistalbranchlengthbin
                % If the current partial piece falls in the distal branch length bin
                    
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximaltype     = [];
					data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).length           = mnpop.mn(i).piece(j).distalbranchlength - ((branchlengthbin-1)*data.branchlengthbinwidth);
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter = data.individual(i).branchlengthbins(branchlengthbin-1).piece(length(data.individual(i).branchlengthbins(branchlengthbin-1).piece)).distaldiameter;
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea      = pi*((data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).length^2)^0.5);
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).volume           = (pi/12)*data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).length*(data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter^2+data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter*data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter+data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter^2);
                
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition      = data.individual(i).branchlengthbins(branchlengthbin-1).piece(end).distalxposition;
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition      = data.individual(i).branchlengthbins(branchlengthbin-1).piece(end).distalyposition;
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition      = data.individual(i).branchlengthbins(branchlengthbin-1).piece(end).distalzposition;
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength     = data.individual(i).branchlengthbins(branchlengthbin-1).piece(end).distalbranchlength;
                    data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                               + (data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                               + (data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                    
                    
                end
				
				if data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).length < 0 || ...
				   data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter < 0 || ...
				   data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea < 0 || ...
				   data.individual(i).branchlengthbins(branchlengthbin).piece(nextpiece).volume < 0
				   disp('Error in piecebinner (876)');
				   %keyboard;
				end
				
				
				
				
				
				
            end
        end		
		
		
		
		
		
		
		
		
		
		
        % Start of bifurcation piece binning
        
        if strcmp(mnpop.mn(i).piece(j).branchtype,'b') == 1
			
			% Put the piece into the population bifurcation piece section
			if isfield(analysis,'bifurcation')==0; nextpiece = 1;
			elseif isfield(analysis.bifurcation,'piece')==0; nextpiece = 1;
			else nextpiece = 1 + length(analysis.bifurcation.piece); 
			end;
			analysis.bifurcation.piece(nextpiece) = orderfields(mnpop.mn(i).piece(j));
			
            % Put the piece into the appropriate diameter bin

            for diameterbin = currentproximaldiameterbin:diameterstep:currentdistaldiameterbin
            % Repeat for as many partial pieces as there will end up being    

                if     isfield(data.individual(i).bifurcation,'diameterbins')==0; nextpiece = 1; 
                elseif isfield(data.individual(i).bifurcation.diameterbins(diameterbin),'piece')==0; nextpiece = 1;
                else nextpiece = 1 + length(data.individual(i).bifurcation.diameterbins(diameterbin).piece); 
                end;

                temppiece = setfield(mnpop.mn(i).piece(j),'partial','n');
                data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece) = temppiece;
                clear temppiece;

                % If the piece lies in two or more diameter bins, split the piece and bin the current partial piece

                if currentdistaldiameterbin < currentproximaldiameterbin
                % If the distal diameter is less than the proximal diameter

                    %disp('Distal diameter is less than proximal diameter.');
                    data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).partial = 'y';

                    if diameterbin == currentproximaldiameterbin
                    % If this partial piece is in the proximal diameter bin
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaltype           = [];
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).rallratio            = [];
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).rallratio1           = [];
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).rallratio2           = [];
						data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).rallratio3           = [];
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).daughterratio        = [];
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).parentdaughterratio  = [];
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).parentdaughter2ratio = [];
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = mnpop.mn(i).piece(j).proximaldiameter;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter       = data.individual(i).diameterbinedges(diameterbin);  
                        if data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter > data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                            disp('Error.  Distal diameter is greater than proximal diameter.');
                            keyboard;
                        end
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length               = (data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/mnpop.mn(i).piece(j).taperrate;
                        if data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length > 1.01 * mnpop.mn(i).piece(j).length || data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length < 0
                            disp('Error.  Partial piece length is greater than piece length.');
                            disp(sprintf('Length: %f',data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length));
                            keyboard;
                        end
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).surfacearea          = pi*((data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).volume               = (pi/12)*data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length*(data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter+data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);                    

                        [xdirection, ydirection, zdirection]                                               = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distalxposition      = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distalyposition      = mnpop.mn(i).piece(j).proximalyposition + ydirection * data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distalzposition      = mnpop.mn(i).piece(j).proximalzposition + zdirection * data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distalpathlength     = data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalpathlength + data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distalradialdistance = ( (data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                             + (data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                             + (data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;


                    elseif diameterbin < currentproximaldiameterbin && diameterbin > currentdistaldiameterbin
                    % If this partial piece falls between the proximal and distal diameter bins

                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaltype         = [];
						data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaltype           = [];
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).rallratio            = [];
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).rallratio1           = [];
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).rallratio2           = [];
						data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).rallratio3           = [];
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).daughterratio        = [];
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).parentdaughterratio  = [];
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).parentdaughter2ratio = [];
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = data.individual(i).diameterbinedges(diameterbin+1);
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter       = data.individual(i).diameterbinedges(diameterbin);
                        if data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter > data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                            disp('Error.  Distal diameter is greater than proximal diameter.');
                            keyboard;
                        end
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length               = (data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/mnpop.mn(i).piece(j).taperrate;
                        if data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length > 1.01 * mnpop.mn(i).piece(j).length || data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length < 0
                            disp('Error.  Partial piece length is greater than piece length.');
                            disp(sprintf('Length: %f',data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length));
                            keyboard;
                        end
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).surfacearea            = pi*((data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).volume                 = (pi/12)*data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length*(data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter+data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);                    

                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalxposition      = data.individual(i).bifurcation.diameterbins(diameterbin+1).piece(end).distalxposition;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalyposition      = data.individual(i).bifurcation.diameterbins(diameterbin+1).piece(end).distalyposition;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalzposition      = data.individual(i).bifurcation.diameterbins(diameterbin+1).piece(end).distalzposition;
                        [xdirection, ydirection, zdirection]                                                 = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distalxposition        = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distalyposition        = mnpop.mn(i).piece(j).proximalxposition + ydirection * data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distalzposition        = mnpop.mn(i).piece(j).proximalxposition + zdirection * data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalpathlength     = data.individual(i).bifurcation.diameterbins(diameterbin+1).piece(end).distalpathlength;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distalpathlength       = data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalpathlength + data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                             + (data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                             + (data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distalradialdistance = ( (data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                             + (data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                             + (data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                        
                    elseif diameterbin == currentdistaldiameterbin
                    % If this partial piece falls in the distal diameter bin

						data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaltype         = [];
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = data.individual(i).diameterbinedges(diameterbin+1);
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter       = mnpop.mn(i).piece(j).distaldiameter;
                        if data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter > data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                            disp('Error.  Distal diameter is greater than proximal diameter.');
                            keyboard;
                        end
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length               = (data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/mnpop.mn(i).piece(j).taperrate;
                        if data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length > 1.01 * mnpop.mn(i).piece(j).length || data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length < 0
                            disp('Error.  Partial piece length is greater than piece length.');
                            disp(sprintf('Length: %f',data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length));
                            keyboard;
                        end
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).surfacearea          = pi*((data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).volume               = (pi/12)*data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length*(data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter+data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);                    

                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalxposition      = data.individual(i).bifurcation.diameterbins(diameterbin+1).piece(end).distalxposition;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalyposition      = data.individual(i).bifurcation.diameterbins(diameterbin+1).piece(end).distalyposition;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalzposition      = data.individual(i).bifurcation.diameterbins(diameterbin+1).piece(end).distalzposition;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalpathlength     = data.individual(i).bifurcation.diameterbins(diameterbin+1).piece(end).distalpathlength;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                             + (data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                             + (data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;

                    else disp('Error.  See piecebinner.m line 249.');
                    end

                elseif currentdistaldiameterbin > currentproximaldiameterbin
                % If the distal diameter is greater than the proximal diameter

                    %disp('Distal diameter is greater than proximal diameter.');
                    data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).partial = 'y';

                    if diameterbin == currentproximaldiameterbin
                    % If this partial piece is in the proximal diameter bin

                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaltype           = [];
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).rallratio            = [];
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).rallratio1           = [];
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).rallratio2           = [];
						data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).rallratio3           = [];
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).daughterratio        = [];
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).parentdaughterratio  = [];
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).parentdaughter2ratio = [];
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = mnpop.mn(i).piece(j).proximaldiameter;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter       = data.individual(i).diameterbinedges(diameterbin+1);
                        if data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter < data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                            disp('Error.  Distal diameter is less than proximal diameter.');
                            keyboard;
                        end
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length               = (data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/mnpop.mn(i).piece(j).taperrate;
                        if data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length > 1.01 * mnpop.mn(i).piece(j).length || data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length < 0
                            disp('Error.  Partial piece length is greater than piece length.');
                            disp(sprintf('Length: %f',data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length));
                            keyboard;
                        end
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).surfacearea          = pi*((data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).volume               = (pi/12)*data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length*(data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter+data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);                    

                        [xdirection, ydirection, zdirection]                                               = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distalxposition      = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distalyposition      = mnpop.mn(i).piece(j).proximalyposition + ydirection * data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distalzposition      = mnpop.mn(i).piece(j).proximalzposition + zdirection * data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distalpathlength     = data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalpathlength + data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distalradialdistance = ( (data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                             + (data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                             + (data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;

                    elseif diameterbin > currentproximaldiameterbin && diameterbin < currentdistaldiameterbin
                    % If this partial piece falls between the proximal and distal diameter bins    

                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaltype         = [];
						data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaltype           = [];
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).rallratio            = [];
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).rallratio1           = [];
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).rallratio2           = [];
						data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).rallratio3           = [];
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).daughterratio        = [];
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).parentdaughterratio  = [];
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).parentdaughter2ratio = [];
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = data.individual(i).diameterbinedges(diameterbin);
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter       = data.individual(i).diameterbinedges(diameterbin+1);
                        if data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter < data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                            disp('Error.  Distal diameter is less than proximal diameter.');
                            keyboard;
                        end
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length               = (data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/mnpop.mn(i).piece(j).taperrate;
                        if data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length > 1.01 * mnpop.mn(i).piece(j).length || data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length < 0
                            disp('Error.  Partial piece length is greater than piece length.');
                            disp(sprintf('Length: %f',data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length));
                            keyboard;
                        end
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).surfacearea          = pi*((data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).volume               = (pi/12)*data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length*(data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter+data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);                    

                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalxposition      = data.individual(i).bifurcation.diameterbins(diameterbin-1).piece(end).distalxposition;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalyposition      = data.individual(i).bifurcation.diameterbins(diameterbin-1).piece(end).distalyposition;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalzposition      = data.individual(i).bifurcation.diameterbins(diameterbin-1).piece(end).distalzposition;
                        [xdirection, ydirection, zdirection]                                                 = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distalxposition        = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distalyposition        = mnpop.mn(i).piece(j).proximalyposition + ydirection * data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distalzposition        = mnpop.mn(i).piece(j).proximalzposition + zdirection * data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalpathlength     = data.individual(i).bifurcation.diameterbins(diameterbin-1).piece(end).distalpathlength;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distalpathlength       = data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalpathlength + data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                             + (data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                             + (data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distalradialdistance = ( (data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                             + (data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                             + (data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;

                        
                    elseif diameterbin == currentdistaldiameterbin
                    % If the piece falls in the distal diameter bin

                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaltype         = [];
						data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = data.individual(i).diameterbinedges(diameterbin);
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter       = mnpop.mn(i).piece(j).distaldiameter;
                        if data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter < data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                            disp('Error.  Distal diameter is less than proximal diameter.');
                            keyboard;
                        end
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length               = (data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/mnpop.mn(i).piece(j).taperrate;
                        if data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length > 101 * mnpop.mn(i).piece(j).length || data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length < 0
                            disp('Error.  Partial piece length is greater than piece length.');
                            disp(sprintf('Length: %f',data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length));
                            keyboard;
                        end
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).surfacearea          = pi*((data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).volume               = (pi/12)*data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).length*(data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter+data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);                    

                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalxposition      = data.individual(i).bifurcation.diameterbins(diameterbin-1).piece(end).distalxposition;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalyposition      = data.individual(i).bifurcation.diameterbins(diameterbin-1).piece(end).distalyposition;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalzposition      = data.individual(i).bifurcation.diameterbins(diameterbin-1).piece(end).distalzposition;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalpathlength     = data.individual(i).bifurcation.diameterbins(diameterbin-1).piece(end).distalpathlength;
                        data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                             + (data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                             + (data.individual(i).bifurcation.diameterbins(diameterbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;

                    else disp('Error: see piecebinner.m line 364.');
                    end
                end
            end

            % Put the piece into the appropriate path length bin      

            for pathlengthbin = currentproximalpathlengthbin:currentdistalpathlengthbin
            % Repeat for as many partial pieces as there will end up being 

                if     isfield(data.individual(i).bifurcation,'pathlengthbins')==0; nextpiece = 1;
                elseif pathlengthbin > length(data.individual(i).bifurcation.pathlengthbins); nextpiece = 1;
                elseif isfield(data.individual(i).bifurcation.pathlengthbins(pathlengthbin),'piece')==0; nextpiece = 1;
                else nextpiece = 1 + length(data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece);
                end

                temppiece = setfield(mnpop.mn(i).piece(j),'partial','n');
                data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece) = temppiece;
                clear temppiece;

                if currentdistalpathlengthbin ~= currentproximalpathlengthbin
                % If the piece lies in two or more path length bins, split the piece and bin the current partial piece

                    data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).partial = 'y';

                    if pathlengthbin == currentproximalpathlengthbin
                    % If the current partial piece falls in the proximal path length bin

                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distaltype           = [];
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).rallratio            = [];
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).rallratio1           = [];
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).rallratio2           = [];
						data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).rallratio3           = [];
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).daughterratio        = [];
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).parentdaughterratio  = [];
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).parentdaughter2ratio = [];
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length               = (pathlengthbin*data.distancebinwidth) - mnpop.mn(i).piece(j).proximalpathlength;
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter       = mnpop.mn(i).piece(j).proximaldiameter - ((  (mnpop.mn(i).piece(j).proximaldiameter - mnpop.mn(i).piece(j).distaldiameter)/mnpop.mn(i).piece(j).length  ) * data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length);
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea          = pi*((data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).volume               = (pi/12)*data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length*(data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);

                        [xdirection, ydirection, zdirection]                                               = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition      = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition      = mnpop.mn(i).piece(j).proximalyposition + ydirection * data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition      = mnpop.mn(i).piece(j).proximalzposition + zdirection * data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distalpathlength     = data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength + data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distalradialdistance = ( (data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                             + (data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                             + (data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;


                    elseif pathlengthbin > currentproximalpathlengthbin && pathlengthbin < currentdistalpathlengthbin
                    % If the current partial piece falls between the proximal and distal path length bins

                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaltype         = [];
						data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distaltype           = [];
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).rallratio            = [];
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).rallratio1           = [];
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).rallratio2           = [];
						data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).rallratio3           = [];
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).daughterratio        = [];
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).parentdaughterratio  = [];
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).parentdaughter2ratio = [];
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length               = data.distancebinwidth;
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter     = data.individual(i).bifurcation.pathlengthbins(pathlengthbin-1).piece(length(data.individual(i).bifurcation.pathlengthbins(pathlengthbin-1).piece)).distaldiameter;
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter       = data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter - ((  (mnpop.mn(i).piece(j).proximaldiameter - mnpop.mn(i).piece(j).distaldiameter)/mnpop.mn(i).piece(j).length  ) * data.distancebinwidth);
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea          = pi*((data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).volume               = (pi/12)*data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length*(data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);

                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition      = data.individual(i).bifurcation.pathlengthbins(pathlengthbin-1).piece(end).distalxposition;
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition      = data.individual(i).bifurcation.pathlengthbins(pathlengthbin-1).piece(end).distalyposition;
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition      = data.individual(i).bifurcation.pathlengthbins(pathlengthbin-1).piece(end).distalzposition;
                        [xdirection, ydirection, zdirection]                                                     = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition        = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition        = mnpop.mn(i).piece(j).proximalxposition + ydirection * data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition        = mnpop.mn(i).piece(j).proximalxposition + zdirection * data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength     = data.individual(i).bifurcation.pathlengthbins(pathlengthbin-1).piece(end).distalpathlength;
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distalpathlength       = data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength + data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                                   + (data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                                   + (data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distalradialdistance = ( (data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                                 + (data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                                 + (data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                        

                    elseif pathlengthbin == currentdistalpathlengthbin
                    % If the current partial piece falls in the distal path length bin

                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaltype     = [];
						data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length           = mnpop.mn(i).piece(j).distalpathlength - ((pathlengthbin-1)*data.distancebinwidth);
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter = data.individual(i).bifurcation.pathlengthbins(pathlengthbin-1).piece(length(data.individual(i).bifurcation.pathlengthbins(pathlengthbin-1).piece)).distaldiameter;
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea      = pi*((data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).volume           = (pi/12)*data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).length*(data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);

                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition      = data.individual(i).bifurcation.pathlengthbins(pathlengthbin-1).piece(end).distalxposition;
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition      = data.individual(i).bifurcation.pathlengthbins(pathlengthbin-1).piece(end).distalyposition;
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition      = data.individual(i).bifurcation.pathlengthbins(pathlengthbin-1).piece(end).distalzposition;
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength     = data.individual(i).bifurcation.pathlengthbins(pathlengthbin-1).piece(end).distalpathlength;
                        data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                                   + (data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                                   + (data.individual(i).bifurcation.pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;


                    end
                end
            end


            % Put the piece into the appropriate radial distance bin

            for radialdistancebin = currentproximalradialdistancebin:radialdistancestep:currentdistalradialdistancebin
            % Repeat for as many partial pieces as there will end up being 

                if isfield(data.individual(i).bifurcation,'radialdistancebins')==0; nextpiece = 1;
                elseif radialdistancebin > length(data.individual(i).bifurcation.radialdistancebins); nextpiece = 1;
                elseif isfield(data.individual(i).bifurcation.radialdistancebins(radialdistancebin),'piece')==0; nextpiece = 1;
                else nextpiece = 1 + length(data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece);
                end

                temppiece = setfield(mnpop.mn(i).piece(j),'partial','n');
                data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece) = temppiece;
                clear temppiece;

                if currentdistalradialdistancebin > currentproximalradialdistancebin
                    data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).partial = 'y';
                    if radialdistancebin == currentproximalradialdistancebin
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaltype           = [];
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio            = [];
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio1           = [];
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio2           = [];
						data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio3           = [];
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).daughterratio        = [];
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).parentdaughterratio  = [];
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).parentdaughter2ratio = [];
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length               = ((radialdistancebin*data.distancebinwidth-mnpop.mn(i).piece(j).proximalradialdistance)/(mnpop.mn(i).piece(j).distalradialdistance-mnpop.mn(i).piece(j).proximalradialdistance))*mnpop.mn(i).piece(j).length;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter       = mnpop.mn(i).piece(j).proximaldiameter - ((  (mnpop.mn(i).piece(j).proximaldiameter - mnpop.mn(i).piece(j).distaldiameter)/mnpop.mn(i).piece(j).length  ) * data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length);
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea          = pi*((data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).volume               = (pi/12)*data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length*(data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);

                        [xdirection, ydirection, zdirection]                                                           = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition      = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition      = mnpop.mn(i).piece(j).proximalyposition + ydirection * data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition      = mnpop.mn(i).piece(j).proximalzposition + zdirection * data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalpathlength     = data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength + data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalradialdistance = ( (data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                                         + (data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                                         + (data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;


                    elseif radialdistancebin > currentproximalradialdistancebin && radialdistancebin < currentdistalradialdistancebin
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaltype         = [];
						data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaltype           = [];
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio            = [];
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio1           = [];
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio2           = [];
						data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio3           = [];
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).daughterratio        = [];
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).parentdaughterratio  = [];
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).parentdaughter2ratio = [];
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length               = (data.distancebinwidth/(mnpop.mn(i).piece(j).distalradialdistance-mnpop.mn(i).piece(j).proximalradialdistance))*mnpop.mn(i).piece(j).length;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter     = data.individual(i).bifurcation.radialdistancebins(radialdistancebin-1).piece(length(data.individual(i).bifurcation.radialdistancebins(radialdistancebin-1).piece)).distaldiameter;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter       = data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter - ((  (mnpop.mn(i).piece(j).proximaldiameter - mnpop.mn(i).piece(j).distaldiameter)/mnpop.mn(i).piece(j).length  ) * data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length);
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea          = pi*((data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).volume               = (pi/12)*data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length*(data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);

                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition      = data.individual(i).bifurcation.radialdistancebins(radialdistancebin-1).piece(end).distalxposition;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition      = data.individual(i).bifurcation.radialdistancebins(radialdistancebin-1).piece(end).distalyposition;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition      = data.individual(i).bifurcation.radialdistancebins(radialdistancebin-1).piece(end).distalzposition;
                        [xdirection, ydirection, zdirection]                                                     = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition        = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition        = mnpop.mn(i).piece(j).proximalxposition + ydirection * data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition        = mnpop.mn(i).piece(j).proximalxposition + zdirection * data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength     = data.individual(i).bifurcation.radialdistancebins(radialdistancebin-1).piece(end).distalpathlength;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalpathlength       = data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength + data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                                   + (data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                                   + (data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalradialdistance = ( (data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                                 + (data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                                 + (data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                        

                    elseif radialdistancebin == currentdistalradialdistancebin
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaltype     = [];
						data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length           = ((mnpop.mn(i).piece(j).distalradialdistance-((radialdistancebin-1)*data.distancebinwidth))/(mnpop.mn(i).piece(j).distalradialdistance-mnpop.mn(i).piece(j).proximalradialdistance))*mnpop.mn(i).piece(j).length;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter = data.individual(i).bifurcation.radialdistancebins(radialdistancebin-1).piece(length(data.individual(i).bifurcation.radialdistancebins(radialdistancebin-1).piece)).distaldiameter;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea      = pi*((data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).volume           = (pi/12)*data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length*(data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);

                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition      = data.individual(i).bifurcation.radialdistancebins(radialdistancebin-1).piece(end).distalxposition;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition      = data.individual(i).bifurcation.radialdistancebins(radialdistancebin-1).piece(end).distalyposition;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition      = data.individual(i).bifurcation.radialdistancebins(radialdistancebin-1).piece(end).distalzposition;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength     = data.individual(i).bifurcation.radialdistancebins(radialdistancebin-1).piece(end).distalpathlength;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                                   + (data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                                   + (data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;


                    end

                elseif currentdistalradialdistancebin < currentproximalradialdistancebin
                    data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).partial = 'y';
                    if radialdistancebin == currentproximalradialdistancebin
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaltype           = [];
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio            = [];
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio1           = [];
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio2           = [];
						data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio3           = [];
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).daughterratio        = [];
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).parentdaughterratio  = [];
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).parentdaughter2ratio = [];
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length               = ((mnpop.mn(i).piece(j).proximalradialdistance-((radialdistancebin-1)*data.distancebinwidth))/(mnpop.mn(i).piece(j).proximalradialdistance-mnpop.mn(i).piece(j).distalradialdistance))*mnpop.mn(i).piece(j).length;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter       = mnpop.mn(i).piece(j).proximaldiameter - ((  (mnpop.mn(i).piece(j).proximaldiameter - mnpop.mn(i).piece(j).distaldiameter)/mnpop.mn(i).piece(j).length  ) * data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length);
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea          = pi*((data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).volume               = (pi/12)*data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length*(data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);

                        [xdirection, ydirection, zdirection]                                                           = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition      = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition      = mnpop.mn(i).piece(j).proximalyposition + ydirection * data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition      = mnpop.mn(i).piece(j).proximalzposition + zdirection * data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalpathlength     = data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength + data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalradialdistance = ( (data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                                         + (data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                                         + (data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;


                    elseif radialdistancebin < currentproximalradialdistancebin && radialdistancebin > currentdistalradialdistancebin
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaltype         = [];
						data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaltype           = [];
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio            = [];
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio1           = [];
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio2           = [];
						data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).rallratio3           = [];
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).daughterratio        = [];
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).parentdaughterratio  = [];
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).parentdaughter2ratio = [];
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length               = (data.distancebinwidth/(mnpop.mn(i).piece(j).proximalradialdistance-mnpop.mn(i).piece(j).distalradialdistance))*mnpop.mn(i).piece(j).length;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter     = data.individual(i).bifurcation.radialdistancebins(radialdistancebin+1).piece(length(data.individual(i).bifurcation.radialdistancebins(radialdistancebin+1).piece)).distaldiameter;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter       = data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter - ((  (mnpop.mn(i).piece(j).proximaldiameter - mnpop.mn(i).piece(j).distaldiameter)/mnpop.mn(i).piece(j).length  ) * data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length);
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea          = pi*((data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).volume               = (pi/12)*data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length*(data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);

                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition      = data.individual(i).bifurcation.radialdistancebins(radialdistancebin+1).piece(end).distalxposition;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition      = data.individual(i).bifurcation.radialdistancebins(radialdistancebin+1).piece(end).distalyposition;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition      = data.individual(i).bifurcation.radialdistancebins(radialdistancebin+1).piece(end).distalzposition;
                        [xdirection, ydirection, zdirection]                                                             = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition        = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition        = mnpop.mn(i).piece(j).proximalxposition + ydirection * data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition        = mnpop.mn(i).piece(j).proximalxposition + zdirection * data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength     = data.individual(i).bifurcation.radialdistancebins(radialdistancebin+1).piece(end).distalpathlength;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalpathlength       = data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength + data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                                           + (data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                                           + (data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalradialdistance = ( (data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                                         + (data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                                         + (data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                            

                    elseif radialdistancebin == currentdistalradialdistancebin
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaltype     = [];
						data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length           = (((radialdistancebin*data.distancebinwidth)-mnpop.mn(i).piece(j).distalradialdistance)/(mnpop.mn(i).piece(j).proximalradialdistance-mnpop.mn(i).piece(j).distalradialdistance))*mnpop.mn(i).piece(j).length;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter = data.individual(i).bifurcation.radialdistancebins(radialdistancebin+1).piece(length(data.individual(i).bifurcation.radialdistancebins(radialdistancebin+1).piece)).distaldiameter;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea      = pi*((data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).volume           = (pi/12)*data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).length*(data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);

                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition      = data.individual(i).bifurcation.radialdistancebins(radialdistancebin+1).piece(end).distalxposition;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition      = data.individual(i).bifurcation.radialdistancebins(radialdistancebin+1).piece(end).distalyposition;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition      = data.individual(i).bifurcation.radialdistancebins(radialdistancebin+1).piece(end).distalzposition;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength     = data.individual(i).bifurcation.radialdistancebins(radialdistancebin+1).piece(end).distalpathlength;
                        data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                                   + (data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                                   + (data.individual(i).bifurcation.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;


                    end
                end
            end        

			
			
			
			
			
			
			
			
			
			
            % Put the piece into the appropriate branch length bin      

            for branchlengthbin = currentproximalbranchlengthbin:currentdistalbranchlengthbin
            % Repeat for as many partial pieces as there will end up being 

                if     isfield(data.individual(i).bifurcation,'branchlengthbins')==0; nextpiece = 1;
                elseif branchlengthbin > length(data.individual(i).bifurcation.branchlengthbins); nextpiece = 1;
                elseif isfield(data.individual(i).bifurcation.branchlengthbins(branchlengthbin),'piece')==0; nextpiece = 1;
                else nextpiece = 1 + length(data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece);
                end

                temppiece = setfield(mnpop.mn(i).piece(j),'partial','n');
                data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece) = temppiece;
                clear temppiece;

                if currentdistalbranchlengthbin ~= currentproximalbranchlengthbin
                % If the piece lies in two or more branch length bins, split the piece and bin the current partial piece

                    data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).partial = 'y';

                    if branchlengthbin == currentproximalbranchlengthbin
                    % If the current partial piece falls in the proximal branch length bin

                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaltype           = [];
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).rallratio            = [];
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).rallratio1           = [];
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).rallratio2           = [];
						data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).rallratio3           = [];
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).daughterratio        = [];
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).parentdaughterratio  = [];
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).parentdaughter2ratio = [];
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length               = (branchlengthbin*data.branchlengthbinwidth) - mnpop.mn(i).piece(j).proximalbranchlength;
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter       = mnpop.mn(i).piece(j).proximaldiameter - ((  (mnpop.mn(i).piece(j).proximaldiameter - mnpop.mn(i).piece(j).distaldiameter)/mnpop.mn(i).piece(j).length  ) * data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length);
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea          = pi*((data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).volume               = (pi/12)*data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length*(data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter^2+data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter*data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter+data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter^2);

                        [xdirection, ydirection, zdirection]                                               = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition      = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition      = mnpop.mn(i).piece(j).proximalyposition + ydirection * data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition      = mnpop.mn(i).piece(j).proximalzposition + zdirection * data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distalbranchlength     = data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength + data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distalradialdistance = ( (data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                             + (data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                             + (data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;


                    elseif branchlengthbin > currentproximalbranchlengthbin && branchlengthbin < currentdistalbranchlengthbin
                    % If the current partial piece falls between the proximal and distal branch length bins

                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaltype         = [];
						data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaltype           = [];
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).rallratio            = [];
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).rallratio1           = [];
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).rallratio2           = [];
						data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).rallratio3           = [];
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).daughterratio        = [];
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).parentdaughterratio  = [];
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).parentdaughter2ratio = [];
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length               = data.branchlengthbinwidth;
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter     = data.individual(i).bifurcation.branchlengthbins(branchlengthbin-1).piece(length(data.individual(i).bifurcation.branchlengthbins(branchlengthbin-1).piece)).distaldiameter;
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter       = data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter - ((  (mnpop.mn(i).piece(j).proximaldiameter - mnpop.mn(i).piece(j).distaldiameter)/mnpop.mn(i).piece(j).length  ) * data.branchlengthbinwidth);
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea          = pi*((data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).volume               = (pi/12)*data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length*(data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter^2+data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter*data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter+data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter^2);

                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition      = data.individual(i).bifurcation.branchlengthbins(branchlengthbin-1).piece(end).distalxposition;
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition      = data.individual(i).bifurcation.branchlengthbins(branchlengthbin-1).piece(end).distalyposition;
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition      = data.individual(i).bifurcation.branchlengthbins(branchlengthbin-1).piece(end).distalzposition;
                        [xdirection, ydirection, zdirection]                                                     = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition        = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition        = mnpop.mn(i).piece(j).proximalxposition + ydirection * data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition        = mnpop.mn(i).piece(j).proximalxposition + zdirection * data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength     = data.individual(i).bifurcation.branchlengthbins(branchlengthbin-1).piece(end).distalbranchlength;
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distalbranchlength       = data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength + data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                                   + (data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                                   + (data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distalradialdistance = ( (data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                                 + (data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                                 + (data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                        

                    elseif branchlengthbin == currentdistalbranchlengthbin
                    % If the current partial piece falls in the distal branch length bin

                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaltype     = [];
						data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length           = mnpop.mn(i).piece(j).distalbranchlength - ((branchlengthbin-1)*data.branchlengthbinwidth);
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter = data.individual(i).bifurcation.branchlengthbins(branchlengthbin-1).piece(length(data.individual(i).bifurcation.branchlengthbins(branchlengthbin-1).piece)).distaldiameter;
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea      = pi*((data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).volume           = (pi/12)*data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length*(data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter^2+data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter*data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter+data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter^2);

                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition      = data.individual(i).bifurcation.branchlengthbins(branchlengthbin-1).piece(end).distalxposition;
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition      = data.individual(i).bifurcation.branchlengthbins(branchlengthbin-1).piece(end).distalyposition;
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition      = data.individual(i).bifurcation.branchlengthbins(branchlengthbin-1).piece(end).distalzposition;
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength     = data.individual(i).bifurcation.branchlengthbins(branchlengthbin-1).piece(end).distalbranchlength;
                        data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                                   + (data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                                   + (data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;


                    end
					
					if data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length < 0 || ...
					   data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter < 0 || ...
					   data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea < 0 || ...
					   data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).volume < 0
					   disp('Error in piecebinner (1545)');
					   %keyboard;
					end
					
                end
				
				if data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length < 0 || ...
				   data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter < 0 || ...
				   data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea < 0 || ...
				   data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).volume < 0
				   disp('Error in piecebinner (1555)');
				   %keyboard;
				end
			
			
			end
			
			if data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).length < 0 || ...
			   data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter < 0 || ...
			   data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea < 0 || ...
			   data.individual(i).bifurcation.branchlengthbins(branchlengthbin).piece(nextpiece).volume < 0
			   disp('Error in piecebinner (1566)');
			   %keyboard;
			end
			
			
			
			
			
			
			
			
        % Start of termination piece binning
        elseif strcmp(mnpop.mn(i).piece(j).branchtype,'t') == 1
			
			% Put the piece into the population termination piece section
			if isfield(analysis,'termination')==0; nextpiece = 1;
			elseif isfield(analysis.termination,'piece')==0; nextpiece = 1;
			else nextpiece = 1 + length(analysis.termination.piece); 
			end;
			analysis.termination.piece(nextpiece) = orderfields(mnpop.mn(i).piece(j));

            % Put the piece into the appropriate diameter bin

            for diameterbin = currentproximaldiameterbin:diameterstep:currentdistaldiameterbin
            % Repeat for as many partial pieces as there will end up being    

                if     isfield(data.individual(i).termination,'diameterbins')==0; nextpiece = 1; 
                elseif isfield(data.individual(i).termination.diameterbins(diameterbin),'piece')==0; nextpiece = 1;
                else nextpiece = 1 + length(data.individual(i).termination.diameterbins(diameterbin).piece); 
                end;

                temppiece = setfield(mnpop.mn(i).piece(j),'partial','n');
                data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece) = temppiece;
                clear temppiece;

                % If the piece lies in two or more diameter bins, split the piece and bin the current partial piece

                if currentdistaldiameterbin < currentproximaldiameterbin
                % If the distal diameter is less than the proximal diameter

                    %disp('Distal diameter is less than proximal diameter.');
                    data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).partial = 'y';

                    if diameterbin == currentproximaldiameterbin
                    % If this partial piece is in the proximal diameter bin
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaltype           = [];
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = mnpop.mn(i).piece(j).proximaldiameter;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter       = data.individual(i).diameterbinedges(diameterbin);  
                        if data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter > data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                            disp('Error.  Distal diameter is greater than proximal diameter.');
                            keyboard;
                        end
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length               = (data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/mnpop.mn(i).piece(j).taperrate;
                        if data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length > 1.01 * mnpop.mn(i).piece(j).length || data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length < 0
                            disp('Error.  Partial piece length is greater than piece length.');
                            disp(sprintf('Length: %f',data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length));
                            keyboard;
                        end
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).surfacearea          = pi*((data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).volume               = (pi/12)*data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length*(data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter+data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);                    

                        [xdirection, ydirection, zdirection]                                               = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distalxposition      = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distalyposition      = mnpop.mn(i).piece(j).proximalyposition + ydirection * data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distalzposition      = mnpop.mn(i).piece(j).proximalzposition + zdirection * data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distalpathlength     = data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalpathlength + data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distalradialdistance = ( (data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                             + (data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                             + (data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;


                    elseif diameterbin < currentproximaldiameterbin && diameterbin > currentdistaldiameterbin
                    % If this partial piece falls between the proximal and distal diameter bins

                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaltype         = [];
						data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaltype           = [];
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = data.individual(i).diameterbinedges(diameterbin+1);
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter       = data.individual(i).diameterbinedges(diameterbin);
                        if data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter > data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                            disp('Error.  Distal diameter is greater than proximal diameter.');
                            keyboard;
                        end
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length               = (data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/mnpop.mn(i).piece(j).taperrate;
                        if data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length > 1.01 * mnpop.mn(i).piece(j).length || data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length < 0
                            disp('Error.  Partial piece length is greater than piece length.');
                            disp(sprintf('Length: %f',data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length));
                            keyboard;
                        end
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).surfacearea            = pi*((data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).volume                 = (pi/12)*data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length*(data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter+data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);                    

                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalxposition      = data.individual(i).termination.diameterbins(diameterbin+1).piece(end).distalxposition;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalyposition      = data.individual(i).termination.diameterbins(diameterbin+1).piece(end).distalyposition;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalzposition      = data.individual(i).termination.diameterbins(diameterbin+1).piece(end).distalzposition;
                        [xdirection, ydirection, zdirection]                                                 = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distalxposition        = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distalyposition        = mnpop.mn(i).piece(j).proximalxposition + ydirection * data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distalzposition        = mnpop.mn(i).piece(j).proximalxposition + zdirection * data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalpathlength     = data.individual(i).termination.diameterbins(diameterbin+1).piece(end).distalpathlength;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distalpathlength       = data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalpathlength + data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                             + (data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                             + (data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distalradialdistance = ( (data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                             + (data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                             + (data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                        
                    elseif diameterbin == currentdistaldiameterbin
                    % If this partial piece falls in the distal diameter bin

                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaltype         = [];
						data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = data.individual(i).diameterbinedges(diameterbin+1);
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter       = mnpop.mn(i).piece(j).distaldiameter;
                        if data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter > data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                            disp('Error.  Distal diameter is greater than proximal diameter.');
                            keyboard;
                        end
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length               = (data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/mnpop.mn(i).piece(j).taperrate;
                        if data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length > 1.01 * mnpop.mn(i).piece(j).length || data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length < 0
                            disp('Error.  Partial piece length is greater than piece length.');
                            disp(sprintf('Length: %f',data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length));
                            keyboard;
                        end
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).surfacearea          = pi*((data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).volume               = (pi/12)*data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length*(data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter+data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);                    

                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalxposition      = data.individual(i).termination.diameterbins(diameterbin+1).piece(end).distalxposition;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalyposition      = data.individual(i).termination.diameterbins(diameterbin+1).piece(end).distalyposition;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalzposition      = data.individual(i).termination.diameterbins(diameterbin+1).piece(end).distalzposition;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalpathlength     = data.individual(i).termination.diameterbins(diameterbin+1).piece(end).distalpathlength;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                             + (data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                             + (data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;

                    else disp('Error.  See piecebinner.m line 249.');
                    end

                elseif currentdistaldiameterbin > currentproximaldiameterbin
                % If the distal diameter is greater than the proximal diameter

                    %disp('Distal diameter is greater than proximal diameter.');
                    data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).partial = 'y';

                    if diameterbin == currentproximaldiameterbin
                    % If this partial piece is in the proximal diameter bin

                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaltype           = [];
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = mnpop.mn(i).piece(j).proximaldiameter;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter       = data.individual(i).diameterbinedges(diameterbin+1);
                        if data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter < data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                            disp('Error.  Distal diameter is less than proximal diameter.');
                            keyboard;
                        end
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length               = (data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/mnpop.mn(i).piece(j).taperrate;
                        if data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length > 1.01 * mnpop.mn(i).piece(j).length || data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length < 0
                            disp('Error.  Partial piece length is greater than piece length.');
                            disp(sprintf('Length: %f',data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length));
                            keyboard;
                        end
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).surfacearea          = pi*((data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).volume               = (pi/12)*data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length*(data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter+data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);                    

                        [xdirection, ydirection, zdirection]                                               = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distalxposition      = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distalyposition      = mnpop.mn(i).piece(j).proximalyposition + ydirection * data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distalzposition      = mnpop.mn(i).piece(j).proximalzposition + zdirection * data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distalpathlength     = data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalpathlength + data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distalradialdistance = ( (data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                             + (data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                             + (data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;

                    elseif diameterbin > currentproximaldiameterbin && diameterbin < currentdistaldiameterbin
                    % If this partial piece falls between the proximal and distal diameter bins    

                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaltype         = [];
						data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaltype           = [];
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = data.individual(i).diameterbinedges(diameterbin);
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter       = data.individual(i).diameterbinedges(diameterbin+1);
                        if data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter < data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                            disp('Error.  Distal diameter is less than proximal diameter.');
                            keyboard;
                        end
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length               = (data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/mnpop.mn(i).piece(j).taperrate;
                        if data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length > 1.01 * mnpop.mn(i).piece(j).length || data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length < 0
                            disp('Error.  Partial piece length is greater than piece length.');
                            disp(sprintf('Length: %f',data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length));
                            keyboard;
                        end
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).surfacearea          = pi*((data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).volume               = (pi/12)*data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length*(data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter+data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);                    

                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalxposition      = data.individual(i).termination.diameterbins(diameterbin-1).piece(end).distalxposition;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalyposition      = data.individual(i).termination.diameterbins(diameterbin-1).piece(end).distalyposition;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalzposition      = data.individual(i).termination.diameterbins(diameterbin-1).piece(end).distalzposition;
                        [xdirection, ydirection, zdirection]                                                 = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distalxposition        = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distalyposition        = mnpop.mn(i).piece(j).proximalyposition + ydirection * data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distalzposition        = mnpop.mn(i).piece(j).proximalzposition + zdirection * data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalpathlength     = data.individual(i).termination.diameterbins(diameterbin-1).piece(end).distalpathlength;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distalpathlength       = data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalpathlength + data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                             + (data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                             + (data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distalradialdistance = ( (data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                             + (data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                             + (data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;

                        
                    elseif diameterbin == currentdistaldiameterbin
                    % If the piece falls in the distal diameter bin

                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaltype         = [];
						data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter     = data.individual(i).diameterbinedges(diameterbin);
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter       = mnpop.mn(i).piece(j).distaldiameter;
                        if data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter < data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter
                            disp('Error.  Distal diameter is less than proximal diameter.');
                            keyboard;
                        end
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length               = (data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter-data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter)/mnpop.mn(i).piece(j).taperrate;
                        if data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length > 1.01 * mnpop.mn(i).piece(j).length || data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length < 0
                            disp('Error.  Partial piece length is greater than piece length.');
                            disp(sprintf('Length: %f',data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length));
                            keyboard;
                        end
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).surfacearea          = pi*((data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).volume               = (pi/12)*data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).length*(data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter^2+data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximaldiameter*data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter+data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).distaldiameter^2);                    

                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalxposition      = data.individual(i).termination.diameterbins(diameterbin-1).piece(end).distalxposition;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalyposition      = data.individual(i).termination.diameterbins(diameterbin-1).piece(end).distalyposition;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalzposition      = data.individual(i).termination.diameterbins(diameterbin-1).piece(end).distalzposition;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalpathlength     = data.individual(i).termination.diameterbins(diameterbin-1).piece(end).distalpathlength;
                        data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                             + (data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                             + (data.individual(i).termination.diameterbins(diameterbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;

                    else disp('Error: see piecebinner.m line 364.');
                    end
                end
            end

            % Put the piece into the appropriate path length bin      

            for pathlengthbin = currentproximalpathlengthbin:currentdistalpathlengthbin
            % Repeat for as many partial pieces as there will end up being 

                if     isfield(data.individual(i).termination,'pathlengthbins')==0; nextpiece = 1;
                elseif pathlengthbin > length(data.individual(i).termination.pathlengthbins); nextpiece = 1;
                elseif isfield(data.individual(i).termination.pathlengthbins(pathlengthbin),'piece')==0; nextpiece = 1;
                else nextpiece = 1 + length(data.individual(i).termination.pathlengthbins(pathlengthbin).piece);
                end

                temppiece = setfield(mnpop.mn(i).piece(j),'partial','n');
                data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece) = temppiece;
                clear temppiece;

                if currentdistalpathlengthbin ~= currentproximalpathlengthbin
                % If the piece lies in two or more path length bins, split the piece and bin the current partial piece

                    data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).partial = 'y';

                    if pathlengthbin == currentproximalpathlengthbin
                    % If the current partial piece falls in the proximal path length bin

                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).distaltype           = [];
                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).length               = (pathlengthbin*data.distancebinwidth) - mnpop.mn(i).piece(j).proximalpathlength;
                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter       = mnpop.mn(i).piece(j).proximaldiameter - ((  (mnpop.mn(i).piece(j).proximaldiameter - mnpop.mn(i).piece(j).distaldiameter)/mnpop.mn(i).piece(j).length  ) * data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).length);
                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea          = pi*((data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).volume               = (pi/12)*data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).length*(data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);

                        [xdirection, ydirection, zdirection]                                               = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition      = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition      = mnpop.mn(i).piece(j).proximalyposition + ydirection * data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition      = mnpop.mn(i).piece(j).proximalzposition + zdirection * data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).distalpathlength     = data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength + data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).distalradialdistance = ( (data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                             + (data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                             + (data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;


                    elseif pathlengthbin > currentproximalpathlengthbin && pathlengthbin < currentdistalpathlengthbin
                    % If the current partial piece falls between the proximal and distal path length bins

                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaltype         = [];
						data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).distaltype           = [];
                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).length               = data.distancebinwidth;
                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter     = data.individual(i).termination.pathlengthbins(pathlengthbin-1).piece(length(data.individual(i).termination.pathlengthbins(pathlengthbin-1).piece)).distaldiameter;
                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter       = data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter - ((  (mnpop.mn(i).piece(j).proximaldiameter - mnpop.mn(i).piece(j).distaldiameter)/mnpop.mn(i).piece(j).length  ) * data.distancebinwidth);
                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea          = pi*((data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).volume               = (pi/12)*data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).length*(data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);

                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition      = data.individual(i).termination.pathlengthbins(pathlengthbin-1).piece(end).distalxposition;
                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition      = data.individual(i).termination.pathlengthbins(pathlengthbin-1).piece(end).distalyposition;
                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition      = data.individual(i).termination.pathlengthbins(pathlengthbin-1).piece(end).distalzposition;
                        [xdirection, ydirection, zdirection]                                                     = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition        = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition        = mnpop.mn(i).piece(j).proximalxposition + ydirection * data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition        = mnpop.mn(i).piece(j).proximalxposition + zdirection * data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength     = data.individual(i).termination.pathlengthbins(pathlengthbin-1).piece(end).distalpathlength;
                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).distalpathlength       = data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength + data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).length;
                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                                   + (data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                                   + (data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).distalradialdistance = ( (data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                                 + (data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                                 + (data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                        

                    elseif pathlengthbin == currentdistalpathlengthbin
                    % If the current partial piece falls in the distal path length bin

                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaltype     = [];
						data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).length           = mnpop.mn(i).piece(j).distalpathlength - ((pathlengthbin-1)*data.distancebinwidth);
                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter = data.individual(i).termination.pathlengthbins(pathlengthbin-1).piece(length(data.individual(i).termination.pathlengthbins(pathlengthbin-1).piece)).distaldiameter;
                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea      = pi*((data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).volume           = (pi/12)*data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).length*(data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);

                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition      = data.individual(i).termination.pathlengthbins(pathlengthbin-1).piece(end).distalxposition;
                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition      = data.individual(i).termination.pathlengthbins(pathlengthbin-1).piece(end).distalyposition;
                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition      = data.individual(i).termination.pathlengthbins(pathlengthbin-1).piece(end).distalzposition;
                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength     = data.individual(i).termination.pathlengthbins(pathlengthbin-1).piece(end).distalpathlength;
                        data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                                   + (data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                                   + (data.individual(i).termination.pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;


                    end
                end
            end


            % Put the piece into the appropriate radial distance bin

            for radialdistancebin = currentproximalradialdistancebin:radialdistancestep:currentdistalradialdistancebin
            % Repeat for as many partial pieces as there will end up being 

                if isfield(data.individual(i).termination,'radialdistancebins')==0; nextpiece = 1;
                elseif radialdistancebin > length(data.individual(i).termination.radialdistancebins); nextpiece = 1;
                elseif isfield(data.individual(i).termination.radialdistancebins(radialdistancebin),'piece')==0; nextpiece = 1;
                else nextpiece = 1 + length(data.individual(i).termination.radialdistancebins(radialdistancebin).piece);
                end

                temppiece = setfield(mnpop.mn(i).piece(j),'partial','n');
                data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece) = temppiece;
                clear temppiece;

                if currentdistalradialdistancebin > currentproximalradialdistancebin
                    data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).partial = 'y';
                    if radialdistancebin == currentproximalradialdistancebin
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaltype           = [];
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length               = ((radialdistancebin*data.distancebinwidth-mnpop.mn(i).piece(j).proximalradialdistance)/(mnpop.mn(i).piece(j).distalradialdistance-mnpop.mn(i).piece(j).proximalradialdistance))*mnpop.mn(i).piece(j).length;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter       = mnpop.mn(i).piece(j).proximaldiameter - ((  (mnpop.mn(i).piece(j).proximaldiameter - mnpop.mn(i).piece(j).distaldiameter)/mnpop.mn(i).piece(j).length  ) * data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length);
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea          = pi*((data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).volume               = (pi/12)*data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length*(data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);

                        [xdirection, ydirection, zdirection]                                                           = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition      = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition      = mnpop.mn(i).piece(j).proximalyposition + ydirection * data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition      = mnpop.mn(i).piece(j).proximalzposition + zdirection * data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalpathlength     = data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength + data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalradialdistance = ( (data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                                         + (data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                                         + (data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;


                    elseif radialdistancebin > currentproximalradialdistancebin && radialdistancebin < currentdistalradialdistancebin
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaltype         = [];
						data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaltype           = [];
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length               = (data.distancebinwidth/(mnpop.mn(i).piece(j).distalradialdistance-mnpop.mn(i).piece(j).proximalradialdistance))*mnpop.mn(i).piece(j).length;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter     = data.individual(i).termination.radialdistancebins(radialdistancebin-1).piece(length(data.individual(i).termination.radialdistancebins(radialdistancebin-1).piece)).distaldiameter;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter       = data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter - ((  (mnpop.mn(i).piece(j).proximaldiameter - mnpop.mn(i).piece(j).distaldiameter)/mnpop.mn(i).piece(j).length  ) * data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length);
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea          = pi*((data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).volume               = (pi/12)*data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length*(data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);

                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition      = data.individual(i).termination.radialdistancebins(radialdistancebin-1).piece(end).distalxposition;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition      = data.individual(i).termination.radialdistancebins(radialdistancebin-1).piece(end).distalyposition;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition      = data.individual(i).termination.radialdistancebins(radialdistancebin-1).piece(end).distalzposition;
                        [xdirection, ydirection, zdirection]                                                     = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition        = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition        = mnpop.mn(i).piece(j).proximalxposition + ydirection * data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition        = mnpop.mn(i).piece(j).proximalxposition + zdirection * data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength     = data.individual(i).termination.radialdistancebins(radialdistancebin-1).piece(end).distalpathlength;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalpathlength       = data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength + data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                                   + (data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                                   + (data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalradialdistance = ( (data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                                 + (data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                                 + (data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                        

                    elseif radialdistancebin == currentdistalradialdistancebin
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaltype     = [];
						data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length           = ((mnpop.mn(i).piece(j).distalradialdistance-((radialdistancebin-1)*data.distancebinwidth))/(mnpop.mn(i).piece(j).distalradialdistance-mnpop.mn(i).piece(j).proximalradialdistance))*mnpop.mn(i).piece(j).length;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter = data.individual(i).termination.radialdistancebins(radialdistancebin-1).piece(length(data.individual(i).termination.radialdistancebins(radialdistancebin-1).piece)).distaldiameter;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea      = pi*((data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).volume           = (pi/12)*data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length*(data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);

                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition      = data.individual(i).termination.radialdistancebins(radialdistancebin-1).piece(end).distalxposition;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition      = data.individual(i).termination.radialdistancebins(radialdistancebin-1).piece(end).distalyposition;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition      = data.individual(i).termination.radialdistancebins(radialdistancebin-1).piece(end).distalzposition;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength     = data.individual(i).termination.radialdistancebins(radialdistancebin-1).piece(end).distalpathlength;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                                   + (data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                                   + (data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;


                    end

                elseif currentdistalradialdistancebin < currentproximalradialdistancebin
                    data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).partial = 'y';
                    if radialdistancebin == currentproximalradialdistancebin
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaltype           = [];
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length               = ((mnpop.mn(i).piece(j).proximalradialdistance-((radialdistancebin-1)*data.distancebinwidth))/(mnpop.mn(i).piece(j).proximalradialdistance-mnpop.mn(i).piece(j).distalradialdistance))*mnpop.mn(i).piece(j).length;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter       = mnpop.mn(i).piece(j).proximaldiameter - ((  (mnpop.mn(i).piece(j).proximaldiameter - mnpop.mn(i).piece(j).distaldiameter)/mnpop.mn(i).piece(j).length  ) * data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length);
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea          = pi*((data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).volume               = (pi/12)*data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length*(data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);

                        [xdirection, ydirection, zdirection]                                                           = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition      = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition      = mnpop.mn(i).piece(j).proximalyposition + ydirection * data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition      = mnpop.mn(i).piece(j).proximalzposition + zdirection * data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalpathlength     = data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength + data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalradialdistance = ( (data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                                         + (data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                                         + (data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;


                    elseif radialdistancebin < currentproximalradialdistancebin && radialdistancebin > currentdistalradialdistancebin
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaltype         = [];
						data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaltype           = [];
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length               = (data.distancebinwidth/(mnpop.mn(i).piece(j).proximalradialdistance-mnpop.mn(i).piece(j).distalradialdistance))*mnpop.mn(i).piece(j).length;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter     = data.individual(i).termination.radialdistancebins(radialdistancebin+1).piece(length(data.individual(i).termination.radialdistancebins(radialdistancebin+1).piece)).distaldiameter;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter       = data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter - ((  (mnpop.mn(i).piece(j).proximaldiameter - mnpop.mn(i).piece(j).distaldiameter)/mnpop.mn(i).piece(j).length  ) * data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length);
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea          = pi*((data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).volume               = (pi/12)*data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length*(data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);

                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition      = data.individual(i).termination.radialdistancebins(radialdistancebin+1).piece(end).distalxposition;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition      = data.individual(i).termination.radialdistancebins(radialdistancebin+1).piece(end).distalyposition;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition      = data.individual(i).termination.radialdistancebins(radialdistancebin+1).piece(end).distalzposition;
                        [xdirection, ydirection, zdirection]                                                             = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition        = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition        = mnpop.mn(i).piece(j).proximalxposition + ydirection * data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition        = mnpop.mn(i).piece(j).proximalxposition + zdirection * data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength     = data.individual(i).termination.radialdistancebins(radialdistancebin+1).piece(end).distalpathlength;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalpathlength       = data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength + data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                                           + (data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                                           + (data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalradialdistance = ( (data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                                         + (data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                                         + (data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                                            

                    elseif radialdistancebin == currentdistalradialdistancebin
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaltype     = [];
						data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length           = (((radialdistancebin*data.distancebinwidth)-mnpop.mn(i).piece(j).distalradialdistance)/(mnpop.mn(i).piece(j).proximalradialdistance-mnpop.mn(i).piece(j).distalradialdistance))*mnpop.mn(i).piece(j).length;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter = data.individual(i).termination.radialdistancebins(radialdistancebin+1).piece(length(data.individual(i).termination.radialdistancebins(radialdistancebin+1).piece)).distaldiameter;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).surfacearea      = pi*((data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).volume           = (pi/12)*data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).length*(data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter^2+data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximaldiameter*data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter+data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).distaldiameter^2);

                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition      = data.individual(i).termination.radialdistancebins(radialdistancebin+1).piece(end).distalxposition;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition      = data.individual(i).termination.radialdistancebins(radialdistancebin+1).piece(end).distalyposition;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition      = data.individual(i).termination.radialdistancebins(radialdistancebin+1).piece(end).distalzposition;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalpathlength     = data.individual(i).termination.radialdistancebins(radialdistancebin+1).piece(end).distalpathlength;
                        data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                                   + (data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                                   + (data.individual(i).termination.radialdistancebins(radialdistancebin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;


                    end
                end
            end        
			
			
			
			
			
			
			
			
			
            % Put the piece into the appropriate branch length bin      

            for branchlengthbin = currentproximalbranchlengthbin:currentdistalbranchlengthbin
            % Repeat for as many partial pieces as there will end up being 

                if     isfield(data.individual(i).termination,'branchlengthbins')==0; nextpiece = 1;
                elseif branchlengthbin > length(data.individual(i).termination.branchlengthbins); nextpiece = 1;
                elseif isfield(data.individual(i).termination.branchlengthbins(branchlengthbin),'piece')==0; nextpiece = 1;
                else nextpiece = 1 + length(data.individual(i).termination.branchlengthbins(branchlengthbin).piece);
                end

                temppiece = setfield(mnpop.mn(i).piece(j),'partial','n');
                data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece) = temppiece;
                clear temppiece;

                if currentdistalbranchlengthbin ~= currentproximalbranchlengthbin
                % If the piece lies in two or more branch length bins, split the piece and bin the current partial piece

                    data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).partial = 'y';

                    if branchlengthbin == currentproximalbranchlengthbin
                    % If the current partial piece falls in the proximal branch length bin

                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).distaltype           = [];
                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).length               = (branchlengthbin*data.branchlengthbinwidth) - mnpop.mn(i).piece(j).proximalbranchlength;
                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter       = mnpop.mn(i).piece(j).proximaldiameter - ((  (mnpop.mn(i).piece(j).proximaldiameter - mnpop.mn(i).piece(j).distaldiameter)/mnpop.mn(i).piece(j).length  ) * data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).length);
                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea          = pi*((data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).volume               = (pi/12)*data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).length*(data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter^2+data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter*data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter+data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter^2);

                        [xdirection, ydirection, zdirection]                                               = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition      = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition      = mnpop.mn(i).piece(j).proximalyposition + ydirection * data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition      = mnpop.mn(i).piece(j).proximalzposition + zdirection * data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).distalbranchlength     = data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength + data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).distalradialdistance = ( (data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                             + (data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                             + (data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;


                    elseif branchlengthbin > currentproximalbranchlengthbin && branchlengthbin < currentdistalbranchlengthbin
                    % If the current partial piece falls between the proximal and distal branch length bins

                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaltype         = [];
						data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).distaltype           = [];
                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).length               = data.branchlengthbinwidth;
                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter     = data.individual(i).termination.branchlengthbins(branchlengthbin-1).piece(length(data.individual(i).termination.branchlengthbins(branchlengthbin-1).piece)).distaldiameter;
                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter       = data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter - ((  (mnpop.mn(i).piece(j).proximaldiameter - mnpop.mn(i).piece(j).distaldiameter)/mnpop.mn(i).piece(j).length  ) * data.branchlengthbinwidth);
                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea          = pi*((data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).volume               = (pi/12)*data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).length*(data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter^2+data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter*data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter+data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter^2);

                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition      = data.individual(i).termination.branchlengthbins(branchlengthbin-1).piece(end).distalxposition;
                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition      = data.individual(i).termination.branchlengthbins(branchlengthbin-1).piece(end).distalyposition;
                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition      = data.individual(i).termination.branchlengthbins(branchlengthbin-1).piece(end).distalzposition;
                        [xdirection, ydirection, zdirection]                                                     = directionfunction(mnpop.mn(i).piece(j).elevation,mnpop.mn(i).piece(j).azimuth);                   
                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition        = mnpop.mn(i).piece(j).proximalxposition + xdirection * data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition        = mnpop.mn(i).piece(j).proximalxposition + ydirection * data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition        = mnpop.mn(i).piece(j).proximalxposition + zdirection * data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength     = data.individual(i).termination.branchlengthbins(branchlengthbin-1).piece(end).distalbranchlength;
                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).distalbranchlength       = data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength + data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).length;
                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                                   + (data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                                   + (data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).distalradialdistance = ( (data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).distalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                                 + (data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).distalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                                 + (data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).distalzposition-mnpop.mn(i).zposition)^2 )^0.5;
                        

                    elseif branchlengthbin == currentdistalbranchlengthbin
                    % If the current partial piece falls in the distal branch length bin

                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaltype     = [];
						data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).length           = mnpop.mn(i).piece(j).distalbranchlength - ((branchlengthbin-1)*data.branchlengthbinwidth);
                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter = data.individual(i).termination.branchlengthbins(branchlengthbin-1).piece(length(data.individual(i).termination.branchlengthbins(branchlengthbin-1).piece)).distaldiameter;
                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).surfacearea      = pi*((data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)+(data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter/2)-(data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).length^2)^0.5);
                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).volume           = (pi/12)*data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).length*(data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter^2+data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximaldiameter*data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter+data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).distaldiameter^2);

                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition      = data.individual(i).termination.branchlengthbins(branchlengthbin-1).piece(end).distalxposition;
                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition      = data.individual(i).termination.branchlengthbins(branchlengthbin-1).piece(end).distalyposition;
                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition      = data.individual(i).termination.branchlengthbins(branchlengthbin-1).piece(end).distalzposition;
                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalbranchlength     = data.individual(i).termination.branchlengthbins(branchlengthbin-1).piece(end).distalbranchlength;
                        data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalradialdistance = ( (data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalxposition-mnpop.mn(i).xposition)^2 ...
                                                                                                                   + (data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalyposition-mnpop.mn(i).yposition)^2 ...
                                                                                                                   + (data.individual(i).termination.branchlengthbins(branchlengthbin).piece(nextpiece).proximalzposition-mnpop.mn(i).zposition)^2 )^0.5;


                    end
                end
            end			
			
			
			
			
			
			
			
			
			
			
            % End of termination piece binning
        else disp('Error: piece type not identified.');
        % End of piece binning
        end
        
        % Start of whole motoneuron analysis and bifurcation/termination counting

        if mnpop.mn(i).piece(j).branchorder > data.individual(i).maxbranchorder
            data.individual(i).maxbranchorder = mnpop.mn(i).piece(j).branchorder;
        end

        data.individual(i).totallength      = data.individual(i).totallength      + mnpop.mn(i).piece(j).length;
        data.individual(i).totalsurfacearea = data.individual(i).totalsurfacearea + mnpop.mn(i).piece(j).surfacearea;      
        data.individual(i).totalvolume      = data.individual(i).totalvolume      + mnpop.mn(i).piece(j).volume;      
        
        if strcmp(mnpop.mn(i).piece(j).distaltype,'bifurcation') == 1
            data.individual(i).numberbifurcations = data.individual(i).numberbifurcations + 1;
            if mnpop.mn(i).piece(j).daughter1diameter < mnpop.mn(i).piece(j).daughter2diameter
                disp(' ');
                disp('Error: daughter 2 diameter is greater than daughter 1 diameter.');
                disp(sprintf('Daughter Ratio: %f',mnpop.mn(i).piece(j).daughterratio));
                disp(sprintf('Daughter 1 Diameter: %f',mnpop.mn(i).piece(j).daughter1diameter));
                disp(sprintf('Daughter 2 Diameter: %f',mnpop.mn(i).piece(j).daughter2diameter));
            end
        end
        
        if strcmp(mnpop.mn(i).piece(j).distaltype,'termination') == 1
            data.individual(i).numberterminations = data.individual(i).numberterminations + 1;
            if mnpop.mn(i).piece(j).branchorder < data.individual(i).minbranchorder
                data.individual(i).minbranchorder = mnpop.mn(i).piece(j).branchorder;
            end
        end
        
        % End of whole motoneuron analysis and bifurcation/termination counting
        
    end
    % Finished going through a piece

end
% Finished going through a motoneuron




