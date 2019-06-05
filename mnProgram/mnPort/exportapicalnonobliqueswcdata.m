function exportapicalnonobliqueswcdata(mnpop,data)

[helppath,addpaths] = fileparts(which('mnaddpaths.m'));
cd(helppath);
cd ..
mnhome = cd;
cd(mnpop.datapathname);

if exist('swc_nonoblique','dir')==7
    cd('swc_nonoblique');
else
    mkdir('swc_nonoblique');
    cd('swc_nonoblique');
end

disp(' ');
disp('    Exporting pice data to ''.swc''.');
disp(' ');

piecetypes{1} = 'soma';
piecetypes{2} = 'axon';
piecetypes{3} = 'dendrite';
piecetypes{4} = 'apical';

for mnnum = 1:length(mnpop.mn)
    
    [~,name,~] = fileparts(fullfile(mnpop.importpathname,mnpop.importfilename{mnnum}));
    filename = sprintf('%s_%s.swc',name,mnpop.datetime);
    fid=fopen(filename,'wt');
    
    fprintf(fid,'%s\n','# Header Information for File');
    
    %fprintf(fid,'%.0f %.0f %.3f %.3f %.3f %.3f %.0f\n',1,1,mnpop.mn(mnnum).xposition,mnpop.mn(mnnum).yposition,mnpop.mn(mnnum).zposition,mnpop.mn(mnnum).somadiameter/2,-1);
    fprintf(fid,'%.0f %.0f %.3f %.3f %.3f %.3f %.0f\n',1,1,mnpop.mn(mnnum).xposition,mnpop.mn(mnnum).yposition,mnpop.mn(mnnum).zposition,data.individual(mnnum).soma.diameter/2,-1);
    
    linenumber = 1;
    
    for piecetype = 2:4
        
        currentpiecetype = piecetypes{piecetype};
        
        if isfield(mnpop.mn(mnnum),currentpiecetype)
                       
            disp(sprintf('    Exporting neuron number: %.0f %ss',mnnum,piecetypes{piecetype}));
            
            eval(['piece = mnpop.mn(mnnum).' currentpiecetype ';']);
            
            for i = 1:length(piece)
                
                piecetypeid = piecetype;
                if piecetype == 4 
                    if piece(i).oblique == 1
                        piecetypeid = 5;
                    elseif piece(i).oblique == 2
                        piecetypeid = 7;                       
                    end
                end
                
                if ~(piecetype==4 && piece(i).oblique)
                    
                    linenumber = linenumber + 1;
                    
                    if strcmp(piece(i).proximaltype,'primary    ')
                        xposition = piece(i).proximalxposition;
                        yposition = piece(i).proximalyposition;
                        zposition = piece(i).proximalzposition;
                        radius    = piece(i).proximaldiameter / 2;
                        parent    = piece(i).parent;
                        if parent == 0
                            parent = 1;
                        end
                        fprintf(fid,'%.0f %.0f %.3f %.3f %.3f %.3f %.0f\n',linenumber,piecetypeid,xposition,yposition,zposition,radius,parent);
                        linenumber = linenumber + 1;
                        xposition = piece(i).distalxposition;
                        yposition = piece(i).distalyposition;
                        zposition = piece(i).distalzposition;
                        radius    = piece(i).distaldiameter / 2;
                        parent    = linenumber - 1;
                        fprintf(fid,'%.0f %.0f %.3f %.3f %.3f %.3f %.0f\n',linenumber,piecetypeid,xposition,yposition,zposition,radius,parent);
                        piece(i).linenumber = linenumber;
                    else
                        xposition = piece(i).distalxposition;
                        yposition = piece(i).distalyposition;
                        zposition = piece(i).distalzposition;
                        radius    = piece(i).distaldiameter / 2;
                        parent    = piece(piece(i).parent).linenumber;
                        fprintf(fid,'%.0f %.0f %.3f %.3f %.3f %.3f %.0f\n',linenumber,piecetypeid,xposition,yposition,zposition,radius,parent);
                        piece(i).linenumber = linenumber;
                    end
                    
                end
                
            end    
        end
    end
    
    fclose(fid);
    
end

cd(mnhome);