function importswcbbp(varargin)

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
mnpop.importfilename = importfilename;
mnpop.numbercells    = numbermns;

disp('   Importing motoneuron data.');

for mnnum = 1 : numbermns

    clear swcdata id xposition yposition zposition diameter parent
    swcdata = textread(importfilename{mnnum},'','commentstyle','shell');

    id           = swcdata(:,1);
    newid        = swcdata(:,1);
    type         = swcdata(:,2);
    xyz          = swcdata(:,3:5);
    diameter     = 2 * swcdata(:,6);
    parent       = swcdata(:,7);
    numdaughters = zeros(size(parent));

    if min(diameter)<=0
        disp('  ');
        disp('   Error: negative or zero diameter found in:');
        disp(sprintf('    ''%s''',importfilename{mnnum}));
        keyboard;
    end
    
    newid(1)                                     = 0;
    mnpop.mn(mnnum).id                           = mnnum;
    mnpop.mn(mnnum).somadiameter                 = 2*swcdata(1,6);
    mnpop.mn(mnnum).xposition                    = swcdata(1,3);
    mnpop.mn(mnnum).yposition                    = swcdata(1,4);
    mnpop.mn(mnnum).zposition                    = swcdata(1,5);

    mnpop.mn(mnnum).somapiece(1).id                  = 1;
    mnpop.mn(mnnum).somapiece(1).originalid          = 1;
    mnpop.mn(mnnum).somapiece(1).motoneuron          = mnnum;
    mnpop.mn(mnnum).somapiece(1).proximalxposition   = xyz(1,1);
    mnpop.mn(mnnum).somapiece(1).proximalyposition   = xyz(1,2);
    mnpop.mn(mnnum).somapiece(1).proximalzposition   = xyz(1,3);
    mnpop.mn(mnnum).somapiece(1).proximaldiameter    = diameter(1);
    mnpop.mn(mnnum).somapiece(1).distaldiameter      = diameter(1);
    mnpop.mn(mnnum).somapiece(1).parent              = parent(1);
    mnpop.mn(mnnum).somapiece(1).originalparent      = parent(1);
    
    somacount     = 1;
    axoncount     = 0;
    dendritecount = 0;
    apicalcount   = 0;
    
    for swcline = 2:length(swcdata)
        numdaughters(parent(swcline)) = numdaughters(parent(swcline)) + 1;
    end
    
    for swcline = 2:length(swcdata)
        
        if sum(ismember(parent,id(swcline))) > 2
            disp(' ');
            disp(sprintf('   Error: multifurcation in ''%s''.',mnpop.importfilename{mnnum}));
            disp(sprintf('    Piece %.0f (type %.0f) has %.0f daughters.',swcline,type(swcline),sum(ismember(parent,id(swcline)))));
            %keyboard;
        end
        if type(parent(swcline)) ~= 1 && type(parent(swcline)) ~= type(swcline)
            disp(' ');
            disp('   Error: parent/daughter of different types.');
            disp(sprintf('    ''%s'' piece %.0f',importfilename{mnnum},swcline));
            keyboard;
        end
        if sum(ismember(xyz,xyz(swcline,:),'rows')) > 1
            disp(' ');
            disp('   Error: overlapping pieces.');
            disp(sprintf('    ''%s'' piece %.0f',importfilename{mnnum},swcline));
            if xyz(swcline,:) == xyz(parent(swcline),:) 
                disp(sprintf('    Overlaps parent: %.0f',parent(swcline)));
                if diameter(swcline) == diameter(parent(swcline))
                    disp(sprintf('    Same diameter as parent: %.0f',parent(swcline)));
                elseif diameter(swcline) == diameter(swcline+1)
                    disp(sprintf('    Same diameter as piece: %.0f',swcline+1));
                end
            end
        end
        
        if type(swcline) == 1
            
            somacount          = somacount + 1;
            newid(swcline)     = 0;
                        
            mnpop.mn(mnnum).somapiece(somacount).id                  = swcline;
            mnpop.mn(mnnum).somapiece(somacount).originalid          = id(swcline);
            mnpop.mn(mnnum).somapiece(somacount).parent              = newid(parent(swcline));
            mnpop.mn(mnnum).somapiece(somacount).originalparent      = parent(swcline);
            mnpop.mn(mnnum).somapiece(somacount).motoneuron          = mnnum;
            mnpop.mn(mnnum).somapiece(somacount).proximalxposition   = xyz(swcline,1);
            mnpop.mn(mnnum).somapiece(somacount).proximalyposition   = xyz(swcline,2);
            mnpop.mn(mnnum).somapiece(somacount).proximalzposition   = xyz(swcline,3);
            mnpop.mn(mnnum).somapiece(somacount).proximaldiameter    = diameter(swcline);
            mnpop.mn(mnnum).somapiece(somacount).distaldiameter      = diameter(swcline);
            
        elseif type(swcline) == 2
            
            if numdaughters(swcline) == 0
                
                newid(swcline) = NaN;
                if diameter(swcline) ~= diameter(parent(swcline))
                    disp(' ');
                    disp('   Error: terminal piece has different proximal/distal diameters.');
                    keyboard;
                end
                mnpop.mn(mnnum).axonpiece(newid(parent(swcline))).distalxposition = xyz(swcline,1);
                mnpop.mn(mnnum).axonpiece(newid(parent(swcline))).distalyposition = xyz(swcline,2);
                mnpop.mn(mnnum).axonpiece(newid(parent(swcline))).distalzposition = xyz(swcline,3);
                mnpop.mn(mnnum).axonpiece(newid(parent(swcline))).distaltype = 'termination';
             
                if xyz(swcline,:) == xyz(parent(swcline),:)
                    disp(' ');
                    disp('   Termination removed -- must mark new termination.');
                    keyboard;
                end
                
            elseif xyz(swcline,:) == xyz(parent(swcline),:)
                
                if numdaughters(swcline) > 1
                    disp(' ');
                    disp('   Removing a bifurcation point!')
                end
                
                newid(swcline) = newid(parent(swcline));
                                
                if diameter(swcline) == diameter(parent(swcline))
                    disp('   Removed -- same diameter as parent.');
                elseif diameter(swcline) == diameter(swcline+1) && parent(swcline+1) == swcline
                    disp('   Removed -- same diameter as daughter.');
                else
                    disp(' ');
                    disp('   Diameter is different from parent and daughter.');
                    keyboard;
                end
                
            else
                
                axoncount          = axoncount + 1;
                newid(swcline)     = axoncount;
                            
                mnpop.mn(mnnum).axonpiece(axoncount).id                  = newid(swcline);
                mnpop.mn(mnnum).axonpiece(axoncount).originalid          = id(swcline);
                mnpop.mn(mnnum).axonpiece(axoncount).parent              = newid(parent(swcline));
                mnpop.mn(mnnum).axonpiece(axoncount).originalparent      = parent(swcline);
                mnpop.mn(mnnum).axonpiece(axoncount).motoneuron          = mnnum;
                mnpop.mn(mnnum).axonpiece(axoncount).proximalxposition   = xyz(swcline,1);
                mnpop.mn(mnnum).axonpiece(axoncount).proximalyposition   = xyz(swcline,2);
                mnpop.mn(mnnum).axonpiece(axoncount).proximalzposition   = xyz(swcline,3);
                mnpop.mn(mnnum).axonpiece(axoncount).proximaldiameter    = diameter(swcline);
                mnpop.mn(mnnum).axonpiece(axoncount).distaldiameter      = diameter(swcline);
                
                if type(id(parent(swcline))) == 1
                    mnpop.mn(mnnum).axonpiece(axoncount).proximaltype = 'primary    ';
                end
                
                if numdaughters(swcline) == 2
                    mnpop.mn(mnnum).axonpiece(axoncount).distaltype = 'bifurcation';
                elseif numdaughters(swcline) > 2
                    mnpop.mn(mnnum).axonpiece(axoncount).distaltype = 'm-furcation';
                end
                
            end
            
        elseif type(swcline) == 3
            
            if numdaughters(swcline) == 0
                
                newid(swcline) = NaN;
                if diameter(swcline) ~= diameter(parent(swcline))
                    disp(' ');
                    disp('   Error: terminal piece has different proximal/distal diameters.');
                    keyboard;
                end
                mnpop.mn(mnnum).dendritepiece(newid(parent(swcline))).distalxposition = xyz(swcline,1);
                mnpop.mn(mnnum).dendritepiece(newid(parent(swcline))).distalyposition = xyz(swcline,2);
                mnpop.mn(mnnum).dendritepiece(newid(parent(swcline))).distalzposition = xyz(swcline,3);
                mnpop.mn(mnnum).dendritepiece(newid(parent(swcline))).distaltype = 'termination';

                if xyz(swcline,:) == xyz(parent(swcline),:)
                    disp(' ');
                    disp('   Termination removed -- must mark new termination.');
                    keyboard;
                end
                
            elseif xyz(swcline,:) == xyz(parent(swcline),:)
                
                if numdaughters(swcline) > 1
                    disp(' ');
                    disp('   Removing a bifurcation point!')
                end
                
                newid(swcline) = newid(parent(swcline));
                                
                if diameter(swcline) == diameter(parent(swcline))
                    disp('   Removed -- same diameter as parent.');
                elseif diameter(swcline) == diameter(swcline+1) && parent(swcline+1) == swcline
                    disp('   Removed -- same diameter as daughter.');
                else
                    disp(' ');
                    disp('Diameter is different from parent and daughter.');
                    keyboard;
                end
                
            else
                
                dendritecount      = dendritecount + 1;
                newid(swcline)     = dendritecount;
                
                mnpop.mn(mnnum).dendritepiece(dendritecount).id                  = newid(swcline);
                mnpop.mn(mnnum).dendritepiece(dendritecount).originalid          = id(swcline);
                mnpop.mn(mnnum).dendritepiece(dendritecount).parent              = newid(parent(swcline));
                mnpop.mn(mnnum).dendritepiece(dendritecount).originalparent      = parent(swcline);
                mnpop.mn(mnnum).dendritepiece(dendritecount).motoneuron          = mnnum;
                mnpop.mn(mnnum).dendritepiece(dendritecount).proximalxposition   = xyz(swcline,1);
                mnpop.mn(mnnum).dendritepiece(dendritecount).proximalyposition   = xyz(swcline,2);
                mnpop.mn(mnnum).dendritepiece(dendritecount).proximalzposition   = xyz(swcline,3);
                mnpop.mn(mnnum).dendritepiece(dendritecount).proximaldiameter    = diameter(swcline);
                mnpop.mn(mnnum).dendritepiece(dendritecount).distaldiameter      = diameter(swcline);
                
                if type(id(parent(swcline))) == 1
                    mnpop.mn(mnnum).dendritepiece(dendritecount).proximaltype = 'primary    ';
                end
                
                if numdaughters(swcline) == 2
                    mnpop.mn(mnnum).dendritepiece(dendritecount).distaltype = 'bifurcation';
                elseif numdaughters(swcline) > 2
                    mnpop.mn(mnnum).dendritepiece(dendritecount).distaltype = 'm-furcation';
                end
                
            end

        elseif type(swcline) == 4
            
            if numdaughters(swcline) == 0
                
                newid(swcline) = NaN;
                if diameter(swcline) ~= diameter(parent(swcline))
                    disp(' ');
                    disp('   Error: terminal piece has different proximal/distal diameters.');
                    keyboard;
                end
                mnpop.mn(mnnum).apicalpiece(newid(parent(swcline))).distalxposition = xyz(swcline,1);
                mnpop.mn(mnnum).apicalpiece(newid(parent(swcline))).distalyposition = xyz(swcline,2);
                mnpop.mn(mnnum).apicalpiece(newid(parent(swcline))).distalzposition = xyz(swcline,3);
                mnpop.mn(mnnum).apicalpiece(newid(parent(swcline))).distaltype = 'termination';

                if xyz(swcline,:) == xyz(parent(swcline),:)
                    disp(' ');
                    disp('   Termination removed -- must mark new termination.');
                    keyboard;
                end
                
            elseif xyz(swcline,:) == xyz(parent(swcline),:)
                
                if numdaughters(swcline) > 1
                    disp(' ');
                    disp('   Removing a bifurcation point!')
                end
                newid(swcline) = newid(parent(swcline));
                                
                if diameter(swcline) == diameter(parent(swcline))
                    disp('   Removed -- same diameter as parent.');
                elseif diameter(swcline) == diameter(swcline+1) && parent(swcline+1) == swcline
                    disp('   Removed -- same diameter as daughter.');
                else
                    disp(' ');
                    disp('Diameter is different from parent and daughter.');
                    keyboard;
                end
                
            else

                apicalcount        = apicalcount + 1;
                newid(swcline)     = apicalcount;
                
                mnpop.mn(mnnum).apicalpiece(apicalcount).id                  = newid(swcline);
                mnpop.mn(mnnum).apicalpiece(apicalcount).originalid          = id(swcline);
                mnpop.mn(mnnum).apicalpiece(apicalcount).parent              = newid(parent(swcline));
                mnpop.mn(mnnum).apicalpiece(apicalcount).originalparent      = parent(swcline);
                mnpop.mn(mnnum).apicalpiece(apicalcount).motoneuron          = mnnum;
                mnpop.mn(mnnum).apicalpiece(apicalcount).proximalxposition   = xyz(swcline,1);
                mnpop.mn(mnnum).apicalpiece(apicalcount).proximalyposition   = xyz(swcline,2);
                mnpop.mn(mnnum).apicalpiece(apicalcount).proximalzposition   = xyz(swcline,3);
                mnpop.mn(mnnum).apicalpiece(apicalcount).proximaldiameter    = diameter(swcline);
                mnpop.mn(mnnum).apicalpiece(apicalcount).distaldiameter      = diameter(swcline);
                
                if type(id(parent(swcline))) == 1
                    mnpop.mn(mnnum).apicalpiece(apicalcount).proximaltype = 'primary    ';
                end
                
                if numdaughters(swcline) == 2
                    mnpop.mn(mnnum).apicalpiece(apicalcount).distaltype = 'bifurcation';
                elseif numdaughters(swcline) > 2
                    mnpop.mn(mnnum).apicalpiece(apicalcount).distaltype = 'm-furcation';
                end
                
            end

        else
            disp(' ');
            disp('   Warning: undefined piece type in');
            disp(sprintf('    ''%s''',importfilename{mnnum}));
            %keyboard;
        end
    end

    disp(' ');
    disp('End of piece sorting.');

    
    
    
    
    filename = importfilename{mnnum};
    filename = filename(1:end-4);
    
    axonfilename = [filename '_' mnpop.datetime  '_axondata.csv'];
    axonpiecedataraw = struct2cell(mnpop.mn(mnnum).axonpiece);
    axonpiecedatadimensions = size(axonpiecedataraw);
    axonpiecedata(1:axonpiecedatadimensions(1),1:axonpiecedatadimensions(3)) = axonpiecedataraw(1:axonpiecedatadimensions(1),1,1:axonpiecedatadimensions(3));
    axonpiecelabels = fieldnames(mnpop.mn(mnnum).axonpiece);
    axonpiecelabelsdata = [axonpiecelabels axonpiecedata]';
    cell2csv(axonfilename,axonpiecelabelsdata);
    
%     dendritefilename = [filename '_' mnpop.datetime  '_dendritedata.csv'];
%     dendritepiecedataraw = struct2cell(mnpop.mn(mnnum).dendritepiece);
%     dendritepiecedatadimensions = size(dendritepiecedataraw);
%     dendritepiecedata(1:dendritepiecedatadimensions(1),1:dendritepiecedatadimensions(3)) = dendritepiecedataraw(1:dendritepiecedatadimensions(1),1,1:dendritepiecedatadimensions(3));
%     dendritepiecelabels = fieldnames(mnpop.mn(mnnum).dendritepiece);
%     dendritepiecelabelsdata = [dendritepiecelabels dendritepiecedata]';
%     cell2csv(dendritefilename,dendritepiecelabelsdata);
    
    apicalfilename = [filename '_' mnpop.datetime '_apicaldata.csv'];
    apicalpiecedataraw = struct2cell(mnpop.mn(mnnum).apicalpiece);
    apicalpiecedatadimensions = size(apicalpiecedataraw);
    apicalpiecedata(1:apicalpiecedatadimensions(1),1:apicalpiecedatadimensions(3)) = apicalpiecedataraw(1:apicalpiecedatadimensions(1),1,1:apicalpiecedatadimensions(3));
    apicalpiecelabels = fieldnames(mnpop.mn(mnnum).apicalpiece);
    apicalpiecelabelsdata = [apicalpiecelabels apicalpiecedata]';
    cell2csv(apicalfilename,apicalpiecelabelsdata);
    
    keyboard
    
    for piecetype = 2:4
        
        if ismember(piecetype,type) == 1
            
            clear piecedata;
            if piecetype == 2
                piecedata = mnpop.mn(mnnum).axonpiece;
            elseif piecetype == 3
                piecedata = mnpop.mn(mnnum).dendritepiece;
            elseif piecedata == 4
                piecedata = mnpop.mn(mnnum).apicalpiece;
            end
            
            clear numbertrunks;
            for i = 1:length(piecedata)
                
                
                
                
            end
            
            
            
            
            
            
            
            
            
        end
    end
end
    
    
%     for piecetype = 1:3
%         
%         clear piecedata;
%         if piecetype == 1
%             piecedata = mnpop.mn(mnnum).axonpiece;
%         elseif piecetype == 2
%             piecedata = mnpop.mn(mnnum).dendritepiece;
%         elseif piecetype ==3 
%             piecedata = mnpop.mn(mnnum).apicalpiece;
%         end
        
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
%     for i = 2:length(mnpop.mn(mnnum).piece)
% 
%         if mnpop.mn(mnnum).piece(i).parent == 1
% 
%             if i>2; mnpop.mn(mnnum).piece(i-1).distaltype = 'termination'; end;
% 
%             mnpop.mn(mnnum).numberprimarydendrites = 1 + mnpop.mn(mnnum).numberprimarydendrites;
% 
%             mnpop.mn(mnnum).primarydendritediameters(mnpop.mn(mnnum).numberprimarydendrites)  = mnpop.mn(mnnum).piece(i).proximaldiameter;
% 
%             [mnpop.mn(mnnum).piece(i).xdirection, ...
%              mnpop.mn(mnnum).piece(i).ydirection, ...
%              mnpop.mn(mnnum).piece(i).zdirection]      =   positiontodirectionfunction (mnpop.mn(mnnum).xposition, ...
%                                                                                         mnpop.mn(mnnum).yposition, ...
%                                                                                         mnpop.mn(mnnum).zposition, ...
%                                                                                         mnpop.mn(mnnum).piece(i).distalxposition, ...
%                                                                                         mnpop.mn(mnnum).piece(i).distalyposition, ...
%                                                                                         mnpop.mn(mnnum).piece(i).distalzposition);
% 
%             mnpop.mn(mnnum).primarydendritexdirection(mnpop.mn(mnnum).numberprimarydendrites) = mnpop.mn(mnnum).piece(i).xdirection;
%             mnpop.mn(mnnum).primarydendriteydirection(mnpop.mn(mnnum).numberprimarydendrites) = mnpop.mn(mnnum).piece(i).ydirection;
%             mnpop.mn(mnnum).primarydendritezdirection(mnpop.mn(mnnum).numberprimarydendrites) = mnpop.mn(mnnum).piece(i).zdirection;
% 
%             mnpop.mn(mnnum).piece(i).proximalxposition = mnpop.mn(mnnum).piece(i).xdirection * mnpop.mn(mnnum).somadiameter/2;
%             mnpop.mn(mnnum).piece(i).proximalyposition = mnpop.mn(mnnum).piece(i).ydirection * mnpop.mn(mnnum).somadiameter/2;
%             mnpop.mn(mnnum).piece(i).proximalzposition = mnpop.mn(mnnum).piece(i).zdirection * mnpop.mn(mnnum).somadiameter/2;
% 
%             [mnpop.mn(mnnum).piece(i).elevation, ...
%              mnpop.mn(mnnum).piece(i).azimuth]     =   elazfunction(mnpop.mn(mnnum).xposition, ...
%                                                                     mnpop.mn(mnnum).yposition, ...
%                                                                     mnpop.mn(mnnum).zposition, ...
%                                                                     mnpop.mn(mnnum).piece(i).distalxposition, ...
%                                                                     mnpop.mn(mnnum).piece(i).distalyposition, ...
%                                                                     mnpop.mn(mnnum).piece(i).distalzposition);
% 
%             mnpop.mn(mnnum).primarydendriteelevation(mnpop.mn(mnnum).numberprimarydendrites)  = mnpop.mn(mnnum).piece(i).elevation;
%             mnpop.mn(mnnum).primarydendriteazimuth(mnpop.mn(mnnum).numberprimarydendrites)    = mnpop.mn(mnnum).piece(i).azimuth;
% 
% 	    mnpop.mn(mnnum).piece(i).length = ((mnpop.mn(mnnum).piece(i).proximalxposition-mnpop.mn(mnnum).piece(i).distalxposition)^2 + ...
% 	                                       (mnpop.mn(mnnum).piece(i).proximalyposition-mnpop.mn(mnnum).piece(i).distalyposition)^2 + ...
% 				               (mnpop.mn(mnnum).piece(i).proximalzposition-mnpop.mn(mnnum).piece(i).distalzposition)^2)^0.5;			
% 			
%             mnpop.mn(mnnum).piece(i).proximaltype = 'primary    ';
%             mnpop.mn(mnnum).piece(i).proximalpathlength = 0;
% 	    mnpop.mn(mnnum).piece(i).proximalbranchlength = 0;
%     	    mnpop.mn(mnnum).piece(i).distalpathlength = mnpop.mn(mnnum).piece(i).length;
% 	    mnpop.mn(mnnum).piece(i).distalbranchlength = mnpop.mn(mnnum).piece(i).length;
% 
% 	    mnpop.mn(mnnum).piece(i).daughter1 = [];
%             mnpop.mn(mnnum).piece(i).daughter1diameter = [];
%             mnpop.mn(mnnum).piece(i).daughter1xdirection = [];
%             mnpop.mn(mnnum).piece(i).daughter1ydirection = [];
%             mnpop.mn(mnnum).piece(i).daughter1zdirection = [];
%             mnpop.mn(mnnum).piece(i).daughter2 = [];
%             mnpop.mn(mnnum).piece(i).daughter2diameter = [];
%             mnpop.mn(mnnum).piece(i).daughter2xdirection = [];
%             mnpop.mn(mnnum).piece(i).daughter2ydirection = [];
%             mnpop.mn(mnnum).piece(i).daughter2zdirection = [];
%             mnpop.mn(mnnum).piece(i).daughterratio = [];
% 	    mnpop.mn(mnnum).piece(i).parentdaughter2ratio = [];
%             mnpop.mn(mnnum).piece(i).parentdaughterratio = [];
% 	    mnpop.mn(mnnum).piece(i).rallratio = [];
%             mnpop.mn(mnnum).piece(i).rallratio1 = [];
%             mnpop.mn(mnnum).piece(i).rallratio2 = [];
%             mnpop.mn(mnnum).piece(i).rallratio3 = [];
% 
%         else
%             
%             if strcmp(option.mnimport.pieceshape,'frustal') == 1
%                 mnpop.mn(mnnum).piece(i).proximaldiameter = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).distaldiameter;
%             elseif strcmp(option.mnimport.pieceshape,'cylindrical') ~= 1
%                 disp('Error: piece shape option must be');
%                 disp('either ''cylindrical'' or ''frustal''.');
%                 return;
%             end
% 
%             mnpop.mn(mnnum).piece(i).proximalxposition = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).distalxposition;
%             mnpop.mn(mnnum).piece(i).proximalyposition = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).distalyposition;
%             mnpop.mn(mnnum).piece(i).proximalzposition = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).distalzposition;
% 
%             if mnpop.mn(mnnum).piece(i).proximalxposition == mnpop.mn(mnnum).piece(i).distalxposition && mnpop.mn(mnnum).piece(i).proximalyposition == mnpop.mn(mnnum).piece(i).distalyposition && mnpop.mn(mnnum).piece(i).proximalzposition == mnpop.mn(mnnum).piece(i).distalzposition
%                 disp('Piece of zero length found.');
%                 mnpop.mn(mnnum).piece(i).xdirection = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).xdirection;
%                 mnpop.mn(mnnum).piece(i).ydirection = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).ydirection;
%                 mnpop.mn(mnnum).piece(i).zdirection = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).zdirection;
%                 mnpop.mn(mnnum).piece(i).elevation  = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).elevation;
%                 mnpop.mn(mnnum).piece(i).azimuth    = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).azimuth;
%             else
%                 [mnpop.mn(mnnum).piece(i).xdirection, ...
%                  mnpop.mn(mnnum).piece(i).ydirection, ...
%                  mnpop.mn(mnnum).piece(i).zdirection] =    positiontodirectionfunction (mnpop.mn(mnnum).piece(i).proximalxposition, ...
%                                                                                         mnpop.mn(mnnum).piece(i).proximalyposition, ...
%                                                                                         mnpop.mn(mnnum).piece(i).proximalzposition, ...
%                                                                                         mnpop.mn(mnnum).piece(i).distalxposition, ...
%                                                                                         mnpop.mn(mnnum).piece(i).distalyposition, ...
%                                                                                         mnpop.mn(mnnum).piece(i).distalzposition);
% 
%                 [mnpop.mn(mnnum).piece(i).elevation, ...
%                  mnpop.mn(mnnum).piece(i).azimuth]     =   elazfunction(mnpop.mn(mnnum).piece(i).proximalxposition, ...
%                                                                         mnpop.mn(mnnum).piece(i).proximalyposition, ...
%                                                                         mnpop.mn(mnnum).piece(i).proximalzposition, ...
%                                                                         mnpop.mn(mnnum).piece(i).distalxposition, ...
%                                                                         mnpop.mn(mnnum).piece(i).distalyposition, ...
%                                                                         mnpop.mn(mnnum).piece(i).distalzposition);
%             end
%                                                                     
%             mnpop.mn(mnnum).piece(i).proximalpathlength = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).distalpathlength;
% 	    mnpop.mn(mnnum).piece(i).proximalbranchlength = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).distalbranchlength;
% 
%             if mnpop.mn(mnnum).piece(i).parent ~= (i-1)
% 
% 	        mnpop.mn(mnnum).piece(i).proximalbranchlength = 0;
% 		mnpop.mn(mnnum).piece(i).distalbranchlength = mnpop.mn(mnnum).piece(i).length;
% 		mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent+1).proximalbranchlength = 0;
% 		mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent+1).distalbranchlength = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent+1).length;				
% 				
%                 mnpop.mn(mnnum).piece(i-1).distaltype='termination';
%                 
%                 if strcmp(option.mnimport.pieceshape,'frustal') == 1
%                    mnpop.mn(mnnum).piece(i).proximaldiameter = mnpop.mn(mnnum).piece(i).distaldiameter;
%                    mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent+1).proximaldiameter = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent+1).distaldiameter;
%                 end
% 
%                 if mnpop.mn(mnnum).piece(i).proximaldiameter <= mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent+1).proximaldiameter
% 
%                     mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2 = i;
%                     mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1 = mnpop.mn(mnnum).piece(i).parent+1;
% 
%                     mnpop.mn(mnnum).piece(i).proximaltype='daughter2  ';
%                     mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent+1).proximaltype='daughter1  ';
% 
%                     mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1diameter = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent+1).proximaldiameter;
%                     mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2diameter = mnpop.mn(mnnum).piece(i).proximaldiameter;
% 
%                     mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1xdirection = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent+1).xdirection;
%                     mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1ydirection = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent+1).ydirection;
%                     mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1zdirection = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent+1).zdirection;
% 
%                     mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2xdirection = mnpop.mn(mnnum).piece(i).xdirection;
%                     mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2ydirection = mnpop.mn(mnnum).piece(i).ydirection;
%                     mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2zdirection = mnpop.mn(mnnum).piece(i).zdirection;
% 
%                 else
% 
%                     mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1 = i;
%                     mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2 = mnpop.mn(mnnum).piece(i).parent+1;
% 
%                     mnpop.mn(mnnum).piece(i).proximaltype='daughter1  ';
%                     mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent+1).proximaltype='daughter2  ';
% 
%                     mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2diameter = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent+1).proximaldiameter;
%                     mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1diameter = mnpop.mn(mnnum).piece(i).proximaldiameter;
% 
%                     mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2xdirection = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent+1).xdirection;
%                     mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2ydirection = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent+1).ydirection;
%                     mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2zdirection = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent+1).zdirection;
% 
%                     mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1xdirection = mnpop.mn(mnnum).piece(i).xdirection;
%                     mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1ydirection = mnpop.mn(mnnum).piece(i).ydirection;
%                     mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1zdirection = mnpop.mn(mnnum).piece(i).zdirection;
% 
% 
%                 end
% 
%                 mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).distaltype='bifurcation';
% 
%                 mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughterratio =  max(mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1diameter, ...
%                                                                                             mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2diameter) / ...
%                                                                                             min(mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1diameter, ...
%                                                                                             mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2diameter);
% 
%                 mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).rallratio = ((mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1diameter)^1.5 + ...
%                                                                                     (mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2diameter)^1.5)/ ...
%                                                                                     (mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).distaldiameter)^1.5;
%                                                                                 
%                 mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).rallratio1 = ((mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1diameter)^1 + ...
%                                                                                     (mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2diameter)^1)/ ...
%                                                                                     (mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).distaldiameter)^1;
%                                                                                 
%                 mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).rallratio2 = ((mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1diameter)^2 + ...
%                                                                                     (mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2diameter)^2)/ ...
%                                                                                     (mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).distaldiameter)^2;
% 
% 		mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).rallratio3 = ((mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1diameter)^3 + ...
%                                                                                     (mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2diameter)^3)/ ...
%                                                                                     (mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).distaldiameter)^3;
% 
%                 mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).parentdaughterratio = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).distaldiameter/ ...
%                                                                                              mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter1diameter;
%                                                                                          
%                 mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).parentdaughter2ratio = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).distaldiameter/ ...
%                                                                                               mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(i).parent).daughter2diameter; 
% 
%             end
% 
%         end
% 
%         mnpop.mn(mnnum).piece(i).primarydendrite = mnpop.mn(mnnum).numberprimarydendrites;
% 
%         mnpop.mn(mnnum).piece(i).length = ((mnpop.mn(mnnum).piece(i).proximalxposition-mnpop.mn(mnnum).piece(i).distalxposition)^2 + ...
%                                            (mnpop.mn(mnnum).piece(i).proximalyposition-mnpop.mn(mnnum).piece(i).distalyposition)^2 + ...
%                                            (mnpop.mn(mnnum).piece(i).proximalzposition-mnpop.mn(mnnum).piece(i).distalzposition)^2)^0.5;
% 
%         mnpop.mn(mnnum).piece(i).surfacearea         = pi*((mnpop.mn(mnnum).piece(i).proximaldiameter/2)+(mnpop.mn(mnnum).piece(i).distaldiameter/2))*(((((mnpop.mn(mnnum).piece(i).proximaldiameter/2)-(mnpop.mn(mnnum).piece(i).distaldiameter/2))^2)+mnpop.mn(mnnum).piece(i).length^2)^0.5);
%         mnpop.mn(mnnum).piece(i).volume              = (pi/12)*mnpop.mn(mnnum).piece(i).length*(mnpop.mn(mnnum).piece(i).proximaldiameter^2+mnpop.mn(mnnum).piece(i).proximaldiameter*mnpop.mn(mnnum).piece(i).distaldiameter+mnpop.mn(mnnum).piece(i).distaldiameter^2);
%         if mnpop.mn(mnnum).piece(i).length == 0
%             mnpop.mn(mnnum).piece(i).cylindricaldiameter = 0;
%             mnpop.mn(mnnum).piece(i).taperrate           = 0;
%         else
%             mnpop.mn(mnnum).piece(i).cylindricaldiameter = 2*((mnpop.mn(mnnum).piece(i).volume/(pi*mnpop.mn(mnnum).piece(i).length))^0.5);
%             mnpop.mn(mnnum).piece(i).taperrate           = (mnpop.mn(mnnum).piece(i).proximaldiameter - mnpop.mn(mnnum).piece(i).distaldiameter) / mnpop.mn(mnnum).piece(i).length;
%         end
%         mnpop.mn(mnnum).piece(i).csa                 = pi*((mnpop.mn(mnnum).piece(i).cylindricaldiameter/2)^2);
% 
%         if isnan(mnpop.mn(mnnum).piece(i).taperrate)
%             disp('Error in ''importswc''.');
%             disp('Taper rate set to zero from NaN.');
%             mnpop.mn(mnnum).piece(i).taperrate = 0;
%         end
%         if isinf(mnpop.mn(mnnum).piece(i).taperrate)
%             disp('Error in ''importswc''.');
%             disp('Taper rate set to zero from Inf.');
%             keyboard
%             mnpop.mn(mnnum).piece(i).taperrate = 0;
%         end
%         
%         mnpop.mn(mnnum).piece(i).distalpathlength    = mnpop.mn(mnnum).piece(i).proximalpathlength + mnpop.mn(mnnum).piece(i).length;
%         mnpop.mn(mnnum).piece(i).pathlength          =(mnpop.mn(mnnum).piece(i).proximalpathlength + mnpop.mn(mnnum).piece(i).distalpathlength)/2;
% 		
% 	mnpop.mn(mnnum).piece(i).distalbranchlength    = mnpop.mn(mnnum).piece(i).proximalbranchlength + mnpop.mn(mnnum).piece(i).length;
%         mnpop.mn(mnnum).piece(i).branchlength          =(mnpop.mn(mnnum).piece(i).proximalbranchlength + mnpop.mn(mnnum).piece(i).distalbranchlength)/2;
% 		
% 
%         mnpop.mn(mnnum).piece(i).proximalradialdistance  = ( (mnpop.mn(mnnum).piece(i).proximalxposition-mnpop.mn(mnnum).xposition)^2 ...
%                                                            + (mnpop.mn(mnnum).piece(i).proximalyposition-mnpop.mn(mnnum).yposition)^2 ...
%                                                            + (mnpop.mn(mnnum).piece(i).proximalzposition-mnpop.mn(mnnum).zposition)^2 )^0.5;
%         mnpop.mn(mnnum).piece(i).distalradialdistance    = ( (mnpop.mn(mnnum).piece(i).distalxposition-mnpop.mn(mnnum).xposition)^2 ...
%                                                            + (mnpop.mn(mnnum).piece(i).distalyposition-mnpop.mn(mnnum).yposition)^2 ...
%                                                            + (mnpop.mn(mnnum).piece(i).distalzposition-mnpop.mn(mnnum).zposition)^2 )^0.5;
%         mnpop.mn(mnnum).piece(i).radialdistance          = (mnpop.mn(mnnum).piece(i).proximalradialdistance+mnpop.mn(mnnum).piece(i).distalradialdistance) / 2;
%     end
% 
%     mnpop.mn(mnnum).piece(length(mnpop.mn(mnnum).piece)).distaltype = 'termination';
% 	
%     for j = 2:length(mnpop.mn(mnnum).piece)
%         
%         if strcmp(mnpop.mn(mnnum).piece(j).proximaltype,'primary    ')==1 || ...
%            strcmp(mnpop.mn(mnnum).piece(j).proximaltype,'daughter1  ')==1 || ...
%            strcmp(mnpop.mn(mnnum).piece(j).proximaltype,'daughter2  ')==1
%             mnpop.mn(mnnum).piece(j).cable = max([mnpop.mn(mnnum).piece.cable]) + 1;
%             mnpop.mn(mnnum).piece(j).dparentangle = NaN;
%         else
%             mnpop.mn(mnnum).piece(j).cable = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(j).parent).cable;
%             mnpop.mn(mnnum).piece(j).dparentangle = vectoranglefunction(mnpop.mn(mnnum).piece(j).xdirection,mnpop.mn(mnnum).piece(j).ydirection,mnpop.mn(mnnum).piece(j).zdirection,mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(j).parent).xdirection,mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(j).parent).ydirection,mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(j).parent).zdirection);
%         end
% 
%         if strcmp(mnpop.mn(mnnum).piece(j).proximaltype,'primary    ')==1
%             mnpop.mn(mnnum).piece(j).branchorder = 1;
%             clear trunkx trunky trunkz;
%             trunkx = mnpop.mn(mnnum).piece(j).xdirection;
%             trunky = mnpop.mn(mnnum).piece(j).ydirection;
%             trunkz = mnpop.mn(mnnum).piece(j).zdirection;
%             clear branchx branchy branchz;
%             branchx = mnpop.mn(mnnum).piece(j).xdirection;
%             branchy = mnpop.mn(mnnum).piece(j).ydirection;
%             branchz = mnpop.mn(mnnum).piece(j).zdirection;
%         elseif strcmp(mnpop.mn(mnnum).piece(j).proximaltype,'daughter1  ')==1 || ...
%                strcmp(mnpop.mn(mnnum).piece(j).proximaltype,'daughter2  ')==1
%             mnpop.mn(mnnum).piece(j).branchorder = 1 + mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(j).parent).branchorder;
%             clear branchx branchy branchz;
%             branchx = mnpop.mn(mnnum).piece(j).xdirection;
%             branchy = mnpop.mn(mnnum).piece(j).ydirection;
%             branchz = mnpop.mn(mnnum).piece(j).zdirection;
%         else
%             mnpop.mn(mnnum).piece(j).branchorder = mnpop.mn(mnnum).piece(mnpop.mn(mnnum).piece(j).parent).branchorder;
%         end
%         
%         mnpop.mn(mnnum).piece(j).dtrunkangle = vectoranglefunction(trunkx,trunky,trunkz,mnpop.mn(mnnum).piece(j).xdirection,mnpop.mn(mnnum).piece(j).ydirection,mnpop.mn(mnnum).piece(j).zdirection);
%         mnpop.mn(mnnum).piece(j).dbranchangle = vectoranglefunction(branchx,branchy,branchz,mnpop.mn(mnnum).piece(j).xdirection,mnpop.mn(mnnum).piece(j).ydirection,mnpop.mn(mnnum).piece(j).zdirection);
% 
%         if strcmp(option.mnimport.pieceshape,'cylindrical') == 1
%             if mnpop.mn(mnnum).piece(j).taperrate == 0
%                 if strcmp(mnpop.mn(mnnum).piece(j).distaltype,'bifurcation')==1 || strcmp(mnpop.mn(mnnum).piece(j).distaltype,'termination')==1
%                     mnpop.mn(mnnum).piece(j).taperrate = 0;
%                 else
%                     if mnpop.mn(mnnum).piece(j).length == 0
%                         mnpop.mn(mnnum).piece(j).taperrate = 0;
%                     else
%                         mnpop.mn(mnnum).piece(j).taperrate = (mnpop.mn(mnnum).piece(j).distaldiameter - mnpop.mn(mnnum).piece(j+1).proximaldiameter) / mnpop.mn(mnnum).piece(j).length;
%                     end
%                 end
%                 if isnan(mnpop.mn(mnnum).piece(i).taperrate)
%                     disp('Error (NaN) in ''importswc''.');
%                     keyboard;
%                 end
%                 if isnan(mnpop.mn(mnnum).piece(i).taperrate)
%                     disp('Error (Inf) in ''importswc''.');
%                     keyboard;
%                 end
%             end
%         end
%     end
%    
%     for k = length(mnpop.mn(mnnum).piece):-1:2
%         %disp(sprintf('Piece Number: %f',k));
%         if strcmp(mnpop.mn(mnnum).piece(k).distaltype,'termination')==1
%             %disp('Termination')
%             mnpop.mn(mnnum).piece(k).branchtype = 't';
%         elseif strcmp(mnpop.mn(mnnum).piece(k).distaltype,'bifurcation')==1
%             %disp('Bifurcation')
%             mnpop.mn(mnnum).piece(k).branchtype = 'b';
%         else
%             mnpop.mn(mnnum).piece(k).branchtype = mnpop.mn(mnnum).piece(k+1).branchtype;
%         end
%         %disp(mnpop.mn(mnnum).piece(k).branchtype);
%     end
%         
% end
% 
% 
% cd(mnhome);
% cd mnData;
% 
% if exist(sprintf('%s_%s','data',datestr(now,'yyyy-mm-dd')),'dir')==7
%     cd(sprintf('%s_%s','data',datestr(now,'yyyy-mm-dd')));
% else
%     mkdir(sprintf('%s_%s','data',datestr(now,'yyyy-mm-dd')));
%     cd(sprintf('%s_%s','data',datestr(now,'yyyy-mm-dd')));
% end
% 
% if exist(sprintf('%s_%s',inputfilename,mnpop.datetime),'dir')==7
%     cd(sprintf('%s_%s',inputfilename,mnpop.datetime));
% else
%     mkdir(sprintf('%s_%s',inputfilename,mnpop.datetime));
%     cd(sprintf('%s_%s',inputfilename,mnpop.datetime));
% end
% 
% mnpop.datapathname = cd;
% 
% populationname=sprintf('%s_mnpop',inputfilename);
% assignin('base',populationname,mnpop);
% eval([populationname '= mnpop;']);
% if strcmp(option.mnimport.savemnpop,'n') ~= 1
% 	disp('   Saving motoneuron data.');
%     save(sprintf('%s_%s_%s',inputfilename,mnpop.datetime,'mnpop.mat'),populationname);
% end
% 
% cd(mnhome);
% 
% disp('  ------------------------------------');
% disp('   Motoneuron import completed.');
% disp('  ------------------------------------');
% 
% if strcmp(option.mnimport.analyze,'n') ~= 1;
%     eval(['mnanalyzer(' sprintf('%s_mnpop',inputfilename) ');']);
% end
% if strcmp(option.mnimport.figures,'n') ~= 1;
%     eval(['mnfigures(' sprintf('%s_analysis',inputfilename) ');']);
% end
% if strcmp(option.mnimport.export,'n') ~= 1;
%     eval(['mnexport(' sprintf('%s_mnpop',inputfilename) ',' sprintf('%s_data',inputfilename) ');']);
% end
% if strcmp(option.mnimport.mnfitter,'n') ~= 1
%     eval(['mnfitter(' sprintf('%s_analysis',inputfilename) ');']);
% end
% close all;
% 
% if strcmp(option.mnimport.clear.data,'n') ~= 1;
%     eval(['clear ' sprintf('%s_data',inputfilename)]);
% end
% 
% cd(mnhome);


