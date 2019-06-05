function exportdendritedata(mnpop)

[helppath,addpaths] = fileparts(which('addpaths.m'));
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

for mnnum = 1:length(mnpop.mn)
    
    clear piecedataraw piecedatadimensions piecedatalabels piecedata piecelablesdata; 
    filename = sprintf('%s_%s_%s%03.0f',mnpop.inputfilename,mnpop.datetime,'piecedata_mn',mnnum);
    
    piecedataraw = struct2cell(mnpop.mn(mnnum).piece);    
    piecedatadimensions = size(piecedataraw);

    piecedatalabels = fieldnames(mnpop.mn(mnnum).piece);
    
    piecedata(1:piecedatadimensions(1),1:piecedatadimensions(3)) = piecedataraw(1:piecedatadimensions(1),1,1:piecedatadimensions(3));
    
    piecelabelsdata = [piecedatalabels piecedata]';

    xlswrite(filename,piecelabelsdata);
   
    if mnnum == 1
        allpiecedata = piecedata;
    else
        allpiecedata = [allpiecedata piecedata];
    end
    
end

popfilename = sprintf('%s_%s_%s',mnpop.inputfilename,mnpop.datetime,'piecedata_all');
poppiecelabelsdata = [piecedatalabels allpiecedata]';
xlswrite(popfilename,poppiecelabelsdata);

cd(mnhome);