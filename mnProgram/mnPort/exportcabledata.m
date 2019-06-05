function exportcabledata(data)

[helppath,addpaths] = fileparts(which('addpaths.m'));
cd(helppath);
cd ..
mnhome = cd;
cd(data.datapathname);

if exist('data','dir')==7
    cd('data');
else
    mkdir('data');
    cd('data');
end

for mnnum = 1:length(data.individual)
    
	disp(sprintf('  Motoneuron Number: %d',mnnum));
	
    clear cabledataraw cabledatadimensions cabledatalabels cabledata cablelablesdata;
    filename = sprintf('%s_%s_cabledata_mn%03.0f.txt',data.inputfilename,data.datetime,mnnum);
    
    cabledataraw = rmfield(data.individual(mnnum).cablebins,'piece');
    cabledatalabels = fieldnames(cabledataraw);
    cabledataraw = struct2cell(cabledataraw);
    
    cabledatadimensions = size(cabledataraw);
        
    cabledata(1:cabledatadimensions(1),1:cabledatadimensions(3)) = cabledataraw(1:cabledatadimensions(1),1,1:cabledatadimensions(3));
    
    cablelabelsdata = [cabledatalabels cabledata]';

    cell2csv(filename,cablelabelsdata);
    
    if mnnum == 1
        allcabledata = cabledata;
    else
        allcabledata = [allcabledata cabledata];
    end
    
end

popfilename = sprintf('%s_%s_cabledata_all.txt',data.inputfilename,data.datetime);
popcablelabelsdata = [cabledatalabels allcabledata]';
cell2csv(popfilename,popcablelabelsdata);

cd(mnhome);