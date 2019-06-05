function mngenerator(inputfilename,popname)

[helppath,addpaths] = fileparts(which('mnaddpaths.m'));
cd(helppath);
cd ..
mnhome = cd;
mnoptions;

if strcmp(option.mngenerator.randomseed,'y')
    RandStream.setDefaultStream(RandStream('mt19937ar','seed',sum(100*clock)));
end

% ------------------------------------------------------------------------
% Read input file, or if none is specified, ask for one and read it
% ------------------------------------------------------------------------

if nargin==0
    disp('  Please choose an input file using the');
    disp('  dialog box.');
    [inputfilename, pathname] = uigetfile('*.m', 'Pick an input file for mnGenerator:');
    if isequal(inputfilename,0) || isequal(pathname,0)
        disp('  You must select a file to continue.');
        disp('  Please start over.');
        return;
    end
    run(fullfile(pathname,inputfilename));
    disp(sprintf('  %s%s', pathname, inputfilename))
    inputfilename=inputfilename(1:max(size(inputfilename))-2);
    
elseif nargin == 1 || nargin == 2
    if exist(sprintf('%s%s',inputfilename,'.m'),'file')==0 && exist(sprintf('%s',inputfilename),'file')==0
        disp(sprintf('%s','  That input file does not exist.'));
        disp(sprintf('%s','  Please choose an input file using the dialog box.'));
        [inputfilename, pathname] = uigetfile('*.m', 'Pick an input file for mnGenerator:');
        if isequal(inputfilename,0) || isequal(pathname,0)
            disp('  You must select a file to continue.');
            disp('  Please start over.');
            return;
        end
        run(fullfile(pathname,inputfilename));
        inputfilename=inputfilename(1:max(size(inputfilename))-2);        
    elseif exist(sprintf('%s%s',inputfilename,'.m'),'file')==0 && exist(sprintf('%s',inputfilename),'file')==2
        pathname=which(inputfilename);
        pathname=pathname(1:max(size(pathname))-max(size(inputfilename)));
        inputfilename=inputfilename(1:max(size(inputfilename))-2);
        %keyboard
        run(fullfile(pathname,inputfilename));        
    elseif exist(sprintf('%s%s',inputfilename,'.m'),'file')==2
        pathname=which(inputfilename);
        pathname=pathname(1:max(size(pathname))-max(size(inputfilename))-2);
        run(fullfile(pathname,inputfilename));        
    end
    input.file     = inputfilename;
    input.pathname = pathname;
    input.filename = inputfilename;
    if nargin == 2
        inputfilename  = popname;
        input.filename = popname;
    end
else
    disp('  You must specify a maximum of one file name.');
    disp('  Please start over.');
end

disp(' ');
disp('  ------------------------------------');
disp('   Motoneuron generation started.');
disp('  ------------------------------------');


% ------------------------------------------------------------------------
% If the storage folder with todays date exists, save the input data
% there.  Otherwise, create the folder and save the input data there.
% ------------------------------------------------------------------------

cd(mnhome);
cd mnData;

if exist(sprintf('%s_%s','data',datestr(now,'yyyy-mm-dd')),'dir')==7
    cd(sprintf('%s_%s','data',datestr(now,'yyyy-mm-dd')));
else
    mkdir(sprintf('%s_%s','data',datestr(now,'yyyy-mm-dd')));
    cd(sprintf('%s_%s','data',datestr(now,'yyyy-mm-dd')));
end

mnpop.datetime = datestr(now, 'yyyy-mm-dd_HH-MM');

if exist(sprintf('%s_%s',inputfilename,mnpop.datetime),'dir')==7
    cd(sprintf('%s_%s',inputfilename,mnpop.datetime));
else
    mkdir(sprintf('%s_%s',inputfilename,mnpop.datetime));
    cd(sprintf('%s_%s',inputfilename,mnpop.datetime));
end

inputname = sprintf('%s_input',inputfilename);
eval([inputname '= input;']);
save(sprintf('%s_%s_%s',inputfilename,mnpop.datetime,'input.mat'),inputname);

mnpop.datapathname  = cd;
%mnpop.inputfilename = input.filename;
mnpop.input         = input;

input.axon.numbertrunks.distribution   = 'constant';
input.axon.numbertrunks.const          = 1;
input.apical.numbertrunks.distribution = 'constant';
input.apical.numbertrunks.const        = 1;

% ------------------------------------------------------------------------
% Determine the number of cells to be created
% ------------------------------------------------------------------------

mnpop.numbercells = samplefunction(input.numbercells);

% ------------------------------------------------------------------------
% Pre-allocate the mnpop data structure
% ------------------------------------------------------------------------

mnpop.mn(mnpop.numbercells).id = [];

% ------------------------------------------------------------------------
% Begin the generation process for each motoneuron
% ------------------------------------------------------------------------

for mnnum=1:mnpop.numbercells
    
    mnpop.mn(mnnum).filename = [inputfilename '_' num2str(mnnum, '%03.0f')];
    mnpop.mn(mnnum).id = mnnum;
    
    disp(sprintf('%s %.0f','   Generating motoneuron number:',mnnum));
    
    % --------------------------------------------------------------------
    % Determine the motoneuron location in the pool
    % --------------------------------------------------------------------
    
    mnpop.mn(mnnum).xposition=samplefunction(input.xposition);
    mnpop.mn(mnnum).yposition=samplefunction(input.yposition);
    mnpop.mn(mnnum).zposition=samplefunction(input.zposition);
    
    mnpop.mn(mnnum).soma.centroidx = mnpop.mn(mnnum).xposition;
    mnpop.mn(mnnum).soma.centroidy = mnpop.mn(mnnum).yposition;
    mnpop.mn(mnnum).soma.centroidz = mnpop.mn(mnnum).zposition;
    
    % --------------------------------------------------------------------
    % Determine the soma size
    % --------------------------------------------------------------------
    
    
    if isfield(input, 'somadiameter')

        mnpop.mn(mnnum).soma.diameter = samplefunction(input.somadiameter);
        mnpop.mn(mnnum).soma.csa      = pi()*(mnpop.mn(mnnum).soma.diameter/2)^2;
        mnpop.mn(mnnum).soma.volume   = (4/3)*pi()*(mnpop.mn(mnnum).soma.diameter/2)^3;
        input.soma.shape = 'spherical'

    else

        if strcmp(input.soma.size.parameter,'diameter')
            mnpop.mn(mnnum).soma.diameter = samplefunction(input.soma.size);
            mnpop.mn(mnnum).soma.csa      = pi()*(mnpop.mn(mnnum).soma.diameter/2)^2;
            mnpop.mn(mnnum).soma.volume   = (4/3)*pi()*(mnpop.mn(mnnum).soma.diameter/2)^3;
        elseif strcmp(input.soma.size.parameter,'csa')
            mnpop.mn(mnnum).soma.csa      = samplefunction(input.soma.size);
            mnpop.mn(mnnum).soma.diameter = 2*(mnpop.mn(mnnum).soma.csa/pi())^0.5;
            mnpop.mn(mnnum).soma.volume   = (4/3)*pi()*(mnpop.mn(mnnum).soma.diameter/2)^3;
        elseif strcmp(input.soma.size.parameter,'volume')
            mnpop.mn(mnnum).soma.volume   = samplefunction(input.soma.size);
            mnpop.mn(mnnum).soma.diameter = 2*((3*mnpop.mn(mnnum).soma.volume)/(4*pi()))^(1/3);
            mnpop.mn(mnnum).soma.csa      = pi()*(mnpop.mn(mnnum).soma.diameter/2)^2;
        else
            disp('Error in input file, soma parameter must be ''diameter'', ''csa'', or ''volume''.');
            keyboard
        end
    end
    

    if strcmp(input.soma.shape,'spherical')
        
    elseif strcmp(input.soma.shape,'pyramidal')
        
    else
        disp('Error in input file, soma must be ''spherical'' or ''pyramidal''.');
        keyboard
    end
    
    piecetypes{1} = 'soma';
    piecetypes{2} = 'axon';
    piecetypes{3} = 'dendrite';
    piecetypes{4} = 'apical';
    
    piecetitles{1} = 'Somatic';
    piecetitles{2} = 'Axonal';
    piecetitles{3} = 'Dendritic';
    piecetitles{4} = 'Apical';
    
    
    for piecetype = 2:4
        
        eval(['togenerate = input.' piecetypes{piecetype} '.generate;']);
        if strcmp(togenerate,'y') 
            
            eval(['typeinput = input.' piecetypes{piecetype} ';']);
            
            
            % --------------------------------------------------------------------
            % Determine the number of trunks
            % --------------------------------------------------------------------
            
            if strcmp(typeinput.numbertrunks.distribution,'preset')
                currenttype.trunk.number = typeinput.numbertrunks.preset(mnnum);
            else
                currenttype.trunk.number = round(samplefunction(typeinput.numbertrunks));
            end
            
            % --------------------------------------------------------------------
            % Determine the initial position of the trunks
            % --------------------------------------------------------------------
            
            % Determine distances from soma centroid
            if strcmp(input.soma.shape,'spherical')
                currenttype.trunk.distancefromcentroid = (mnpop.mn(mnnum).soma.diameter/2) * ones(currenttype.trunk.number,1);
            elseif strcmp(input.soma.shape,'pyramidal')
                currenttype.trunk.distancefromcentroid = distancesfromcentroidfunction(typeinput,currenttype.trunk.number,mnpop.mn(mnnum).soma);
            else
                disp('Error in input file, soma must be ''spherical'' or ''pyramidal''.');
                keyboard
            end
            
            %% Determine the centroid-to-trunk elevations and azimuths
            %[currenttype.trunk.elevationfromcentroid, ...
            % currenttype.trunk.azimuthfromcentroid]    = directionsfromcentroidfunction(typeinput,currenttype.trunk.number);
            
            %% Assign the proximal positions of the trunk
            %for trunknum = 1:currenttype.trunk.number
            %    [currenttype.trunk.xdirectionfromcentroid(trunknum), ...
            %     currenttype.trunk.ydirectionfromcentroid(trunknum), ...
            %     currenttype.trunk.zdirectionfromcentroid(trunknum)]      = directionfunction(currenttype.trunk.elevationfromcentroid(trunknum),currenttype.trunk.azimuthfromcentroid(trunknum));
            %    currenttype.trunk.proximalxposition(trunknum) = mnpop.mn(mnnum).xposition + currenttype.trunk.distancefromcentroid * currenttype.trunk.xdirectionfromcentroid(trunknum);
            %    currenttype.trunk.proximalyposition(trunknum) = mnpop.mn(mnnum).yposition + currenttype.trunk.distancefromcentroid * currenttype.trunk.ydirectionfromcentroid(trunknum);
            %    currenttype.trunk.proximalzposition(trunknum) = mnpop.mn(mnnum).zposition + currenttype.trunk.distancefromcentroid * currenttype.trunk.zdirectionfromcentroid(trunknum);
            %end
            
            %% Determine the directions of the trunks
            %[currenttype.trunk.elevation, ...
            % currenttype.trunk.azimuth] = trunkdirectionsfunction(typeinput,currenttype.trunk);
            
            %%%% 
            [primarydendriteelevation,primarydendriteazimuth] = primarydendritedirectionsfunction(currenttype.trunk.number)
            %%%%

            % --------------------------------------------------------------------
            % Determine the diameters of the trunks
            % --------------------------------------------------------------------
            
            if strcmp(typeinput.trunkdiameter.distribution,'preset')
                currenttype.trunk.diameters = typeinput.trunkdiameter.preset{mnnum};
            else
                %currenttype.trunk.diameters = trunkdiametersfunction(typeinput,currenttype.trunk,mnpop.mn(mnnum).soma);
                currenttype.trunk.diameters = primarydendritediametersfunction(currenttype.trunk.number, typeinput.trunkdiameter)
            end
            
            
            % --------------------------------------------------------------------
            % Begin the generation process for each trunk
            % --------------------------------------------------------------------
            
            for pdnum=1:currenttype.trunk.number
                disp(sprintf('     %s trunk number: %.0f',piecetitles{piecetype},pdnum));
                
%                 [currenttype.trunkxdirection(pdnum), ...
%                     currenttype.trunkydirection(pdnum), ...
%                     currenttype.trunkzdirection(pdnum)]       = directionfunction(currenttype.trunkelevation(pdnum),currenttype.trunkazimuth(pdnum));
                
                % ----------------------------------------------------------------
                % Generate branches until a termination is reached, then back up
                % until an empty daughter branch location is reached.  If the soma
                % is reached during back-up, 'treecomplete' is set to 'y'.
                % ----------------------------------------------------------------
                
                endpiece = 1;
                istrunk = 'y';
                treecomplete = 'n';
                while treecomplete == 'n'
                    branchgenerator;
                    if strcmp(typepiece(length(typepiece)).distaltype,'termination') == 1
                        backupscript;
                    end
                end
                
                % --------------------------------------------------------------------
                % End of trunk generation.  Generate another until the
                % determined number is complete.
                % --------------------------------------------------------------------
                
            end
            
            % ------------------------------------------------------------------------
            % Rearrange piece fields order for convenience
            % ------------------------------------------------------------------------
            
            pieceorder{1}='id';
            pieceorder{2}='motoneuron';
            pieceorder{3}='trunk';
            pieceorder{4}='cable';
            pieceorder{5}='parent';
            pieceorder{6}='branchorder';
            pieceorder{7}='proximaltype';
            pieceorder{8}='distaltype';
            pieceorder{9}='proximaldiameter';
            pieceorder{10}='cylindricaldiameter';
            pieceorder{11}='distaldiameter';
            pieceorder{12}='proximalxposition';
            pieceorder{13}='proximalyposition';
            pieceorder{14}='proximalzposition';
            pieceorder{15}='distalxposition';
            pieceorder{16}='distalyposition';
            pieceorder{17}='distalzposition';
            pieceorder{18}='proximalpathlength';
            pieceorder{19}='pathlength';
            pieceorder{20}='distalpathlength';
            pieceorder{21}='proximalradialdistance';
            pieceorder{22}='radialdistance';
            pieceorder{23}='distalradialdistance';
            pieceorder{24}='length';
            pieceorder{25}='surfacearea';
            pieceorder{26}='volume';
            pieceorder{27}='csa';
            pieceorder{28}='branchlength';
            pieceorder{29}='threshold';
            pieceorder{30}='taperrate';
            pieceorder{31}='elevation';
            pieceorder{32}='azimuth';
            pieceorder{33}='xdirection';
            pieceorder{34}='ydirection';
            pieceorder{35}='zdirection';
            pieceorder{36}='earlytermination';
            pieceorder{37}='daughters';
            pieceorder{38}='daughterratio';
            pieceorder{39}='parentdaughterratio';
            pieceorder{40}='rallratio';
            pieceorder{41}='daughter1';
            pieceorder{42}='daughter2';
            pieceorder{43}='daughter1diameter';
            pieceorder{44}='daughter2diameter';
            pieceorder{45}='daughter1xdirection';
            pieceorder{46}='daughter1ydirection';
            pieceorder{47}='daughter1zdirection';
            pieceorder{48}='daughter2xdirection';
            pieceorder{49}='daughter2ydirection';
            pieceorder{50}='daughter2zdirection';
            
            %currenttype.piece = orderfields(currenttype.piece,pieceorder);
            
            eval(['mnpop.mn(mnnum).' piecetypes{piecetype} ' = typepiece;']);
            clear typepiece;
            eval(['mnpop.mn(mnnum).' piecetypes{piecetype} 'data = currenttype;']);
            clear currenttype;
            
        end
    end
    
    %eval(['mnpop.mn(mnnum).' piecetypes{piecetype} ' = typepiece;']);
    %clear typepiece;
    %eval(['mnpop.mn(mnnum).' piecetypes{piecetype} 'data = currenttype;']);
    %clear currenttype;
    
    % ------------------------------------------------------------------------
    % End of motoneuron generation.  Generate another until the determined
    % number is complete.
    % ------------------------------------------------------------------------
    
end

% ------------------------------------------------------------------------
% Rearrange the fields for convenience
% ------------------------------------------------------------------------

order{1} ='id';
order{2} ='cellclass';
order{3} ='somadiameter';
order{4} ='xposition';
order{5} ='yposition';
order{6} ='zposition';
order{7} ='numbertrunks';
order{8} ='trunkdiameters';
order{9} ='trunkelevation';
order{10}='trunkazimuth';
order{11}='trunkxdirection';
order{12}='trunkydirection';
order{13}='trunkzdirection';
order{14}='piece';

%mnpop.mn = orderfields(mnpop.mn,order);

% ------------------------------------------------------------------------
% Save the data
% ------------------------------------------------------------------------

populationname=sprintf('%s_mnpop',inputfilename);
assignin('base',populationname,mnpop);
assignin('caller',populationname,mnpop);
%assignin('caller','inputfilename',inputfilename);
eval([populationname '= mnpop;']);
if strcmp(option.mngenerator.savemnpop,'n') ~= 1
    disp('   Saving motoneuron data.')
    save(sprintf('%s_%s_%s',inputfilename,mnpop.datetime,'mnpop.mat'),populationname);
end

disp('  ------------------------------------');
disp('   Motoneuron generation completed.');
disp('  ------------------------------------');

if strcmp(option.mngenerator.analyze,'n') ~= 1
    eval(['mnanalyzer(' sprintf('%s_mnpop',inputfilename) ');']);
end

if strcmp(option.mngenerator.plotcairo,'n') ~= 1
    %insert code to plot morphologies
end

eval(['clear ' sprintf('%s_mnpop',inputfilename)]);
eval(['clear ' sprintf('%s_mnpop',inputfilename)]);
if strcmp(option.mngenerator.figures,'n') ~= 1
    eval(['mnfigures(' sprintf('%s_analysis',inputfilename) ');']);
end

cd(mnhome);




