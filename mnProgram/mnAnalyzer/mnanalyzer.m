function mnanalyzer(mnpop)

[helppath,addpaths] = fileparts(which('mnaddpaths.m'));
cd(helppath);
cd ..
mnhome = cd;
mnoptions;

disp(' ');
disp('  ------------------------------------');
disp('   Motoneuron analysis started.');
disp('  ------------------------------------');

[data,analysis]   = piecebinner(mnpop);
[data,analysis]   = cablecreator(mnpop,data,analysis);
[data,analysis]   = cablebinner(data,analysis);
[data,analysis]   = cableanalyzer(data,analysis);
[data,analysis]   = pathlengthanalyzer(data,analysis);
[data,analysis]   = radialdistanceanalyzer(data,analysis);
[data,analysis]   = diameteranalyzer(data,analysis);
[data,analysis]   = somaanalyzer(mnpop,data,analysis);
[data,analysis]   = trunkanalyzer(data,analysis);
[data,analysis]   = branchorderanalyzer(data,analysis);
[data,analysis]   = degreeanalyzer(data,analysis);
[data,analysis]   = branchlengthanalyzer(data,analysis);

if strcmp(option.mnanalyzer.doublebin1,'y') || strcmp(option.mnanalyzer.doublebin2,'y') || strcmp(option.mnanalyzer.doublebin3,'y')
    data = piecedoublebinner(data);
end
if strcmp(option.mnanalyzer.doublebin1,'y')
	[data,analysis] = doublebinanalyzer1(data,analysis);
end
if strcmp(option.mnanalyzer.doublebin2,'y')
	[data,analysis] = doublebinanalyzer2(data,analysis);
end
if strcmp(option.mnanalyzer.doublebin3,'y')
	[data,analysis] = doublebinanalyzer3(data,analysis);
end
	
cd(mnpop.datapathname);
dataname     = sprintf('%s_data',mnpop.inputfilename);
analysisname = sprintf('%s_analysis',mnpop.inputfilename);

assignin('caller',dataname,data);
assignin('caller',analysisname,analysis);

if strcmp(option.mnanalyzer.clear.data,'n') == 1
    assignin('base',dataname,data);
end
if strcmp(option.mnanalyzer.clear.analysis,'n') == 1
    assignin('base',analysisname,analysis);
end

if strcmp(option.mnanalyzer.save.data,'n') ~= 1
    eval([dataname '=data;']);
	disp('   Saving analysis data.')
    save(sprintf('%s_%s_%s',mnpop.inputfilename,mnpop.datetime,'data.mat'),dataname,'-v7.3');
end
if strcmp(option.mnanalyzer.save.analysis,'n') ~= 1
    eval([analysisname '=analysis;']);
	disp('   Saving analysis.')
    save(sprintf('%s_%s_%s',mnpop.inputfilename,mnpop.datetime,'analysis.mat'),analysisname,'-v7.3');
end

cd(mnhome);

disp('  ------------------------------------');
disp('   Motoneuron analysis completed.');
disp('  ------------------------------------');

