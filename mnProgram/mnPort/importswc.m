function importswc(varargin)

[helppath,addpaths] = fileparts(which('mnaddpaths.m'));
cd(helppath);
cd ..
mnhome = cd;
cd('mnInput');
mnoptions;

disp(' ');
disp('  ------------------------------------');
disp('   Motoneuron import started.');
disp('  ------------------------------------');

if nargin == 0
    
    disp('   Please type the name of the population');
    disp('    at the prompt and press enter.');
    inputfilename = input('   Population name: ','s');
elseif nargin == 1
    inputfilename = varargin{1};
elseif nargin > 1
    disp(' ');
    disp('   Only one input (the desired name of');
    disp('    the population) is allowed.');
end

disp('   Please choose the input ''.swc''');
disp('    file(s) using the dialog box.');

[importfilename, pathname] = uigetfile('*.swc', 'Choose the input file(s) for mnPort:','MultiSelect','on');
if isequal(importfilename,0) || isequal(pathname,0)
    disp(' ');
    disp('   You must select a file to continue.');
    disp('    Please start over.');
    disp(' ');
    mnpop='Error';
    return;
end
if iscell(importfilename) == 1
    importfilename = sort(importfilename);
    numbermns = length(importfilename);
else
    importfilename = {importfilename};
    numbermns = 1;
end
cd(pathname);

mnpop.datetime       = datestr(now, 'yyyy-mm-dd_HH-MM');
mnpop.inputfilename  = inputfilename;
mnpop.importpathname = cd;
mnpop.importfilename = importfilename{1};
mnpop.numbercells    = numbermns;

disp('   Importing motoneuron data.');

for mnnum = 1 : numbermns

    clear swcdata id xposition yposition zposition diameter parent
    swcdata = textread(importfilename{mnnum},'','commentstyle','shell');

    id        = swcdata(:,1);
    newid     = swcdata(:,1);
    type      = swcdata(:,2);
    xposition = swcdata(:,3);
    yposition = swcdata(:,4);
    zposition = swcdata(:,5);
    diameter  = 2 * swcdata(:,6);
    parent    = swcdata(:,7);

    if min(diameter)<0
        disp('  ');
        disp('   Error: negative diameter(s) found in:');
        disp(sprintf('    %s',importfilename{mnnum}));
        if mnnum == numbermns
            disp('  ');
            disp('   Unable to process negative diameters.');
            return;
        end
    end
    
    mnpop.mn(mnnum).id                           = mnnum;
    mnpop.mn(mnnum).somadiameter                 = 2*swcdata(1,6);
    mnpop.mn(mnnum).xposition                    = swcdata(1,3);
    mnpop.mn(mnnum).yposition                    = swcdata(1,4);
    mnpop.mn(mnnum).zposition                    = swcdata(1,5);

	if sum(ismember(type,3)) == 0
		disp(sprintf('Error: no dendrites in neuron %.0f',mnnum));
		disp(importfilename{mnnum});
		%keyboard;
	end
	
    if sum(ismember(type,3)) > 0
        mnpop.mn(mnnum).numberprimarydendrites    = 0;
        mnpop.mn(mnnum).piece(1).id               = 1;
        mnpop.mn(mnnum).piece(1).motoneuron       = mnnum;
        mnpop.mn(mnnum).piece(1).cable            = 1;
        mnpop.mn(mnnum).piece(1).parent           = -1;
        mnpop.mn(mnnum).piece(1).branchorder      = 0;
        mnpop.mn(mnnum).piece(1).distaltype       = 'soma       ';
        mnpop.mn(mnnum).piece(1).proximaldiameter = mnpop.mn(mnnum).somadiameter;
        mnpop.mn(mnnum).piece(1).distaldiameter   = mnpop.mn(mnnum).somadiameter;
        mnpop.mn(mnnum).piece(1).distalpathlength = 0;
    end
    if sum(ismember(type,2)) > 0
        mnpop.mn(mnnum).axonpiece(1).id               = 1;
        mnpop.mn(mnnum).axonpiece(1).motoneuron       = mnnum;
        mnpop.mn(mnnum).axonpiece(1).cable            = 1;
        mnpop.mn(mnnum).axonpiece(1).parent           = -1;
        mnpop.mn(mnnum).axonpiece(1).branchorder      = 0;
        mnpop.mn(mnnum).axonpiece(1).distaltype       = 'soma       ';
        mnpop.mn(mnnum).axonpiece(1).proximaldiameter = mnpop.mn(mnnum).somadiameter;
        mnpop.mn(mnnum).axonpiece(1).distaldiameter   = mnpop.mn(mnnum).somadiameter;
        mnpop.mn(mnnum).axonpiece(1).distalpathlength = 0;
    end
    if sum(ismember(type,4)) > 0
        mnpop.mn(mnnum).numberapicaldendrites           = 0;
        mnpop.mn(mnnum).apicalpiece(1).id               = 1;
        mnpop.mn(mnnum).apicalpiece(1).motoneuron       = mnnum;
        mnpop.mn(mnnum).apicalpiece(1).cable            = 1;
        mnpop.mn(mnnum).apicalpiece(1).parent           = -1;
        mnpop.mn(mnnum).apicalpiece(1).branchorder      = 0;
        mnpop.mn(mnnum).apicalpiece(1).distaltype       = 'soma       ';
        mnpop.mn(mnnum).apicalpiece(1).proximaldiameter = mnpop.mn(mnnum).somadiameter;
        mnpop.mn(mnnum).apicalpiece(1).distaldiameter   = mnpop.mn(mnnum).somadiameter;
        mnpop.mn(mnnum).apicalpiece(1).distalpathlength = 0;
    end

    axoncount = 1;
    dendritecount = 1;
    apicalcount = 1;

    for swcline = 2:length(swcdata)

        if type(swcline) == 2

            axoncount = axoncount + 1;
            newid(swcline) = axoncount;

            mnpop.mn(mnnum).axonpiece(axoncount).id                  = newid(swcline);
			mnpop.mn(mnnum).axonpiece(axoncount).originalid          = id(swcline);
            mnpop.mn(mnnum).axonpiece(axoncount).motoneuron          = mnnum;
            mnpop.mn(mnnum).axonpiece(axoncount).distalxposition     = xposition(swcline);
            mnpop.mn(mnnum).axonpiece(axoncount).distalyposition     = yposition(swcline);
            mnpop.mn(mnnum).axonpiece(axoncount).distalzposition     = zposition(swcline);
            mnpop.mn(mnnum).axonpiece(axoncount).proximaldiameter    = diameter(swcline);
            mnpop.mn(mnnum).axonpiece(axoncount).distaldiameter      = diameter(swcline);
            mnpop.mn(mnnum).axonpiece(axoncount).parent              = newid(parent(swcline));

        elseif type(swcline) == 3

            dendritecount = dendritecount + 1;
            newid(swcline) = dendritecount;

            mnpop.mn(mnnum).piece(dendritecount).id                  = newid(swcline);
			mnpop.mn(mnnum).piece(dendritecount).originalid          = id(swcline);
            mnpop.mn(mnnum).piece(dendritecount).motoneuron          = mnnum;
            mnpop.mn(mnnum).piece(dendritecount).distalxposition     = xposition(swcline);
            mnpop.mn(mnnum).piece(dendritecount).distalyposition     = yposition(swcline);
            mnpop.mn(mnnum).piece(dendritecount).distalzposition     = zposition(swcline);
            mnpop.mn(mnnum).piece(dendritecount).proximaldiameter    = diameter(swcline);
            mnpop.mn(mnnum).piece(dendritecount).distaldiameter      = diameter(swcline);
            mnpop.mn(mnnum).piece(dendritecount).parent              = newid(parent(swcline));

        elseif type(swcline) == 4

            apicalcount = apicalcount + 1;
            newid(swcline) = apicalcount;

            mnpop.mn(mnnum).apicalpiece(apicalcount).id                  = newid(swcline);
			mnpop.mn(mnnum).apicalpiece(apicalcount).originalid          = id(swcline);
            mnpop.mn(mnnum).apicalpiece(apicalcount).motoneuron          = mnnum;
            mnpop.mn(mnnum).apicalpiece(apicalcount).distalxposition     = xposition(swcline);
            mnpop.mn(mnnum).apicalpiece(apicalcount).distalyposition     = yposition(swcline);
            mnpop.mn(mnnum).apicalpiece(apicalcount).distalzposition     = zposition(swcline);
            mnpop.mn(mnnum).apicalpiece(apicalcount).proximaldiameter    = diameter(swcline);
            mnpop.mn(mnnum).apicalpiece(apicalcount).distaldiameter      = diameter(swcline);
            mnpop.mn(mnnum).apicalpiece(apicalcount).parent              = newid(parent(swcline));

        else
            disp(' ');
            disp('   Warning: undefined piece type in');
            disp(sprintf('   ''.swc'' file at line id #%0.0f.',swcline));
            %keyboard;
        end
    end

    for i = 2:length(mnpop.mn(mnnum).piece)

        if mnpop.mn(mnnum).piece(i).parent == 1

            if i>2; mnpop.mn(mnnum).piece(i-1).distaltype = 'termination'; end;

            mnpop.mn(mnnum).numberprimarydendrites = 1 + mnpop.mn(mnnum).numberprimarydendrites;

            mnpop.mn(mnnum).primarydendritediameters(mnpop.mn(mnnum).numberprimarydendrites)  = mnpop.mn(mnnum).piece(i).proximaldiameter;

            [mnpop.mn(mnnum).piece(i).xdirection, ...
             mnpop.mn(mnnum).piece(i).ydirection, ...
             mnpop.mn(mnnum).piece(i).zdirection]      =   positiontodirectionfunction (mnpop.mn(mnnum).xposition, ...
                                                                                        mnpop.mn(mnnum).yposition, ...
                                                                                        mnpop.mn(mnnum).zposition, ...
                                                                                        mnpop.mn(mnnum).piece(i).distalxposition, ...
                                                                                        mnpop.mn(mnnum).piece(i).distalyposition, ...
                                                                                        mnpop.mn(mnnum).piece(i).distalzposition);

            mnpop.mn(mnnum).primarydendritexdirection(mnpop.mn(mnnum).numberprimarydendrites) = mnpop.mn(mnnum).piece(i).xdirection;
            mnpop.mn(mnnum).primarydendriteydirection(mnpop.mn(mnnum).numberprimarydendrites) = mnpop.mn(mnnum).piece(i).ydirection;
            mnpop.mn(mnnum).primarydendritezdirection(mnpop.mn(mnnum).numberprimarydendrites) = mnpop.mn(mnnum).piece(i).zdirection;

            mnpop.mn(mnnum).piece(i).proximalxposition = mnpop.mn(mnnum).piece(i).xdirection * mnpop.mn(mnnum).somadiameter/2;
            mnpop.mn(mnnum).piece(i).proximalyposition = mnpop.mn(mnnum).piece(i).ydirection * mnpop.mn(mnnum).somadiameter/2;
            mnpop.mn(mnnum).piece(i).proximalzposition = mnpop.mn(mnnum).piece(i).zdirection * mnpop.mn(mnnum).somadiameter/2;

            [mnpop.mn(mnnum).piece(i).elevation, ...
             mnpop.mn(mnnum).piece(i).azimuth]     =   elazfunction(mnpop.mn(mnnum).xposition, ...
                                                                    mnpop.mn(mnnum).yposition, ...
                                                                    mnpop.mn(mnnum).zposition, ...
                                                                    mnpop.mn(mnnum).piece(i).distalxposition, ...
                                                                    mnpop.mn(mnnum).piece(i).distalyposition, ...
                                                                    mnpop.mn(mnnum).piece(i).distalzposition);

            mnpop.mn(mnnum).primarydendriteelevation(mnpop.mn(mnnum).numberprimarydendrites)  = mnpop.mn(mnnum).piece(i).elevation;
            mnpop.mn(mnnum).primarydendriteazimuth(mnpop.mn(mnnum).numberprimarydendrites)    = mnpop.mn(mnnum).piece(i).azimuth;

			mnpop.mn(mnnum).piece(i).length = ((mnpop.mn(mnnum).piece(i).proximalxposition-mnpop.mn(mnnum).piece(i).distalxposition)^2 + ...
											   (mnpop.mn(mnnum).piece(i).proximalyposition-mnpop.mn(mnnum).piece(i).distalyposition)^2 + ...
											   (mnpop.mn(mnnum).piece(i).proximalzposition-mnpop.mn(mnnum).piece(i).distalzposition)^2)^0.5;			
			
            mnpop.mn(mnnum).piece(i).proximaltype = 'primary    ';
            mnpop.mn(mnnum).piece(i).proximalpathlength = 0;
			mnpop.mn(mnnum).piece(i).proximalbranchlength = 0;
			mnpop.mn(mnnum).piece(i).distalpathlength = mnpop.mn(mnnum).piece(i).length;
			mnpop.mn(mnnum).piece(i).distalbranchlength = mnpop.mn(mnnum).piece(i).length;

			mnpop.mn(mnnum).piece(i).daughter1 = [];
            mnpop.mn(mnnum).piece(i).daughter1diameter = [];
            mnpop.mn(mnnum).piece(i).daughter1xdirection = [];
            mnpop.mn(mnnum).piece(i).daughter1ydirection = [];
            mnpop.mn(mnnum).piece(i).daughter1zdirection = [];
            mnpop.mn(mnnum).piece(i).daughter2 = [];
            mnpop.mn(mnnum).piece(i).daughter2diameter = [];
            mnpop.mn(mnnum).piece(i).daughter2xdirection = [];
            mnpop.mn(mnnum).piece(i).daughter2ydirection = [];
            mnpop.mn(mnnum).piece(i).daughter2zdirection = [];
            mnpop.mn(mnnum).piece(i).daughterratio = [];
			mnpop.mn(mnnum).piece(i).parentdaughter2ratio = [];
            mnpop.mn(mnnum).piece(i).parentdaughterratio = [];
	        mnpop.mn(mnnum).piece(i).rallratio = [];
            mnpop.mn(mnnum).piece(i).rallratio1 = [];
            mnpop.mn(mnnum).piece(i).rallratio2 = [];
            mnpop.mn(mnnum).piece(i).rallratio3 = [];

        else
            
            if strcmp(option.mnimport.pieceshape,'frustal') == 1
                mnpop.mn(mnnum).piece(i).proximaldiameter = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).distaldiameter;
            elseif strcmp(option.mnimport.pieceshape,'cylindrical') ~= 1
                disp('Error: piece shape option must be');
                disp('either ''cylindrical'' or ''frustal''.');
                return;
            end

            mnpop.mn(mnnum).piece(i).proximalxposition = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).distalxposition;
            mnpop.mn(mnnum).piece(i).proximalyposition = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).distalyposition;
            mnpop.mn(mnnum).piece(i).proximalzposition = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).distalzposition;

            if mnpop.mn(mnnum).piece(i).proximalxposition == mnpop.mn(mnnum).piece(i).distalxposition && mnpop.mn(mnnum).piece(i).proximalyposition == mnpop.mn(mnnum).piece(i).distalyposition && mnpop.mn(mnnum).piece(i).proximalzposition == mnpop.mn(mnnum).piece(i).distalzposition
                disp('Piece of zero length found.');
                mnpop.mn(mnnum).piece(i).xdirection = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).xdirection;
                mnpop.mn(mnnum).piece(i).ydirection = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).ydirection;
                mnpop.mn(mnnum).piece(i).zdirection = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).zdirection;
                mnpop.mn(mnnum).piece(i).elevation  = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).elevation;
                mnpop.mn(mnnum).piece(i).azimuth    = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).azimuth;
            else
                [mnpop.mn(mnnum).piece(i).xdirection, ...
                 mnpop.mn(mnnum).piece(i).ydirection, ...
                 mnpop.mn(mnnum).piece(i).zdirection] =    positiontodirectionfunction (mnpop.mn(mnnum).piece(i).proximalxposition, ...
                                                                                        mnpop.mn(mnnum).piece(i).proximalyposition, ...
                                                                                        mnpop.mn(mnnum).piece(i).proximalzposition, ...
                                                                                        mnpop.mn(mnnum).piece(i).distalxposition, ...
                                                                                        mnpop.mn(mnnum).piece(i).distalyposition, ...
                                                                                        mnpop.mn(mnnum).piece(i).distalzposition);

                [mnpop.mn(mnnum).piece(i).elevation, ...
                 mnpop.mn(mnnum).piece(i).azimuth]     =   elazfunction(mnpop.mn(mnnum).piece(i).proximalxposition, ...
                                                                        mnpop.mn(mnnum).piece(i).proximalyposition, ...
                                                                        mnpop.mn(mnnum).piece(i).proximalzposition, ...
                                                                        mnpop.mn(mnnum).piece(i).distalxposition, ...
                                                                        mnpop.mn(mnnum).piece(i).distalyposition, ...
                                                                        mnpop.mn(mnnum).piece(i).distalzposition);
            end
                                                                    
            mnpop.mn(mnnum).piece(i).proximalpathlength = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).distalpathlength;
			mnpop.mn(mnnum).piece(i).proximalbranchlength = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).distalbranchlength;

            if mnpop.mn(mnnum).piece(i).parent ~= (i-1)

				mnpop.mn(mnnum).piece(i).proximalbranchlength = 0;
				mnpop.mn(mnnum).piece(i).distalbranchlength = mnpop.mn(mnnum).piece(i).length;
				mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent+1).proximalbranchlength = 0;
				mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent+1).distalbranchlength = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent+1).length;				
				
                mnpop.mn(mnnum).piece(i-1).distaltype='termination';
                
                if strcmp(option.mnimport.pieceshape,'frustal') == 1
                   mnpop.mn(mnnum).piece(i).proximaldiameter = mnpop.mn(mnnum).piece(i).distaldiameter;
                   mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent+1).proximaldiameter = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent+1).distaldiameter;
                end

                if mnpop.mn(mnnum).piece(i).proximaldiameter <= mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent+1).proximaldiameter

                    mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2 = i;
                    mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1 = mnpop.mn(mnnum).piece(i).parent+1;

                    mnpop.mn(mnnum).piece(i).proximaltype='daughter2  ';
                    mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent+1).proximaltype='daughter1  ';

                    mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1diameter = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent+1).proximaldiameter;
                    mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2diameter = mnpop.mn(mnnum).piece(i).proximaldiameter;

                    mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1xdirection = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent+1).xdirection;
                    mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1ydirection = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent+1).ydirection;
                    mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1zdirection = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent+1).zdirection;

                    mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2xdirection = mnpop.mn(mnnum).piece(i).xdirection;
                    mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2ydirection = mnpop.mn(mnnum).piece(i).ydirection;
                    mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2zdirection = mnpop.mn(mnnum).piece(i).zdirection;

                else

                    mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1 = i;
                    mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2 = mnpop.mn(mnnum).piece(i).parent+1;

                    mnpop.mn(mnnum).piece(i).proximaltype='daughter1  ';
                    mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent+1).proximaltype='daughter2  ';

                    mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2diameter = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent+1).proximaldiameter;
                    mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1diameter = mnpop.mn(mnnum).piece(i).proximaldiameter;

                    mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2xdirection = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent+1).xdirection;
                    mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2ydirection = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent+1).ydirection;
                    mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2zdirection = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent+1).zdirection;

                    mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1xdirection = mnpop.mn(mnnum).piece(i).xdirection;
                    mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1ydirection = mnpop.mn(mnnum).piece(i).ydirection;
                    mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1zdirection = mnpop.mn(mnnum).piece(i).zdirection;


                end

                mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).distaltype='bifurcation';

                mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughterratio =  max(mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1diameter, ...
                                                                                            mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2diameter) / ...
                                                                                            min(mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1diameter, ...
                                                                                            mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2diameter);

                mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).rallratio = ((mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1diameter)^1.5 + ...
                                                                                    (mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2diameter)^1.5)/ ...
                                                                                    (mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).distaldiameter)^1.5;
                                                                                
                mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).rallratio1 = ((mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1diameter)^1 + ...
                                                                                    (mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2diameter)^1)/ ...
                                                                                    (mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).distaldiameter)^1;
                                                                                
                mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).rallratio2 = ((mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1diameter)^2 + ...
                                                                                    (mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2diameter)^2)/ ...
                                                                                    (mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).distaldiameter)^2;

				mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).rallratio3 = ((mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1diameter)^3 + ...
                                                                                    (mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2diameter)^3)/ ...
                                                                                    (mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).distaldiameter)^3;

                mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).parentdaughterratio = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).distaldiameter/ ...
                                                                                             mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1diameter;
                                                                                         
                mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).parentdaughter2ratio = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).distaldiameter/ ...
                                                                                              mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2diameter; 

            end

        end

        mnpop.mn(mnnum).piece(i).primarydendrite = mnpop.mn(mnnum).numberprimarydendrites;

        mnpop.mn(mnnum).piece(i).length = ((mnpop.mn(mnnum).piece(i).proximalxposition-mnpop.mn(mnnum).piece(i).distalxposition)^2 + ...
                                           (mnpop.mn(mnnum).piece(i).proximalyposition-mnpop.mn(mnnum).piece(i).distalyposition)^2 + ...
                                           (mnpop.mn(mnnum).piece(i).proximalzposition-mnpop.mn(mnnum).piece(i).distalzposition)^2)^0.5;

        mnpop.mn(mnnum).piece(i).surfacearea         = pi*((mnpop.mn(mnnum).piece(i).proximaldiameter/2)+(mnpop.mn(mnnum).piece(i).distaldiameter/2))*(((((mnpop.mn(mnnum).piece(i).proximaldiameter/2)-(mnpop.mn(mnnum).piece(i).distaldiameter/2))^2)+mnpop.mn(mnnum).piece(i).length^2)^0.5);
        mnpop.mn(mnnum).piece(i).volume              = (pi/12)*mnpop.mn(mnnum).piece(i).length*(mnpop.mn(mnnum).piece(i).proximaldiameter^2+mnpop.mn(mnnum).piece(i).proximaldiameter*mnpop.mn(mnnum).piece(i).distaldiameter+mnpop.mn(mnnum).piece(i).distaldiameter^2);
        if mnpop.mn(mnnum).piece(i).length == 0
            mnpop.mn(mnnum).piece(i).cylindricaldiameter = 0;
            mnpop.mn(mnnum).piece(i).taperrate           = 0;
        else
            mnpop.mn(mnnum).piece(i).cylindricaldiameter = 2*((mnpop.mn(mnnum).piece(i).volume/(pi*mnpop.mn(mnnum).piece(i).length))^0.5);
            mnpop.mn(mnnum).piece(i).taperrate           = (mnpop.mn(mnnum).piece(i).proximaldiameter - mnpop.mn(mnnum).piece(i).distaldiameter) / mnpop.mn(mnnum).piece(i).length;
        end
        mnpop.mn(mnnum).piece(i).csa                 = pi*((mnpop.mn(mnnum).piece(i).cylindricaldiameter/2)^2);

        if isnan(mnpop.mn(mnnum).piece(i).taperrate)
            disp('Error in ''importswc''.');
            disp('Taper rate set to zero from NaN.');
            mnpop.mn(mnnum).piece(i).taperrate = 0;
        end
        if isinf(mnpop.mn(mnnum).piece(i).taperrate)
            disp('Error in ''importswc''.');
            disp('Taper rate set to zero from Inf.');
            keyboard
            mnpop.mn(mnnum).piece(i).taperrate = 0;
        end
        
        
        %
		%mnpop.mn(mnnum).piece(i).taperratevolume      = (((pi/4) * (mnpop.mn(mnnum).piece(i).proximaldiameter^2) * mnpop.mn(mnnum).piece(i).length) - mnpop.mn(mnnum).piece(i).volume)/mnpop.mn(mnnum).piece(i).length;
		%mnpop.mn(mnnum).piece(i).taperratevolume      = (pi/4) * (mnpop.mn(mnnum).piece(i).proximaldiameter - (mnpop.mn(mnnum).piece(i).taperrate * mnpop.mn(mnnum).piece(i).length))^2;
		%mnpop.mn(mnnum).piece(i).taperratevolume      = mnpop.mn(mnnum).piece(i).volume / mnpop.mn(mnnum).piece(i).length;
		%mnpop.mn(mnnum).piece(i).taperratesurfacearea = ((pi * mnpop.mn(mnnum).piece(i).proximaldiameter * mnpop.mn(mnnum).piece(i).length) - mnpop.mn(mnnum).piece(i).surfacearea)/mnpop.mn(mnnum).piece(i).length;
		%
		
        mnpop.mn(mnnum).piece(i).distalpathlength    = mnpop.mn(mnnum).piece(i).proximalpathlength + mnpop.mn(mnnum).piece(i).length;
        mnpop.mn(mnnum).piece(i).pathlength          =(mnpop.mn(mnnum).piece(i).proximalpathlength + mnpop.mn(mnnum).piece(i).distalpathlength)/2;
		
		mnpop.mn(mnnum).piece(i).distalbranchlength    = mnpop.mn(mnnum).piece(i).proximalbranchlength + mnpop.mn(mnnum).piece(i).length;
        mnpop.mn(mnnum).piece(i).branchlength          =(mnpop.mn(mnnum).piece(i).proximalbranchlength + mnpop.mn(mnnum).piece(i).distalbranchlength)/2;
		

        mnpop.mn(mnnum).piece(i).proximalradialdistance  = ( (mnpop.mn(mnnum).piece(i).proximalxposition-mnpop.mn(mnnum).xposition)^2 ...
                                                           + (mnpop.mn(mnnum).piece(i).proximalyposition-mnpop.mn(mnnum).yposition)^2 ...
                                                           + (mnpop.mn(mnnum).piece(i).proximalzposition-mnpop.mn(mnnum).zposition)^2 )^0.5;
        mnpop.mn(mnnum).piece(i).distalradialdistance    = ( (mnpop.mn(mnnum).piece(i).distalxposition-mnpop.mn(mnnum).xposition)^2 ...
                                                           + (mnpop.mn(mnnum).piece(i).distalyposition-mnpop.mn(mnnum).yposition)^2 ...
                                                           + (mnpop.mn(mnnum).piece(i).distalzposition-mnpop.mn(mnnum).zposition)^2 )^0.5;
        mnpop.mn(mnnum).piece(i).radialdistance          = (mnpop.mn(mnnum).piece(i).proximalradialdistance+mnpop.mn(mnnum).piece(i).distalradialdistance) / 2;
    end

	
	mnpop.mn(mnnum).piece(length(mnpop.mn(mnnum).piece)).distaltype = 'termination';
	
    for j = 2:length(mnpop.mn(mnnum).piece)
        if strcmp(mnpop.mn(mnnum).piece(j).proximaltype,'primary    ')==1 || ...
           strcmp(mnpop.mn(mnnum).piece(j).proximaltype,'daughter1  ')==1 || ...
           strcmp(mnpop.mn(mnnum).piece(j).proximaltype,'daughter2  ')==1
            mnpop.mn(mnnum).piece(j).cable = max([mnpop.mn(mnnum).piece.cable]) + 1;
        else
            mnpop.mn(mnnum).piece(j).cable = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(j).parent).cable;
        end

        if strcmp(mnpop.mn(mnnum).piece(j).proximaltype,'primary    ')==1
            mnpop.mn(mnnum).piece(j).branchorder = 1;
        elseif strcmp(mnpop.mn(mnnum).piece(j).proximaltype,'daughter1  ')==1 || ...
               strcmp(mnpop.mn(mnnum).piece(j).proximaltype,'daughter2  ')==1
            mnpop.mn(mnnum).piece(j).branchorder = 1 + mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(j).parent).branchorder;
        else
            mnpop.mn(mnnum).piece(j).branchorder = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(j).parent).branchorder;
        end

        if strcmp(option.mnimport.pieceshape,'cylindrical') == 1
			if mnpop.mn(mnnum).piece(j).taperrate == 0
                if strcmp(mnpop.mn(mnnum).piece(j).distaltype,'bifurcation')==1 || strcmp(mnpop.mn(mnnum).piece(j).distaltype,'termination')==1
                	mnpop.mn(mnnum).piece(j).taperrate = 0;
					%mnpop.mn(mnnum).piece(j).taperratevolume = 0;
                else
                    if mnpop.mn(mnnum).piece(j).length == 0
                        mnpop.mn(mnnum).piece(j).taperrate = 0;
                    else
                        mnpop.mn(mnnum).piece(j).taperrate = (mnpop.mn(mnnum).piece(j).distaldiameter - mnpop.mn(mnnum).piece(j+1).proximaldiameter) / mnpop.mn(mnnum).piece(j).length;
                        %mnpop.mn(mnnum).piece(j).taperratevolume = (pi/4)*(mnpop.mn(mnnum).piece(j).proximaldiameter^2 - (2*mnpop.mn(mnnum).piece(j).proximaldiameter*mnpop.mn(mnnum).piece(j).taperrate*mnpop.mn(mnnum).piece(j).length) + ((mnpop.mn(mnnum).piece(j).taperrate^2)*(mnpop.mn(mnnum).piece(j).length^2)));
                    end
                end
                if isnan(mnpop.mn(mnnum).piece(i).taperrate)
                    disp('Error (NaN) in ''importswc''.');
                    keyboard;
                end
                if isnan(mnpop.mn(mnnum).piece(i).taperrate)
                    disp('Error (Inf) in ''importswc''.');
                    keyboard;
                end
            end
        end
    end
   
    for k = length(mnpop.mn(mnnum).piece):-1:2
        %disp(sprintf('Piece Number: %f',k));
        if strcmp(mnpop.mn(mnnum).piece(k).distaltype,'termination')==1
            %disp('Termination')
            mnpop.mn(mnnum).piece(k).branchtype = 't';
        elseif strcmp(mnpop.mn(mnnum).piece(k).distaltype,'bifurcation')==1
            %disp('Bifurcation')
            mnpop.mn(mnnum).piece(k).branchtype = 'b';
        else
            mnpop.mn(mnnum).piece(k).branchtype = mnpop.mn(mnnum).piece(k+1).branchtype;
        end
        %disp(mnpop.mn(mnnum).piece(k).branchtype);
    end
        
end

    % ------------------------------------------------------------------------
    % Rearrange piece fields order for convenience
    % ------------------------------------------------------------------------

    pieceorder{1}='id';
    pieceorder{2}='motoneuron';
    pieceorder{3}='primarydendrite';
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

    %branchlength
    %threshold

    pieceorder{28}='taperrate';
    pieceorder{29}='elevation';
    pieceorder{30}='azimuth';
    pieceorder{31}='xdirection';
    pieceorder{32}='ydirection';
    pieceorder{33}='zdirection';

    %earlytermination
    %daughters

    pieceorder{34}='daughterratio';
    pieceorder{35}='parentdaughterratio';
    pieceorder{36}='parentdaughter2ratio';
    pieceorder{37}='rallratio';
    pieceorder{38}='rallratio1';
    pieceorder{39}='rallratio2';
    pieceorder{40}='daughter1';
    pieceorder{41}='daughter2';
    pieceorder{42}='daughter1diameter';
    pieceorder{43}='daughter2diameter';
    pieceorder{44}='daughter1xdirection';
    pieceorder{45}='daughter1ydirection';
    pieceorder{46}='daughter1zdirection';
    pieceorder{47}='daughter2xdirection';
    pieceorder{48}='daughter2ydirection';
    pieceorder{49}='daughter2zdirection';

    %mnpop.mn(mnnum).piece = orderfields(mnpop.mn(mnnum).piece,pieceorder);




cd(mnhome);
cd mnData;

if exist(sprintf('%s_%s','data',datestr(now,'yyyy-mm-dd')),'dir')==7
    cd(sprintf('%s_%s','data',datestr(now,'yyyy-mm-dd')));
else
    mkdir(sprintf('%s_%s','data',datestr(now,'yyyy-mm-dd')));
    cd(sprintf('%s_%s','data',datestr(now,'yyyy-mm-dd')));
end

if exist(sprintf('%s_%s',inputfilename,mnpop.datetime),'dir')==7
    cd(sprintf('%s_%s',inputfilename,mnpop.datetime));
else
    mkdir(sprintf('%s_%s',inputfilename,mnpop.datetime));
    cd(sprintf('%s_%s',inputfilename,mnpop.datetime));
end

mnpop.datapathname = cd;

populationname=sprintf('%s_mnpop',inputfilename);
assignin('base',populationname,mnpop);
eval([populationname '= mnpop;']);
if strcmp(option.mnimport.savemnpop,'n') ~= 1
	disp('   Saving motoneuron data.');
    save(sprintf('%s_%s_%s',inputfilename,mnpop.datetime,'mnpop.mat'),populationname);
end

cd(mnhome);

disp('  ------------------------------------');
disp('   Motoneuron import completed.');
disp('  ------------------------------------');

if strcmp(option.mnimport.analyze,'n') ~= 1;
    eval(['mnanalyzer(' sprintf('%s_mnpop',inputfilename) ');']);
end
if strcmp(option.mnimport.figures,'n') ~= 1;
    eval(['mnfigures(' sprintf('%s_analysis',inputfilename) ');']);
end
% if strcmp(option.mnimport.export,'n') ~= 1;
%     eval(['mnexport(' sprintf('%s_mnpop',inputfilename) ',' sprintf('%s_data',inputfilename) ');']);
% end
if strcmp(option.mnimport.mnfitter,'n') ~= 1
    eval(['mnfitter(' sprintf('%s_analysis',inputfilename) ');']);
end
close all;

if strcmp(option.mnimport.clear.data,'n') ~= 1;
    eval(['clear ' sprintf('%s_data',inputfilename)]);
end

cd(mnhome);


