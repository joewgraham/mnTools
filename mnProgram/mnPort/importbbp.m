function importbbp(varargin)
% This function imports h5 files of BBP morphologies into the format 
% used in mnCode

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

disp('   Please choose the input ''.h5''');
disp('    file(s) using the dialog box.');

[importfilename, pathname] = uigetfile('*.h5', 'Choose the input file(s) for mnPort:','MultiSelect','on');
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

fieldorder{1} = 'motoneuron';
fieldorder{2} = 'trunk';
fieldorder{3} = 'cable';
fieldorder{4} = 'id';
fieldorder{5} = 'parent';
fieldorder{6} = 'branchorder';
fieldorder{7} = 'branchtype';
fieldorder{8} = 'proximaltype';
fieldorder{9} = 'distaltype';
fieldorder{10} = 'length';
fieldorder{11} = 'surfacearea';
fieldorder{12} = 'volume';
fieldorder{13} = 'proximaldiameter';
fieldorder{14} = 'cylindricaldiameter';
fieldorder{15} = 'distaldiameter';
fieldorder{16} = 'csa';
fieldorder{17} = 'taperrate';
fieldorder{18} = 'proximalbranchlength';
fieldorder{19} = 'distalbranchlength';
fieldorder{20} = 'proximalpathlength';
fieldorder{21} = 'distalpathlength';
fieldorder{22} = 'proximalradialdistance';
fieldorder{23} = 'distalradialdistance';
fieldorder{24} = 'xdirection';
fieldorder{25} = 'ydirection';
fieldorder{26} = 'zdirection';
fieldorder{27} = 'elevation';
fieldorder{28} = 'azimuth';
fieldorder{29} = 'proximalxposition';
fieldorder{30} = 'proximalyposition';
fieldorder{31} = 'proximalzposition';
fieldorder{32} = 'distalxposition';
fieldorder{33} = 'distalyposition';
fieldorder{34} = 'distalzposition';
fieldorder{35} = 'originalid';
fieldorder{36} = 'originalparent';
fieldorder{37} = 'daughters';
fieldorder{38} = 'rallratio';
fieldorder{39} = 'rallratio1';
fieldorder{40} = 'rallratio2';
fieldorder{41} = 'rallratio3';
fieldorder{42} = 'daughterratio';
fieldorder{43} = 'parentdaughterratio';
fieldorder{44} = 'parentdaughter2ratio';
fieldorder{45} = 'daughter1';
fieldorder{46} = 'daughter1diameter';
fieldorder{47} = 'daughter1xdirection';
fieldorder{48} = 'daughter1ydirection';
fieldorder{49} = 'daughter1zdirection';
fieldorder{50} = 'daughter2';
fieldorder{51} = 'daughter2diameter';
fieldorder{52} = 'daughter2xdirection';
fieldorder{53} = 'daughter2ydirection';
fieldorder{54} = 'daughter2zdirection';

mnpop.datetime       = datestr(now, 'yyyy-mm-dd_HH-MM');
mnpop.inputfilename  = inputfilename;
mnpop.importpathname = cd;
mnpop.importfilename = importfilename;
mnpop.numbercells    = numbermns;

disp('   Importing motoneuron data:');

for mnnum = 1 : numbermns
    
    cd(pathname);
    disp(['    ' importfilename{mnnum}]);
    
    currentfile = importfilename{mnnum};
    currentfile = currentfile(1:end-3);
    
    clear swcdata id xposition yposition zposition diameter parent
    swcdata = hd5reader(pathname,currentfile);
     
    id           = swcdata(:,1);
    newid        = swcdata(:,1);
    type         = swcdata(:,2);
    xyz          = swcdata(:,3:5);
    diameter     = 2 * swcdata(:,6);
    parent       = swcdata(:,7);
    numdaughters = zeros(size(parent));
    
    if min(diameter)<0
        
        disp('  ');
        disp('     Error: negative or zero diameter found.');
        keyboard;
    end
    
    newid(1)                                     = 0;
    mnpop.mn(mnnum).id                           = mnnum;
    mnpop.mn(mnnum).somadiameter                 = 2*swcdata(1,6);
    mnpop.mn(mnnum).xposition                    = swcdata(1,3);
    mnpop.mn(mnnum).yposition                    = swcdata(1,4);
    mnpop.mn(mnnum).zposition                    = swcdata(1,5);
    
    mnpop.mn(mnnum).soma(1).id                  = 1;
    mnpop.mn(mnnum).soma(1).originalid          = 1;
    mnpop.mn(mnnum).soma(1).motoneuron          = mnnum;
    mnpop.mn(mnnum).soma(1).proximalxposition   = xyz(1,1);
    mnpop.mn(mnnum).soma(1).proximalyposition   = xyz(1,2);
    mnpop.mn(mnnum).soma(1).proximalzposition   = xyz(1,3);
    mnpop.mn(mnnum).soma(1).proximaldiameter    = diameter(1);
    mnpop.mn(mnnum).soma(1).distaldiameter      = diameter(1);
    mnpop.mn(mnnum).soma(1).parent              = parent(1);
    mnpop.mn(mnnum).soma(1).originalparent      = parent(1);
    mnpop.mn(mnnum).soma(1).cable               = 1;
    
    somacount     = 1;
    axoncount     = 0;
    dendritecount = 0;
    apicalcount   = 0;
    
    for swcline = 2:length(swcdata)
        numdaughters(parent(swcline)) = numdaughters(parent(swcline)) + 1;
    end
    
    for swcline = 2:length(swcdata)
        
        if type(parent(swcline)) ~= 1 && type(parent(swcline)) ~= type(swcline)
            disp(' ');
            disp('     Error: parent/daughter of different types.');
            disp(sprintf('      Piece: %.0f',swcline));
            keyboard;
        end
        
        
        if type(swcline) == 1
            
            somacount          = somacount + 1;
            newid(swcline)     = somacount;
            
            mnpop.mn(mnnum).soma(somacount).id                  = somacount;
            mnpop.mn(mnnum).soma(somacount).originalid          = id(swcline);
            mnpop.mn(mnnum).soma(somacount).parent              = newid(parent(swcline));
            mnpop.mn(mnnum).soma(somacount).originalparent      = parent(swcline);
            mnpop.mn(mnnum).soma(somacount).motoneuron          = mnnum;
            mnpop.mn(mnnum).soma(somacount).proximalxposition   = xyz(swcline,1);
            mnpop.mn(mnnum).soma(somacount).proximalyposition   = xyz(swcline,2);
            mnpop.mn(mnnum).soma(somacount).proximalzposition   = xyz(swcline,3);
            mnpop.mn(mnnum).soma(somacount).proximaldiameter    = diameter(swcline);
            mnpop.mn(mnnum).soma(somacount).distaldiameter      = diameter(swcline);
            mnpop.mn(mnnum).soma(somacount).cable               = 1;
            
        elseif type(swcline) == 2
            
            if xyz(swcline,:) == xyz(parent(swcline),:)
                
                newid(swcline) = newid(parent(swcline));
                
                if numdaughters(swcline) == 0
                    disp(sprintf('     Warning: Removing a termination point (%.0f).',swcline));
                    disp(sprintf('       Reassigning mnPiece %.0f as termination.',axoncount));
                    mnpop.mn(mnnum).axon(axoncount).distaltype = 'termination';
                elseif numdaughters(swcline) > 1
                    disp(sprintf('     Warning: Removing a bifurcation point (%.0f).',swcline));
                    disp(sprintf('       Reassigning mnPiece %.0f as bifurcation.',axoncount));
                    mnpop.mn(mnnum).axon(axoncount).distaltype = 'bifurcation';
                end
                
                if diameter(swcline) == diameter(parent(swcline))
                    disp(sprintf('     Removed overlapping piece %.0f (same diameter as parent).',id(swcline)));
                elseif diameter(swcline) == diameter(swcline+1) && parent(swcline+1) == swcline
                    disp(sprintf('     Removed overlapping piece %.0f (same diameter as daughter).',id(swcline)));
                else
                    disp(' ');
                    disp(sprintf('     Error: overlapping piece %.0f diameter is different from parent and daughter.',id(swcline)));
                    keyboard;
                end
                
            else
                
                axoncount      = axoncount + 1;
                newid(swcline) = axoncount;
                
                if type(parent(swcline)) == 1
                    
                    mnpop.mn(mnnum).axon(axoncount).proximaldiameter  = diameter(swcline);
                    mnpop.mn(mnnum).axon(axoncount).proximalxposition = xyz(swcline,1);
                    mnpop.mn(mnnum).axon(axoncount).proximalyposition = xyz(swcline,2);
                    mnpop.mn(mnnum).axon(axoncount).proximalzposition = xyz(swcline,3);
                    mnpop.mn(mnnum).axon(axoncount).proximaltype      = 'primary    ';
                    mnpop.mn(mnnum).axon(axoncount).distaltype        = [];
                    
                    mnpop.mn(mnnum).axon(axoncount).motoneuron      = mnnum;
                    mnpop.mn(mnnum).axon(axoncount).id              = axoncount;
                    mnpop.mn(mnnum).axon(axoncount).parent          = newid(parent(swcline));
                    mnpop.mn(mnnum).axon(axoncount).originalid      = id(swcline);
                    mnpop.mn(mnnum).axon(axoncount).originalparent  = parent(swcline);
                    mnpop.mn(mnnum).axon(axoncount).daughters       = [];
                    
                    axoncount      = axoncount - 1;
                    newid(swcline) = 0;
                    
                else
                    
                    mnpop.mn(mnnum).axon(axoncount).proximalxposition = xyz(parent(swcline),1);
                    mnpop.mn(mnnum).axon(axoncount).proximalyposition = xyz(parent(swcline),2);
                    mnpop.mn(mnnum).axon(axoncount).proximalzposition = xyz(parent(swcline),3);
                    
                    mnpop.mn(mnnum).axon(axoncount).distaldiameter  = diameter(swcline);
                    mnpop.mn(mnnum).axon(axoncount).distalxposition = xyz(swcline,1);
                    mnpop.mn(mnnum).axon(axoncount).distalyposition = xyz(swcline,2);
                    mnpop.mn(mnnum).axon(axoncount).distalzposition = xyz(swcline,3);
                    
                    mnpop.mn(mnnum).axon(axoncount).motoneuron      = mnnum;
                    mnpop.mn(mnnum).axon(axoncount).id              = axoncount;
                    mnpop.mn(mnnum).axon(axoncount).parent          = newid(parent(swcline));
                    mnpop.mn(mnnum).axon(axoncount).originalid      = id(swcline);
                    mnpop.mn(mnnum).axon(axoncount).originalparent  = parent(swcline);
                    mnpop.mn(mnnum).axon(axoncount).daughters       = [];
                    
                    if mnpop.mn(mnnum).axon(axoncount).parent > 0
                        if strcmp(mnpop.mn(mnnum).axon(mnpop.mn(mnnum).axon(axoncount).parent).distaltype,'bifurcation') == 0 && strcmp(mnpop.mn(mnnum).axon(mnpop.mn(mnnum).axon(axoncount).parent).distaltype,'m-furcation') == 0
                            mnpop.mn(mnnum).axon(axoncount).proximaldiameter  = diameter(parent(swcline));
                        else
                            mnpop.mn(mnnum).axon(axoncount).proximaldiameter        = diameter(swcline);
                            mnpop.mn(mnnum).axon(axoncount).proximaltype            = 'daughter   ';
                            mnpop.mn(mnnum).axon(mnpop.mn(mnnum).axon(axoncount).parent).daughters = [mnpop.mn(mnnum).axon(mnpop.mn(mnnum).axon(axoncount).parent).daughters mnpop.mn(mnnum).axon(axoncount).id];
                        end
                    end
                    
                    if numdaughters(swcline) == 0
                        mnpop.mn(mnnum).axon(axoncount).distaltype = 'termination';
                    elseif numdaughters(swcline) == 2
                        mnpop.mn(mnnum).axon(axoncount).distaltype = 'bifurcation';
                    elseif numdaughters(swcline) > 2
                        mnpop.mn(mnnum).axon(axoncount).distaltype = 'm-furcation';
                        disp(sprintf('     Warning: Piece %.0f (type %.0f) has %.0f daughters.',swcline,type(swcline),sum(ismember(parent,id(swcline)))));
                    end
                    
                end
                
                if numdaughters(swcline) == 0
                    mnpop.mn(mnnum).axon(axoncount).distaltype = 'termination';
                end
                
            end
            
        elseif type(swcline) == 3
            
            if xyz(swcline,:) == xyz(parent(swcline),:)
                
                newid(swcline) = newid(parent(swcline));
                
                if numdaughters(swcline) == 0
                    disp(sprintf('     Warning: Removing a termination point (%.0f).',swcline));
                    disp(sprintf('       Reassigning mnPiece %.0f as termination.',dendritecount));
                    mnpop.mn(mnnum).dendrite(dendritecount).distaltype = 'termination';
                elseif numdaughters(swcline) > 1
                    disp(sprintf('     Warning: Removing a bifurcation point (%.0f).',swcline));
                    disp(sprintf('       Reassigning mnPiece %.0f as bifurcation.',dendritecount));
                    mnpop.mn(mnnum).dendrite(dendritecount).distaltype = 'bifurcation';
                end
                
                if diameter(swcline) == diameter(parent(swcline))
                    disp(sprintf('     Removed overlapping piece %.0f (same diameter as parent).',id(swcline)));
                elseif diameter(swcline) == diameter(swcline+1) && parent(swcline+1) == swcline
                    disp(sprintf('     Removed overlapping piece %.0f (same diameter as daughter).',id(swcline)));
                else
                    disp(' ');
                    disp(sprintf('     Error: overlapping piece %.0f diameter is different from parent and daughter.',id(swcline)));
                    keyboard;
                end
                
            else
            
                dendritecount      = dendritecount + 1;
                newid(swcline) = dendritecount;

                if type(parent(swcline)) == 1

                    mnpop.mn(mnnum).dendrite(dendritecount).proximaldiameter  = diameter(swcline);
                    mnpop.mn(mnnum).dendrite(dendritecount).proximalxposition = xyz(swcline,1);
                    mnpop.mn(mnnum).dendrite(dendritecount).proximalyposition = xyz(swcline,2);
                    mnpop.mn(mnnum).dendrite(dendritecount).proximalzposition = xyz(swcline,3);
                    mnpop.mn(mnnum).dendrite(dendritecount).proximaltype      = 'primary    ';
                    mnpop.mn(mnnum).dendrite(dendritecount).distaltype        = [];

                    mnpop.mn(mnnum).dendrite(dendritecount).motoneuron      = mnnum;
                    mnpop.mn(mnnum).dendrite(dendritecount).id              = dendritecount;
                    mnpop.mn(mnnum).dendrite(dendritecount).parent          = newid(parent(swcline));
                    mnpop.mn(mnnum).dendrite(dendritecount).originalid      = id(swcline);
                    mnpop.mn(mnnum).dendrite(dendritecount).originalparent  = parent(swcline);
                    mnpop.mn(mnnum).dendrite(dendritecount).daughters       = [];

                    dendritecount      = dendritecount - 1;
                    newid(swcline) = 0;

                else

                    mnpop.mn(mnnum).dendrite(dendritecount).proximalxposition = xyz(parent(swcline),1);
                    mnpop.mn(mnnum).dendrite(dendritecount).proximalyposition = xyz(parent(swcline),2);
                    mnpop.mn(mnnum).dendrite(dendritecount).proximalzposition = xyz(parent(swcline),3);

                    mnpop.mn(mnnum).dendrite(dendritecount).distaldiameter  = diameter(swcline);
                    mnpop.mn(mnnum).dendrite(dendritecount).distalxposition = xyz(swcline,1);
                    mnpop.mn(mnnum).dendrite(dendritecount).distalyposition = xyz(swcline,2);
                    mnpop.mn(mnnum).dendrite(dendritecount).distalzposition = xyz(swcline,3);

                    mnpop.mn(mnnum).dendrite(dendritecount).motoneuron      = mnnum;
                    mnpop.mn(mnnum).dendrite(dendritecount).id              = dendritecount;
                    mnpop.mn(mnnum).dendrite(dendritecount).parent          = newid(parent(swcline));
                    mnpop.mn(mnnum).dendrite(dendritecount).originalid      = id(swcline);
                    mnpop.mn(mnnum).dendrite(dendritecount).originalparent  = parent(swcline);
                    mnpop.mn(mnnum).dendrite(dendritecount).daughters       = [];

                    if mnpop.mn(mnnum).dendrite(dendritecount).parent > 0
                        if strcmp(mnpop.mn(mnnum).dendrite(mnpop.mn(mnnum).dendrite(dendritecount).parent).distaltype,'bifurcation') == 0 && strcmp(mnpop.mn(mnnum).dendrite(mnpop.mn(mnnum).dendrite(dendritecount).parent).distaltype,'m-furcation') == 0
                            mnpop.mn(mnnum).dendrite(dendritecount).proximaldiameter  = diameter(parent(swcline));
                        else
                            mnpop.mn(mnnum).dendrite(dendritecount).proximaldiameter        = diameter(swcline);
                            mnpop.mn(mnnum).dendrite(dendritecount).proximaltype            = 'daughter   ';
                            mnpop.mn(mnnum).dendrite(mnpop.mn(mnnum).dendrite(dendritecount).parent).daughters = [mnpop.mn(mnnum).dendrite(mnpop.mn(mnnum).dendrite(dendritecount).parent).daughters mnpop.mn(mnnum).dendrite(dendritecount).id];
                        end
                    end

                    if numdaughters(swcline) == 0
                        mnpop.mn(mnnum).dendrite(dendritecount).distaltype = 'termination';
                    elseif numdaughters(swcline) == 2
                        mnpop.mn(mnnum).dendrite(dendritecount).distaltype = 'bifurcation';
                    elseif numdaughters(swcline) > 2
                        mnpop.mn(mnnum).dendrite(dendritecount).distaltype = 'm-furcation';
                        disp(sprintf('     Warning: Piece %.0f (type %.0f) has %.0f daughters.',swcline,type(swcline),sum(ismember(parent,id(swcline)))));
                    end

                end

                if numdaughters(swcline) == 0
                    mnpop.mn(mnnum).dendrite(dendritecount).distaltype = 'termination';
                end
                
            end
            
        elseif type(swcline) == 4
            
            if xyz(swcline,:) == xyz(parent(swcline),:)
                
                newid(swcline) = newid(parent(swcline));
                
                if numdaughters(swcline) == 0
                    disp(sprintf('     Warning: Removing a termination point (%.0f).',swcline));
                    disp(sprintf('       Reassigning mnPiece %.0f as termination.',apicalcount));
                    mnpop.mn(mnnum).apical(apicalcount).distaltype = 'termination';
                elseif numdaughters(swcline) > 1
                    disp(sprintf('     Warning: Removing a bifurcation point (%.0f).',swcline));
                    disp(sprintf('       Reassigning mnPiece %.0f as bifurcation.',apicalcount));
                    mnpop.mn(mnnum).apical(apicalcount).distaltype = 'bifurcation';
                end
                
                if diameter(swcline) == diameter(parent(swcline))
                    disp(sprintf('     Removed overlapping piece %.0f (same diameter as parent).',id(swcline)));
                elseif diameter(swcline) == diameter(swcline+1) && parent(swcline+1) == swcline
                    disp(sprintf('     Removed overlapping piece %.0f (same diameter as daughter).',id(swcline)));
                else
                    disp(' ');
                    disp(sprintf('     Error: overlapping piece %.0f diameter is different from parent and daughter.',id(swcline)));
                    keyboard;
                end
            
            else
            
                apicalcount      = apicalcount + 1;
                newid(swcline) = apicalcount;

                if type(parent(swcline)) == 1

                    mnpop.mn(mnnum).apical(apicalcount).proximaldiameter  = diameter(swcline);
                    mnpop.mn(mnnum).apical(apicalcount).proximalxposition = xyz(swcline,1);
                    mnpop.mn(mnnum).apical(apicalcount).proximalyposition = xyz(swcline,2);
                    mnpop.mn(mnnum).apical(apicalcount).proximalzposition = xyz(swcline,3);
                    mnpop.mn(mnnum).apical(apicalcount).proximaltype      = 'primary    ';
                    mnpop.mn(mnnum).apical(apicalcount).distaltype        = [];

                    mnpop.mn(mnnum).apical(apicalcount).motoneuron      = mnnum;
                    mnpop.mn(mnnum).apical(apicalcount).id              = apicalcount;
                    mnpop.mn(mnnum).apical(apicalcount).parent          = newid(parent(swcline));
                    mnpop.mn(mnnum).apical(apicalcount).originalid      = id(swcline);
                    mnpop.mn(mnnum).apical(apicalcount).originalparent  = parent(swcline);
                    mnpop.mn(mnnum).apical(apicalcount).daughters       = [];

                    apicalcount      = apicalcount - 1;
                    newid(swcline) = 0;

                else

                    mnpop.mn(mnnum).apical(apicalcount).proximalxposition = xyz(parent(swcline),1);
                    mnpop.mn(mnnum).apical(apicalcount).proximalyposition = xyz(parent(swcline),2);
                    mnpop.mn(mnnum).apical(apicalcount).proximalzposition = xyz(parent(swcline),3);

                    mnpop.mn(mnnum).apical(apicalcount).distaldiameter  = diameter(swcline);
                    mnpop.mn(mnnum).apical(apicalcount).distalxposition = xyz(swcline,1);
                    mnpop.mn(mnnum).apical(apicalcount).distalyposition = xyz(swcline,2);
                    mnpop.mn(mnnum).apical(apicalcount).distalzposition = xyz(swcline,3);

                    mnpop.mn(mnnum).apical(apicalcount).motoneuron      = mnnum;
                    mnpop.mn(mnnum).apical(apicalcount).id              = apicalcount;
                    mnpop.mn(mnnum).apical(apicalcount).parent          = newid(parent(swcline));
                    mnpop.mn(mnnum).apical(apicalcount).originalid      = id(swcline);
                    mnpop.mn(mnnum).apical(apicalcount).originalparent  = parent(swcline);
                    mnpop.mn(mnnum).apical(apicalcount).daughters       = [];

                    if mnpop.mn(mnnum).apical(apicalcount).parent > 0
                        if strcmp(mnpop.mn(mnnum).apical(mnpop.mn(mnnum).apical(apicalcount).parent).distaltype,'bifurcation') == 0 && strcmp(mnpop.mn(mnnum).apical(mnpop.mn(mnnum).apical(apicalcount).parent).distaltype,'m-furcation') == 0
                            mnpop.mn(mnnum).apical(apicalcount).proximaldiameter  = diameter(parent(swcline));
                        else
                            mnpop.mn(mnnum).apical(apicalcount).proximaldiameter        = diameter(swcline);
                            mnpop.mn(mnnum).apical(apicalcount).proximaltype            = 'daughter   ';
                            mnpop.mn(mnnum).apical(mnpop.mn(mnnum).apical(apicalcount).parent).daughters = [mnpop.mn(mnnum).apical(mnpop.mn(mnnum).apical(apicalcount).parent).daughters mnpop.mn(mnnum).apical(apicalcount).id];
                        end
                    end

                    if numdaughters(swcline) == 0
                        mnpop.mn(mnnum).apical(apicalcount).distaltype = 'termination';
                    elseif numdaughters(swcline) == 2
                        mnpop.mn(mnnum).apical(apicalcount).distaltype = 'bifurcation';
                    elseif numdaughters(swcline) > 2
                        mnpop.mn(mnnum).apical(apicalcount).distaltype = 'm-furcation';
                        disp(sprintf('     Warning: Piece %.0f (type %.0f) has %.0f daughters.',swcline,type(swcline),sum(ismember(parent,id(swcline)))));
                    end

                end

                if numdaughters(swcline) == 0
                    mnpop.mn(mnnum).apical(apicalcount).distaltype = 'termination';
                end
                
            end
            
        else
            disp(' ');
            disp('   Warning: undefined piece type in');
            disp(sprintf('    ''%s''',importfilename{mnnum}));
            %keyboard;
        end
    end
    
       
    
    for piecetype = 2:4
        
        if ismember(piecetype,type) == 1
            
            clear pieceinfo;
            clear cablecount;
            trunkcount = 0;
            
            if piecetype == 2
                pieceinfo = mnpop.mn(mnnum).axon;
                cablecount = 1;
            elseif piecetype == 3
                pieceinfo = mnpop.mn(mnnum).dendrite;
                if ismember(2,type)
                    cablecount = max([mnpop.mn(mnnum).axon.cable]);
                else
                    cablecount = 1;
                end
            elseif piecetype == 4
                pieceinfo = mnpop.mn(mnnum).apical;
                if ismember(3,type)
                    cablecount = max([mnpop.mn(mnnum).dendrite.cable]);
                elseif ismember(2,type)
                    cablecount = max([mnpop.mn(mnnum).axon.cable]);
                else
                    cablecount = 1;
                end
            end
            
            
            for i = 1:length(pieceinfo)
                
                pieceinfo(i).length                  = ((pieceinfo(i).proximalxposition - pieceinfo(i).distalxposition)^2+(pieceinfo(i).proximalyposition - pieceinfo(i).distalyposition)^2+(pieceinfo(i).proximalzposition - pieceinfo(i).distalzposition)^2)^0.5;
                pieceinfo(i).surfacearea             = pi*((pieceinfo(i).proximaldiameter/2)+(pieceinfo(i).distaldiameter/2))*(((((pieceinfo(i).proximaldiameter/2)-(pieceinfo(i).distaldiameter/2))^2)+pieceinfo(i).length^2)^0.5);
                pieceinfo(i).volume                  = (pi/12)*pieceinfo(i).length*(pieceinfo(i).proximaldiameter^2+pieceinfo(i).proximaldiameter*pieceinfo(i).distaldiameter+pieceinfo(i).distaldiameter^2);
                pieceinfo(i).cylindricaldiameter     = 2*((pieceinfo(i).volume/(pi*pieceinfo(i).length))^0.5);
                pieceinfo(i).csa                     = pi*((pieceinfo(i).cylindricaldiameter/2)^2);
                pieceinfo(i).taperrate               = (pieceinfo(i).proximaldiameter - pieceinfo(i).distaldiameter) / pieceinfo(i).length;
                pieceinfo(i).proximalradialdistance  = ((pieceinfo(i).proximalxposition-mnpop.mn(mnnum).xposition)^2+(pieceinfo(i).proximalyposition-mnpop.mn(mnnum).yposition)^2+(pieceinfo(i).proximalzposition-mnpop.mn(mnnum).zposition)^2 )^0.5;
                pieceinfo(i).distalradialdistance    = ((pieceinfo(i).distalxposition-mnpop.mn(mnnum).xposition)^2+(pieceinfo(i).distalyposition-mnpop.mn(mnnum).yposition)^2+(pieceinfo(i).distalzposition-mnpop.mn(mnnum).zposition)^2 )^0.5;
               [pieceinfo(i).xdirection, ...
                pieceinfo(i).ydirection, ...
                pieceinfo(i).zdirection]             = positiontodirectionfunction (pieceinfo(i).proximalxposition,pieceinfo(i).proximalyposition,pieceinfo(i).proximalzposition,pieceinfo(i).distalxposition,pieceinfo(i).distalyposition,pieceinfo(i).distalzposition);
               [pieceinfo(i).elevation, ...
                pieceinfo(i).azimuth]                = elazfunction(pieceinfo(i).proximalxposition,pieceinfo(i).proximalyposition,pieceinfo(i).proximalzposition,pieceinfo(i).distalxposition,pieceinfo(i).distalyposition,pieceinfo(i).distalzposition);
                
                if strcmp('primary    ',pieceinfo(i).proximaltype)
                   
                    if pieceinfo(i).parent ~= 0
                        disp(' ');
                        disp('     Error: primary dendrite mislabeled.');
                        keyboard;
                    end
                    
                    trunkcount = trunkcount + 1;
                    cablecount = cablecount + 1;
                    pieceinfo(i).trunk = trunkcount;
                    pieceinfo(i).cable = cablecount; 
                    pieceinfo(i).branchorder = 1;
                    pieceinfo(i).proximalpathlength = 0;
                    pieceinfo(i).proximalbranchlength = 0;
                    
                elseif strcmp('daughter   ',pieceinfo(i).proximaltype)
                    
                    cablecount = cablecount + 1;
                    pieceinfo(i).trunk = trunkcount;
                    pieceinfo(i).cable = cablecount; 
                    pieceinfo(i).branchorder = pieceinfo(pieceinfo(i).parent).branchorder + 1;
                    pieceinfo(i).proximalpathlength = pieceinfo(pieceinfo(i).parent).distalpathlength;
                    pieceinfo(i).proximalbranchlength = 0;
                    
                    if strcmp('bifurcation',pieceinfo(pieceinfo(i).parent).distaltype)
                        clear daughter1;
                        clear daughter2;
                        if pieceinfo(pieceinfo(pieceinfo(i).parent).daughters(1)).proximaldiameter >= pieceinfo(pieceinfo(pieceinfo(i).parent).daughters(2)).proximaldiameter
                            daughter1 = pieceinfo(pieceinfo(i).parent).daughters(1);                            
                            daughter2 = pieceinfo(pieceinfo(i).parent).daughters(2);                                                                                    
                        else
                            daughter1 = pieceinfo(pieceinfo(i).parent).daughters(2);                            
                            daughter2 = pieceinfo(pieceinfo(i).parent).daughters(1);
                        end
                        pieceinfo(pieceinfo(i).parent).daughter1 = daughter1;
                        pieceinfo(pieceinfo(i).parent).daughter1diameter = pieceinfo(daughter1).proximaldiameter;
                        pieceinfo(pieceinfo(i).parent).daughter1xdirection = pieceinfo(daughter1).xdirection;
                        pieceinfo(pieceinfo(i).parent).daughter1ydirection = pieceinfo(daughter1).ydirection;
                        pieceinfo(pieceinfo(i).parent).daughter1zdirection = pieceinfo(daughter1).zdirection;
                        pieceinfo(pieceinfo(i).parent).daughter2 = daughter2;
                        pieceinfo(pieceinfo(i).parent).daughter2diameter = pieceinfo(daughter2).proximaldiameter;
                        pieceinfo(pieceinfo(i).parent).daughter2xdirection = pieceinfo(daughter2).xdirection;
                        pieceinfo(pieceinfo(i).parent).daughter2ydirection = pieceinfo(daughter2).ydirection;
                        pieceinfo(pieceinfo(i).parent).daughter2zdirection = pieceinfo(daughter2).zdirection;
                        pieceinfo(pieceinfo(i).parent).daughterratio = pieceinfo(daughter1).proximaldiameter / pieceinfo(daughter2).proximaldiameter;
                        pieceinfo(pieceinfo(i).parent).parentdaughterratio = pieceinfo(pieceinfo(i).parent).distaldiameter / pieceinfo(daughter1).proximaldiameter;
                        pieceinfo(pieceinfo(i).parent).parentdaughter2ratio = pieceinfo(pieceinfo(i).parent).distaldiameter / pieceinfo(daughter2).proximaldiameter;
                        pieceinfo(pieceinfo(i).parent).rallratio = ((pieceinfo(daughter1).proximaldiameter)^1.5+(pieceinfo(daughter2).proximaldiameter)^1.5) / (pieceinfo(pieceinfo(i).parent).distaldiameter)^1.5;
                        pieceinfo(pieceinfo(i).parent).rallratio1 = ((pieceinfo(daughter1).proximaldiameter)^1.0+(pieceinfo(daughter2).proximaldiameter)^1.0) / (pieceinfo(pieceinfo(i).parent).distaldiameter)^1.0;
                        pieceinfo(pieceinfo(i).parent).rallratio2 = ((pieceinfo(daughter1).proximaldiameter)^2.0+(pieceinfo(daughter2).proximaldiameter)^2.0) / (pieceinfo(pieceinfo(i).parent).distaldiameter)^2.0;
                        pieceinfo(pieceinfo(i).parent).rallratio3 = ((pieceinfo(daughter1).proximaldiameter)^3.0+(pieceinfo(daughter2).proximaldiameter)^3.0) / (pieceinfo(pieceinfo(i).parent).distaldiameter)^3.0;     
                    elseif strcmp('m-furcation',pieceinfo(pieceinfo(i).parent).distaltype)
                        % Perhaps calculate Rall ratio for multifurcations?
                        % As it is, multifurcation data is not analyzed
                        % with bifurcation data.
                    else
                       disp(' ');
                       disp('     Error: daughter without labeled parent.');
                       keyboard;
                    end
                    
                    
                else
                    
                    pieceinfo(i).trunk = trunkcount;
                    pieceinfo(i).cable = cablecount; 
                    pieceinfo(i).branchorder = pieceinfo(pieceinfo(i).parent).branchorder;
                    pieceinfo(i).proximalpathlength = pieceinfo(pieceinfo(i).parent).distalpathlength;
                    pieceinfo(i).proximalbranchlength = pieceinfo(pieceinfo(i).parent).distalbranchlength;
                    
                end
                
                pieceinfo(i).distalpathlength   = pieceinfo(i).proximalpathlength + pieceinfo(i).length;
                pieceinfo(i).distalbranchlength = pieceinfo(i).proximalbranchlength + pieceinfo(i).length;
                
            end
            
            for j = length(pieceinfo):-1:1
                if strcmp(pieceinfo(j).distaltype,'termination')==1
                    pieceinfo(j).branchtype = 't';
                elseif strcmp(pieceinfo(j).distaltype,'bifurcation')==1
                    pieceinfo(j).branchtype = 'b';
                else
                    pieceinfo(j).branchtype = pieceinfo(j+1).branchtype;
                    if pieceinfo(j+1).parent ~= pieceinfo(j).id
                        disp(' ');
                        disp('     Error: problem with piece typing.');
                        keyboard;
                    end
                end
            end
            
            if piecetype == 2
                mnpop.mn(mnnum).axon = pieceinfo;
                mnpop.mn(mnnum).axon = orderfields(mnpop.mn(mnnum).axon,fieldorder);
            elseif piecetype == 3
                mnpop.mn(mnnum).dendrite = pieceinfo;
                mnpop.mn(mnnum).dendrite = orderfields(mnpop.mn(mnnum).dendrite,fieldorder);
            elseif piecetype == 4
                mnpop.mn(mnnum).apical = pieceinfo;
                mnpop.mn(mnnum).apical = orderfields(mnpop.mn(mnnum).apical,fieldorder);
            end
        end
    end
    
    if strcmp(option.mnimport.export,'n') ~= 1;
        
        disp('     Exporting data to ''.csv''.');
        
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
        
        filename = importfilename{mnnum};
        filename = filename(1:end-4);
        
        if ismember(2,type)
            axonfilename = [filename '_' mnpop.datetime  '_axondata.csv'];
            axonpiecedataraw = struct2cell(mnpop.mn(mnnum).axon);
            axonpiecedatadimensions = size(axonpiecedataraw);
            axonpiecedata(1:axonpiecedatadimensions(1),1:axonpiecedatadimensions(3)) = axonpiecedataraw(1:axonpiecedatadimensions(1),1,1:axonpiecedatadimensions(3));
            axonpiecelabels = fieldnames(mnpop.mn(mnnum).axon);
            axonpiecelabelsdata = [axonpiecelabels axonpiecedata]';
            cell2csv(axonfilename,axonpiecelabelsdata);
        end
        if ismember(3,type)
            dendritefilename = [filename '_' mnpop.datetime  '_dendritedata.csv'];
            dendritepiecedataraw = struct2cell(mnpop.mn(mnnum).dendrite);
            dendritepiecedatadimensions = size(dendritepiecedataraw);
            dendritepiecedata(1:dendritepiecedatadimensions(1),1:dendritepiecedatadimensions(3)) = dendritepiecedataraw(1:dendritepiecedatadimensions(1),1,1:dendritepiecedatadimensions(3));
            dendritepiecelabels = fieldnames(mnpop.mn(mnnum).dendrite);
            dendritepiecelabelsdata = [dendritepiecelabels dendritepiecedata]';
            cell2csv(dendritefilename,dendritepiecelabelsdata);
        end
        if ismember(4,type)
            apicalfilename = [filename '_' mnpop.datetime '_apicaldata.csv'];
            apicalpiecedataraw = struct2cell(mnpop.mn(mnnum).apical);
            apicalpiecedatadimensions = size(apicalpiecedataraw);
            apicalpiecedata(1:apicalpiecedatadimensions(1),1:apicalpiecedatadimensions(3)) = apicalpiecedataraw(1:apicalpiecedatadimensions(1),1,1:apicalpiecedatadimensions(3));
            apicalpiecelabels = fieldnames(mnpop.mn(mnnum).apical);
            apicalpiecelabelsdata = [apicalpiecelabels apicalpiecedata]';
            cell2csv(apicalfilename,apicalpiecelabelsdata);
        end
    end
    
end




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