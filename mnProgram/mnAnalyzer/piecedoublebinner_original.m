function data = piecedoublebinner(data)
%Divides pieces into cables, primarydendritebins, branchorderbins,
%pathlengthbins, radialdistance bins, bifurcationbin, and terminationbin

disp('   Piece double binning started.');

% Pre-allocate the bins
for i = 1:length(data.individual)
    pathlengthbinlengths(i) = length(data.individual(i).pathlengthbins);
end
maxpathlengthbin = max(pathlengthbinlengths);
for j = 1:length(data.individual)
    for k = 1:length(data.population.diameterbins)
        for m = 1:maxpathlengthbin
            data.individual(j).doublebins.diameterbins(k).pathlengthbins(m).length = [];
            %data.individual(j).doublebins.diameterbins(k).pathlengthbins(m).piece  = [];
            data.individual(j).bifurcation.doublebins.diameterbins(k).pathlengthbins(m).length = [];
            data.individual(j).termination.doublebins.diameterbins(k).pathlengthbins(m).length = [];
            %data.individual(j).bifurcation.doublebins.diameterbins(k).pathlengthbins(m).piece  = [];
            %data.individual(j).termination.doublebins.diameterbins(k).pathlengthbins(m).piece  = [];
        end
    end
end



for mnnum = 1:length(data.individual)

    for diameterbin = 1:length(data.individual(mnnum).diameterbins)

        if isfield(data.individual(mnnum).diameterbins(diameterbin),'piece') == 1

            for currentpiece = 1:length(data.individual(mnnum).diameterbins(diameterbin).piece)

                currentproximalpathlength        = data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).proximalpathlength;
                currentdistalpathlength          = data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).distalpathlength;
                currentproximalpathlengthbin     = 1 + floor(currentproximalpathlength / data.distancebinwidth);
                currentdistalpathlengthbin       = 1 + floor(currentdistalpathlength / data.distancebinwidth);


                % Put the piece into the appropriate path length bin

                for pathlengthbin = currentproximalpathlengthbin:currentdistalpathlengthbin
                    % Repeat for as many partial pieces as there will end up being

                    if     isfield(data.individual(mnnum),'doublebins')==0; nextpiece = 1;
                    elseif diameterbin > length(data.individual(mnnum).doublebins.diameterbins); nextpiece = 1;
                    elseif isfield(data.individual(mnnum).doublebins.diameterbins(diameterbin),'pathlengthbins')==0; nextpiece = 1;
                    elseif pathlengthbin > length(data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins); nextpiece = 1;
                    elseif isfield(data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin),'piece')==0; nextpiece = 1;
                    else nextpiece = 1 + length(data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece);
                    end

                    temppiece = setfield(data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece),'partial2','n');
                    data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece) = temppiece;
                    clear temppiece;

                    if currentdistalpathlengthbin ~= currentproximalpathlengthbin
                        % If the piece lies in two or more path length bins, split the piece and bin the current partial piece

                        data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).partial2 = 'y';

                        if pathlengthbin == currentproximalpathlengthbin
                            % If the current partial piece falls in the proximal path length bin

                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaltype           = [];
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio            = [];
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio1           = [];
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio2           = [];
							data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio3           = [];
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).daughterratio        = [];
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).parentdaughterratio  = [];
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).parentdaughter2ratio = [];
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length               = (pathlengthbin*data.distancebinwidth) - data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).proximalpathlength;
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter       = data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).proximaldiameter - (data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).taperrate * data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length);
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea          = pi*((data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).volume               = (pi/12)*data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length*(data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);

                            [xdirection, ydirection, zdirection]                                               = directionfunction(data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).elevation,data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).azimuth);
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition      = data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).proximalxposition + xdirection * data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition      = data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).proximalyposition + ydirection * data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition      = data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).proximalzposition + zdirection * data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalpathlength     = data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength + data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalradialdistance = ( (data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition-data.individual(mnnum).xposition)^2 ...
                                + (data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition-data.individual(mnnum).yposition)^2 ...
                                + (data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition-data.individual(mnnum).zposition)^2 )^0.5;


                        elseif pathlengthbin > currentproximalpathlengthbin && pathlengthbin < currentdistalpathlengthbin
                            % If the current partial piece falls between the proximal and distal path length bins

                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaltype         = [];
							data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaltype           = [];
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio            = [];
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio1           = [];
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio2           = [];
							data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio3           = [];
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).daughterratio        = [];
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).parentdaughterratio  = [];
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).parentdaughter2ratio = [];
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length               = data.distancebinwidth;
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter     = data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(length(data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece)).distaldiameter;
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter       = data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter - (data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).taperrate * data.distancebinwidth);
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea          = pi*((data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).volume               = (pi/12)*data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length*(data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);

                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition      = data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalxposition;
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition      = data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalyposition;
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition      = data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalzposition;
                            [xdirection, ydirection, zdirection]                                                     = directionfunction(data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).elevation,data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).azimuth);
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition        = data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).proximalxposition + xdirection * data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition        = data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).proximalxposition + ydirection * data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition        = data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).proximalxposition + zdirection * data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength     = data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalpathlength;
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalpathlength       = data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength + data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalradialdistance = ( (data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition-data.individual(mnnum).xposition)^2 ...
                                + (data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition-data.individual(mnnum).yposition)^2 ...
                                + (data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition-data.individual(mnnum).zposition)^2 )^0.5;
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalradialdistance = ( (data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition-data.individual(mnnum).xposition)^2 ...
                                + (data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition-data.individual(mnnum).yposition)^2 ...
                                + (data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition-data.individual(mnnum).zposition)^2 )^0.5;
                            

                        elseif pathlengthbin == currentdistalpathlengthbin
                            % If the current partial piece falls in the distal path length bin

                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaltype     = [];
							data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length           = data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).distalpathlength - ((pathlengthbin-1)*data.distancebinwidth);
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter = data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(length(data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece)).distaldiameter;
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea      = pi*((data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).volume           = (pi/12)*data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length*(data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);

                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition      = data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalxposition;
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition      = data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalyposition;
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition      = data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalzposition;
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength     = data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalpathlength;
                            data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalradialdistance = ( (data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition-data.individual(mnnum).xposition)^2 ...
                                + (data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition-data.individual(mnnum).yposition)^2 ...
                                + (data.individual(mnnum).doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition-data.individual(mnnum).zposition)^2 )^0.5;


                        end
                        % End of individual split piece path length binning
                    end
                    % End of split piece path length binning for this piece
                end
                % End of path length binning








                if strcmp(data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).branchtype,'b') == 1
                % Begin bifurcation piece binning

                    % Put the piece into the appropriate path length bin

                    for pathlengthbin = currentproximalpathlengthbin:currentdistalpathlengthbin
                        % Repeat for as many partial pieces as there will end up being

                        if     isfield(data.individual(mnnum).bifurcation,'doublebins')==0; nextpiece = 1;
                        elseif diameterbin > length(data.individual(mnnum).bifurcation.doublebins.diameterbins); nextpiece = 1;
                        elseif isfield(data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin),'pathlengthbins')==0; nextpiece = 1;
                        elseif pathlengthbin > length(data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins); nextpiece = 1;
                        elseif isfield(data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin),'piece')==0; nextpiece = 1;
                        else nextpiece = 1 + length(data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece);
                        end

                        temppiece = setfield(data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece),'partial2','n');
                        data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece) = temppiece;
                        clear temppiece;

                        if currentdistalpathlengthbin ~= currentproximalpathlengthbin
                            % If the piece lies in two or more path length bins, split the piece and bin the current partial piece

                            data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).partial2 = 'y';

                            if pathlengthbin == currentproximalpathlengthbin
                                % If the current partial piece falls in the proximal path length bin

                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaltype           = [];
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio            = [];
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio1           = [];
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio2           = [];
								data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio3           = [];
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).daughterratio        = [];
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).parentdaughterratio  = [];
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).parentdaughter2ratio = [];
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length               = (pathlengthbin*data.distancebinwidth) - data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).proximalpathlength;
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter       = data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).proximaldiameter - (data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).taperrate * data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length);
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea          = pi*((data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).volume               = (pi/12)*data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length*(data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);

                                [xdirection, ydirection, zdirection]                                               = directionfunction(data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).elevation,data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).azimuth);
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition      = data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).proximalxposition + xdirection * data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition      = data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).proximalyposition + ydirection * data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition      = data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).proximalzposition + zdirection * data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalpathlength     = data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength + data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalradialdistance = ( (data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition-data.individual(mnnum).xposition)^2 ...
                                    + (data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition-data.individual(mnnum).yposition)^2 ...
                                    + (data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition-data.individual(mnnum).zposition)^2 )^0.5;


                            elseif pathlengthbin > currentproximalpathlengthbin && pathlengthbin < currentdistalpathlengthbin
                                % If the current partial piece falls between the proximal and distal path length bins

                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaltype         = [];
								data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaltype           = [];
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio            = [];
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio1           = [];
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio2           = [];
								data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).rallratio3           = [];
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).daughterratio        = [];
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).parentdaughterratio  = [];
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).parentdaughter2ratio = [];
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length               = data.distancebinwidth;
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter     = data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(length(data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece)).distaldiameter;
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter       = data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter - (data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).taperrate * data.distancebinwidth);
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea          = pi*((data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).volume               = (pi/12)*data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length*(data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);

                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition      = data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalxposition;
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition      = data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalyposition;
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition      = data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalzposition;
                                [xdirection, ydirection, zdirection]                                                     = directionfunction(data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).elevation,data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).azimuth);
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition        = data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).proximalxposition + xdirection * data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition        = data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).proximalxposition + ydirection * data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition        = data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).proximalxposition + zdirection * data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength     = data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalpathlength;
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalpathlength       = data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength + data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalradialdistance = ( (data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition-data.individual(mnnum).xposition)^2 ...
                                    + (data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition-data.individual(mnnum).yposition)^2 ...
                                    + (data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition-data.individual(mnnum).zposition)^2 )^0.5;
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalradialdistance = ( (data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition-data.individual(mnnum).xposition)^2 ...
                                    + (data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition-data.individual(mnnum).yposition)^2 ...
                                    + (data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition-data.individual(mnnum).zposition)^2 )^0.5;
                                

                            elseif pathlengthbin == currentdistalpathlengthbin
                                % If the current partial piece falls in the distal path length bin

                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaltype     = [];
								data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length           = data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).distalpathlength - ((pathlengthbin-1)*data.distancebinwidth);
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter = data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(length(data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece)).distaldiameter;
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea      = pi*((data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).volume           = (pi/12)*data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length*(data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);

                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition      = data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalxposition;
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition      = data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalyposition;
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition      = data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalzposition;
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength     = data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalpathlength;
                                data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalradialdistance = ( (data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition-data.individual(mnnum).xposition)^2 ...
                                    + (data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition-data.individual(mnnum).yposition)^2 ...
                                    + (data.individual(mnnum).bifurcation.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition-data.individual(mnnum).zposition)^2 )^0.5;


                            end
                            % End of individual split piece path length binning
                        end
                        % End of split piece path length binning for this piece
                    end
                    % End of path length binning
                
                % End of bifurcation binning


                elseif strcmp(data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).branchtype,'t') == 1
                % Begin termination piece binning

                    % Put the piece into the appropriate path length bin

                    for pathlengthbin = currentproximalpathlengthbin:currentdistalpathlengthbin
                        % Repeat for as many partial pieces as there will end up being

                        if     isfield(data.individual(mnnum).termination,'doublebins')==0; nextpiece = 1;
                        elseif diameterbin > length(data.individual(mnnum).termination.doublebins.diameterbins); nextpiece = 1;
                        elseif isfield(data.individual(mnnum).termination.doublebins.diameterbins(diameterbin),'pathlengthbins')==0; nextpiece = 1;
                        elseif pathlengthbin > length(data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins); nextpiece = 1;
                        elseif isfield(data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin),'piece')==0; nextpiece = 1;
                        else nextpiece = 1 + length(data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece);
                        end

                        temppiece = setfield(data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece),'partial2','n');
                        data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece) = temppiece;
                        clear temppiece;

                        if currentdistalpathlengthbin ~= currentproximalpathlengthbin
                            % If the piece lies in two or more path length bins, split the piece and bin the current partial piece

                            data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).partial2 = 'y';

                            if pathlengthbin == currentproximalpathlengthbin
                                % If the current partial piece falls in the proximal path length bin

                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaltype           = [];
                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length               = (pathlengthbin*data.distancebinwidth) - data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).proximalpathlength;
                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter       = data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).proximaldiameter - (data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).taperrate * data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length);
                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea          = pi*((data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).volume               = (pi/12)*data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length*(data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);

                                [xdirection, ydirection, zdirection]                                               = directionfunction(data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).elevation,data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).azimuth);
                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition      = data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).proximalxposition + xdirection * data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition      = data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).proximalyposition + ydirection * data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition      = data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).proximalzposition + zdirection * data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalpathlength     = data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength + data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalradialdistance = ( (data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition-data.individual(mnnum).xposition)^2 ...
                                    + (data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition-data.individual(mnnum).yposition)^2 ...
                                    + (data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition-data.individual(mnnum).zposition)^2 )^0.5;


                            elseif pathlengthbin > currentproximalpathlengthbin && pathlengthbin < currentdistalpathlengthbin
                                % If the current partial piece falls between the proximal and distal path length bins

                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaltype         = [];
								data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaltype           = [];
                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length               = data.distancebinwidth;
                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter     = data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(length(data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece)).distaldiameter;
                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter       = data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter - (data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).taperrate * data.distancebinwidth);
                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea          = pi*((data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).volume               = (pi/12)*data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length*(data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);

                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition      = data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalxposition;
                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition      = data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalyposition;
                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition      = data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalzposition;
                                [xdirection, ydirection, zdirection]                                                     = directionfunction(data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).elevation,data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).azimuth);
                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition        = data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).proximalxposition + xdirection * data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition        = data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).proximalxposition + ydirection * data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition        = data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).proximalxposition + zdirection * data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength     = data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalpathlength;
                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalpathlength       = data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength + data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length;
                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalradialdistance = ( (data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition-data.individual(mnnum).xposition)^2 ...
                                    + (data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition-data.individual(mnnum).yposition)^2 ...
                                    + (data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition-data.individual(mnnum).zposition)^2 )^0.5;
                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalradialdistance = ( (data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalxposition-data.individual(mnnum).xposition)^2 ...
                                    + (data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalyposition-data.individual(mnnum).yposition)^2 ...
                                    + (data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distalzposition-data.individual(mnnum).zposition)^2 )^0.5;
                                

                            elseif pathlengthbin == currentdistalpathlengthbin
                                % If the current partial piece falls in the distal path length bin

                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaltype     = [];
								data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length           = data.individual(mnnum).diameterbins(diameterbin).piece(currentpiece).distalpathlength - ((pathlengthbin-1)*data.distancebinwidth);
                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter = data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(length(data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece)).distaldiameter;
                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).surfacearea      = pi*((data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)+(data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))*(((((data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter/2)-(data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter/2))^2)+data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length^2)^0.5);
                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).volume           = (pi/12)*data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).length*(data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter^2+data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximaldiameter*data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter+data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).distaldiameter^2);

                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition      = data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalxposition;
                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition      = data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalyposition;
                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition      = data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalzposition;
                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalpathlength     = data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin-1).piece(end).distalpathlength;
                                data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalradialdistance = ( (data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalxposition-data.individual(mnnum).xposition)^2 ...
                                    + (data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalyposition-data.individual(mnnum).yposition)^2 ...
                                    + (data.individual(mnnum).termination.doublebins.diameterbins(diameterbin).pathlengthbins(pathlengthbin).piece(nextpiece).proximalzposition-data.individual(mnnum).zposition)^2 )^0.5;


                            end
                            % End of individual split piece path length binning
                        end
                        % End of split piece path length binning for this piece
                    end
                    % End of path length binning
                else
                    disp('Error: piece branch type not identified.');
                    keyboard
                end
                % End of termination binning

                
                
                
            end
            % End of pieces in this diameter bin
        end
        % End of piece
    end
    % End of diameter bins
end
% End of motoneuron






























