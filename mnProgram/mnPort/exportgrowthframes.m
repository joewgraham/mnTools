function exportgrowthframes(mnpop)

[helppath,addpaths] = fileparts(which('mnaddpaths.m'));
cd(helppath);
cd ..
mnhome = cd;
cd(mnpop.datapathname);

numberframes = 10;

if ~exist('growthframes','dir')
    mkdir('growthframes');
end
cd('growthframes');
currenttime = datestr(now,'yyyy-mm-dd_HH-MM-SS');

if ~exist(currenttime,'dir')
    mkdir(currenttime);
end
cd(currenttime);

if ~exist('hdf5','dir')
    mkdir('hdf5');
end
cd('hdf5');


disp(' ');
disp('    Please enter the structures to grow.');
disp('      1. Soma');
disp('      2. Axon');
disp('      3. Dendrites');
disp('      4. Apicals');
disp('      5. All');
piecetypestogrow = input('    Enter a number: ');
if isempty(piecetypestogrow) || ismember(5,piecetypestogrow) == 1
    piecetypestogrow = [1 2 3 4];
    firstframenumber = [];
end

disp(' ');
firstframenumber = input('    Enter the first frame number: ');


disp(' ');
disp('    Please enter the growth type.');
disp('      1. Growth per frame');
disp('      2. Number of frames');
growthtype = input('    Enter a number: ');
if isempty(growthtype)
    growthtype = 1;
end

if growthtype == 1
    if ismember(2,piecetypestogrow)
        disp(' ');
        disp(sprintf('    Axonal maximum path length: %0.2f',max([mnpop.mn(1).axon.distalpathlength])));
        disp('    Please type "max" or enter the growth per frame');
        input1 = input('    for axons (microns): ','s');
        if isempty(input1)
            input1 = 'max';
        end
    else
        input1 = [];
    end
    if ismember(3,piecetypestogrow)
        disp(' ');
        disp(sprintf('    Dendritic maximum path length: %0.2f',max([mnpop.mn(1).dendrite.distalpathlength])));
        disp('    Please type "max" or enter the growth per frame');
        input2 = input('    for dendrites (microns): ','s');
        if isempty(input2)
            input2 = 'max';
        end
    else
        input2 = [];
    end
    if ismember(4,piecetypestogrow)
        disp(' ');
        disp(sprintf('    Apical maximum path length: %0.2f',max([mnpop.mn(1).apical.distalpathlength])));
        disp('    Please type "max" or enter the growth per frame');
        input3 = input('    for apical dendrites (microns): ','s');
        if isempty(input3)
            input3 = 'max';
        end
    else
        input3 = [];
    end
elseif growthtype == 2
    disp(' ');
    disp('    Please enter the approximate number');
    input4 = input('    of frames to create: ');
    numberframes = input4;
else
    disp('    Error. Please start over.');
    return;
end

disp(' ');
disp('    To create rotation, please enter the');
degreesperframe = input('    number of degrees per frame: ');
if isempty(degreesperframe)
    degreesperframe = 0;
end

disp(' ');
disp('    Include scaled branch diameter?');
disp('      1. Yes');
disp('      2. No');
branchscaling = input('    Enter a number: ');
if isempty(branchscaling)
    branchscaling = 2;
end

disp(' ');
disp('    To have additional frames after growth');
disp('    is complete, please enter the number of');
additionalframes = input('    additional frames: ');
if isempty(additionalframes)
    additionalframes = 0;
end

disp(' ');
disp('    To inject noise, please enter the.');
noise = input('    maximum deviation (microns): ');
if isempty(noise)
    noise = 0;
end

disp(' ');
disp('    Exporting data to growth frames.');
disp(' ');

piecetypes{1} = 'soma';
piecetypes{2} = 'axon';
piecetypes{3} = 'dendrite';
piecetypes{4} = 'apical';

for mnnum = 1:length(mnpop.mn)
    
    if growthtype == 2
        if isfield(mnpop.mn(mnnum),'axon')
            growthrate(1,2) = 1.01*max([mnpop.mn(mnnum).axon.distalpathlength]/numberframes);
        else
            growthrate(1,2) = 0;
        end
        if isfield(mnpop.mn(mnnum),'dendrite')
            growthrate(1,3) = 1.01*max([mnpop.mn(mnnum).dendrite.distalpathlength]/numberframes);
        else
            growthrate(1,3) = 0;
        end
        if isfield(mnpop.mn(mnnum),'apical')
            growthrate(1,4) = 1.01*max([mnpop.mn(mnnum).apical.distalpathlength]/numberframes);
        else
            growthrate(1,4) = 0;
        end
    else
        if ismember(2,piecetypestogrow) && isfield(mnpop.mn(mnnum),'axon')
            if strcmp(input1,'max')
                growthrate(1,2) = max([mnpop.mn(mnnum).axon.distalpathlength]);
            else
                growthrate(1,2) = str2num(input1);
            end
        else
            growthrate(1,2) = 0;
        end
        if ismember(3,piecetypestogrow) && isfield(mnpop.mn(mnnum),'dendrite')
            if strcmp(input2,'max')
                growthrate(1,3) = max([mnpop.mn(mnnum).dendrite.distalpathlength]);
            else
                growthrate(1,3) = str2num(input2);
            end
        else
            growthrate(1,3) = 0;
        end
        if ismember(4,piecetypestogrow) && isfield(mnpop.mn(mnnum),'apical')
            if strcmp(input3,'max')
                growthrate(1,4) = max([mnpop.mn(mnnum).apical.distalpathlength]);
            else
                growthrate(1,4) = str2num(input3);
            end
        else
            growthrate(1,4) = 0;
        end
    end
    
    filecount = 0;
    growth = [0 0 0 0];
    
    if isfield(mnpop.mn(mnnum),'axon')
        axonmax = max([mnpop.mn(mnnum).axon.distalpathlength]);
    else
        axonmax = -1;
    end
    if isfield(mnpop.mn(mnnum),'dendrite')
        dendritemax = max([mnpop.mn(mnnum).dendrite.distalpathlength]);
    else
        dendritemax = -1;
    end
    if isfield(mnpop.mn(mnnum),'apical')
        apicalmax = max([mnpop.mn(mnnum).apical.distalpathlength]);
    else
        apicalmax = -1;
    end
    
    maxgrowth = [-1 axonmax dendritemax apicalmax];
    
    if ismember(2,piecetypestogrow) == 1
        axonmax = max([mnpop.mn(mnnum).axon.distalpathlength]);
    else
        axonmax = -1;
    end
    if ismember(3,piecetypestogrow) == 1
        dendritemax = max([mnpop.mn(mnnum).dendrite.distalpathlength]);
    else
        dendritemax = -1;
    end
    if ismember(4,piecetypestogrow) == 1
        apicalmax = max([mnpop.mn(mnnum).apical.distalpathlength]);
    else
        apicalmax = -1;
    end
    
    maxpathlength = [-1 axonmax dendritemax apicalmax];
    
    while sum(growth >= maxpathlength) < 4
        
        filecount = filecount + 1;
        growth = filecount * growthrate;
        growth = min(growth,maxgrowth);
        growthpercent = growth ./ maxgrowth;
        degrees = filecount * degreesperframe;
        
%         swcdata(1,1) = 1;
%         swcdata(1,2) = 1;
%         swcdata(1,3) = mnpop.mn(mnnum).xposition;
%         swcdata(1,4) = mnpop.mn(mnnum).yposition;
%         swcdata(1,5) = mnpop.mn(mnnum).zposition;
%         swcdata(1,6) = mnpop.mn(mnnum).somadiameter/2;
%         swcdata(1,7) = -1;
        
        pointsdata(1,1) = mnpop.mn(mnnum).xposition;
        pointsdata(1,2) = mnpop.mn(mnnum).yposition;
        pointsdata(1,3) = mnpop.mn(mnnum).zposition;
        pointsdata(1,4) = mnpop.mn(mnnum).soma.diameter;
        
        structuredata(1,1) = 0;
        structuredata(1,2) = 1;
        structuredata(1,3) = -1;
        
        linenumber = 1;
        pointsnumber = 1;
        structurenumber = 1;
        
        if isfield(mnpop.mn(mnnum),'hdf5') 
            if isfield(mnpop.mn(mnnum).hdf5,'soma')
                for hdsomacount = 1:length(mnpop.mn(mnnum).hdf5.soma)
                    if degrees == 0
                        pointsdata(pointsnumber,1) = mnpop.mn(mnnum).hdf5.soma(hdsomacount).xposition + (2*noise*rand(1,1) - noise);
                        pointsdata(pointsnumber,2) = mnpop.mn(mnnum).hdf5.soma(hdsomacount).yposition + (2*noise*rand(1,1) - noise);
                        pointsdata(pointsnumber,3) = mnpop.mn(mnnum).hdf5.soma(hdsomacount).zposition + (2*noise*rand(1,1) - noise);
                    else
                        v = [mnpop.mn(mnnum).hdf5.soma(hdsomacount).xposition; mnpop.mn(mnnum).hdf5.soma(hdsomacount).yposition; mnpop.mn(mnnum).hdf5.soma(hdsomacount).zposition];
                        R = [cosd(degrees) 0 sind(degrees); 0 1 0; -sind(degrees) 0 cosd(degrees)];
                        vnew = R*v;
                        pointsdata(pointsnumber,1) = vnew(1,1) + (2*noise*rand(1,1) - noise);
                        pointsdata(pointsnumber,2) = vnew(2,1) + (2*noise*rand(1,1) - noise);
                        pointsdata(pointsnumber,3) = vnew(3,1) + (2*noise*rand(1,1) - noise);
                    end
                    pointsdata(pointsnumber,4) = 0;
                    pointsnumber = pointsnumber + 1;
                end
                pointsnumber = pointsnumber - 1;
                structuredata(structurenumber,1) = 0;
                structuredata(structurenumber,2) = 1;
                structuredata(structurenumber,3) = -1;
            end
        end
        
        piecetypestogrow = piecetypestogrow(piecetypestogrow ~= 1);
        for piecetype = piecetypestogrow
            
            currentpiecetype = piecetypes{piecetype};
            currentgrowthpercent = growthpercent(piecetype);
            
            if isfield(mnpop.mn(mnnum),currentpiecetype)
                
                eval(['piece = mnpop.mn(mnnum).' currentpiecetype ';']);
                
                for piecenum = 1:length(piece)
                    
                    if strcmp(piece(piecenum).proximaltype,'primary    ') || strcmp(piece(piecenum).proximaltype,'daughter   ') || strcmp(piece(piecenum).proximaltype,'daughter1  ') || strcmp(piece(piecenum).proximaltype,'daughter2  ')
                        
                        if piece(piecenum).proximalpathlength < growth(piecetype)
                            
                            linenumber = linenumber + 1;
                            pointsnumber = pointsnumber + 1;
                            structurenumber = structurenumber + 1;
                            
%                             swcdata(linenumber,1) = linenumber;
%                             swcdata(linenumber,2) = piecetype;
%                             swcdata(linenumber,3) = piece(piecenum).proximalxposition;
%                             swcdata(linenumber,4) = piece(piecenum).proximalyposition;
%                             swcdata(linenumber,5) = piece(piecenum).proximalzposition;
%                             swcdata(linenumber,6) = piece(piecenum).proximaldiameter / 2;

                            if degrees == 0
                                pointsdata(pointsnumber,1) = piece(piecenum).proximalxposition + (2*noise*rand(1,1) - noise);
                                pointsdata(pointsnumber,2) = piece(piecenum).proximalyposition + (2*noise*rand(1,1) - noise);
                                pointsdata(pointsnumber,3) = piece(piecenum).proximalzposition + (2*noise*rand(1,1) - noise);
                            else
                                v = [piece(piecenum).proximalxposition; piece(piecenum).proximalyposition; piece(piecenum).proximalzposition];
                                R = [cosd(degrees) 0 sind(degrees); 0 1 0; -sind(degrees) 0 cosd(degrees)];
                                vnew = R*v;
                                pointsdata(pointsnumber,1) = vnew(1,1) + (2*noise*rand(1,1) - noise);
                                pointsdata(pointsnumber,2) = vnew(2,1) + (2*noise*rand(1,1) - noise);
                                pointsdata(pointsnumber,3) = vnew(3,1) + (2*noise*rand(1,1) - noise);
                            end
                            
                            if branchscaling == 1
                                pointsdata(pointsnumber,4) = piece(piecenum).proximaldiameter * currentgrowthpercent;
                            elseif branchscaling == 2
                                pointsdata(pointsnumber,4) = piece(piecenum).proximaldiameter;
                            else
                                disp('Error in exportgrowthframes.');
                                keyboard;
                            end
                            
                            structuredata(structurenumber,1) = pointsnumber - 1;
                            structuredata(structurenumber,2) = piecetype;
                            
                            if strcmp(piece(piecenum).proximaltype,'primary    ');
                                swcdata(linenumber,7) = 1;
                                structuredata(structurenumber,3) = 0;
                            else
                                swcdata(linenumber,7) = piece(piece(piecenum).parent).linenumber;
                                structuredata(structurenumber,3) = piece(piece(piecenum).parent).structurenumber;
                            end
                            
                            if piece(piecenum).distalpathlength < growth(piecetype)
                                
                                linenumber = linenumber + 1;
                                pointsnumber = pointsnumber + 1;
                                
%                                 swcdata(linenumber,1) = linenumber;
%                                 swcdata(linenumber,2) = piecetype;
%                                 swcdata(linenumber,3) = piece(piecenum).distalxposition;
%                                 swcdata(linenumber,4) = piece(piecenum).distalyposition;
%                                 swcdata(linenumber,5) = piece(piecenum).distalzposition;
%                                 swcdata(linenumber,6) = piece(piecenum).distaldiameter / 2;
%                                 swcdata(linenumber,7) = linenumber - 1;
                                
                                if degrees == 0
                                    pointsdata(pointsnumber,1) = piece(piecenum).distalxposition + (2*noise*rand(1,1) - noise);
                                    pointsdata(pointsnumber,2) = piece(piecenum).distalyposition + (2*noise*rand(1,1) - noise);
                                    pointsdata(pointsnumber,3) = piece(piecenum).distalzposition + (2*noise*rand(1,1) - noise);
                                else
                                    v = [piece(piecenum).distalxposition; piece(piecenum).distalyposition; piece(piecenum).distalzposition];
                                    R = [cosd(degrees) 0 sind(degrees); 0 1 0; -sind(degrees) 0 cosd(degrees)];
                                    vnew = R*v;
                                    pointsdata(pointsnumber,1) = vnew(1,1) + (2*noise*rand(1,1) - noise);
                                    pointsdata(pointsnumber,2) = vnew(2,1) + (2*noise*rand(1,1) - noise);
                                    pointsdata(pointsnumber,3) = vnew(3,1) + (2*noise*rand(1,1) - noise);
                                end
                                
                                if branchscaling == 1
                                    pointsdata(pointsnumber,4) = piece(piecenum).distaldiameter * currentgrowthpercent;
                                elseif branchscaling == 2
                                    pointsdata(pointsnumber,4) = piece(piecenum).distaldiameter;
                                else
                                    disp('Error in exportgrowthframes.');
                                    keyboard;
                                end
                                
                                piece(piecenum).linenumber = linenumber;
                                piece(piecenum).pointsnumber = pointsnumber;
                                piece(piecenum).structurenumber = structurenumber-1;
                                
                            else
                                
                                linenumber = linenumber + 1;
                                pointsnumber = pointsnumber + 1;
                                newpiecelength = growth(piecetype) - piece(piecenum).proximalpathlength;
                                newxposition   = piece(piecenum).proximalxposition + newpiecelength * piece(piecenum).xdirection;
                                newyposition   = piece(piecenum).proximalyposition + newpiecelength * piece(piecenum).ydirection;
                                newzposition   = piece(piecenum).proximalzposition + newpiecelength * piece(piecenum).zdirection;
                                newdiameter    = piece(piecenum).proximaldiameter - ((piece(piecenum).proximaldiameter-piece(piecenum).distaldiameter)/piece(piecenum).length)*newpiecelength;
                                
%                                 swcdata(linenumber,1) = linenumber;
%                                 swcdata(linenumber,2) = piecetype;
%                                 swcdata(linenumber,3) = newxposition;
%                                 swcdata(linenumber,4) = newyposition;
%                                 swcdata(linenumber,5) = newzposition;
%                                 swcdata(linenumber,6) = newdiameter / 2;
%                                 swcdata(linenumber,7) = linenumber - 1;
                                
                                if degrees == 0
                                    pointsdata(pointsnumber,1) = newxposition + (2*noise*rand(1,1) - noise);
                                    pointsdata(pointsnumber,2) = newyposition + (2*noise*rand(1,1) - noise);
                                    pointsdata(pointsnumber,3) = newzposition + (2*noise*rand(1,1) - noise);
                                else
                                    v = [newxposition; newyposition; newzposition];
                                    R = [cosd(degrees) 0 sind(degrees); 0 1 0; -sind(degrees) 0 cosd(degrees)];
                                    vnew = R*v;
                                    pointsdata(pointsnumber,1) = vnew(1,1) + (2*noise*rand(1,1) - noise);
                                    pointsdata(pointsnumber,2) = vnew(2,1) + (2*noise*rand(1,1) - noise);
                                    pointsdata(pointsnumber,3) = vnew(3,1) + (2*noise*rand(1,1) - noise);
                                end
                                
                                if branchscaling == 1
                                    pointsdata(pointsnumber,4) = newdiameter * currentgrowthpercent;
                                elseif branchscaling == 2
                                    pointsdata(pointsnumber,4) = newdiameter;
                                else
                                    disp('Error in exportgrowthframes.');
                                    keyboard;
                                end
                                
                            end
                            
                        end
                        
                    else
                        
                        if piece(piecenum).proximalpathlength < growth(piecetype)
                            
                            if piece(piecenum).distalpathlength < growth(piecetype)
                                
                                linenumber = linenumber + 1;
                                pointsnumber = pointsnumber + 1;
%                                 swcdata(linenumber,1) = linenumber;
%                                 swcdata(linenumber,2) = piecetype;
%                                 swcdata(linenumber,3) = piece(piecenum).distalxposition;
%                                 swcdata(linenumber,4) = piece(piecenum).distalyposition;
%                                 swcdata(linenumber,5) = piece(piecenum).distalzposition;
%                                 swcdata(linenumber,6) = piece(piecenum).distaldiameter / 2;
%                                 swcdata(linenumber,7) = piece(piece(piecenum).parent).linenumber;
                                if degrees == 0
                                    pointsdata(pointsnumber,1) = piece(piecenum).distalxposition + (2*noise*rand(1,1) - noise);
                                    pointsdata(pointsnumber,2) = piece(piecenum).distalyposition + (2*noise*rand(1,1) - noise);
                                    pointsdata(pointsnumber,3) = piece(piecenum).distalzposition + (2*noise*rand(1,1) - noise);
                                else
                                    v = [piece(piecenum).distalxposition; piece(piecenum).distalyposition; piece(piecenum).distalzposition];
                                    R = [cosd(degrees) 0 sind(degrees); 0 1 0; -sind(degrees) 0 cosd(degrees)];
                                    vnew = R*v;
                                    pointsdata(pointsnumber,1) = vnew(1,1) + (2*noise*rand(1,1) - noise);
                                    pointsdata(pointsnumber,2) = vnew(2,1) + (2*noise*rand(1,1) - noise);
                                    pointsdata(pointsnumber,3) = vnew(3,1) + (2*noise*rand(1,1) - noise);
                                end
                                
                                if branchscaling == 1
                                    pointsdata(pointsnumber,4) = piece(piecenum).distaldiameter * currentgrowthpercent;
                                elseif branchscaling == 2
                                    pointsdata(pointsnumber,4) = piece(piecenum).distaldiameter;
                                else
                                    disp('Error in exportgrowthframes.');
                                    keyboard;
                                end
                                
                                piece(piecenum).linenumber = linenumber;
                                piece(piecenum).pointsnumber = pointsnumber;
                                piece(piecenum).structurenumber = structurenumber-1;
                                
                            else
                                
                                linenumber = linenumber + 1;
                                pointsnumber = pointsnumber + 1;
                                newpiecelength = growth(piecetype) - piece(piecenum).proximalpathlength;
                                newxposition   = piece(piecenum).proximalxposition + newpiecelength * piece(piecenum).xdirection;
                                newyposition   = piece(piecenum).proximalyposition + newpiecelength * piece(piecenum).ydirection;
                                newzposition   = piece(piecenum).proximalzposition + newpiecelength * piece(piecenum).zdirection;
                                newdiameter    = piece(piecenum).proximaldiameter - ((piece(piecenum).proximaldiameter-piece(piecenum).distaldiameter)/piece(piecenum).length)*newpiecelength;
                                
                                
%                                 swcdata(linenumber,1) = linenumber;
%                                 swcdata(linenumber,2) = piecetype;
%                                 swcdata(linenumber,3) = newxposition;
%                                 swcdata(linenumber,4) = newyposition;
%                                 swcdata(linenumber,5) = newzposition;
%                                 swcdata(linenumber,6) = newdiameter / 2;
%                                 swcdata(linenumber,7) = linenumber - 1;
                                
                                if degrees == 0
                                    pointsdata(pointsnumber,1) = newxposition + (2*noise*rand(1,1) - noise);
                                    pointsdata(pointsnumber,2) = newyposition + (2*noise*rand(1,1) - noise);
                                    pointsdata(pointsnumber,3) = newzposition + (2*noise*rand(1,1) - noise);
                                else
                                    v = [newxposition; newyposition; newzposition];
                                    R = [cosd(degrees) 0 sind(degrees); 0 1 0; -sind(degrees) 0 cosd(degrees)];
                                    vnew = R*v;
                                    pointsdata(pointsnumber,1) = vnew(1,1) + (2*noise*rand(1,1) - noise);
                                    pointsdata(pointsnumber,2) = vnew(2,1) + (2*noise*rand(1,1) - noise);
                                    pointsdata(pointsnumber,3) = vnew(3,1) + (2*noise*rand(1,1) - noise);
                                end
                                
                                if branchscaling == 1
                                    pointsdata(pointsnumber,4) = newdiameter * currentgrowthpercent;
                                elseif branchscaling == 2
                                    pointsdata(pointsnumber,4) = newdiameter;
                                else
                                    disp('Error in exportgrowthframes.');
                                    keyboard;
                                end
                                
                            end
                            
                        end
                        
                    end
                    
                end
                
            end
            
        end
        [~,mnfilename,~] = fileparts(mnpop.mn(mnnum).filename);
        if ~isempty(firstframenumber)
            truefilecount = firstframenumber - 1 + filecount;
        else
            truefilecount = filecount;
        end
        
        % % Write swc files
        % if ~exist('swc','dir')
        %     mkdir('swc');
        %  end
        % cd('swc');
        % swcfilename = sprintf('%s_%s_%03.0f.swc',mnfilename,mnpop.datetime,truefilecount);
        % fid = fopen(swcfilename,'wt');
        % fprintf(fid,'%s\n','# Header Information for File');
        % for i = 1:length(swcdata)
        %     fprintf(fid,'%.0f %.0f %.3f %.3f %.3f %.3f %.0f\n',swcdata(i,1),swcdata(i,2),swcdata(i,3),swcdata(i,4),swcdata(i,5),swcdata(i,6),swcdata(i,7));
        % end
        % fclose(fid);
        % cd ..
        
        % % Write h5 files
        
        structuredata = int32(structuredata);
        %h5filename = sprintf('%s_%s_%03.0f.h5',mnfilename,mnpop.datetime,truefilecount);
        h5filename = sprintf('%s_%03.0f.h5',mnfilename,truefilecount);
        hdf5write(h5filename,'/points',pointsdata');
        hdf5write(h5filename,'/structure',structuredata','WriteMode','append');
        
        temppointsdata = pointsdata;
        tempstructuredata = structuredata;
        clear swcdata;
        clear pointsdata;
        clear structuredata;
    end
    
    for additionalframe = 1:additionalframes
        
        filecount = filecount + 1;
        truefilecount = truefilecount + 1;
        degrees = filecount * degreesperframe;
        
        for point = 1:length(temppointsdata)
            
            if degrees == 0
                pointsdata(point,1) = temppointsdata(point,1) + (2*noise*rand(1,1) - noise);
                pointsdata(point,2) = temppointsdata(point,2) + (2*noise*rand(1,1) - noise);
                pointsdata(point,3) = temppointsdata(point,3) + (2*noise*rand(1,1) - noise);
                pointsdata(point,4) = temppointsdata(point,4);
            else
                v = [temppointsdata(point,1); temppointsdata(point,2); temppointsdata(point,3)];
                R = [cosd(degrees) 0 sind(degrees); 0 1 0; -sind(degrees) 0 cosd(degrees)];
                vnew = R*v;
                pointsdata(point,1) = vnew(1,1) + (2*noise*rand(1,1) - noise);
                pointsdata(point,2) = vnew(2,1) + (2*noise*rand(1,1) - noise);
                pointsdata(point,3) = vnew(3,1) + (2*noise*rand(1,1) - noise);
                pointsdata(point,4) = temppointsdata(point,4);
            end
            
        end
                
        h5filename = sprintf('%s_%03.0f.h5',mnfilename,truefilecount);
        hdf5write(h5filename,'/points',pointsdata');
        hdf5write(h5filename,'/structure',tempstructuredata','WriteMode','append');
        
        clear pointsdata;
        
    end
    
end

createpngfiles = true;
if createpngfiles
    disp('    Creating ''.png'' files.');
    cd ..
    mkdir('png');
    system('Plot_Cairo -O png/ -i hdf5/*');
    cd('png');
    mkdir('xy');
    mkdir('yz');
    mkdir('xz');
    cd ..
    system('mv png/*xy.png png/xy/');
    system('mv png/*yz.png png/yz/');
    system('mv png/*xz.png png/xz/');
end

cd(mnhome);
