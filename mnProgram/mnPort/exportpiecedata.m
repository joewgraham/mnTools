function exportpiecedata(mnpop)

[helppath,addpaths] = fileparts(which('mnaddpaths.m'));
cd(helppath);
cd ..
mnhome = cd;
cd(mnpop.datapathname);

if exist('data','dir')==7
    cd('data');
else
    mkdir('data');
    cd('data');
end

disp(' ');
disp('    Exporting pice data to ''.csv''.');
disp(' ');

piecetypes{1} = 'soma';
piecetypes{2} = 'axon';
piecetypes{3} = 'dendrite';
piecetypes{4} = 'apical';

for mnnum = 1:length(mnpop.mn)
    
    [~,filename,~] = fileparts(mnpop.mn(mnnum).filename);
    
    for piecetype = 2:4
        
        if isfield(mnpop.mn(mnnum),piecetypes{piecetype})
            
            disp(sprintf('    Exporting neuron number: %.0f %ss',mnnum,piecetypes{piecetype}));
            
            datafilename = [filename '_' mnpop.datetime '_' piecetypes{piecetype} '_data.csv'];
            eval(['piecedataraw = struct2cell(mnpop.mn(mnnum).' piecetypes{piecetype} ');']);
            piecedatadimensions = size(piecedataraw);
            piecedata(1:piecedatadimensions(1),1:piecedatadimensions(3)) = piecedataraw(1:piecedatadimensions(1),1,1:piecedatadimensions(3));
            eval(['piecelabels = fieldnames(mnpop.mn(mnnum).' piecetypes{piecetype} ');']);
            piecelabelsdata = [piecelabels piecedata]';
            cell2csv(datafilename,piecelabelsdata);
                 
        end
    end  
end


cd(mnhome);


    
        
        
        

        
     