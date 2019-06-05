% Options File for mnCode
% ------------------------------------

% mnGenerator
  
    %use random seed?
	option.mngenerator.randomseed = 'y';
	
	%save mnpop.mat?
    option.mngenerator.savemnpop = 'y';
    
    %analyze data?
    option.mngenerator.analyze = 'y';
    
    %create figures?
    option.mngenerator.figures = 'n';
    
    %export data?
    option.mngenerator.export = 'n';


    

% mnAnalyzer

    % perform diameter/path length double binning?
	option.mnanalyzer.doublebin1 = 'y';
	
	% perform diameter/branch length double binning?
	option.mnanalyzer.doublebin2 = 'y';
	
	% perform diameter/branch order double binning?
	option.mnanalyzer.doublebin3 = 'y';
	
	% clear data?
    option.mnanalyzer.clear.data = 'n';
    
    % clear analysis?
    option.mnanalyzer.clear.analysis = 'n';
    
    % save data?
    option.mnanalyzer.save.data = 'n';
    
    % save analysis?
    option.mnanalyzer.save.analysis = 'y';

    % axon binning options
    data.distancebinwidth   = 100; 
	data.branchlengthbinwidth = 100;
	data.branchvolumebinwidth = 1000 ;
    data.diameterbinbreaks  = [2 4]; 
	data.diameterbinwidths  = [0.25 0.5 1.0]; %[0.25 0.5 1.0]; 
		%Cullheim article: 100, [5], [0.25 1.0]
		%Purkinje: 25, [2], [0.2 0.2]
		%Cullheim: 100, [2 5 15], [0.25 0.5 1.0 2.5]
		%Cullheim2: 100, [2 5], [0.25 0.5 0.5]
		%Crook: 25, [1 2.5], [0.0625 0.25 0.5]
		%Fyffe: 100, [2 5 15], [0.25 0.5 1.0 2.5]
		%Ascoli 1: 50, [2 5 15], [0.125 0.5 1.0 2.5]
		
% mnFigures

    %create bif/term figures?
    option.mnfigures.bifterm = 'n';

    %create individual bif/term figures?
    option.mnfigures.indbifterm = 'n';
    
    
    
% mnImport

    % save mnpop.mat?
    option.mnimport.savemnpop = 'n';
    
    % analyze data?
    option.mnimport.analyze = 'n';
    
    % create figures?
    option.mnimport.figures = 'n';
    
    % export data?
    option.mnimport.export = 'y';
    
    % parameter fit data?
    option.mnimport.mnfitter = 'n';
    
    % clear data?
    option.mnimport.clear.data = 'n';
    
    % pieces cylindrical or frustal?
    option.mnimport.pieceshape = 'frustal';    
    
    
    
% mnExport  
    
    % export piece data?
    option.mnexport.piecedata = 'y';
    
    % export cable data?
    option.mnexport.cabledata = 'y';

    % export swc files?
    option.mnexport.swcdata = 'n';
    
    %export xml files?
    option.mnexport.xmldata = 'n';    
    